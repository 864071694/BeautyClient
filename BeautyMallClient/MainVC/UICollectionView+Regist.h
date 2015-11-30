//
//  UICollectionView+Regist.h
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/23.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (Regist)

- (void)registerNibHeade:(Class)aClass;
- (void)registerNibClass:(Class)aClass;
- (void)registerClass:(Class)aClass;

@end
