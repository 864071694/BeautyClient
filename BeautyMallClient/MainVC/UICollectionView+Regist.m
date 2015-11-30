//
//  UICollectionView+Regist.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/23.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#import "UICollectionView+Regist.h"

@implementation UICollectionView (Regist)

- (void)registerNibHeade:(Class)aClass {
    NSString *className = NSStringFromClass(aClass);
    [self registerNib:[UINib nibWithNibName:className bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:className];
}

- (void)registerNibClass:(Class)aClass {
    NSString *className = NSStringFromClass(aClass);
    [self registerNib:[UINib nibWithNibName:className bundle:nil] forCellWithReuseIdentifier:className];
}

- (void)registerClass:(Class)aClass {
    [self registerClass:aClass forCellWithReuseIdentifier:NSStringFromClass(aClass)];
}

@end
