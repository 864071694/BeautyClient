//
//  NSString+Utils.m
//  AF封装
//
//  Created by 张泽楠 on 15/11/15.
//  Copyright © 2015年 张泽楠. All rights reserved.
//

#import "NSString+Utils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Utils)

+ (NSString *)UUID {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    NSString *retStr = (__bridge_transfer NSString *)string;
    return [[retStr stringByReplacingOccurrencesOfString:@"-" withString:@""] lowercaseString];
}

- (BOOL)isValid {
    return self && [self isEqualToString:@""] && [self isEqual:[NSNull null]];
}

- (BOOL)isValidEmail {
    BOOL sticterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = sticterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidPhone {
    /**
     * 手机号码
     * 移动：134,135,136,137,138,139,150,151,152,157,158,159,182,187,188
     * 联通：130,131,132,155,156,185,186
     * 电信：133,153,180,189
     */
    NSString *MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:self];
}

@end
