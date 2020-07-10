//
//  AppDelegate.m
//  SharetraceObjectiveCDemo
//
//  Created by ShareTrace on 2020/5/29.
//  Copyright © 2020 ShareTrace. All rights reserved.
//

#import "AppDelegate.h"
#import <SharetraceSDK/SharetraceSDK-Swift.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Sharetrace start];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
