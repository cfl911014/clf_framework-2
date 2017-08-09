//
//  UIButton+layer.h
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (layer)

//UIButton * cache = [UIButton cornerButton:4.0
//                                     font:14.0
//                                  bgColor:[UIColor redColor]
//                               boderColor:[UIColor blueColor]
//                               boderWight:1.0
//                                    title:@"修改"];

+ (instancetype)cornerButton:(CGFloat)corner
                        font:(CGFloat)font
                     bgColor:(UIColor *)color
                  boderColor:(UIColor *)boderColor
                  boderWight:(CGFloat)w
                       title:(NSString *)title;

- (void)setNormarlTitle:(NSString*)title;
- (void)setSelectedTitle:(NSString*)title;

- (void)setNormarlTitleColor:(UIColor*)color;
- (void)setSelectedTitleColor:(UIColor*)color;

- (void)setNormarlImage:(UIImage*)img;
- (void)setSelectedImage:(UIImage*)img;

- (void)setFontSize:(CGFloat)size;



@end
