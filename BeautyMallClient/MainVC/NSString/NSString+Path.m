//
//  NSString+Path.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/22.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import "NSString+Path.h"

@implementation NSString (Path)

+ (NSString *)documentsPath {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

+ (NSString *)tempPath {
    return NSTemporaryDirectory();
}

+ (NSString *)libraryPath {
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
}

+ (NSString *)cachesPath {
   return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]; 
}

@end
