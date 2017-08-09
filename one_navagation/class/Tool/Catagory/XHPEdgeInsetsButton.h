//
//  XHPEdgeInsetsButton.h
//  
//
//  Created by FenDou on 15/11/17.
//  Copyright © 2015年 FenDou. All rights reserved.
//  自定义按钮图片左右样式

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XHPButtonEdgeInsetsStyle) {
    XHPButtonEdgeInsetsStyleImageLeft,
    XHPButtonEdgeInsetsStyleImageRight,
    XHPButtonEdgeInsetsStyleImageTop,
    XHPButtonEdgeInsetsStyleImageBottom
};

IB_DESIGNABLE

@interface XHPEdgeInsetsButton : UIButton


/**
 *  样式
 */
#if TARGET_INTERFACE_BUILDER

@property (nonatomic) IBInspectable NSUInteger edgeInsetsStyle;

#else

@property (nonatomic) XHPButtonEdgeInsetsStyle edgeInsetsStyle;

#endif


/**
 *  间距
 */
@property (nonatomic) IBInspectable CGFloat imageTitleSpace;

@end
