//
//  CustomTabBarController.m
//  BeautyMallClient
//
//  Created by 张泽楠 on 15/11/22.
//  Copyright © 2015年 √Ç¬∫‚Ä†√ä‚â•Œ©√ä‚Ä¢‚Ä†. All rights reserved.
//

#import "CustomTabBarController.h"
#import "HomePageViewController.h"
#import "MineViewController.h"
#import "ShoppingViewController.h"
#import "ThemeViewController.h"
#import "BrandViewController.h"
#import "TabButton.h"
#import "UIViewController+Nav.h"

@interface CustomTabBarController ()
<UITabBarControllerDelegate>

@property (nonatomic, PX_STRONG) UIButton *selectedBtn;
@property (nonatomic, PX_STRONG) NSArray  *imagesArray;

@end

@implementation CustomTabBarController

- (NSArray *)imagesArray {
    if (!_imagesArray) {
        _imagesArray = @[@"yuike_maintab_home_nor", @"yuike_maintab_home_sel",
                           @"yuike_maintab_brand_nor", @"yuike_maintab_brand_sel",
                           @"yuike_maintab_activity_nor", @"yuike_maintab_activity_sel",
                           @"yuike_maintab_shopcart_nor", @"yuike_maintab_shopcart_sel",
                           @"yuike_maintab_space_nor", @"yuike_maintab_space_sel"];
    }
    return _imagesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.barTintColor = GRAYCOLOR;
    self.tabBar.frame = CGRectMake(0, ScreenH - CUSTOM_Tab_H, ScreenW, CUSTOM_Tab_H);
    [self setupViewControllers];
}

- (void)setupViewControllers {
    UINavigationController *homeNav = [HomePageViewController createNav];
    homeNav.navigationBar.barTintColor = PINKCOLOR;
    
    UINavigationController *brandNav = [BrandViewController createNav];
    
    ThemeViewController *themeVC = [[ThemeViewController alloc] init];
    
    UINavigationController *shopNav = [ShoppingViewController createNav];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    self.viewControllers = @[homeNav, brandNav, themeVC, shopNav, mineVC];
    
    NSInteger count = self.viewControllers.count;
    CGFloat btnW = ScreenW / count;
    for (int i = 0; i < count; i ++) {
        TabButton *btn = [TabButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        btn.frame = CGRectMake(btnW * i, 0, btnW, CUSTOM_Tab_H);
        UIImage *nomalImg = [UIImage imageNamed:self.imagesArray[i * 2]];
        UIImage *selecImg = [UIImage imageNamed:self.imagesArray[i * 2 + 1]];
        [btn setImage:nomalImg
             forState:UIControlStateNormal];
        [btn setImage:selecImg
             forState:UIControlStateSelected];
        [self.tabBar addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        if (i == 0) {
            [self btnClick:btn];
        }
    }
    PX_RELEASE(themeVC);
    PX_RELEASE(mineVC);
}

- (void)setViewControllers:(NSArray *)viewControllers {
    [super setViewControllers:viewControllers];
}

- (void)btnClick:(UIButton *)sender {
    if (self.selectedBtn == sender) {
        return;
    }
    self.selectedBtn.selected = NO;
    sender.selected = YES;
    self.selectedBtn = sender;
    self.selectedIndex = sender.tag;
}

@end