//
//  MLNavigationController.h
//  MultiLayerNavigation
//
//  Created by 张泽楠 on 15/11/29.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const MHTabBarControllerViewControllerPushNotification;
extern NSString * const MHTabBarControllerViewControllerPopNotification;

@interface MHNavigationController : UINavigationController
<UIGestureRecognizerDelegate>

/**
 *  默认为YES,可以拖拽
 */
@property (nonatomic, assign) BOOL canDragBack;

@end
