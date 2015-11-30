//
//  AFNetworkRequest.h
//  AF封装
//
//  Created by 张泽楠 on 15/11/15.
//  Copyright © 2015年 张泽楠. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AFNetworkRequestDatasource <NSObject>

- (NSString *)NetworkRequestBaseURLString; //用于初始化的网址

@end

//网络请求类型
typedef NS_ENUM(NSUInteger, NetworkRequestType) {
    NetworkRequestTypePost = 0,
    NetworkRequestTypeGet,
    NetworkRequestTypeHead,
    NetworkRequestTypePut,
    NetworkRequestTypeDelete
};

typedef void(^NetworkRequestResultBlock)(id responseObject, NSError *error);

@interface AFNetworkRequest : NSObject

@property (nonatomic, assign) id<AFNetworkRequestDatasource> datasource;

/**
 *  发送网络请求
 *
 *  @param urlString   网址字符串
 *  @param parameters  参数
 *  @param type        请求类型
 *  @param resultBlock 返回结果：responseObject,error
 */
- (void)requestWithURLString:(NSString *)urlString
                  parameters:(NSDictionary *)parameters
                        type:(NetworkRequestType)type
                 resultBlock:(NetworkRequestResultBlock)resultBlock;

@end
