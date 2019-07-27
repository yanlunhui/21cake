<template>
    <div class="footer">
        <img src="img/footer-logo.png" alt="" class="footer-logo" height="36" width="96">
        <div class="footer-nav">
            <a href="">联系我们</a>
            <span>|</span>
            <a href="">订购帮助</a>
            <span>|</span>
            <a href="">企业合作</a>
            <span>|</span>
            <a href="">生产经营资质</a>
            <span>|</span>
            <a href="">公告专区</a>
        </div>
        <div class="footer-icon">
            <a href="#">
                <img src="img/footericon-01.png" alt="">
            </a>
            <a href="" class="footer-weixin">
                <div class="erweima">
                    <img src="img/erweima.png" alt="">
                </div>
                <img src="img/footericon-02.png" alt="">
            </a>
            <a href="" class="footer-erweima">
                <div class="f-erweima"><img src="img/footer-erweima.png" alt=""></div>    
                APP
            </a>
        </div>
        <div class="footer-text">
            <span>
                订购专线：400 650 2121 （服务时间 08:00-22:00），企业团购热线：021-37768396
            </span>
            <span>
                客服电话：021-23099721（全国），kefu@21cake.com（邮箱）
            </span>
            <span>
                 杭州/广州：提前5小时预订；北京：提前6小时预订；上海：提前5.5-6小时预订；天津/苏州/无锡/深圳：提前8小时预订（部分偏远地区除外，当日22点以后订单，于次日8点开始审核）
            </span>
            <span>
                    当日蛋糕配送截止下单时间：北京：16:50；上海：16:30；杭州/广州：13:50；天津：10:30；苏州/无锡/深圳：11:00
            </span>
            <span>
                    网站注册公司名称: 北京廿一客食品有限公司 地址: 北京市北京经济技术开发区兴海二街5号院3号楼
            </span>
        </div>
        <div class="footer-copyright">
            <span>
                Copyright© 21Cake蛋糕官网商城 2007-2018, 版权所有 京ICP备14006254号-1
            </span>
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>

<style scoped>
    div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, button, textarea, p, blockquote, th, td{
    padding: 0;
    margin: 0;
}
body{
    font-family: 'PingFang SC','Heiti SC','微软雅黑',Helvetica,Arial;
    font-size: 12px;
    color: #684029;
    overflow-x: hidden;
}
.footer{
    background: #333;
    padding: 50px 0 0 0;
    width: 100%;
    position: absolute;
    display: block;
}
.footer-logo{
    display: block;
    margin:0 auto;
}
.footer-nav{
    text-align: center;
    color: #fff;
    margin: 25px 0;
    display: block;
}
.footer-nav a{
    color: #fff;
    display: inline-block;
    margin: 0 50px;
    text-decoration: none;
}
.footer-icon{
    text-align: center;
    position: relative;
}
.footer-icon a{
    display: inline-block;
    border-radius: 25px;
    height: 50px;
    width: 50px;
    background: #494949;
    margin: 0 25px;
    font-size: 16px;
    color: #fff;
    line-height: 50px;
    text-align: center;
    vertical-align: middle;
    text-decoration: none;
}
.footer-icon a>img{
    height: 30px;
    margin: 10px;
}
.footer-text{
    color: #9a9a9a;
    text-align: center;
    margin-top: 25px;
    line-height: 18px;
    font-size: 10px;
}
footer-text span:first-child{
    font-weight: bold;
}
.footer-text span{
    display: block;
}
.footer-copyright{
    margin: 0 auto;
    border-top: 1px solid #616161;
    margin-top: 15px;
    text-align: center;
    padding-bottom: 15px;
    font-size: 10px;
    padding-top: 12px;
}
.footer-copyright span{
    color: #9a9a9a;
    line-height: 1.5em;
}
.erweima{
    width: 120px;
    height: 0px;
    position: absolute;
    top:-134px;
    left:50%;
    margin-left: -60px;
    box-sizing: border-box;
    overflow: hidden;
    transition:all .2s linear;
}
.erweima>img{
   width: 100px;
   height: 100px;
   border: 10px solid #fff;
}
.footer-weixin:hover .erweima{
    height: 120px;
}
.f-erweima{
    position: absolute;
    top:-134px;
    left:53%
}
.f-erweima{
    width: 120px;
    height: 0px;
    overflow: hidden; 
    transition: all .2s linear;

}
.f-erweima img{
    width: 100px;
    height: 100px;
    border: 10px solid #fff;
    
}
.footer-erweima:hover .f-erweima{
    height: 120px;

}
</style>


