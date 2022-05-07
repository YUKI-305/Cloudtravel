<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <!--是标题啊-->
    <title>Travel in China</title>
    <meta http-eqiv="content-type" content="text/html" charset="utf-8" />
    <meta http-equiv="Content-Language" content="en-us" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta name="MSSmartTagsPreventParsing" content="true" />
    <meta name="description" content="Description" />
    <meta name="keywords" content="Keywords" />
    <meta name="author" content="Enlighten Designs" />
    <style type="text/css" media="all">
        @import "main.css";
    </style>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=1.0&&type=webgl&ak=x40ygmxMnWTrbc5SFDu86CrDthVXgOr7"></script>
    <script type="text/javascript" src="//api.map.baidu.com/library/TrackAnimation/src/TrackAnimation_min.js"></script>
</head>
<body>
<div class="talk-AI-box">
    <img class="talk-AI-img" src="image/nav/img-ai.png" alt="AI">
</div>
<div class="chat">
    <div class="chat-header clearfix">
        <div class="chat-name">旅行助手乔乔子</div>
        <img class="img-dismiss" src="images/nav/like1.svg" alt="dismiss" title="dismiss">
    </div>

    <div class="chat-history">
        <ul>
            <li>
                <img class="pic-me" src="images/banner/spring01.png" alt="我">
                <div class="message my-message">
                    让我看看是哪个小可爱又来了呀？
                </div>
            </li>

            <li class="clearfix">
                <div class="message other-message float-right">
                    原来是我的好大儿雯铎呀？他来干什么了呢，让我猜一猜，她一定是来偷偷充电啦！
                </div>
                <img class="pic-AI" src="images/login/profile.png" alt="乔乔子">
            </li>
        </ul>
    </div> <!-- end chat-history -->

    <div class="chat-message clearfix">
        <textarea name="message-to-send" id="message-to-send" placeholder="你想要问什么呢？" rows="2"></textarea>
        <button class="button-send">发送</button>
    </div> <!-- end chat-message -->
</div>
<%
    String accountHref = "Account.jsp";
    if(session.getAttribute("username") == null)
        accountHref ="login.jsp";
%>
<div id="top_logo">
    <div id="right-top">
        <ul>
            <li id="home" title="主页"><a href="main.jsp"></a></li>
            <li id="community" title="社区"><a href="community_home.jsp"></a></li>
            <li id="shop" title="特产文创"><a href="Shop_home.jsp"></a></li>
            <li id="account" title="个人中心"><a href="<%=accountHref %>"></a></li>
        </ul>
    </div>
</div>

<div id="container">
</div>

<script>

</script>
<script>
//创建地图实例
var map = new BMapGL.Map("container",{enableMapClick: true});
//设置中心点
var point = new BMapGL.Point(116.404, 39.915);
//地图初始化
map.centerAndZoom(point, 7);
//鼠标滚轮
map.enableScrollWheelZoom(true);
//添加控件
var scaleCtrl = new BMapGL.ScaleControl();  // 添加比例尺控件
map.addControl(scaleCtrl);
var zoomCtrl = new BMapGL.ZoomControl();  // 添加缩放控件
map.addControl(zoomCtrl);
//控制控件位置
var opts0 = {
    offset: new BMapGL.Size(20, 90)
}
var cityCtrl = new BMapGL.CityListControl(opts0);  // 添加城市列表控件
map.addControl(cityCtrl);

//自定义marker
var myIcon = new BMapGL.Icon("image/scene/pot.svg", new BMapGL.Size(60, 60), {
    anchor: new BMapGL.Size(25, 40),
    //imageOffset: new BMapGL.Size(0, 0 - 25)   // 设置图片偏移
});
//添加标记北京天安门
var point1 = new BMapGL.Point(116.404, 39.915);
var marker1 = new BMapGL.Marker(point1,{icon: myIcon});        // 创建标注
map.addOverlay(marker1);
//marker1.addEventListener("click",function (){
//    trackAni.start();
//})
//文本
var content1 = '天安门';
var label1 = new BMapGL.Label(content1, {       // 创建文本标注
    position: point1,
    offset: new BMapGL.Size(-16, -25)
})
map.addOverlay(label1);                        // 将标注添加到地图中
label1.setStyle({                              // 设置label的样式
    color: '#fff',
    fontSize: '13px',
    background: '#1296db',
    border: '0px solid #1296db',
    fontWeight: 'bold'
})
// 创建图文信息窗口
var sContent = `<h4 style='margin:0 0 5px 0;'>天安门</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/tiananmen.png' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    天安门（Tian'anmen），坐落在中华人民共和国首都北京市的中心、故宫的南端，与天安门广场以及人民英雄纪念碑、毛主席纪念堂、人民大会堂、中国国家博物馆隔长安街相望，占地面积4800平方米，以杰出的建筑艺术和特殊的政治地位为世人所瞩目。
    天安门是明清两代北京皇城的正门，始建于明朝永乐十五年（1417年），最初名“承天门”，寓“承天启运、受命于天”之意。清朝顺治八年（1651年）更名为天安门。
    </p></div>`;
