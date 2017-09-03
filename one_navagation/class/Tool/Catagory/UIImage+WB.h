//
//  UIImage+WB.h
//  Picasso
//
//  Created by  崔付亮  on 15/6/11.
//  Copyright (c) 2015年  崔付亮 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WB)

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;


@end
