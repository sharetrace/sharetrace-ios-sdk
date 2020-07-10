//
//  ViewController.m
//  SharetraceObjectiveCDemo
//
//  Created by ShareTrace on 2020/5/29.
//  Copyright © 2020 ShareTrace. All rights reserved.
//

#import "HomeViewController.h"
#import <SharetraceSDK/SharetraceSDK-Swift.h>

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)getParamsAction:(id)sender {
    [Sharetrace getInstallTrace:^(AppData * _Nullable appdata) {
        NSLog(@"ShareTrace success: resumePage：%@; paramsData：%@", [appdata resumePage], [appdata paramsData]);
    } :^(NSInteger code, NSString * _Nonnull message) {
        NSLog(@"ShareTrace fail: code：%ld; message：%@", code, message);
    }];
}

@end
