//
//  MLNavigationController.m
//  MultiLayerNavigation
//
//  Created by 张泽楠 on 15/11/29.
//  Copyright © 2015年 ‚Äö√†√∂‚àö√°¬¨¬®‚Äö√†¬¥‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö¬¢‚Äö√Ñ¬¢‚âà√≠¬¨¬©‚Äö√†√∂‚àö¬ß‚Äö√Ñ√∂‚àö√ë¬¨¬¢‚Äö√Ñ√∂‚àö√ë‚Äö√Ñ‚Ä†. All rights reserved.
//

#define KEY_WINDOW  [[[UIApplication sharedApplication] delegate] window]
#define TOP_VIEW  [[[UIApplication sharedApplication] delegate] window].rootViewController.view
#define TOP_VIEW_WIDTH (TOP_VIEW.frame.size.width)

#import "MHNavigationController.h"

NSString * const MHTabBarControllerViewControllerPushNotification = @"MHTabBarControllerViewControllerPushNotification";
NSString * const MHTabBarControllerViewControllerPopNotification = @"MHTabBarControllerViewControllerPopNotification";

@interface MHNavigationController (){
    CGPoint startTouch;
    UIImageView *lastScreenShotView;
    UIView *blackMask;
}

@property (nonatomic, assign) BOOL           isMoving;
@property (nonatomic, retain) UIView         *backgroundView;
@property (nonatomic, retain) NSMutableArray *screenShotsList;

@end

@implementation MHNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.screenShotsList = [NSMutableArray arrayWithCapacity:2];
    self.canDragBack = YES;
}

- (void)dealloc {
    self.screenShotsList = nil;
    [self.backgroundView removeFromSuperview];
    self.backgroundView = nil;
#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self
                                                                                action:@selector(paningGestureReceive:)];
    recognizer.delegate = self;
    [recognizer delaysTouchesBegan];
    [self.view addGestureRecognizer:recognizer];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.screenShotsList.count == 0) {
        UIImage *capturedImage = [self capture];
        if (capturedImage) {
            [self.screenShotsList addObject:capturedImage];
        }
    }
}

// override the push method
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIImage *capturedImage = [self capture];
    if (capturedImage) {
        [self.screenShotsList addObject:capturedImage];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:MHTabBarControllerViewControllerPushNotification object:viewController];
    });
    [super pushViewController:viewController animated:animated];
}

// override the pop method
- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    [self.screenShotsList removeLastObject];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:MHTabBarControllerViewControllerPopNotification object:nil];
    });
    return [super popViewControllerAnimated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
    [self.screenShotsList removeAllObjects];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:MHTabBarControllerViewControllerPopNotification object:nil];
    });
    return [super popToRootViewControllerAnimated:animated];
}

#pragma mark - Utility Methods -

// get the current view screen shot
- (UIImage *)capture {
    UIGraphicsBeginImageContextWithOptions(TOP_VIEW.bounds.size, TOP_VIEW.opaque, 0.0);
    [TOP_VIEW.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

// set lastScreenShotView 's position and alpha when paning
- (void)moveViewWithX:(float)x {
    x = x > TOP_VIEW_WIDTH ? TOP_VIEW_WIDTH : x;
    x = x < 0 ? 0 : x;
    CGRect frame = TOP_VIEW.frame;
    frame.origin.x = x;
    TOP_VIEW.frame = frame;
//    float scale = (x / (20 * TOP_VIEW_WIDTH)) + 0.95;
//    lastScreenShotView.transform = CGAffineTransformMakeScale(scale, scale);
    float alpha = 0.4 - (x / 800);
    lastScreenShotView.frame = CGRectMake(-ScreenW / 2 + x / 2, 0, ScreenW, ScreenH);
    blackMask.alpha = alpha;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (self.viewControllers.count <= 1 || !self.canDragBack) {
        return NO;
    }
    return YES;
}

#pragma mark - Gesture Recognizer -

- (void)paningGestureReceive:(UIPanGestureRecognizer *)recoginzer {
    // If the viewControllers has only one vc or disable the interaction, then return.
    if (self.viewControllers.count <= 1 || !self.canDragBack) {
        return;
    }
    // we get the touch position by the window's coordinate
    CGPoint touchPoint = [recoginzer locationInView:KEY_WINDOW];
    
    // begin paning, show the backgroundView(last screenshot),if not exist, create it.
    if (recoginzer.state == UIGestureRecognizerStateBegan) {
        _isMoving = YES;
        startTouch = touchPoint;
        if (!self.backgroundView) {
            CGRect frame = TOP_VIEW.frame;
            CGFloat topPoint = [[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0 ? 0 : 20;
            self.backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, topPoint, frame.size.width , frame.size.height)];
            [TOP_VIEW.superview insertSubview:self.backgroundView belowSubview:TOP_VIEW];
            blackMask = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width , frame.size.height)];
            blackMask.backgroundColor = [UIColor blackColor];
            [self.backgroundView addSubview:blackMask];
        }
        self.backgroundView.hidden = NO;
        if (lastScreenShotView) {
            [lastScreenShotView removeFromSuperview];
        }
        UIImage *lastScreenShot = [self.screenShotsList lastObject];
        lastScreenShotView = [[UIImageView alloc]initWithImage:lastScreenShot];
        [self.backgroundView insertSubview:lastScreenShotView belowSubview:blackMask];
        //End paning, always check that if it should move right or move left automatically
    } else if (recoginzer.state == UIGestureRecognizerStateEnded){
        if (touchPoint.x - startTouch.x > 50) {
            [UIView animateWithDuration:0.3 animations:^{
                [self moveViewWithX:TOP_VIEW_WIDTH];
            } completion:^(BOOL finished) {
                [self popViewControllerAnimated:NO];
                CGRect frame = TOP_VIEW.frame;
                frame.origin.x = 0;
                TOP_VIEW.frame = frame;
                _isMoving = NO;
                self.backgroundView.hidden = YES;
            }];
        } else {
            [UIView animateWithDuration:0.3 animations:^{
                [self moveViewWithX:0];
            } completion:^(BOOL finished) {
                _isMoving = NO;
                self.backgroundView.hidden = YES;
            }];
        }
        return;
        // cancal panning, alway move to left side automatically
    } else if (recoginzer.state == UIGestureRecognizerStateCancelled){
        [UIView animateWithDuration:0.3 animations:^{
            [self moveViewWithX:0];
        } completion:^(BOOL finished) {
            _isMoving = NO;
            self.backgroundView.hidden = YES;
        }];
        return;
    }
    // it keeps move with touch
    if (_isMoving) {
        [self moveViewWithX:touchPoint.x - startTouch.x];
    }
}

@end