var infoWindow1 = new BMapGL.InfoWindow(sContent);
// marker添加点击事件
marker1.addEventListener('click', function () {
    this.openInfoWindow(infoWindow1);
    // 图片加载完毕重绘infoWindow
    document.getElementById('imgDemo').onload = function () {
        infoWindow1.redraw(); // 防止在网速较慢时生成的信息框高度比图片总高度小，导致图片部分被隐藏
    };
});
//批量添加标记点
var scene = [
    {"name":'西藏省林芝市',"province":'西藏省',"city":'西藏市',"title":'林芝'},
    {"name":'辽宁省沈阳市故宫',"province":'辽宁省',"city":'沈阳市',"title":'沈阳故宫'},
    {"name":'辽宁省沈阳市张氏帅府',"province":'辽宁省',"city":'沈阳市',"title":'张氏帅府'},
    {"name":'上海市东方明珠广播电视塔',"province":'上海市',"city":'上海市',"title":'东方明珠'},
    {"name":'河南省洛阳市老君山',"province":'河南省',"city":'洛阳市',"title":'老君山'},
    {"name":'云南省昆明市官渡古镇',"province":'云南省',"city":'昆明市',"title":'官渡古城'},
    {"name":'云南省昆明市石林景区',"province":'云南省',"city":'昆明市',"title":'石林景区'},
    {"name":'云南省大理市洱海公园',"province":'云南省',"city":'大理市',"title":'洱海'},
    {"name":'云南省大理市大理古城',"province":'云南省',"city":'大理市',"title":'大理古城'},
    {"name":'云南省丽江市玉龙雪山',"province":'云南省',"city":'丽江市',"title":'玉龙雪山'},
    {"name":'云南省丽江市丽江古城',"province":'云南省',"city":'丽江市',"title":'丽江古城'},
    {"name":'云南省丽江市泸沽湖风景区',"province":'云南省',"city":'丽江市',"title":'泸沽湖'},
    {"name":'上海市城隍庙',"province":'上海市',"city":'上海市',"title":'城隍庙'},
    {"name":'陕西省华阴市华山风景名胜区',"province":'陕西省',"city":'华阴市',"title":'华山'},
    {"name":'新疆省赛里木湖',"province":'新疆省',"city":'博乐市',"title":'赛里木湖'},
    {"name":'新疆省喀纳斯湖国家地质公园',"province":'新疆省',"city":'新疆维吾尔自治区',"title":'喀纳斯湖'},
    {"name":'新疆维吾尔自治区昌吉回族自治州阜康市天山天池风景区',"province":'新疆省',"city":'阜康市',"title":'天山天池'},
    {"name":'新疆阿勒泰地区富蕴县可可托海国家地质公园',"province":'新疆省',"city":'富蕴县',"title":'可可托海'},
    {"name":'浙江省杭州市西湖',"province":'浙江省',"city":'杭州市',"title":'西湖'},
    {"name":'浙江省桐乡市乌镇风景区',"province":'浙江省',"city":'桐乡市',"title":'乌镇'},
    {"name":'浙江省温州市雁荡山风景名胜区',"province":'浙江省',"city":'温州市',"title":'雁荡山'},
    {"name":'浙江省绍兴市鲁迅故里',"province":'浙江省',"city":'绍兴市',"title":'鲁迅故里'},
    {"name":'浙江省舟山市普陀山风景名胜区',"province":'浙江省',"city":'舟山市',"title":'普陀山'},

    {"name":'江苏省连云港市连岛海滨旅游度假区',"province":'江苏省',"city":'连云港市',"title":'连岛'},
    {"name":'江苏省南京市瞻园',"province":'江苏省',"city":'南京市',"title":'瞻园'},
    {"name":'江苏省无锡市惠山古镇',"province":'江苏省',"city":'无锡市',"title":'惠山古镇'},

    {"name":'福建省厦门市鼓浪屿',"province":'福建省',"city":'厦门市',"title":'鼓浪屿'},
    {"name":'福建省厦门市厦门大学(思明校区)',"province":'福建省',"city":'厦门市',"title":'厦门大学'},
    {"name":'福建省福州市鼓楼区西禅寺',"province":'福建省',"city":'福州市',"title":'西禅寺'},
    {"name":'福建省南平市武夷山国家重点风景名胜区',"province":'福建省',"city":'南平市',"title":'武夷山'},

    {"name":'江西省萍乡市萍乡武功山国家级风景名胜区',"province":'江西省',"city":'萍乡市',"title":'武功山'},
    {"name":'江西省上饶市婺源县江岭风景区',"province":'江西省',"city":'上饶市',"title":'江岭'},
    {"name":'江西省景德镇市陶溪川文创街区',"province":'江西省',"city":'景德镇市',"title":'景德镇'},

    {"name":'广东省阳江市海陵岛',"province":'广东省',"city":'阳江市',"title":'海陵岛'},
    {"name":'广东省深圳市红树林海滨生态公园',"province":'广东省',"city":'深圳市',"title":'红树林'},
    {"name":'广东省广州市广州塔',"province":'广东省',"city":'广州市',"title":'广州塔'},
    {"name":'广东省江门市开平碉楼文化旅游区',"province":'广东省',"city":'江门市',"title":'开平碉楼'},

    {"name":'广西壮族自治区北海市北海老街',"province":'广西壮族自治区',"city":'北海市',"title":'北海老街'},
    {"name":'广西壮族自治区桂林市訾洲岛景区',"province":'广西壮族自治区',"city":'桂林市',"title":'訾洲岛'},
    {"name":'广西壮族自治区南宁市更望湖',"province":'广西壮族自治区',"city":'南宁市',"title":'更望湖'},

    {"name":'湖南省长沙市橘子洲景区',"province":'湖南省',"city":'长沙市',"title":'橘子洲'},
    {"name":'湖南省张家界市天门山国家森林公园',"province":'湖南省',"city":'张家界市',"title":'张家界'},
    {"name":'湖南省湘西土家族苗族自治州凤凰县凤凰古城',"province":'湖南省',"city":'湘西土家族苗族自治州',"title":'凤凰古城'},
    {"name":'湖南省岳阳市岳阳楼景区',"province":'湖南省',"city":'岳阳市',"title":'岳阳楼'},

    {"name":'安徽省宣城市泾县桃花潭镇桃花潭风景区',"province":'安徽省',"city":'宣城市',"title":'桃花潭'},
    {"name":'安徽省黄山市黄山风景区',"province":'安徽省',"city":'黄山市',"title":'黄山'},
    {"name":'安徽省宣城市敬亭山风景名胜区',"province":'安徽省',"city":'宣城市',"title":'敬亭山'},

    {"name":'山东省青岛市五四广场',"province":'山东省',"city":'青岛市',"title":'五四广场'},
    {"name":'山东省烟台市长岛风景区',"province":'山东省',"city":'烟台市',"title":'长岛'},
    {"name":'山东省济南市大明湖公园',"province":'山东省',"city":'济南市',"title":'大明湖'},
    {"name":'山东省泰安市泰山风景名胜区',"province":'山东省',"city":'泰安市',"title":'泰山'},

    /*神农架-它独立了*/
    {"name":'湖北省神农架林区神农架国家级自然保护区',"province":'湖北省',"city":'',"title":'神农架'},
    {"name":'湖北省宜昌市三峡大坝旅游景区',"province":'湖北省',"city":'宜昌市',"title":'三峡'},
    {"name":'湖北省荆州市荆州古城历史文化旅游区',"province":'湖北省',"city":'荆州市',"title":'荆州古城'},

    {"name":'重庆市渝中区重庆洪崖洞',"province":'',"city":'重庆市',"title":'洪崖洞'},
    {"name":'重庆市渝中区长江索道',"province":'',"city":'重庆市',"title":'长江索道'},
    {"name":'重庆市渝中区人民解放纪念碑',"province":'',"city":'重庆市',"title":'解放碑'},

    {"name":'四川省成都市成都大熊猫繁育研究基地',"province":'四川省',"city":'成都市',"title":'大熊猫'},
    {"name":'四川省都江堰市都江堰景区',"province":'四川省',"city":'都江堰市',"title":'都江堰'},
    {"name":'四川省阿坝藏族羌族自治州九寨沟县',"province":'四川省',"city":'阿坝藏族羌族自治州',"title":'九寨沟'},
    {"name":'四川省乐山市峨眉山风景区',"province":'四川省',"city":'乐山市',"title":'峨眉山'},
    {"name":'四川省乐山市乐山大佛',"province":'四川省',"city":'乐山市',"title":'乐山大佛'},

    {"name":'陕西省西安市秦始皇兵马俑博物馆',"province":'陕西省',"city":'西安市',"title":'兵马俑'},
    {"name":'陕西省西安市大唐不夜城',"province":'陕西省',"city":'西安市',"title":'唐不夜城'},
    {"name":'陕西省延安市陕西黄河壶口瀑布风景名胜区',"province":'陕西省',"city":'延安市',"title":'壶口瀑布'},
    {"name":'陕西省延安市黄帝陵',"province":'陕西省',"city":'延安市',"title":'黄帝陵'},
    {"name":'陕西省安康市瀛湖风景区',"province":'陕西省',"city":'安康市',"title":'瀛湖'},

    {"name":'甘肃省酒泉市敦煌莫高窟',"province":'甘肃省',"city":'酒泉市',"title":'莫高窟'},
    {"name":'甘肃省敦煌市嘉峪关长城文化旅游景区',"province":'甘肃省',"city":'嘉峪关市',"title":'嘉峪关'},
    {"name":'甘肃省敦煌市鸣沙山月牙泉风景名胜区',"province":'甘肃省',"city":'敦煌市',"title":'月牙泉'},
    {"name":'甘肃省张掖市临泽县七彩丹霞风景区',"province":'甘肃省',"city":'张掖市',"title":'七彩丹霞'},

    {"name":'宁夏回族自治区银川市怀远观光夜市',"province":'宁夏回族自治区',"city":'银川市',"title":'怀远夜市'},
    {"name":'宁夏回族自治区吴忠市罗山国家级自然保护区',"province":'宁夏回族自治区',"city":'吴忠市',"title":'罗山'},
    {"name":'宁夏回族自治区中卫市双龙石窟石空大佛寺',"province":'宁夏回族自治区',"city":'中卫市',"title":'双龙石窟'},

    {"name":'山西省晋中市',"province":'山西省',"city":'晋中市',"title":'平遥古城'},
    {"name":'山西省忻州市五台山风景名胜区',"province":'山西省',"city":'忻州市',"title":'五台山'},
    {"name":'山西省太原市东湖醋园',"province":'山西省',"city":'太原市',"title":'东湖醋园'},

    {"name":'青海省海西蒙古族藏族自治州格尔木市察尔汗盐湖',"province":'青海省',"city":'海西蒙古族藏族自治州',"title":'察尔汗'},
    {"name":'青海省西宁市湟源县日月山',"province":'青海省',"city":'西宁市',"title":'日月山'},
    {"name":'青海省海西蒙古族藏族自治州翡翠湖',"province":'青海省',"city":'海西蒙古族藏族自治州',"title":'翡翠湖'},

    {"name":'河北省秦皇岛市山海关风景区',"province":'河北省',"city":'秦皇岛市',"title":'山海关'},
    {"name":'河北省承德市承德避暑山庄',"province":'河北省',"city":'承德市',"title":'避暑山庄'},
    {"name":'河北省保定市白洋淀风景区',"province":'河北省',"city":'保定市',"title":'白洋淀'},
    {"name":'河北省保定市白石山景区',"province":'河北省',"city":'保定市',"title":'白石山'},

    {"name":'内蒙古自治区呼伦贝尔市呼伦贝尔大草原',"province":'内蒙古自治区',"city":'呼伦贝尔市',"title":'大草原'},
    {"name":'内蒙古自治区呼伦贝尔市呼伦湖旅游景区',"province":'内蒙古自治区',"city":'呼伦贝尔市',"title":'呼伦湖'},

    {"name":'西藏自治区日喀则地区定日县珠穆朗玛峰',"province":'西藏自治区',"city":'日喀则地区',"title":'珠穆朗玛'},
    {"name":'西藏自治区拉萨市纳木景区',"province":'西藏自治区',"city":'拉萨市',"title":'纳木错'},
    {"name":'西藏自治区山南市羊卓雍措',"province":'西藏自治区',"city":'山南市',"title":'羊卓雍措'},
    {"name":'西藏自治区拉萨市布达拉宫',"province":'西藏自治区',"city":'拉萨市',"title":'布达拉宫'},
    {"name":'西藏自治区林芝市雅鲁藏布大峡谷',"province":'西藏自治区',"city":'林芝市',"title":'雅鲁藏布'},

    {"name":'黑龙江省哈尔滨市哈尔滨冰雪大世界',"province":'黑龙江省',"city":'哈尔滨市',"title":'冰雪世界'},
    {"name":'黑龙江省哈尔滨市圣索菲亚教堂',"province":'黑龙江省',"city":'哈尔滨市',"title":'圣索菲亚'},
    {"name":'黑龙江省大兴安岭地区漠河市北极村',"province":'黑龙江省',"city":'漠河市',"title":'北极村'},

    {"name":'吉林省延边朝鲜族自治州安图县长白山自然保护区',"province":'吉林省',"city":'延边朝鲜族自治州',"title":'长白山'},
    {"name":'吉林省延边朝鲜族自治州长白山梦幻魔界漂流',"province":'吉林省',"city":'延边朝鲜族自治州',"title":'魔界漂流'},
    {"name":'吉林省吉林市雾凇岛',"province":'吉林省',"city":'吉林市',"title":'雾凇岛'},

    {"name":'海南省乐东黎族自治县尖峰岭国家森林公园',"province":'海南省',"city":'乐东黎族自治县',"title":'尖峰岭'},
    {"name":'海南省临高县古银瀑布',"province":'海南省',"city":'临高县',"title":'古银瀑布'},
    {"name":'海南省三亚市亚龙湾热带天堂森林公园',"province":'海南省',"city":'三亚市',"title":'亚龙湾'},
    {"name":'海南省三亚市椰梦长廊',"province":'海南省',"city":'三亚市',"title":'椰梦长廊'},
];
//批量图文信息
var sContent_arr = [
    {"con":`<h4 style='margin:0 0 5px 0;'>林芝</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/linzhi.png' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    林芝的桃花沟是一片天然野生桃林，高处有水源，四周林木葱茏，终年碧绿苍翠，间有流水，清澈见底。每年的三、四月，寒意未尽，但是这片巨大的野桃林给林芝带来了一片壮丽的春天，当远方的雪峰还有皑皑白雪，桃花却已如醉霞绯云般地争相斗艳。
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>沈阳故宫</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/guandu.jpg' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    沈阳故宫，又称盛京皇宫，位于辽宁省沈阳市沈河区，为清朝初期的皇宫。沈阳故宫始建于清太祖天命十年（1625年），建成于清崇德元年（1636年）。 总占地面积63272平方米，建筑面积18968平方米。它不仅是中国仅存的两大皇家宫殿建筑群之一，也是中国关外唯一的一座皇家建筑群。
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>张氏帅府</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/guandu.jpg' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    张氏帅府始建于民国三年（1914年）9月，总占地3.6万平方米，总建筑面积为2.76万平方米。民国五年（1916年）张作霖正式入住，以后又不断扩建，逐步形成了由东院、中院、西院和院外建筑等四个部分组成的的建筑体系。各个建筑风格各异，有中国传统式、中西合璧式、罗马式、北欧式、日本式。主要有大青楼、小青楼、西院红楼群及赵四小姐楼等建筑。
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>东方明珠</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/guandu.jpg' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    东方明珠广播电视塔，简称“东方明珠”，位于上海市浦东新区陆家嘴世纪大道1号，地处黄浦江畔，背拥陆家嘴地区现代化建筑楼群，与隔江的外滩万国建筑博览群交相辉映，始建于1994年10月1日，是集都市观光、时尚餐饮、购物娱乐、历史陈列、浦江游览、会展演出、广播电视发射等多功能于一体的上海市标志性建筑之一。截至2019年，为亚洲第六高塔、世界第九高塔。
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>老君山</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/guandu.jpg' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>官渡古城</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/guandu.jpg' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    作为一个历史悠久的古镇，官渡曾是一个誉满滇中的古渡口，是昆明历史文化名城古镇之一，唐宋时已是滇池东昆岸的一大集镇，元代与昆明同时设县，明清已成为商业、手工业很发达的乡镇。昔日官渡，商贾云集，高塔辉映，有五山、六寺、七阁、八 庙和众多人文景观， 至今仍保留着许多文化建筑遗址。
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>石林景区</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/shilin.jpg' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    昆明市石林风景区，又称为云南石林，位于昆明石林彝族自治县境内，距离云南省会昆明78公里。范围达350平方公里。
    昆明市石林风景区开发为游览区的主要是：石林风景区、黑松岩（乃古石林）风景区、飞龙瀑（大叠水）风景区、长湖风景区。
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>洱海</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/erhai.jpg' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    洱海，古称昆明池、洱河、叶榆泽等。位于云南省大理白族自治州大理市。一般湖水面积约246平方千米（一说251平方公里），蓄水量约29.5亿立方米，呈狭长形，北起洱源县南端，南止大理市下关，南北长40公里，是仅次于滇池的云南第二大湖，中国淡水湖中居第7位。洱海形成于冰河时代末期，其成因主要是沉降侵蚀，属高原构造断陷湖泊，海拔1972米。
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>大理古城</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/dali.jpg' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    大理古城位于云南省西部，又名叶榆城、紫城。古城其历史可追溯至唐天宝年间，南诏王阁逻凤筑的羊苴咩城，为其新都。古城始建于明洪武十五年（1382年），占地面积3平方公里。
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>玉龙雪山</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/yulong.png' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    玉龙雪山为云南省丽江市境内雪山群，西临虎跳峡涧、南起玉湖，北至大具下虎跳峡口，隔江西与中甸雪山、东与绵绵山相并列，北自三江口，如扇面向古城展开。
    玉龙雪山在纳西语中被称为“欧鲁”，意为“天山”。其十三座雪峰连绵不绝，宛若一条“巨龙”腾越飞舞，故称为“玉龙”。又因其岩性主要为石灰岩与玄武岩，黑白分明，所以又称为“黑白雪山”。是纳西人的神山，传说纳西族保护神“三朵”的化身。
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>丽江古城</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/lijiang.png' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    丽江古城历史悠久，兼有水乡之容、山城之貌，从城市总体布局到工程、建筑融汉、白、彝、藏各民族精华，自具纳西族独特风采。古城多元文化相互融合的文化价值是研究中国城市建设史、建筑史、文化史不可多得的重要遗产，体现了特定历史条件下的城镇建筑中所特有的人类创造精神和进步意义。
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>泸沽湖</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/luguhu.jpg' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    泸沽湖湖盆区坐落于永宁盆地，是中国第三大深水湖泊，湖内有一小岛。泸沽湖周边主要居住着摩梭人、彝族和普米族，沿岸居住有蒙古族7种民族，约1.3万人。优美的自然环境和奇特的民族风情，使这里成为著名的旅游景区。
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>华山</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/huashan.jpg' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    华山，古称“西岳”，雅称“太华山”，为五岳之一，位于陕西省渭南市华阴市，在省会西安以东120千米处。南接秦岭山脉，北瞰黄渭，自古以来就有“奇险天下第一山”的说法。
    中华之“华”源于华山，由此，华山有了“华夏之根”之称 。华山是中国道教主流全真派圣地，为“第四洞天”，也是中国民间广泛崇奉的神祇，即西岳华山君神。
    </p></div>`},
    {"con":`<h4 style='margin:0 0 5px 0;'>武汉大学</h4>
    <img style='float:right;margin:0 4px 22px' id='imgDemo' src='./image/scene/guandu.jpg' width='400' height='300'/>
    <p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>
    武汉大学是有着百年历史的名校，武大不仅有浓厚的学术氛围，而且美丽的武大校园更是名声在外，被誉为全国最美的大学校园。而武大樱花就是其中最为美丽的一景！
武大樱花开于三月中旬，至下旬最为鼎盛，花期较短，仅13-20天左右。每年樱花盛开之时，来自全国各地的游人旅客如织如潮，有百万以上的游客慕名而来。樱花大道旁摩肩擦踵，樱花纷飞，好不美丽！
    </p></div>`},
];
//创建地址解析器实例
var myGeo = new BMapGL.Geocoder();
// 将地址解析结果显示在地图上，批量添加标记和图文信息
addScene(scene);
function addScene(scene){
    for(var i=0;i<scene.length;i++){
        (function (i){
            myGeo.getPoint(scene[i].name, function(point){
                if(point){
                    //添加标记点
                    var marker = new BMapGL.Marker(point,{icon: myIcon});
                    map.addOverlay(marker);
                    //添加文本
                    var content = scene[i].title;
                    var dif = [0,0,-10,-16,-22];
                    var label = new BMapGL.Label(content, {       // 创建文本标注
                        position: point,
                        offset: new BMapGL.Size(dif[scene[i].title.length], -25)
                    })
                    map.addOverlay(label);                        // 将标注添加到地图中
                    label.setStyle({                              // 设置label的样式
                        color: '#fff',
                        fontSize: '13px',
                        background: '#1296db',
                        border: '0px solid #1296db',
                        fontWeight: 'bold'
                    })
                    var infoWindow = new BMapGL.InfoWindow(sContent_arr[i].con);
                    marker.addEventListener("click", function(){
                        this.openInfoWindow(infoWindow);
                        // 图片加载完毕重绘infoWindow
                        document.getElementById('imgDemo').onload = function () {
                            infoWindow.redraw(); // 防止在网速较慢时生成的信息框高度比图片总高度小，导致图片部分被隐藏
                        };
                    });
                    if(scene[i].province=='云南省'){
                        yunnan_point.push(new BMapGL.Point(point.lng, point.lat));
                    }
                }else{
                    //('您选择的地址没有解析到结果！');
                }
            }, scene[i].city)
        })(i)
    }
}

