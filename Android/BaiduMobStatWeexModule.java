package com.weex.app.extend;


import com.baidu.mobstat.StatService;
import com.taobao.weex.annotation.JSMethod;
import com.taobao.weex.common.WXModule;

import java.util.HashMap;

public class BaiduMobStatWeexModule extends WXModule {

    /**
     * 用于统计自定义事件的发生次数
     *
     * @param eventId    事件ID,注意要先在mtj.baidu.com中注册此事件ID
     * @param attributes key-value 键值对。key值根据您在web端配置填入，只有在web端配置才会生效；value限制最长为1024byte，
     *                   超出长度则不会放入attributes结构;key,value均要求为String类型 ，如果您需要传入数字等，请转换为字符串后传入
     */
    @JSMethod()
    public void logEvent(String eventId, HashMap<String, String> attributes) {
        StatService.onEvent(mWXSDKInstance.getContext(), eventId, "label", 1, attributes);

    }

    /**
     * 用于统计自定义事件的时长，此为开发者传入时长的函数。注意此函数中的事件ID应该与onEvent函数中的不同 此函数等价于(onEventStart+onEventEnd)，推荐使用该函数。
     *
     * @param eventId      事件ID,注意要先在mtj.baidu.com中注册此事件ID
     * @param milliseconds 事件时长的毫秒数,注意单位为毫秒
     * @param attributes   key-value 键值对。key值根据您在web端配置填入，只有在web端配置才会生效；value限制最长为1024byte，超出长度则不会放入attributes结构;key,
     *                     value均要求为String类型 ，如果您需要传入数字等，请转换为字符串后传入
     */
    @JSMethod()
    public void logEventWithDurationTime(String eventId, long milliseconds, HashMap<String, String> attributes) {
        StatService.onEventDuration(mWXSDKInstance.getContext(), eventId, "label", milliseconds, attributes);
    }

    /**
     * 用于统计自定义事件的时长，此为开启计时的函数。同eventEnd配对使用
     *
     * @param eventId 事件ID,注意要先在mtj.baidu.com中注册此事件ID
     */
    @JSMethod()
    public void eventStart(String eventId) {
        StatService.onEventStart(mWXSDKInstance.getContext(), eventId, "label");
    }

    /**
     * 用于统计自定义事件的时长，此为结束计时的函数，同eventStart配对使用
     *
     * @param eventId 事件ID,注意要先在mtj.baidu.com中注册此事件ID
     */
    @JSMethod()
    public void eventEnd(String eventId) {
        StatService.onEventEnd(mWXSDKInstance.getContext(), eventId, "label");
    }

    /**
     * 用于统计单个自定义页面的开始，配合onPageEnd函数成对调用
     *
     * @param pageName 该页面的名称
     */
    @JSMethod()
    public void pageviewStartWithName(String pageName) {
        StatService.onPageStart(mWXSDKInstance.getContext(), pageName);
    }

    /**
     * 用于统计单个自定义页面的结束，配合onPageStart函数成对调用
     *
     * @param pageName 该页面的名称
     */
    @JSMethod()
    public void pageviewEndWithName(String pageName) {
        StatService.onPageEnd(mWXSDKInstance.getContext(), pageName);
    }
}
