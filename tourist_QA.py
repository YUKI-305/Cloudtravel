from BiLSTM_NER import *
from Tfidf_Classification.QAtfidf import *
from BiLSTM_NER.QAbilstm import *
from QA import *
if __name__ == '__main__':
    tfidfclf = TfidfClf()
    bln = BilstmNer()
    while True:
        question = input("Hi!我是你的旅行助手乔乔子！你可以向我提出问题：")
        #问句意图判别

        pre_type = tfidfclf.predict(question) #问句意图
        if pre_type != 23:
            tag = 'it'
        else:
            tag = 'ty'
        #问句实体识别
        bln = BilstmNer()
        entity = bln.predict(tag=tag, input_str=question)#问句实体
        KGgraph = CovidGraph()
        answer = KGgraph.answer(entity=entity, pre=pre_type)
        print(answer)