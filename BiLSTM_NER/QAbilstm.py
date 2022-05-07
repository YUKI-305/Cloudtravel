import pickle
from sklearn.metrics import precision_score, recall_score, f1_score, classification_report
import torch
from torch.utils.data import Dataset, DataLoader
import torch.nn as nn
import torch.optim as optim
from BiLSTM_NER.model import NERLSTM_CRF
from BiLSTM_NER.utils import get_tags, format_result
from BiLSTM_NER.config import Config
import time


class BilstmNer():
    def __init__(self):
        self.model = self.load_model()

    def load_model(self):
        with open(Config.pickle_path, 'rb') as inp:
            self.word2id = pickle.load(inp)
            self.id2word = pickle.load(inp)
            self.tag2id = pickle.load(inp)
            self.id2tag = pickle.load(inp)
            self.x_train = pickle.load(inp)
            self.y_train = pickle.load(inp)
            self.x_test = pickle.load(inp)
            self.y_test = pickle.load(inp)
            self.x_valid = pickle.load(inp)
            self.y_valid = pickle.load(inp)
        model = NERLSTM_CRF(Config.embedding_dim, Config.hidden_dim, Config.dropout, self.word2id, self.tag2id)
        model.load_state_dict(torch.load('BiLSTM_NER/bilstm_model/bilstm_ner.bin',map_location='cpu'))
        return model

#     def predict(self, tag, input_str=""):
#         model.load_state_dict(torch.load('./bilstm_model/bilstm_ner.bin'))
#         if not input_str:
#             input_str = input("请输入文本: ")
#         input_vec = [word2id.get(i, 0) for i in input_str]
#         print(input_vec)

#         # convert to tensor
#         sentences = torch.tensor(input_vec).view(1, -1)
#         print(sentences)
#         paths = model(sentences)
#         print(paths)

#         entities = []
#         print(paths[0], tag, tag2id)
#         tags = get_tags(paths[0], tag, tag2id)
#         print(tags)
#         entities += format_result(tags, input_str, tag)
#         print(entities)
    def predict(self, tag, input_str):
        input_vec = [self.word2id.get(i, 0) for i in input_str]
        sentences = torch.tensor(input_vec).view(1, -1)
        paths = self.model(sentences)
    
        entities = []
        tags = get_tags(paths[0], tag, self.tag2id)
        entities += format_result(tags, input_str, tag)
        if not entities:
            return ''
        else:
            return entities[0]['word']


class NERDataset(Dataset):
    def __init__(self, X, Y):
        self.data = [{'x': X[i], 'y': Y[i]} for i in range(X.shape[0])]

    def __getitem__(self, index):
        return self.data[index]

    def __len__(self):
        return len(self.data)


def train():
    criterion = nn.CrossEntropyLoss(ignore_index=0)
    optimizer = optim.Adam(model.parameters(), lr=Config.lr, weight_decay=Config.weight_decay)

    for epoch in range(Config.max_epoch):
        model.train()
        model.to(Config.device)
        for index, batch in enumerate(train_dataloader):
            optimizer.zero_grad()

            X = batch['x'].long().to(Config.device)  # torch.Size([4, 60])    (batch_size, max_len)
            y = batch['y'].long().to(Config.device)  # torch.Size([4, 60])    (batch_size, max_len)

            # CRF
            loss = model.log_likelihood(X, y)
            loss.backward()
            torch.nn.utils.clip_grad_norm_(parameters=model.parameters(), max_norm=10)
            optimizer.step()

            now_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
            o_str = 'time: {}, epoch: {}, step: {}, loss: {:6f}'.format(now_time, epoch, index, loss.item())
            print(o_str)

        aver_loss = 0
        preds, labels = [], []
        for index, batch in enumerate(valid_dataloader):
            model.eval()
            val_x, val_y = batch['x'].long().to(Config.device), batch['y'].long().to(Config.device)
            predict = model(val_x)
            # CRF
            loss = model.log_likelihood(val_x, val_y)
            aver_loss += loss.item()
            # 统计非0的，也就是真实标签的长度
            leng = []
            for i in val_y.cpu():
                tmp = []
                for j in i:
                    if j.item() > 0:
                        tmp.append(j.item())
                leng.append(tmp)

            for index, i in enumerate(predict):
                preds += i[:len(leng[index])]

            for index, i in enumerate(val_y.tolist()):
                labels += i[:len(leng[index])]
        aver_loss /= (len(valid_dataloader) * 64)
        precision = precision_score(labels, preds, average='macro')
        recall = recall_score(labels, preds, average='macro')
        f1 = f1_score(labels, preds, average='macro')
        report = classification_report(labels, preds)
        print(report)
        torch.save(model.state_dict(), 'BiLSTM_NER/bilstm_model/bilstm_ner.bin')


def predict(tag, input_str=""):
    model.load_state_dict(torch.load('BiLSTM_NER/bilstm_model/bilstm_ner.bin'))
    if not input_str:
        input_str = input("请输入文本: ")
    input_vec = [word2id.get(i, 0) for i in input_str]
    print(input_vec)

    # convert to tensor
    sentences = torch.tensor(input_vec).view(1, -1)
    print(sentences)
    paths = model(sentences)
    print(paths)

    entities = []
    print(paths[0], tag, tag2id)
    tags = get_tags(paths[0], tag, tag2id)
    print(tags)
    entities += format_result(tags, input_str, tag)
    print(entities)
    return entities


if __name__ == '__main__':
    # 1. 加载数据集
    with open(Config.pickle_path, 'rb') as inp:
        word2id = pickle.load(inp)
        id2word = pickle.load(inp)
        tag2id = pickle.load(inp)
        id2tag = pickle.load(inp)
        x_train = pickle.load(inp)
        y_train = pickle.load(inp)
        x_test = pickle.load(inp)
        y_test = pickle.load(inp)
        x_valid = pickle.load(inp)
        y_valid = pickle.load(inp)
#     print("train len:", len(x_train))
#     print("test len:", len(x_test))
#     print("valid len", len(x_valid))
#     print(word2id[:10])
#     print(tag2id[:10])
    # print(x_train[:10])
    # print(y_train[:10])

    train_dataset = NERDataset(x_train, y_train)
    valid_dataset = NERDataset(x_valid, y_valid)
    test_dataset = NERDataset(x_test, y_test)

    train_dataloader = DataLoader(train_dataset, batch_size=Config.batch_size, shuffle=True,
                                  num_workers=Config.num_workers)
    valid_dataloader = DataLoader(valid_dataset, batch_size=Config.batch_size, shuffle=True,
                                  num_workers=Config.num_workers)
    test_dataloader = DataLoader(test_dataset, batch_size=Config.batch_size, shuffle=True,
                                 num_workers=Config.num_workers)
    #
    model = NERLSTM_CRF(Config.embedding_dim, Config.hidden_dim, Config.dropout, word2id, tag2id)
#     train()  # 训练

    bln = BilstmNer()
    while 1:
        s = input("【QAbilstm测试】请输入问题：")
        tag = input("【QAbilstm测试】请输入标签：")
        entity = bln.predict(tag=tag, input_str=s)
        print(entity)
