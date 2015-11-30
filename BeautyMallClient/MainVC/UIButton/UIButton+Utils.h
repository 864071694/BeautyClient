//
//  UIButton+Utils.h
//  AF封装
//
//  Created by 张泽楠 on 15/11/15.
//  Copyright © 2015年 张泽楠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Utils)
//以下2个方法，须在设置图片和标题之后使用
/**
 *  将按钮转换为竖直样式：图片在上，标题在下
 */
- (void)transToVertical;

/**
 *  将按钮转换为竖直样式：图片在上，标题在下
 *
 *  @param padding 图片与标题间距
 */
- (void)transToVerticalWithPadding:(CGFloat)padding;

@end
