from py2neo import Graph, Node, Relationship
import random

query2sql_sent = {
    0 :" match (n:item) WHERE n.`名称`='{0}' return properties(n)",
    # 查询实体（item）
    1 : "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`方言`",
    # 查询方言
    2 : "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`占地面积`,n.`建筑面积`,n.`规划面积`,n.`总面积`",
    # 查询占地面积，建筑面积，规划面积，总面积
    3 : "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`开发建设时间`,n.`建造时间`",
    # 查询开发建设时间，建造时间
    4: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`当地特产`,n.`主要产品`,n.`特产`,n.`景区特产`",
    # 查询当地特产，主要产品，特产，景区特产
    5: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`国籍`,n.`地址`,n.`所属区域`,n.`分布区域`,n.`所属地区`,n.`所在地区`,n.`地点`,n.`地理位置`,n.`景区位置`",
    # 查询国籍，地址,所属区域，分布区域，所属地区，所在地区，地点，地理位置，景区位置
    6: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`森林覆盖率`,n.`植被覆盖率`",
    # 森林覆盖率，植被覆盖率
    7: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`野生动物`,n.`动物种类`",
    # 查询野生动物,动物种类
    8: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`名人`,n.`奉化名人`",
    # 查询名人，奉化名人
    9: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`交通`,n.`机场`,n.`火车站`",
    # 查询交通，机场，火车站
    10: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`平均海拔`,n.`海拔高度`,n.`高`",
    # 查询平均海拔，海拔高度，高
    11: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`特点`,n.`主要游览内容`,n.`主要景点`,n.`人文景观`,n.`著名景点`,n.`景区四绝`,n.`景区组成`,n.`名胜古迹`",
    # 查询特点，主要游览内容,主要景点，人文景观，著名景点，景区四绝，景区组成，名胜古迹
    12: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`票价`,n.`门票价格`",
    # 查询票价，门票价格
    13: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`娱乐设施`,n.`服务`",
    # 查询娱乐设施,服务
    14: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`深度`,n.`平均水深`,n.`已探深度`",
    #查询深度，平均水深，以探深度
    15: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`气候条件`",
    # 查询气候条件
    16: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`人口`",
    # 人口
    17: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`周边景点`",
    # 周边景点
    18: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`建造人物`",
    # 建造人物
    19: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`蓄水量`",
    # 蓄水量
    20: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`酒店住宿`",
    # 酒店住宿
    21: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`旅游级别`,n.`级别`,n.`景区等级`,n.`荣誉`,n.`誉称`,n.`风景区级别`",
    # 旅游级别,级别，景区等级，荣誉，誉称，风景区级别
    22: "match (n:item) WHERE n.`名称`='{0}' return n.`名称`,n.`展示植物`,n.`植物种类`",
    # 展示植物，植物种类
    23: "match (n:item)-[r:`关系`]-(p:type) where p.`名称`='{0}' return n.`名称` as name,p.`名称`",
    # 推荐
    }


