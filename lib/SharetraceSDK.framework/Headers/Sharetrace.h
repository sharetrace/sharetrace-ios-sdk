//
//  Sharetrace.h
//  SharetraceSDK
//
//  Created by ShareTrace on 2019/7/17.
//  Copyright © 2020 ShareTrace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppData.h"

@interface Sharetrace : NSObject

+ (NSString * _Nonnull)sdkVersion;
+ (void)start;
+ (void)startWith:(NSString * _Nonnull)appKey;
+ (void)getInstallTrace:(void (^ _Nullable)(AppData * _Nullable))success :(void (^ _Nullable)(NSInteger, NSString * _Nonnull))fail;
@end
