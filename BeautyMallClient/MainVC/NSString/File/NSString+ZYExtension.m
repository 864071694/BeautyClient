//
//  NSString+ZYExtension.m
//  获取文件夹大小
//
//  Created by 张泽楠 on 15/11/13.
//  Copyright © 2015年 张泽楠. All rights reserved.
//

#import "NSString+ZYExtension.h"

@implementation NSString (ZYExtension)

- (NSInteger)fileSize {
    NSFileManager *mgr = [NSFileManager defaultManager];
    BOOL isDirectory = NO;
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    if (!exists) {
        return 0;
    }
    if (isDirectory) {
        NSInteger size = 0;
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            NSString *fullSubPath = [self stringByAppendingPathComponent:subpath];
            size += [mgr attributesOfItemAtPath:fullSubPath error:nil].fileSize;
        }
        return size;
    } else {
        return [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
}

@end