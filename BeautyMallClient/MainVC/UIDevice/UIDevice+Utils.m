//
//  UIDevice+Utils.m
//  AF封装
//
//  Created by 张泽楠 on 15/11/15.
//  Copyright © 2015年 张泽楠. All rights reserved.
//

#import "UIDevice+Utils.h"
#import <sys/types.h>
#import <sys/sysctl.h>
#import <mach/mach.h>
#import <mach/mach_host.h>

@implementation UIDevice (Utils)

static NSString * deviceStrTmp = nil;

- (NSString *)deviceStr {
    if (!deviceStrTmp) {
        NSDictionary *dict = @{ @"iPhone1,1" : @"iPhone",
                                @"iPhone1,2" : @"iPhone 3G",
                                @"iPhone2,1" : @"iPhone 3GS",
                                @"iPhone3,1" : @"iPhone 4",
                                @"iPhone3,2" : @"iPhone 4",
                                @"iPhone3,3" : @"iPhone 4",
                                @"iPhone4,1" : @"iPhone 4s",
                                @"iPhone5,1" : @"iPhone 5",
                                @"iPhone5,2" : @"iPhone 5",
                                @"iPhone5,3" : @"iPhone 5c",
                                @"iPhone5,4" : @"iPhone 5c",
                                @"iPhone6,1" : @"iPhone 5s",
                                @"iPhone6,2" : @"iPhone 5s",
                                @"iPhone7,1" : @"iPhone 6 Plus",
                                @"iPhone7,2" : @"iPhone 6",
                                @"iPhone8,1" : @"iPhone 6s",
                                @"iPhone8,2" : @"iPhone 6s Plus",
                                
                                @"iPod1,1" : @"iPod Touch",
                                @"iPod2,1" : @"iPod Touch 2G",
                                @"iPod3,1" : @"iPod Touch 3G",
                                @"iPod4,1" : @"iPod Touch 4G",
                                @"iPod5,1" : @"iPod Touch 5G",
                                @"iPod7,1" : @"iPod Touch 6G",
                                
                                @"iPad1,1" : @"iPad 1G",
                                
                                @"iPad2,1" : @"iPad 2",
                                @"iPad2,2" : @"iPad 2",
                                @"iPad2,3" : @"iPad 2",
                                @"iPad2,4" : @"iPad 2",
                                @"iPad2,5" : @"iPad Mini 1G",
                                @"iPad2,6" : @"iPad Mini 1G",
                                @"iPad2,7" : @"iPad Mini 1G",
                                
                                @"iPad3,1" : @"iPad 3",
                                @"iPad3,2" : @"iPad 3",
                                @"iPad3,3" : @"iPad 3",
                                @"iPad3,4" : @"iPad 4",
                                @"iPad3,5" : @"iPad 4",
                                @"iPad3,6" : @"iPad 4",
                                
                                @"iPad4,1" : @"iPad Air",
                                @"iPad4,2" : @"iPad Air",
                                @"iPad4,3" : @"iPad Air",
                                @"iPad4,4" : @"iPad Mini 2",
                                @"iPad4,5" : @"iPad Mini 2",
                                @"iPad4,6" : @"iPad Mini 2",
                                @"iPad4,7" : @"iPad Mini 3",
                                @"iPad4,8" : @"iPad Mini 3",
                                @"iPad4,9" : @"iPad Mini 3",
                                
                                @"iPad5,1" : @"iPad Mini 4",
                                @"iPad5,2" : @"iPad Mini 4",
                                @"iPad5,3" : @"iPad Air 2",
                                @"iPad5,4" : @"iPad Air 2",
                                
                                @"i386"    : @"iPhone Simulator",
                                @"x86_64"  : @"iPhone Simulator",
                                
                                @"Watch1,1" : @"Apple Watch",
                                @"Watch1,2" : @"Apple Watch"
                                };
        NSString *platform = [self platform];
        deviceStrTmp = [dict objectForKey:platform];
    }
    return deviceStrTmp;
}

- (NSString *)platform {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

@end