//设置云南省旅游轨迹动画
var path = [{
    'lng': 103.324356,
    'lat': 24.812281
}, {
    'lng': 102.760121,
    'lat': 24.953658
}, {
    'lng': 100.24588,
    'lat': 25.603661
}, {
    'lng': 100.165497,
    'lat': 25.695471
}, {
    'lng': 100.22549,
    'lat': 26.87721
}, {
    'lng': 100.213715,
    'lat': 27.125282
}, {
    'lng': 100.7864,
    'lat': 27.683392
}];
var point2 = [];
for (var i = 0; i < path.length; i++) {
    point2.push(new BMapGL.Point(path[i].lng, path[i].lat));
}
var pl = new BMapGL.Polyline(point2,{strokeColor: "#1296db", strokeWeight: 3});
var trackAni = new BMapGLLib.TrackAnimation(map, pl, {
    overallView: true, // 动画完成后自动调整视野到总览
    tilt: 55,          // 轨迹播放的角度，默认为55
    duration: 5000,   // 动画持续时长，默认为10000，单位ms
    delay: 300 ,       // 动画开始的延迟，默认0，单位ms
});

//北京
var path3 = [{
    'lng': 116.297611,
    'lat': 40.047363
}, {
    'lng': 116.302839,
    'lat': 40.048219
}, {
    'lng': 116.308301,
    'lat': 40.050566
}, {
    'lng': 116.305732,
    'lat': 40.054957
}, {
    'lng': 116.304754,
    'lat': 40.057953
}, {
    'lng': 116.306487,
    'lat': 40.058312
}, {
    'lng': 116.307223,
    'lat': 40.056379
}];
var point3 = [];
for (var i = 0; i < path3.length; i++) {
    point3.push(new BMapGL.Point(path3[i].lng, path3[i].lat));
}
var pl3 = new BMapGL.Polyline(point3);
var trackAni3 = new BMapGLLib.TrackAnimation(map, pl3, {
    overallView: true, // 动画完成后自动调整视野到总览
    tilt: 30,          // 轨迹播放的角度，默认为55
    duration: 5000,   // 动画持续时长，默认为10000，单位ms
    delay: 300        // 动画开始的延迟，默认0，单位ms
});
//妄图封装
//var point4 = new BMapGL.Point(116.504, 39.915);
//var yunnan_point = [];
//var pl_yunnan = new BMapGL.Polyline(yunnan_point,{strokeColor: "#1296db", strokeWeight: 3});
//var trackAni_yunnan = new BMapGLLib.TrackAnimation(map, pl_yunnan, {
//    overallView: true, // 动画完成后自动调整视野到总览
//    tilt: 30,          // 轨迹播放的角度，默认为55
//    duration: 10000,   // 动画持续时长，默认为10000，单位ms
//    delay: 300 ,       // 动画开始的延迟，默认0，单位ms
//});

