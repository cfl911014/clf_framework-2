//
//  HUD.h
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HUD : NSObject

/**
 *  创建单列
 */
+ (HUD *)sharedHUD;


#pragma mark - 基本功能

- (void)showHUD:(UIView *)superview message:(NSString *)message;
- (void)hideHUD;


#pragma mark - 加载功能
/*
 * superview 加载视图的父视图
 * dimBackground 背景是否有蒙灰效果（设置为YES则有，设置为NO则没有）
 */
- (void)showLoading:(UIView *)superview dimBackground:(BOOL)dimBackground;
- (void)showSuccess;
- (void)showFailure;
- (void)hide;
@end
