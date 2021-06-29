//
//  BaiduMobStatWeexModule.m
//  WeexDemo
//
//  Created by Li,Dongdong(BDG) on 2021/6/17.
//  Copyright © 2021 Baidu. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag on this file.
#endif

#import "BaiduMobStatWeexModule.h"
#import "BaiduMobStat.h"

@implementation BaiduMobStatWeexModule

WX_EXPORT_METHOD(@selector(logEvent:attributes:))
WX_EXPORT_METHOD(@selector(logEventWithDurationTime:durationTime:attributes:))
WX_EXPORT_METHOD(@selector(eventStart:))
WX_EXPORT_METHOD(@selector(eventEnd:attributes:))
WX_EXPORT_METHOD(@selector(pageviewStartWithName:))
WX_EXPORT_METHOD(@selector(pageviewEndWithName:))

/**
 记录一次事件的点击，eventId和对应的attribute的key请在网站上创建，未创建的evenId和key将无法统计。
 @param eventId 事件Id，提前在网站端创建
 @param attributes 事件属性，对应的key需要在网站上创建，注意：value只接受NSString
 weex 中使用示例：
 BaiduMobStatWeexModule.logEvent("Event1",{"key1":"value1","key2":"value2"})
 */
- (void)logEvent:(NSString *)eventId attributes:(nullable NSDictionary *)attributes {
    if ([attributes count] == 0) {
        [[BaiduMobStat defaultStat] logEvent:eventId];
    } else {
        [[BaiduMobStat defaultStat] logEvent:eventId attributes:attributes];
    }
}

/**
 记录一次事件的时长，eventId和对应的attribute的key请在网站上创建，未创建的evenId和key将无法统计。
 @param eventId 自定义事件Id，提前在网站端创建
 @param duration 已知的自定义事件时长，单位为毫秒（ms）
 @param attributes 事件属性，对应的key需要在网站上创建，注意：value只接受NSString
 weex 中使用示例：
 BaiduMobStatWeexModule.logEventWithDurationTime("Event2",1000, {"key1":"value1","key2":"value2"})
 */
- (void)logEventWithDurationTime:(NSString *)eventId durationTime:(unsigned long)duration attributes:(nullable NSDictionary *)attributes {
    if ([attributes count] == 0) {
        [[BaiduMobStat defaultStat] logEventWithDurationTime:eventId durationTime:duration];
    } else {
        [[BaiduMobStat defaultStat] logEventWithDurationTime:eventId durationTime:duration attributes:attributes];
    }
}

/**
 记录一次事件的开始，eventId请在网站上创建。未创建的evenId记录将无效。
 @param eventId 自定义事件Id，提前在网站端创建
 weex 中使用示例：
 BaiduMobStatWeexModule.eventStart("Event3")
 */
- (void)eventStart:(NSString *)eventId {
    [[BaiduMobStat defaultStat] eventStart:eventId];
}

/**
 记录一次事件的结束，eventId和对应的attribute的key请在网站上创建，未创建的evenId和key将无法统计。
 @param eventId 自定义事件Id，提前在网站端创建
 @param attributes 事件属性，对应的key需要在网站上创建，注意：value只接受NSString
 weex 中使用示例：
 BaiduMobStatWeexModule.eventEnd("Event3",{"key1":"value1","key2":"value2"})
 */
- (void)eventEnd:(NSString *)eventId attributes:(nullable NSDictionary *)attributes {
    if ([attributes count] == 0) {
        [[BaiduMobStat defaultStat] eventEnd:eventId];
    } else {
        [[BaiduMobStat defaultStat] eventEnd:eventId attributes:attributes];
    }
}

/**
 记录某个页面访问的开始，请参见Example程序，在合适的位置调用。
 建议在ViewController的viewDidAppear函数中调用
 @param name 页面名称
 weex 中使用示例：
 BaiduMobStatWeexModule.pageviewStartWithName("Page1")
 */
- (void)pageviewStartWithName:(NSString *)name {
    [[BaiduMobStat defaultStat] pageviewStartWithName:name];
}

/**
 记录某个页面访问的结束，与pageviewStartWithName配对使用，请参见Example程序，在合适的位置调用。
 建议在ViewController的viewDidDisappear函数中调用
 @param name 页面名称
 weex 中使用示例：
 BaiduMobStatWeexModule.pageviewEndWithName("Page1")
 */
- (void)pageviewEndWithName:(NSString *)name {
    [[BaiduMobStat defaultStat] pageviewEndWithName:name];
}

@end
