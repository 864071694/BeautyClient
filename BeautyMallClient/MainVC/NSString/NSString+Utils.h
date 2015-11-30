//
//  NSString+Utils.h
//  AF封装
//
//  Created by 张泽楠 on 15/11/15.
//  Copyright © 2015年 张泽楠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)
/**
 *  获得UUID
 *  @return 返回uuid
 */
+ (NSString *)UUID;

/**
 *  检验是否有效
 *  @return 若非空且不等于@“”，则返回YES，否则，返回NO
 */
- (BOOL)isValid;

/**
 *  判断是否有效邮箱
 *  @return 返回是否有效
 */
- (BOOL)isValidEmail;

/**
 *  判断是否有效手机号码
 *  @return 返回是否有效
 */
- (BOOL)isValidPhone;

@end
