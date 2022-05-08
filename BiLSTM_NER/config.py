import torch


class Config:
    # device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    device = torch.device('cpu')

    pickle_path = 'BiLSTM_NER/bilstm_model/data.pkl'  # 训练集存放路径

    load_model_path = None  # 加载预训练的模型的路径，为None代表不加载

    batch_size = 128  # batch size
    num_workers = 1  # how many workers for loading data
    print_freq = 20  # print info every N batch

    max_epoch = 10
    lr = 0.001  # initial learning rate
    lr_decay = 0.5  # when val_loss increase, lr = lr*lr_decay
    weight_decay = 1e-5  # 损失函数

    embedding_dim = 100
    hidden_dim = 200
    dropout = 0.2



