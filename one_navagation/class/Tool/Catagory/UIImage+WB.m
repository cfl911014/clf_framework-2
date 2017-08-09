//
//  UIImage+WB.m
//  Picasso
//
//  Created by 张玲玉 on 15/6/11.
//  Copyright (c) 2015年 bj.58.com. All rights reserved.
//

#import "UIImage+WB.h"

@implementation UIImage (WB)

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name
{
    return [self resizedImageWithName:name left:0.5 top:0.5];
}
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [UIImage imageNamed:name];
    image = [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
    return image;
}


@end
