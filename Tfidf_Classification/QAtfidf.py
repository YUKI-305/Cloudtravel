import csv
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import RidgeClassifier
from sklearn.naive_bayes import MultinomialNB
from sklearn.metrics import f1_score
import pickle
# from bert4pytorch import tokenization

class TfidfClf():
    def __init__(self):
        (self.word2id, self.tfidf, self.model) = pickle.load(open('Tfidf_Classification/tf_idf_model/tfidf_model.pkl', 'rb'))

    def predict(self,sent):
        sent = text2id([sent], self.word2id)
        sent = self.tfidf.transform(sent)
        val_pred = self.model.predict(sent)
        return val_pred.tolist()[0]


def readfile(dir):
    # 读文件
    contents, labels = [], []
    with open(dir, encoding='gbk') as f:
        for line in csv.reader(f):
            # print(line)
            content, label = line[0], line[1]
            contents.append(content)
            labels.append(label)
    return contents, labels


def build_vocab(contents):
    word_list = []
    for content in contents:
        for i in range(len(content)):
            word_list.append(content[i])
            word_list = list(dict.fromkeys(word_list))
    word2id={'<unk>':0,'<pad>':1}
    for i,word in enumerate(word_list):
        word2id[word]=i+2
    return word2id


def text2id(contents, word2id):
    contents_id = []
    for content in contents:
        content_str = [str(word2id[i]) if i in word2id.keys() else '0' for i in content]
        content_str = ' '.join(content_str)
        contents_id.append(content_str)

    return contents_id


def train(contents, labels):
    tfidf = TfidfVectorizer(ngram_range=(1, 3), max_features=10000)
    train_test = tfidf.fit_transform(contents)

    clf = RidgeClassifier()
    clf.fit(train_test[:17000], labels[:17000])
    val_pred = clf.predict(train_test[17000:])

    #
    # nb = MultinomialNB()
    # nb.fit(train_test[:7000], labels[:7000])
    # val_pred = nb.predict(train_test[7000:])
    print(f1_score(labels[17000:], val_pred, average='macro'))
    return tfidf, clf





if __name__ == "__main__":
    data_dir = 'dataset/question.csv'
    contents, labels = readfile(data_dir)
    word2id = build_vocab(contents)
    contents_id = text2id(contents, word2id)
    tfidf, model = train(contents_id, labels)
    pickle.dump((word2id, tfidf, model), open('tf_idf_model/tfidf_model.pkl', 'wb'))

    while 1:
        tfidfclf = TfidfClf()
        s = input("【QATfIdf测试】请输入问题：")
        val_pred = tfidfclf.predict(s)
        print(val_pred)
