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
    [Sharetrace initWithDelegate:self];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    [Sharetrace handleUniversalLink:userActivity];
    return YES;
}

//iOS9以下
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [Sharetrace handleSchemeLinkURL:url];
    return YES;
}

//iOS9及以上
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(nonnull NSDictionary *)options {
    [Sharetrace handleSchemeLinkURL:url];
    return YES;
}

- (void)getWakeUpTrace:(AppData * _Nullable)appData {
    if (appData != nil) {
        NSString *info = [NSString stringWithFormat:@"appData: \n %@, \n%@, %@", appData.paramsData, appData.resumePage, appData.channel];
        NSLog(@"getWakeUpTrace Success, %@", info);
        [self showAler:@"getWakeUpTrace Success" :info];
    } else {
        NSLog(@"getWakeUpTrace nil");
        [self showAler:@"getWakeUpTrace" :@"Fail"];
    }
}

- (void) showAler:(NSString*)title :(NSString*)msg {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //button click event
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [alert addAction:ok];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
}

@end
