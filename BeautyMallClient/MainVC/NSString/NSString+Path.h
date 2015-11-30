//
//  NSString+Path.h
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/22.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Path)

+ (NSString *)documentsPath;

+ (NSString *)tempPath;

+ (NSString *)libraryPath;

+ (NSString *)cachesPath;

@end
