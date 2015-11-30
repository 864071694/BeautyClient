//
//  BrandProducts.h
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrandProducts : NSObject

@property (nonatomic, strong) NSString *taobaoNumIid;
@property (nonatomic, assign) double taobaoVolume;
@property (nonatomic, strong) NSString *flagUrl;
@property (nonatomic, strong) NSString *taobaoPicUrl;
@property (nonatomic, strong) NSString *productsDescription;
@property (nonatomic, strong) NSString *editorLogoUrl;
@property (nonatomic, strong) NSString *editorName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
