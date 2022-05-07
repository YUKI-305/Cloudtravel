import random
import csv
# [问题模板，类型，频次（高0中1低2）]
question_model=[['*怎么样','0','0'], ['*','0','1'], ['*简介','0','2'],  # 查询实体（item）
                ['*的方言','1','0'], ['*讲什么话','1','1'], ['*的人有什么方言','1','2'],  # 查询方言
                ['*有多大','2','0'], ['*面积多少','2','1'], ['*占地面积','2','2'],  # 查询占地面积，建筑面积，规划面积，总面积
                ['哪年建的*','3','0'], ['*的建设时间','3','1'], ['*景区是何时开发的','3','2'],  # 查询开发建设时间，建造时间
                ['*有什么特产','4','0'], ['在*有哪些值得买的土特产','4','1'], ['*可以带什么纪念品','4','2'],  # 查询当地特产，主要产品，特产，景区特产
                ['*在哪','5','0'], ['*的位置','5','1'], ['*在什么地方','5','2'],  # 查询国籍，地址,所属区域，分布区域，所属地区，所在地区，地点，地理位置，景区位置
                ['*的森林覆盖率有多大','6','1'], ['*有多大一片森林','6','2'],  #森林覆盖率，植被覆盖率
                ['*有哪些野生动物','7','0'], ['*是哪些动物的栖息地','7','1'], ['*有哪些小动物','7','2'],  # 查询野生动物,动物种类
                ['*有哪些名人','8','0'], ['*出过哪些历史人物','8','1'], ['*是哪些名人的老家','8','2'],  # 查询名人，奉化名人
                ['*的交通便利吗','9','0'], ['*的交通设施','9','1'], ['怎么到*','9','2'],  # 查询交通，机场，火车站
                ['*的平均海拔','10','0'], ['*有多高','10','1'], ['*的海拔','10','2'],  # 查询平均海拔，海拔高度，高
                ['*有哪些特色风光','11','0'], ['*的风景怎么样','11','1'], ['*有哪些值得看到','11','2'],  # 查询特点，主要游览内容,主要景点，人文景观，著名景点，景区四绝，景区组成，名胜古迹
                ['*地的票价设置情况','12','0'], ['*怎么买票','12','1'], ['逛*需要买票吗','12','2'],  # 查询票价，门票价格
                ['在*可以玩些什么','13','0'], ['*的娱乐设施有哪些','13','1'], ['*有哪些娱乐项目','13','2'],  # 查询娱乐设施,服务
                ['*有多深','14','1'], ['*的深度','14','2'],  #查询深度，平均水深，以探深度
                ['*的天气怎么样', '15', '0'],['气候在*这个地方温和吗', '15', '1'],['*很冷吗', '15', '2'],  # 查询气候条件
                ['*这个地方有多少人', '16', '1'],['居住在*有多少', '16', '2'],#人口
                ['在*的周边有哪些值得逛的景点','17','0'],['在*附近的景点','17','1'],['*周围还有什么名胜','28','2'],#周边景点
                ['*是谁建的','18','0'],['谁建的*','18','1'],['*的建造者','18','2'],#建造人物
                ['*有多大的蓄水量','19','1'],['*蓄水量有多少','19','2'],#蓄水量
                ['*周围有哪些酒店','20','0'],['*附近怎么住','20','1'],['*的住宿条件','20','2'],#酒店住宿
                ['*是几星景区','21','0'],['*景区级别','21','1'],['*好不好','21','2'],#旅游级别,级别，景区等级，荣誉，誉称，风景区级别
                ['*有哪些植物','22','0'],['*的植物种类','22','1'],['*的植被有什么','22','2'],#展示植物，植物种类
                ['*有哪些推荐','23','0'],['*有什么好地方','23','0'],['关于*','23','1'],['*去哪比较好','23','1']]#推荐

def mark_question(str):
    str_list = list(str)
    for i,iter in enumerate(str_list):
        if iter =='*' or iter =='/O ':
            continue
        else :
           str_list.insert(i+1,'/O ')
    que = ''.join(str_list)
    return que
def mark_item(str):
    str_list = list(str)
    for i,iter in enumerate(str_list):
        if iter == '/B_it ' or iter == '/M_it ' :
            continue
        elif iter == '/E_it ':
            break
        elif i == 0:
           str_list.insert(i+1,'/B_it ')
        elif i == len(str_list)-1 and iter != '/E_it ':
           str_list.insert(i+1,'/E_it ')
        else:
            str_list.insert(i+1,'/M_it ')
    que = ''.join(str_list)
    return que
def mark_type(str):
    str_list = list(str)
    for i,iter in enumerate(str_list):
        if iter == '/B_ty ' or iter == '/M_ty ' :
            continue
        elif iter == '/E_ty ':
            break
        elif i == 0:
           str_list.insert(i+1,'/B_ty ')
        elif i == len(str_list)-1 and iter != '/E_ty ':
           str_list.insert(i+1,'/E_ty ')
        else:
            str_list.insert(i+1,'/M_ty ')
    que = ''.join(str_list)
    return que

if __name__ == '__main__':
    high_frequency = 500
    mid_frequency = 300
    low_frequency = 100
    question_data = []
    question_data_mark = []
    item_info = []
    type_info = []
    with open("attraction_entity.csv",encoding='utf-8') as item_file:
        info = csv.reader(item_file)
        for row in info:
            if row[0]=='item':
                item_info.append(row[1])

    with open("attraction_entity.csv",encoding='utf-8') as type_file:
        info = csv.reader(type_file)
        for row in info:
            if row[0] == 'type':
                type_info.append(row[1])

    for question in question_model:
        if question[1]!='23':
            model = question[0]
            model_mark = mark_question(question[0])
            if question[2]=='0':
                frequency = high_frequency
            elif question[2] == '1':
                frequency = mid_frequency
            else:
                frequency = low_frequency
            for info in item_info:
                if frequency == 0:
                    break
                else:
                    que = model.replace('*',info)
                    question_data.append([que,question[1]])
                    info_mark = mark_item(info)
                    que_mark = model_mark.replace('*',info_mark)
                    question_data_mark.append([que_mark])
                    frequency-=1

        else:
            model = question[0]
            model_mark = mark_question(question[0])
            if question[2]=='0':
                frequency = high_frequency
            elif question[2] == '1':
                frequency = mid_frequency
            else:
                frequency = low_frequency
            for info in type_info:
                if frequency == 0:
                    break
                else:
                    que = model.replace('*',info)
                    question_data.append([que,question[1]])
                    info_mark = mark_type(info)
                    que_mark = model_mark.replace('*',info_mark)
                    question_data_mark.append([que_mark])
                    frequency-=1

    random.shuffle(question_data)
    random.shuffle(question_data_mark)

    with open("question.csv", "w", newline='') as csvfile:
                writer = csv.writer(csvfile)
                for que in question_data:
                    writer.writerow(que)

    with open("question_mark.csv", "w", newline='') as csvfile:
                writer = csv.writer(csvfile)
                for que in question_data_mark:
                    writer.writerow(que)
