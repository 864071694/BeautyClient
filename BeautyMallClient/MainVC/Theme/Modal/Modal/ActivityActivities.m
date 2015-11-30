//
//  ActivityActivities.m
//
//  Created by ZhangZeNan  on 15/11/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ActivityActivities.h"
#import "ActivityContent.h"

NSString * const kActivityActivitiesIsAskShare = @"is_ask_share";
NSString * const kActivityActivitiesDescription = @"description";
NSString * const kActivityActivitiesStatus = @"status";
NSString * const kActivityActivitiesTitle = @"title";
NSString * const kActivityActivitiesUrl = @"url";
NSString * const kActivityActivitiesAskShareContent = @"ask_share_content";
NSString * const kActivityActivitiesBrandIds = @"brand_ids";
NSString * const kActivityActivitiesProductsCount = @"products_count";
NSString * const kActivityActivitiesShareGoto = @"share_goto";
NSString * const kActivityActivitiesCommentsCount = @"comments_count";
NSString * const kActivityActivitiesPicUrls = @"pic_urls";
NSString * const kActivityActivitiesShareMessage = @"share_message";
NSString * const kActivityActivitiesActivityCategoryIds = @"activity_category_ids";
NSString * const kActivityActivitiesSortOrder = @"sort_order";
NSString * const kActivityActivitiesSharesCount = @"shares_count";
NSString * const kActivityActivitiesActivityType = @"activity_type";
NSString * const kActivityActivitiesId = @"id";
NSString * const kActivityActivitiesDisplayType = @"display_type";
NSString * const kActivityActivitiesShareTitle = @"share_title";
NSString * const kActivityActivitiesIsShowVote = @"is_show_vote";
NSString * const kActivityActivitiesVisitsCount = @"visits_count";
NSString * const kActivityActivitiesFlagUrl = @"flag_url";
NSString * const kActivityActivitiesPublishedTime = @"published_time";
NSString * const kActivityActivitiesLikesCount = @"likes_count";
NSString * const kActivityActivitiesStartTime = @"start_time";
NSString * const kActivityActivitiesCreatedTime = @"created_time";
NSString * const kActivityActivitiesTaobaoSellerNicks = @"taobao_seller_nicks";
NSString * const kActivityActivitiesBrandTitles = @"brand_titles";
NSString * const kActivityActivitiesPicUrl = @"pic_url";
NSString * const kActivityActivitiesShortTitle = @"short_title";
NSString * const kActivityActivitiesEndTime = @"end_time";
NSString * const kActivityActivitiesContent = @"content";

@interface ActivityActivities ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ActivityActivities

