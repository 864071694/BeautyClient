//
//  JDNetworkRequest.m
//  AF封装
//
//  Created by 张泽楠 on 15/11/15.
//  Copyright © 2015年 张泽楠. All rights reserved.
//

#import "AFNetworking.h"
#import "AFNetworkRequest.h"
#import "NSString+Path.h"
#import <NSString+MD5.h>

@interface AFNetworkRequest ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, assign, getter=isConnected) BOOL connected;/**<网络是否连接*/

@end

@implementation AFNetworkRequest

- (void)requestWithURLString:(NSString *)urlString
                  parameters:(NSDictionary *)parameters
                        type:(NetworkRequestType)type
                 resultBlock:(NetworkRequestResultBlock)resultBlock {
//    if (!self.isConnected) {
//        NSLog(@"没有网络,建议在手机设置中打开网络");
//        return;
//    }
    if (![self.datasource respondsToSelector:@selector(NetworkRequestBaseURLString)]) {
        NSLog(@"error:未实现JDNetworkRequestDatasource");
        return;
    }
    NSSet *acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                     @"text/html",
                                     @"text/json",
                                     @"text/javascript",
                                     @"text/plain", nil];
    self.manager.operationQueue.maxConcurrentOperationCount = 5;
    self.manager.requestSerializer.timeoutInterval = 3;
    self.manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    
    NSString *path = [[NSString cachesPath] stringByAppendingPathComponent:[urlString MD5Digest]];
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:path]) {
        NSDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        resultBlock(dic, nil);
        return;
    }
    switch (type) {
        case NetworkRequestTypePost: {
            [self.manager POST:urlString
                    parameters:parameters
                       success:^(NSURLSessionDataTask *task, id responseObject) {
                           [responseObject writeToFile:path atomically:YES];
                           [self handleRequestResultWithDataTask:task
                                                  responseObject:responseObject
                                                           error:nil
                                                     resultBlock:resultBlock];
                       } failure:^(NSURLSessionDataTask *task, NSError *error) {
                           [self handleRequestResultWithDataTask:task
                                                  responseObject:nil
                                                           error:error
                                                     resultBlock:resultBlock];
                       }];
            break;
        }
        case NetworkRequestTypeGet: {
            [self.manager GET:urlString
                   parameters:parameters
                      success:^(NSURLSessionDataTask *task, id responseObject) {
                          [NSKeyedArchiver archiveRootObject:responseObject toFile:path];
                          [self handleRequestResultWithDataTask:task
                                                 responseObject:responseObject
                                                          error:nil
                                                    resultBlock:resultBlock];
                      } failure:^(NSURLSessionDataTask *task, NSError *error) {
                          [self handleRequestResultWithDataTask:task
                                                 responseObject:nil
                                                          error:error
                                                    resultBlock:resultBlock];
                      }];
            break;
        }
        case NetworkRequestTypePut: {
            [self.manager PUT:urlString
                   parameters:parameters
                      success:^(NSURLSessionDataTask *task, id responseObject) {
                          [self handleRequestResultWithDataTask:task
                                                 responseObject:responseObject
                                                          error:nil
                                                    resultBlock:resultBlock];
                      } failure:^(NSURLSessionDataTask *task, NSError *error) {
                          [self handleRequestResultWithDataTask:task
                                                 responseObject:nil
                                                          error:error
                                                    resultBlock:resultBlock];
                      }];
            break;
        }
        case NetworkRequestTypeHead: {
            [self.manager HEAD:urlString
                    parameters:parameters
                       success:^(NSURLSessionDataTask *task) {
                           [self handleRequestResultWithDataTask:task
                                                  responseObject:nil
                                                           error:nil
                                                     resultBlock:resultBlock];
                       } failure:^(NSURLSessionDataTask *task, NSError *error) {
                           [self handleRequestResultWithDataTask:task
                                                  responseObject:nil
                                                           error:error
                                                     resultBlock:resultBlock];
                       }];
            break;
        }
        case NetworkRequestTypeDelete:{
            [self.manager DELETE:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                [responseObject writeToFile:path atomically:YES];
                [self handleRequestResultWithDataTask:task
                                       responseObject:nil
                                                error:nil
                                          resultBlock:resultBlock];
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                [self handleRequestResultWithDataTask:task
                                       responseObject:nil
                                                error:error
                                          resultBlock:resultBlock];
            }];
            break;
        }
    }
}

- (BOOL)isConnected {
    struct sockaddr zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sa_len = sizeof(zeroAddress);
    zeroAddress.sa_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability =
    SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags =
    SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    if (!didRetrieveFlags) {
        printf("Error. Count not recover network reachability flags\n");
        return NO;
    }
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection) ? YES : NO;
}

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        NSString *baseUrlString = [self.datasource NetworkRequestBaseURLString];
        _manager = [[AFHTTPSessionManager alloc]
                    initWithBaseURL:[NSURL URLWithString:baseUrlString]];
    }
    return _manager;
}

- (void)handleRequestResultWithDataTask:(NSURLSessionDataTask *)task
                         responseObject:(id)responseObject
                                  error:(NSError *)error
                            resultBlock:(NetworkRequestResultBlock)resultBlock {
    if (resultBlock) {
        resultBlock(responseObject, error);
    }
}

@end