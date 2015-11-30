//
//  MyLog.m
//  MyLog
//
//  Created by 张泽楠 on 15/11/19.
//  Copyright © 2015年 张泽楠. All rights reserved.
//

#import "MyLog.h"

@implementation MyLog

+ (void)output:(const char *)fileName
       lineNumber:(int)lineNumber
            input:(NSString *)input, ... {
    va_list argList;
    NSString *filePath = [[NSString alloc] initWithBytes:fileName
                                                  length:strlen(fileName)
                                                encoding:NSUTF8StringEncoding];
    va_start(argList, input);
    NSString *formatStr = [[NSString alloc] initWithFormat:input
                                       arguments:argList];
    va_end(argList);
    printf("%s\n", [[NSString stringWithFormat:@"%@[%d] %@", [filePath lastPathComponent], lineNumber, formatStr] UTF8String]);
    PX_RELEASE(filePath);
    PX_RELEASE(formatStr);
}

@end

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    [strM appendString:@")"];
    return strM;
}

@end

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    [strM appendString:@"}\n"];
    return strM;
}

@end
