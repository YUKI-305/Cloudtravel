import pandas as pd
import numpy as np
import collections
import pickle

def data2pkl():
    datas = list()
    labels = list()
    tags = set()
    tags.add('')
    input_data = open(r'./dataset/question_mark.csv', 'r', encoding='gbk')
    for line in input_data.readlines():
        line = line.split()
        linedata = []
        linelabel = []
        numNotO = 0
        for word in line:
            word = word.split('/')
            linedata.append(word[0])
            linelabel.append(word[1])
            tags.add(word[1])   # 标签集合
            if word[1] != 'O':
                numNotO += 1   # 加这个if  就是防止当前这句话中没有我们需要进行标注的实体 全是O的话 直接pass掉 没必要训练

        if numNotO != 0:
            datas.append(linedata)
            labels.append(linelabel)

    input_data.close()

    def flat_gen(x):
        def iselement(e):
            return not(isinstance(e, collections.Iterable) and not isinstance(e, str))
        for el in x:
            if iselement(el):
                yield el
            else:
                yield from flat_gen(el)

    all_words = [i for i in flat_gen(datas)]
    sr_allwords = pd.Series(all_words)
    sr_allwords = sr_allwords.value_counts()
    set_words = sr_allwords.index
    set_ids = range(1, len(set_words) + 1)

    tags = [i for i in tags]
    tag_ids = range(len(tags))

    word2id = pd.Series(set_ids, index=set_words)
    id2word = pd.Series(set_words, index=set_ids)

    tag2id = pd.Series(tag_ids, index=tags)
    id2tag = pd.Series(tags, index=tag_ids)

    word2id["unknow"] = len(word2id) + 1
    id2word[len(word2id)] = "unknow"

    max_len = 60

    def X_padding(words):
        ids = list(word2id[words])
        if len(ids) >= max_len:
            return ids[:max_len]
        ids.extend([0] * (max_len - len(ids)))
        return ids

    def y_padding(tags):
        ids = list(tag2id[tags])
        if len(ids) >= max_len:
            return ids[:max_len]
        ids.extend([0] * (max_len - len(ids)))
        return ids

    df_data = pd.DataFrame({'words': datas, 'tags': labels}, index=range(len(datas)))
    df_data['x'] = df_data['words'].apply(X_padding)
    df_data['y'] = df_data['tags'].apply(y_padding)
    x = np.asarray(list(df_data['x'].values))
    y = np.asarray(list(df_data['y'].values))

    from sklearn.model_selection import train_test_split
    x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=43)
    x_train, x_valid, y_train, y_valid = train_test_split(x_train, y_train, test_size=0.2, random_state=43)

    with open('bilstm_model/data.pkl', 'wb') as outp:
        pickle.dump(word2id, outp)
        pickle.dump(id2word, outp)
        pickle.dump(tag2id, outp)
        pickle.dump(id2tag, outp)
        pickle.dump(x_train, outp)
        pickle.dump(y_train, outp)
        pickle.dump(x_test, outp)
        pickle.dump(y_test, outp)
        pickle.dump(x_valid, outp)
        pickle.dump(y_valid, outp)
    print('** Finished saving the data.')


if __name__ == '__main__':
    data2pkl()   # 将数据集放在pkl文件中

