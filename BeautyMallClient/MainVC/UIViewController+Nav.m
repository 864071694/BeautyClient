//
//  UIViewController+Nav.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/28.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#import "UIViewController+Nav.h"

@implementation UIViewController (Nav)

+ (UINavigationController *)createNav {
    UIViewController *vc = [[self alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    PX_RELEASE(vc);
    return PX_AUTORELEASE(nav);
}

@end
