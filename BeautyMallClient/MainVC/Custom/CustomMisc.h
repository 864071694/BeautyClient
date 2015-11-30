//
//  CustoMisc.h
//  AF封装
//
//  Created by 张泽楠 on 15/11/15.
//  Copyright © 2015年 张泽楠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomMisc : NSObject
/**
 *  首次启动设置
 */
+ (void)launchSetup;

/**
 *  判断是否首次启动
 *
 *  @return 是否首次启动
 */
+ (BOOL)isFirstLaunch;

/**
 *  显示数字，如评论数
 *
 *  @param count       数字
 *  @param maxCount    最大显示数，超过的就是maxCount++
 *  @param placeholder 数字为0时，显示。
 *
 *  @return 显示字符串
 */
+ (NSString *)stringWithCount:(NSInteger)count
                        maxCount:(NSInteger)maxCount
                     placeholder:(NSString *)placeholder;

@end