@synthesize isAskShare = _isAskShare;
@synthesize activitiesDescription = _activitiesDescription;
@synthesize status = _status;
@synthesize title = _title;
@synthesize url = _url;
@synthesize askShareContent = _askShareContent;
@synthesize brandIds = _brandIds;
@synthesize productsCount = _productsCount;
@synthesize shareGoto = _shareGoto;
@synthesize commentsCount = _commentsCount;
@synthesize picUrls = _picUrls;
@synthesize shareMessage = _shareMessage;
@synthesize activityCategoryIds = _activityCategoryIds;
@synthesize sortOrder = _sortOrder;
@synthesize sharesCount = _sharesCount;
@synthesize activityType = _activityType;
@synthesize activitiesIdentifier = _activitiesIdentifier;
@synthesize displayType = _displayType;
@synthesize shareTitle = _shareTitle;
@synthesize isShowVote = _isShowVote;
@synthesize visitsCount = _visitsCount;
@synthesize flagUrl = _flagUrl;
@synthesize publishedTime = _publishedTime;
@synthesize likesCount = _likesCount;
@synthesize startTime = _startTime;
@synthesize createdTime = _createdTime;
@synthesize taobaoSellerNicks = _taobaoSellerNicks;
@synthesize brandTitles = _brandTitles;
@synthesize picUrl = _picUrl;
@synthesize shortTitle = _shortTitle;
@synthesize endTime = _endTime;
@synthesize content = _content;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return PX_AUTORELEASE([[self alloc] initWithDictionary:dict]);
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.isAskShare = [self objectOrNilForKey:kActivityActivitiesIsAskShare fromDictionary:dict];
            self.activitiesDescription = [self objectOrNilForKey:kActivityActivitiesDescription fromDictionary:dict];
            self.status = [self objectOrNilForKey:kActivityActivitiesStatus fromDictionary:dict];
            self.title = [self objectOrNilForKey:kActivityActivitiesTitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kActivityActivitiesUrl fromDictionary:dict];
            self.askShareContent = [self objectOrNilForKey:kActivityActivitiesAskShareContent fromDictionary:dict];
            self.brandIds = [self objectOrNilForKey:kActivityActivitiesBrandIds fromDictionary:dict];
            self.productsCount = [self objectOrNilForKey:kActivityActivitiesProductsCount fromDictionary:dict];
            self.shareGoto = [self objectOrNilForKey:kActivityActivitiesShareGoto fromDictionary:dict];
            self.commentsCount = [self objectOrNilForKey:kActivityActivitiesCommentsCount fromDictionary:dict];
            self.picUrls = [self objectOrNilForKey:kActivityActivitiesPicUrls fromDictionary:dict];
            self.shareMessage = [self objectOrNilForKey:kActivityActivitiesShareMessage fromDictionary:dict];
            self.activityCategoryIds = [self objectOrNilForKey:kActivityActivitiesActivityCategoryIds fromDictionary:dict];
            self.sortOrder = [self objectOrNilForKey:kActivityActivitiesSortOrder fromDictionary:dict];
            self.sharesCount = [self objectOrNilForKey:kActivityActivitiesSharesCount fromDictionary:dict];
            self.activityType = [self objectOrNilForKey:kActivityActivitiesActivityType fromDictionary:dict];
            self.activitiesIdentifier = [self objectOrNilForKey:kActivityActivitiesId fromDictionary:dict];
            self.displayType = [[self objectOrNilForKey:kActivityActivitiesDisplayType fromDictionary:dict] doubleValue];
            self.shareTitle = [self objectOrNilForKey:kActivityActivitiesShareTitle fromDictionary:dict];
            self.isShowVote = [self objectOrNilForKey:kActivityActivitiesIsShowVote fromDictionary:dict];
            self.visitsCount = [self objectOrNilForKey:kActivityActivitiesVisitsCount fromDictionary:dict];
            self.flagUrl = [self objectOrNilForKey:kActivityActivitiesFlagUrl fromDictionary:dict];
            self.publishedTime = [self objectOrNilForKey:kActivityActivitiesPublishedTime fromDictionary:dict];
            self.likesCount = [self objectOrNilForKey:kActivityActivitiesLikesCount fromDictionary:dict];
            self.startTime = [self objectOrNilForKey:kActivityActivitiesStartTime fromDictionary:dict];
            self.createdTime = [self objectOrNilForKey:kActivityActivitiesCreatedTime fromDictionary:dict];
            self.taobaoSellerNicks = [self objectOrNilForKey:kActivityActivitiesTaobaoSellerNicks fromDictionary:dict];
            self.brandTitles = [self objectOrNilForKey:kActivityActivitiesBrandTitles fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kActivityActivitiesPicUrl fromDictionary:dict];
            self.shortTitle = [self objectOrNilForKey:kActivityActivitiesShortTitle fromDictionary:dict];
            self.endTime = [self objectOrNilForKey:kActivityActivitiesEndTime fromDictionary:dict];
            self.content = [ActivityContent modelObjectWithDictionary:[dict objectForKey:kActivityActivitiesContent]];

    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.isAskShare forKey:kActivityActivitiesIsAskShare];
    [mutableDict setValue:self.activitiesDescription forKey:kActivityActivitiesDescription];
    [mutableDict setValue:self.status forKey:kActivityActivitiesStatus];
    [mutableDict setValue:self.title forKey:kActivityActivitiesTitle];
    [mutableDict setValue:self.url forKey:kActivityActivitiesUrl];
    [mutableDict setValue:self.askShareContent forKey:kActivityActivitiesAskShareContent];
    [mutableDict setValue:self.brandIds forKey:kActivityActivitiesBrandIds];
    [mutableDict setValue:self.productsCount forKey:kActivityActivitiesProductsCount];
    [mutableDict setValue:self.shareGoto forKey:kActivityActivitiesShareGoto];
    [mutableDict setValue:self.commentsCount forKey:kActivityActivitiesCommentsCount];
    [mutableDict setValue:self.picUrls forKey:kActivityActivitiesPicUrls];
    [mutableDict setValue:self.shareMessage forKey:kActivityActivitiesShareMessage];
    [mutableDict setValue:self.activityCategoryIds forKey:kActivityActivitiesActivityCategoryIds];
    [mutableDict setValue:self.sortOrder forKey:kActivityActivitiesSortOrder];
    [mutableDict setValue:self.sharesCount forKey:kActivityActivitiesSharesCount];
    [mutableDict setValue:self.activityType forKey:kActivityActivitiesActivityType];
    [mutableDict setValue:self.activitiesIdentifier forKey:kActivityActivitiesId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayType] forKey:kActivityActivitiesDisplayType];
    [mutableDict setValue:self.shareTitle forKey:kActivityActivitiesShareTitle];
    [mutableDict setValue:self.isShowVote forKey:kActivityActivitiesIsShowVote];
    [mutableDict setValue:self.visitsCount forKey:kActivityActivitiesVisitsCount];
    [mutableDict setValue:self.flagUrl forKey:kActivityActivitiesFlagUrl];
    [mutableDict setValue:self.publishedTime forKey:kActivityActivitiesPublishedTime];
    [mutableDict setValue:self.likesCount forKey:kActivityActivitiesLikesCount];
    [mutableDict setValue:self.startTime forKey:kActivityActivitiesStartTime];
    [mutableDict setValue:self.createdTime forKey:kActivityActivitiesCreatedTime];
    [mutableDict setValue:self.taobaoSellerNicks forKey:kActivityActivitiesTaobaoSellerNicks];
    [mutableDict setValue:self.brandTitles forKey:kActivityActivitiesBrandTitles];
    [mutableDict setValue:self.picUrl forKey:kActivityActivitiesPicUrl];
    [mutableDict setValue:self.shortTitle forKey:kActivityActivitiesShortTitle];
    [mutableDict setValue:self.endTime forKey:kActivityActivitiesEndTime];
    [mutableDict setValue:[self.content dictionaryRepresentation] forKey:kActivityActivitiesContent];
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
