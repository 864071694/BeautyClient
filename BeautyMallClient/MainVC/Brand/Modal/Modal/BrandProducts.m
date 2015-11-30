//
//  BrandProducts.m
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BrandProducts.h"

NSString * const kBrandProductsTaobaoNumIid = @"taobao_num_iid";
NSString * const kBrandProductsTaobaoVolume = @"taobao_volume";
NSString * const kBrandProductsFlagUrl = @"flag_url";
NSString * const kBrandProductsTaobaoPicUrl = @"taobao_pic_url";
NSString * const kBrandProductsDescription = @"description";
NSString * const kBrandProductsEditorLogoUrl = @"editor_logo_url";
NSString * const kBrandProductsEditorName = @"editor_name";

@interface BrandProducts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BrandProducts

@synthesize taobaoNumIid = _taobaoNumIid;
@synthesize taobaoVolume = _taobaoVolume;
@synthesize flagUrl = _flagUrl;
@synthesize taobaoPicUrl = _taobaoPicUrl;
@synthesize productsDescription = _productsDescription;
@synthesize editorLogoUrl = _editorLogoUrl;
@synthesize editorName = _editorName;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dict]);
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.taobaoNumIid = [self objectOrNilForKey:kBrandProductsTaobaoNumIid fromDictionary:dict];
        self.taobaoVolume = [[self objectOrNilForKey:kBrandProductsTaobaoVolume fromDictionary:dict] doubleValue];
        self.flagUrl = [self objectOrNilForKey:kBrandProductsFlagUrl fromDictionary:dict];
        self.taobaoPicUrl = [self objectOrNilForKey:kBrandProductsTaobaoPicUrl fromDictionary:dict];
        self.productsDescription = [self objectOrNilForKey:kBrandProductsDescription fromDictionary:dict];
        self.editorLogoUrl = [self objectOrNilForKey:kBrandProductsEditorLogoUrl fromDictionary:dict];
        self.editorName = [self objectOrNilForKey:kBrandProductsEditorName fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.taobaoNumIid forKey:kBrandProductsTaobaoNumIid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.taobaoVolume] forKey:kBrandProductsTaobaoVolume];
    [mutableDict setValue:self.flagUrl forKey:kBrandProductsFlagUrl];
    [mutableDict setValue:self.taobaoPicUrl forKey:kBrandProductsTaobaoPicUrl];
    [mutableDict setValue:self.productsDescription forKey:kBrandProductsDescription];
    [mutableDict setValue:self.editorLogoUrl forKey:kBrandProductsEditorLogoUrl];
    [mutableDict setValue:self.editorName forKey:kBrandProductsEditorName];
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

@end
