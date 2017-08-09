//
//  UIImage+WB.h
//  Picasso
//
//  Created by 张玲玉 on 15/6/11.
//  Copyright (c) 2015年 bj.58.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WB)

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;


@end
