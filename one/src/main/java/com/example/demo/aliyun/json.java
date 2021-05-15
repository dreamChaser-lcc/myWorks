package com.example.demo.aliyun;
import net.sf.json.JSONObject;
import com.alibaba.fastjson.JSON;
import net.sf.json.JSONString;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class json {
    public static void main(String[] args) throws Exception {
        String json = "{'deviceType':'CustomCategory','iotId':'LHGR0pgEEhI4FWZaIwAS000000','requestId':'123','checkFailedData':{},'productKey':'a17rRRuNTCD','gmtCreate':1607241627505,'deviceName':'aliServer','items':{'LightSwitch':{'value':1,'time':1607241627510},'CurrentTemperature':{'value':49,'time':1607241627510}}}";


//        String name = jsonObj.getString("items");
        JSONObject object = JSONObject.fromObject(json);
            //循环遍历JSON放入Map
//        Iterator iter = object.keySet().iterator();
//        Map map = new HashMap();
//        while (iter.hasNext()) {
//            String key = (String) iter.next();
//            String value = object.getString(key);
//            map.put(key, value);
//        }
        //解析json字符串
        JSONObject items = JSONObject.fromObject(object.getString("items"));
        JSONObject LightSwitchs = JSONObject.fromObject(items.getString("LightSwitch"));
        String value = LightSwitchs.getString("value");
        Long time = LightSwitchs.getLong("time");

        //三种获取时间的方法，其中time是时间戳
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String sd = sdf.format(Long.parseLong(String.valueOf(time)));
        String sd2 = sdf.format(new Date(Long.parseLong(String.valueOf(time))));
        String sd3 = sdf.format(time);

        System.out.println(value +"----"+ time);
        System.out.println(sd2 + "-----------" + sd);
    }
}