//设置右键点击出旅游路线图
var menu = new BMapGL.ContextMenu();
var txtMenuItem = [
    {
        text: '云南省云游路线图',
        callback: function () {
            trackAni.start();
        }
    },
    {
        text: '北京云游路线图',
        callback: function () {
            trackAni3.start();
        }
    }
];
for (var j = 0; j < txtMenuItem.length; j++) {
    menu.addItem(new BMapGL.MenuItem(txtMenuItem[j].text, txtMenuItem[j].callback, 100));
}
map.addContextMenu(menu);

</script>

<script id="message-template" type="text/x-handlebars-template">
    <li class="clearfix">
        <img class="pic-me" src="images/banner/spring01.png" alt="我">
        <div class="message my-message">
            {{messageOutput}}
        </div>
    </li>
</script>

<script id="message-response-template" type="text/x-handlebars-template">
    <li class="clearfix">
        <div class="message other-message float-right">
            {{response}}
        </div>
        <img class="pic-AI" src="images/login/profile.png" alt="乔乔子">
    </li>
</script>

<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js'></script>
<script id="rendered-js">
    (function () {

        var chat = {
            messageToSend: '',
            messageResponses: [
                '今天吃什么呢？肉夹馍还是小火锅，小孩子才做选择，乔乔子都要！',
                '明天会降温哦，要记得多穿一点衣服！',
                '冉冉子，你是我的神！',
                '让我看看是谁又睡懒觉了？哦，原来是我们的拂晓女鹅。快看，雯铎又把她的小jio露出来了~',
                '你饿了吗？乔乔子好饿呀！',
                '请加入我们的团队，一起开始饥荒吧，high到天亮，耶耶耶！'
            ],
            init: function () {
                this.cacheDOM();
                this.bindEvents();
                this.render();
            },
            cacheDOM: function () {
                this.$chatHistory = $('.chat-history');
                this.$button = $('.button-send');
                this.$textarea = $('#message-to-send');
                this.$chatHistoryList = this.$chatHistory.find('ul');
            },
            bindEvents: function () {
                this.$button.on('click', this.addMessage.bind(this));
                this.$textarea.on('keyup', this.addMessageEnter.bind(this));
            },
            render: function () {
                this.scrollToBottom();
                if (this.messageToSend.trim() !== '') {
                    var template = Handlebars.compile($("#message-template").html());
                    var context = {
                        messageOutput: this.messageToSend,
                        time: this.getCurrentTime()
                    };

                    this.$chatHistoryList.append(template(context));
                    this.scrollToBottom();
                    this.$textarea.val('');

                    // responses
                    var templateResponse = Handlebars.compile($("#message-response-template").html());
                    var contextResponse = {
                        response: this.getRandomItem(this.messageResponses),
                        time: this.getCurrentTime()
                    };

                    setTimeout(function () {
                        this.$chatHistoryList.append(templateResponse(contextResponse));
                        this.scrollToBottom();
                    }.bind(this), 1000);

                }

            },

            addMessage: function () {
                this.messageToSend = this.$textarea.val()
                this.render();
            },
            addMessageEnter: function (event) {
                // enter was pressed
                if (event.keyCode === 13) {
                    this.addMessage();
                }
            },
            scrollToBottom: function () {
                this.$chatHistory.scrollTop(this.$chatHistory[0].scrollHeight);
            },
            getCurrentTime: function () {
                return new Date().toLocaleTimeString().replace(/([\d]+:[\d]{2})(:[\d]{2})(.*)/, "$1$3");
            },
            getRandomItem: function (arr) {
                return arr[Math.floor(Math.random() * arr.length)];
            }

        };

        chat.init();

    })();
</script>
<script type="text/javascript">
    $(".talk-AI-box").click(function () {
        $(".chat").toggle("10");
        $(".talk-AI-box").toggle("10");
    })
    $(".img-dismiss").click(function () {
        $(".chat").toggle("10");
        $(".talk-AI-box").toggle("0");
    })
    $(document).mousemove(function(event){
        var y = event.pageY;
        $(".talk-AI-box").offset({ top: y, right:0 })
    });

</script>
</body>
</html>