class CovidGraph:
    def __init__(self):
        self.graph = Graph('http://172.22.76.204:7474/browser/', password='123456')

    def answer(self,entity,pre):
        sql = query2sql_sent[int(pre)]
        # print("sql:",sql.format(entity))
        answer_data = self.graph.run(sql.format(entity)).data()
        # print("answer:",answer_data)
        answer_sentence = "不好意思啊！乔乔子还没有学会！"
        if answer_data == []:
           return answer_sentence
        if pre == '0':
            answer_sentence = entity+'简介：\n'
            infos = answer_data[0]['properties(n)']
            for key in infos:
                if infos[key]:
                    answer_sentence += key +":"+infos[key]+";"
            answer_sentence += "\n乔乔子就知道这些啦！我会继续努力的！"
            return answer_sentence
        if pre == '1':
            if answer_data[0]['n.`方言`'] != '':
                answer_sentence = "{}的方言一般为".format(entity) + answer_data[0]['n.`方言`']
            return answer_sentence
        if pre == '2':
            if answer_data[0]['n.`占地面积`'] != '':
                answer_sentence = "{}的面积大概有".format(entity) + answer_data[0]['n.`占地面积`']+"哦！"
            if answer_data[0]['n.`建筑面积`'] != '':
                answer_sentence = "{}的面积大概有".format(entity) + answer_data[0]['n.`建筑面积`']+"哦！"
            if answer_data[0]['n.`规划面积`'] != '':
                answer_sentence = "{}的面积大概有".format(entity) + answer_data[0]['n.`规划面积`']+"哦！"
            if answer_data[0]['n.`总面积`'] != '':
                answer_sentence = "{}的面积大概有".format(entity) + answer_data[0]['n.`总面积`']+"哦！"
            return answer_sentence
        if pre == '3':
            if answer_data[0]['n.`开发建造时间`'] != '':
                answer_sentence = "开发建设{}是在大概".format(entity) + answer_data[0]['n.`开发建造时间`']+"呢！"
            if answer_data[0]['n.`建造时间`'] != '':
                answer_sentence = "开发建设{}是在大概".format(entity) + answer_data[0]['n.`建造时间`']+"呢！"
            return answer_sentence
        if pre == '4':
            if answer_data[0]['n.`当地特产`'] != '':
                answer_sentence = "来{}玩儿可以带".format(entity) + answer_data[0]['n.`当地特产`']+"回去嗷！"
            if answer_data[0]['n.`主要产品`'] != '':
                answer_sentence = "来{}玩儿可以带".format(entity) + answer_data[0]['n.`主要产品`']+"回去嗷！"
            if answer_data[0]['n.`特产`'] != '':
                answer_sentence = "来{}玩儿可以带".format(entity) + answer_data[0]['n.`特产`']+"回去嗷！"
            if answer_data[0]['n.`景区特产`'] != '':
                answer_sentence = "来{}玩儿可以带".format(entity) + answer_data[0]['n.`景区特产`']+"回去嗷！"
            return answer_sentence
        if pre == '5':# 查询国籍，地址,所属区域，分布区域，所属地区，所在地区，地点，地理位置，景区位置
            if answer_data[0]['n.`国籍`'] != '':
                answer_sentence = "{}位于".format(entity) + answer_data[0]['n.`国籍`']+"呢！"
            if answer_data[0]['n.`地址`'] != '':
                answer_sentence = "{}位于".format(entity) + answer_data[0]['n.`地址`']+"呢！"
            if answer_data[0]['n.`所属区域`'] != '':
                answer_sentence = "{}位于".format(entity) + answer_data[0]['n.`所属区域`']+"呢！"
            if answer_data[0]['n.`分布区域`'] != '':
                answer_sentence = "{}位于".format(entity) + answer_data[0]['n.`分布区域`']+"呢！"
            if answer_data[0]['n.`所属地区`'] != '':
                answer_sentence = "{}位于".format(entity) + answer_data[0]['n.`所属地区`'] + "呢！"
            if answer_data[0]['n.`所在地区`'] != '':
                answer_sentence = "{}位于".format(entity) + answer_data[0]['n.`所在地区`'] + "呢！"
            if answer_data[0]['n.`地点`'] != '':
                answer_sentence = "{}位于".format(entity) + answer_data[0]['n.`地点`'] + "呢！"
            if answer_data[0]['n.`地理位置`'] != '':
                answer_sentence = "{}位于".format(entity) + answer_data[0]['n.`地理位置`'] + "呢！"
            if answer_data[0]['n.`景区位置`'] != '':
                answer_sentence = "{}位于".format(entity) + answer_data[0]['n.`景区位置`'] + "呢！"
            return answer_sentence
        if pre == '6':#森林覆盖率，植被覆盖率
            if answer_data[0]['n.`森林覆盖率`'] != '':
                answer_sentence = "{}的森林覆盖率大概在".format(entity) + answer_data[0]['n.`森林覆盖率`']
            if answer_data[0]['n.`植被覆盖率`'] != '':
                answer_sentence = "{}的植被覆盖率大概在".format(entity) + answer_data[0]['n.`植被覆盖率`']
            return answer_sentence
        if pre == '7': # 查询野生动物,动物种类
            if answer_data[0]['n.`野生动物`'] != '':
                answer_sentence = "{}里有这些可爱小动物：".format(entity) + answer_data[0]['n.`野生动物`']
            if answer_data[0]['n.`动物种类`'] != '':
                answer_sentence = "{}里有这些可爱小动物：".format(entity) + answer_data[0]['n.`动物种类`']
            return answer_sentence
        if pre == '8':  # 查询名人，奉化名人
            if answer_data[0]['n.`名人`'] != '':
                answer_sentence = answer_data[0]['n.`名人`']+"是来自{}这个地方的哦！".format(entity)
            if answer_data[0]['n.`奉化名人`'] != '':
                answer_sentence = answer_data[0]['n.`奉化名人`']+"是来自{}这个地方的哦！".format(entity)
            return answer_sentence
        if pre == '9':   # 查询交通，机场，火车站
            if answer_data[0]['n.`交通`'] != '':
                answer_sentence = "{}这里有".format(entity) + answer_data[0]['n.`交通`']+"，出行很方便的！"
            if answer_data[0]['n.`机场`'] != '':
                answer_sentence = "{}这里有".format(entity) + answer_data[0]['n.`机场`'] + "，出行很方便的！"
            if answer_data[0]['n.`火车站`'] != '':
                answer_sentence = "{}这里有".format(entity) + answer_data[0]['n.`火车站`']+"，出行很方便的！"
            return answer_sentence
        if pre == '10':   # 查询平均海拔，海拔高度，高
            if answer_data[0]['n.`平均海拔`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`平均海拔`'] + "那么高"
            if answer_data[0]['n.`海拔高度`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`海拔高度`'] + "那么高"
            if answer_data[0]['n.`高`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`高`'] + "那么高"
            return answer_sentence
        if pre == '11':   # 查询特点，主要游览内容,主要景点，人文景观，著名景点，景区四绝，景区组成，名胜古迹
            if answer_data[0]['n.`特点`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`特点`'] + "的特点"+"，非常值得游览！"
            if answer_data[0]['n.`主要游览内容`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`主要游览内容`'] +"，非常值得游览！"
            if answer_data[0]['n.`主要景点`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`主要景点`'] +"，非常值得游览！"
            if answer_data[0]['n.`人文景观`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`人文景观`'] +"，非常值得游览！"
            if answer_data[0]['n.`著名景点`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`著名景点`'] +"，非常值得游览！"
            if answer_data[0]['n.`景区四绝`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`景区四绝`'] +"，非常值得游览！"
            if answer_data[0]['n.`景区组成`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`景区组成`'] + "，非常值得游览！"
            if answer_data[0]['n.`名胜古迹`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`名胜古迹`'] + "，非常值得游览！"
            return answer_sentence
        if pre == '12': # 查询票价，门票价格
            if answer_data[0]['n.`票价`'] != '':
                answer_sentence = "{}游览门票价格为".format(entity) + answer_data[0]['n.`票价`']+ "，记得提前买票入场啊！"
            if answer_data[0]['n.`门票价格`'] != '':
                answer_sentence = "{}游览门票价格为".format(entity) + answer_data[0]['n.`门票价格`'] + "，记得提前买票入场啊！"
            return answer_sentence
        if pre == '13': # 查询娱乐设施,服务
            if answer_data[0]['n.`娱乐设施`'] != '':
                answer_sentence = "{}提供".format(entity) + answer_data[0]['n.`娱乐设施`']+ "等多种项目，别忘了去享受优质服务哦！"
            if answer_data[0]['n.`服务`'] != '':
                answer_sentence = "{}提供".format(entity) + answer_data[0]['n.`服务`'] + "等多种项目，别忘了去享受优质服务哦！"
            return answer_sentence
        if pre == '14': #查询深度，平均水深，以探深度
            if answer_data[0]['n.`深度`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`深度`']+ "那么深"
            if answer_data[0]['n.`平均水深`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`平均水深`'] + "那么深"
            if answer_data[0]['n.`已探深度`'] != '':
                answer_sentence = "{}有".format(entity) + answer_data[0]['n.`已探深度`'] + "那么深"
            return answer_sentence
        if pre == '15': # 查询气候条件
            if answer_data[0]['n.`气候条件`'] != '':
                answer_sentence = "{}当地气候为".format(entity) + answer_data[0]['n.`气候条件`']+",注意增减衣物！"
            return answer_sentence
        if pre == '16': #人口
            if answer_data[0]['n.`人口`'] != '':
                answer_sentence = "{}的常驻人口为".format(entity) + answer_data[0]['n.`人口`']
            return answer_sentence
        if pre == '17': ##周边景点
            if answer_data[0]['n.`周边景点`'] != '':
                answer_sentence = "{}的周边还有".format(entity) + answer_data[0]['n.`周边景点`']+"，欢迎打卡哦！"
            return answer_sentence
        if pre == '18': ##建造人物
            if answer_data[0]['n.`建造人物`'] != '':
                answer_sentence = answer_data[0]['n.`建造人物`']+"建造了{}哦".format(entity)
            return answer_sentence
        if pre == '19': ##蓄水量
            if answer_data[0]['n.`蓄水量`'] != '':
                answer_sentence = "{}的蓄水量大概有".format(entity)+answer_data[0]['n.`蓄水量`']
            return answer_sentence
        if pre == '20': ##酒店住宿
            if answer_data[0]['n.`酒店住宿`'] != '':
                answer_sentence = "到{}旅游可以选择住在".format(entity)+answer_data[0]['n.`酒店住宿`']
            return answer_sentence
        if pre == '21':  #旅游级别,级别，景区等级，荣誉，誉称，风景区级别
            if answer_data[0]['n.`旅游级别`'] != '':
                answer_sentence = "{}是".format(entity) + answer_data[0]['n.`旅游级别`']+"呢！"
            if answer_data[0]['n.`级别`'] != '':
                answer_sentence = "{}是".format(entity) + answer_data[0]['n.`级别`'] + "呢！"
            if answer_data[0]['n.`景区等级`'] != '':
                answer_sentence = "{}是".format(entity) + answer_data[0]['n.`景区等级`'] + "呢！"
            if answer_data[0]['n.`荣誉`'] != '':
                answer_sentence = "{}是".format(entity) + answer_data[0]['n.`荣誉`'] + "呢！"
            if answer_data[0]['n.`誉称`'] != '':
                answer_sentence = "{}是".format(entity) + answer_data[0]['n.`誉称`'] + "呢！"
            if answer_data[0]['n.`风景区级别`'] != '':
                answer_sentence = "{}是".format(entity) + answer_data[0]['n.`风景区级别`'] + "呢！"
            return answer_sentence
        if pre == '22': #展示植物，植物种类
            if answer_data[0]['n.`植物`'] != '':
                answer_sentence = "{}有多种植物：".format(entity) + answer_data[0]['n.`植物`']
            if answer_data[0]['n.`植物种类`'] != '':
                answer_sentence = "{}有多种植物：".format(entity) + answer_data[0]['n.`植物种类`']
            return answer_sentence
        if pre == '23':
            answer_sentence = "您搜索的{}有这些推荐：".format(entity)
            for info in answer_data:
                answer_sentence += info['name']+','
            answer_sentence +="想要了解更多，快来向我提问！"
            return answer_sentence

if __name__ == '__main__':
    KGgraph = CovidGraph()
    answer = KGgraph.answer("雁荡山",0)
    print(answer)