//
//  ActivityActivities.h
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ActivityContent;

@interface ActivityActivities : NSObject

@property (nonatomic, strong) NSString *isAskShare;
@property (nonatomic, strong) NSString *activitiesDescription;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *askShareContent;
@property (nonatomic, strong) NSString *brandIds;
@property (nonatomic, strong) NSString *productsCount;
@property (nonatomic, strong) NSString *shareGoto;
@property (nonatomic, strong) NSString *commentsCount;
@property (nonatomic, strong) NSString *picUrls;
@property (nonatomic, strong) NSString *shareMessage;
@property (nonatomic, strong) NSString *activityCategoryIds;
@property (nonatomic, strong) NSString *sortOrder;
@property (nonatomic, strong) NSString *sharesCount;
@property (nonatomic, strong) NSString *activityType;
@property (nonatomic, strong) NSString *activitiesIdentifier;
@property (nonatomic, assign) double displayType;
@property (nonatomic, strong) NSString *shareTitle;
@property (nonatomic, strong) NSString *isShowVote;
@property (nonatomic, strong) NSString *visitsCount;
@property (nonatomic, assign) id flagUrl;
@property (nonatomic, strong) NSString *publishedTime;
@property (nonatomic, strong) NSString *likesCount;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSString *createdTime;
@property (nonatomic, strong) NSString *taobaoSellerNicks;
@property (nonatomic, strong) NSString *brandTitles;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *shortTitle;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, strong) ActivityContent *content;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
