//
//  Sharetrace.h
//  SharetraceSDK
//
//  Created by ShareTrace on 2019/7/17.
//  Copyright © 2020 ShareTrace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppData.h"

@protocol SharetraceDelegate<NSObject>

@optional
/**
* 应用点击调起时，获取由web传递过来的动态参数（如房间号、邀请码、渠道等）和相关信息
* @param appData 由web传递过来的动态参数
*/
- (void)getWakeUpTrace:(AppData * _Nullable)appData;

@end

@interface Sharetrace : NSObject

+(instancetype _Nonnull) shareInstance;

/**
* 获取当前SDK的版本号
* @return NSString SDK版本号(2.4.0)
*/
+ (NSString * _Nonnull)sdkVersion;

/**
* 【已废弃】初始化Sharetrace SDK
* 调用该方法前，需在Info.plist文件中配置键值对
* <key>com.sharetrace.APP_KEY</key>
* <string>你的appKey</string>
*/
+ (void)start __deprecated_msg("Deprecated in v2.0.0，请使用方法<code>initWithDelegate</code>");

/**
* 【已废弃】初始化Sharetrace SDK，与<code>start</code>方法一样
* @param appKey Sharetrace后台分配的appKey
*/
+ (void)startWith:(NSString * _Nonnull)appKey __deprecated_msg("Deprecated in v2.0.0，请使用方法<code>initWithDelegate</code>");

/**
* 初始化Sharetrace SDK
* 调用该方法前，需在Info.plist文件中配置键值对
* <key>com.sharetrace.APP_KEY</key>
* @param delegate 实现SharetraceDelegate的对象实例
*/
+ (void)initWithDelegate:(id<SharetraceDelegate> _Nullable)delegate;

/**
* 初始化Sharetrace SDK
* 调用该方法前，需在Info.plist文件中配置键值对
* <key>com.sharetrace.APP_KEY</key>
* @param delegate 实现SharetraceDelegate的对象实例
*/
+ (void)initWithDelegate:(id<SharetraceDelegate> _Nullable)delegate appKey:(NSString * _Nonnull)appKey;

/**
* 获取由web传递过来的动态参数（如房间号、邀请码、渠道等）和相关信息
* 默认回调超时时长为: 10 秒
* @param success 成功回调block，在主线程（UI线程）回调
* @param fail 失败回调block，在主线程（UI线程）回调
*/
+ (void)getInstallTrace:(void (^ _Nullable)(AppData * _Nullable))success :(void (^ _Nullable)(NSInteger, NSString * _Nonnull))fail;

/**
* 获取由web传递过来的动态参数（如房间号、邀请码、渠道等）和相关信息，可自定义回调超时时长(单位: 毫秒(ms))
* @param timeout 回调超时时长; 如: 设置10秒则传入 10 * 1000
* @param success 成功回调block，在主线程（UI线程）回调
* @param fail 失败回调block，在主线程（UI线程）回调
*/
+ (void)getInstallTraceWithTimeout:(NSTimeInterval)timeout
                                  success:(void (^ _Nullable)(AppData * _Nullable))success
                                  fail:(void (^ _Nullable)(NSInteger, NSString * _Nonnull))fail;

/**
 * 处理 URI Schemes 逻辑
 * @param url 通过Schemes调起时，系统回调回来的URL
 * @return bool Sharetrace是否成功识别该URL
 */
+ (BOOL)handleSchemeLinkURL:(NSURL * _Nullable)url;

/**
 * 处理 Universal link 逻辑
 * @param userActivity 通过Universal link调起时，包含系统回调回来的URL信息的NSUserActivity
 * @return bool Sharetrace是否成功识别该URL
 */
+ (BOOL)handleUniversalLink:(NSUserActivity * _Nullable)userActivity;

/**
 * 注册SharetraceDelegate
 * @param delegate 实现SharetraceDelegate的实例
 */
+ (void)registerSharetraceDelegate: (id<SharetraceDelegate> _Nullable)delegate;

/**
 * 设置目标服务器的domain, 仅供私有化部署用户使用
 * 注:
 * 方法一: 如在代码中设置, 需要在init之前调用才能生效！
 * 方法二: 调用该方法前，需在Info.plist文件中配置键值对
 * <key>com.sharetrace.SERVER_DOMAIN</key>
 * @param domain 目标服务器的domain, 如: https://api.sharetrace.com
 */
+ (void)setServerDomain:(NSString * _Nonnull)domain;

/**
 * 判断是否首次请求
 * @return BOOL 是否首次请求
 */
+ (BOOL)isFirstOpen;

/**
 * 开启Debug模式
 * 注：仅在开发阶段开启，开启后会记录更多调试日志
 * @param debug 是否开启Debug模式，默认为 NO
 */
+ (void)setDebug:(BOOL)debug;

/**
 * 写入日志
 * @param log 日志信息
 */
+ (void)appendLog:(NSString * _Nullable)log;

/**
 * 提取所有的调试日志
 * @return NSString 调试日志
 */
+ (NSString * _Nullable)dumpLog;

/**
 * 设置SDK不访问剪切板
 * 注：
 * 1. 默认情况下，SDK会访问剪切板，以获取剪切板中的动态参数
 * 2. 需要initWithDelegate之前调用才能生效
 */
+ (void)disableClipboard;

@end


