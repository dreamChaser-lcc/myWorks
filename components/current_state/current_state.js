// components/current_state/current_state.js
import mqtt from '../../utils/mqtt.js';

const aliyunOpt = require('../../utils/aliyun/aliyun_connect')
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    equipmentData:{
      type:Object,
      value:{}
    },
  },

  /**
   * 组件的初始数据
   */
  data: {
    num:"0",
    connectState:false,
    ledSwitch:false,
    fanSwitch:false,
    equipmentData:{
    },
    isBind:false,
    //---下面是连接alios
    client: null,
    //记录重连的次数
    reconnectCounts: 0,
    //MQTT连接的配置s
    options: {
      protocolVersion: 4, //MQTT连接协议版本
      clean: false,
      reconnectPeriod: 1000, //1000毫秒，两次重新连接之间的间隔
      connectTimeout: 30 * 1000, //1000毫秒，两次重新连接之间的间隔
      resubscribe: true, //如果连接断开并重新连接，则会再次自动订阅已订阅的主题（默认true）
      clientId: '',
      password: '',
      username: '',
    },                                                                                                                                    aliyunInfo: {
      productKey: 'a17rRRuNTCD', //阿里云连接的三元组 ，请自己替代为自己的产品信息!!
      deviceName: 'wxApp', //阿里云连接的三元组 ，请自己替代为自己的产品信息!!
      deviceSecret: '43ab7062856dfa5dfcb9253f0f3abd93', //阿里云连接的三元组 ，请自己替代为自己的产品信息!!
      regionId: 'cn-shanghai', //阿里云连接的三元组 ，请自己替代为自己的产品信息!!
    }   

  },
  onLoad: function() {
    wx.setNavigationBarTitle({
      title: '阿里云物联网Mqtt连接'
    })
  },
  observers:{
    'equipmentData':function(num){
      // console.log(num.time)
      this.setData({
        isBind:num.time!=undefined&&num.time!='',
      })
      // console.log(this.data.isBind)
    },
  },
  /**
   * 组件的方法列表
   */
  methods: {
    onClick_connect: function() {
      var that = this
      //传进去三元组等信息，拿到mqtt连接的各个参数
      let clientOpt = aliyunOpt.getAliyunIotMqttClient({
        productKey: that.data.aliyunInfo.productKey,
        deviceName: that.data.aliyunInfo.deviceName,
        deviceSecret: that.data.aliyunInfo.deviceSecret,
        regionId: that.data.aliyunInfo.regionId,
        port: that.data.aliyunInfo.port,
      });
      //console.log("get data:" + JSON.stringify(clientOpt));
      //得到连接域名
      let host = 'wxs://'+clientOpt.host;
      this.setData({
        'options.clientId': clientOpt.clientId,
        'options.password': clientOpt.password,
        'options.username': clientOpt.username,
      })
      console.log("this.data.options host:" + host);
      console.log("this.data.options data:" + JSON.stringify(this.data.options));
      //开始连接
      this.data.client = mqtt.connect(host, this.data.options);
      this.data.client.on('connect', (connack)=> {
        this.setData({
          connectState:true,
        })
        wx.showToast({
          title: '连接成功'
        })
      })
      //服务器下发消息的回调
      that.data.client.on("message", function(topic, payload) {
        console.log(" 收到 topic:" + topic + " , payload :" + payload)
        wx.showModal({
          content: " 收到topic:[" + topic + "], payload :[" + payload + "]",
          showCancel: false,
        });
      })
      //服务器连接异常的回调
      that.data.client.on("error", function(error) {
        // console.log(" 服务器 error 的回调" + error)
        wx.showToast({
          title: '服务器连接异常'
        })
        this.setData({
          connectState:false,
        })   
      })
      //服务器重连连接异常的回调
      that.data.client.on("reconnect", function() {
        console.log(" 服务器 reconnect的回调")
      })
      //服务器连接异常的回调
      that.data.client.on("offline", function(errr) {
        console.log(" 服务器offline的回调")
      })
    },
    onClick_SubOne: function() {
      if (this.data.client && this.data.client.connected) {
        //仅订阅单个主题
        this.data.client.subscribe('/sys/a1o3SXAACTs/rgb2812/thing/event/property/post', function(err, granted) {
          if (!err) {
            wx.showToast({
              title: '订阅主题成功'
            })
          } else {
            wx.showToast({
              title: '订阅主题失败',
              icon: 'fail',
              duration: 2000
            })
          }
        })
      } else {
        wx.showToast({
          title: '请先连接服务器',
          icon: 'none',
          duration: 2000
        })
      }
    },
    //风扇按钮触发
    onClick_FanSwitch: function(){
      this.setData({
        // ["equipmentData.fanSwitch"]:!this.data.equipmentData.fanSwitch,
        fanSwitch:!this.data.fanSwitch,
       })
      if (this.data.client && this.data.client.connected) {
          // console.log(this.data.equipmentData.fanSwitch)
          if(this.data.fanSwitch){
            this.data.client.publish('/a17rRRuNTCD/wxApp/user/test', '{"params":{"LightSwitch":3,"FanSwitch":1}}');
          }
          else{
            this.data.client.publish('/a17rRRuNTCD/wxApp/user/test', '{"params":{"LightSwitch":3,"FanSwitch":0}}');
          }
        
      }else {
        wx.showToast({
          title: '请先连接服务器',
          icon: 'none',
          duration: 2000
        })
      
      }
      
    },
    //小灯按钮触发
    onClick_PubMsg: function() {
      //反转小灯开关状态
      this.setData({
        ledSwitch:!this.data.ledSwitch,
    })
      console.log(this.data.ledSwitch)
      if (this.data.client && this.data.client.connected) {
        if(this.data.ledSwitch)
        {
          this.data.client.publish('/a17rRRuNTCD/wxApp/user/test', '{"params":{"LightSwitch":1,"FanSwitch":3}}');//远程发送指令到阿里云服务器，此灯为蓝灯
        }
        else{
          this.data.client.publish('/a17rRRuNTCD/wxApp/user/test', '{"params":{"LightSwitch":0,"FanSwitch":3}}');//远程发送指令到阿里云服务器，此灯为蓝灯
        }
      //  console.log(this.data.ledSwitch);
        wx.showToast({
          title: '发布成功'
        })
      } else {
        wx.showToast({
          title: '请先连接服务器',
          icon: 'none',
          duration: 2000
        })
      }
    },



    // handleSwitch(e){
    //   let sw = e.target.id;
    //   let sw_val = e.detail.value;
    //   let wxEqName = this.data.equipmentData.eqName;
    //   // console.log(wxEqName)
    //   this.reque(wxEqName,sw,sw_val);
    //   // switch(sw){
    //   //   case 'switchWd':this.reque(wxEqName,sw,sw_val);break;
    //   //   case 'switchZl':console.log("zhon");break;
    //   //   case 'switchGz':console.log("光照");break
    //   // }
    // },
    // reque(wxEqName,sw,val){
    //   //console.log("进入")
    //   wx.request({
    //     url: 'http://192.168.43.67:9000/changeSwitch',
    //     method: 'post',
    //     data:{
    //       wxEqName,
    //       sw,
    //       val,
    //     },
    //     success(value){
    //       // console.log(value)
    //       let {data} = value;
    //       if(data==0)
    //       {
    //       wx.showToast({title: '操作失败，请刷新',icon:"none",})
    //       }
    //       else{
    //         wx.showToast({title:'操作成功',icon:"success"})
    //       }
    //     }
    //   })
    // }



  }
})
