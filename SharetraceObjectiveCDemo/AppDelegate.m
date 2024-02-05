//
//  AppDelegate.m
//  SharetraceObjectiveCDemo
//
//  Created by ShareTrace on 2020/5/29.
//  Copyright © 2020 ShareTrace. All rights reserved.
//

#import "AppDelegate.h"
#import <SharetraceSDK/SharetraceSDK.h>

@interface AppDelegate ()<SharetraceDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 如需禁用SharetraceSDK访问系统剪贴板，若禁用会影响匹配成功率
//    [Sharetrace disableClipboard];
    [Sharetrace initWithDelegate:self];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    
    if ([Sharetrace handleUniversalLink:userActivity]) {
        return YES;
    }
    
    return YES;
}

//ios9以下 URI Scheme
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    if ([Sharetrace handleSchemeLinkURL:url]) {
        return YES;
    }

    //其他代码
    return YES;
}

//iOS9以上 URL Scheme
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(nonnull NSDictionary *)options {
    
    if ([Sharetrace handleSchemeLinkURL:url]) {
        return YES;
    }
    
    //其他代码
    return YES;
}

- (void)getWakeUpTrace:(AppData * _Nullable)appData {
    if (appData != nil) {
        NSString *info = [NSString stringWithFormat:@"appData: \n %@, \n %@", appData.paramsData, appData.channel];
        NSLog(@"getWakeUpTrace Success, %@", info);
        [self showAlert:@"getWakeUpTrace Success" :info];
    } else {
        NSLog(@"getWakeUpTrace nil");
        [self showAlert:@"getWakeUpTrace" :@"Fail"];
    }
}

- (void) showAlert:(NSString*)title :(NSString*)msg {
    NSString *alertMsg = [NSString stringWithFormat:@"msg : %@", msg];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:alertMsg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //button click event
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [alert addAction:ok];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
}

@end
