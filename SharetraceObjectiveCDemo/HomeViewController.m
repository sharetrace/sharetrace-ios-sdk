//
//  ViewController.m
//  SharetraceObjectiveCDemo
//
//  Created by ShareTrace on 2020/5/29.
//  Copyright © 2020 ShareTrace. All rights reserved.
//

#import "HomeViewController.h"
#import <SharetraceSDK/SharetraceSDK.h>

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
        [self showAler:@"getInstallTrace Success" :[appdata paramsData]];
    } :^(NSInteger code, NSString * _Nonnull message) {
        NSLog(@"ShareTrace fail: code：%ld; message：%@", code, message);
        [self showAler:@"getInstallTrace Fail" :message];
    }];
}

- (void) showAler:(NSString*)title :(NSString*)msg {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //button click event
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
