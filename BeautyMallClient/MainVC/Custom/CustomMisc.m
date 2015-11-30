//
//  CustoMisc.m
//  AF封装
//
//  Created by 张泽楠 on 15/11/15.
//  Copyright © 2015年 张泽楠. All rights reserved.
//

#import "CustomMisc.h"
#import "NSString+Utils.h"

@implementation CustomMisc

static NSString * const kEverLaunched = @"everLaunched";
static NSString * const kFirstLaunch  = @"firstLaunch";

+ (void)launchSetup {
    //  判断是否首次启动应用
    if ([self isFirstLaunch]) {    //  首次启动
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kEverLaunched];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kFirstLaunch];
    }else{  //  非首次启动
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kFirstLaunch];
    }
}

+ (BOOL)isFirstLaunch {
    return ![[NSUserDefaults standardUserDefaults] boolForKey:kEverLaunched];
}

+ (NSString *)stringWithCount:(NSInteger)count
                        maxCount:(NSInteger)maxCount
                     placeholder:(NSString *)placeholder {
    if (count <= 0) {
        if (![placeholder isValid]) {
            return placeholder;
        } else {
            return @"";
        }
    } else if (count <= maxCount){
        return [NSString stringWithFormat:@"%ld", (long)count];
    } else {
        return [NSString stringWithFormat:@"%ld++", (long)count];
    }
}

@end
