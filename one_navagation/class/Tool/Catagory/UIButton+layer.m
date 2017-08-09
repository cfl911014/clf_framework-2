//
//  UIButton+layer.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIButton+layer.h"

@implementation UIButton (layer)


+ (instancetype)cornerButton:(CGFloat)corner
                        font:(CGFloat)font
                     bgColor:(UIColor*)color
                  boderColor:(UIColor*)boderColor
                  boderWight:(CGFloat)w
                       title:(NSString *)title
{
    return [[self alloc] initWithCircleCorner:corner
                                         font:font
                                      bgColor:color
                                   boderColor:boderColor
                                   boderWight:w
                                        title:(NSString *)title];
}

- (instancetype)initWithCircleCorner:(CGFloat)corner
                                font:(CGFloat)font
                             bgColor:(UIColor*)color
                          boderColor:(UIColor*)boderColor
                          boderWight:(CGFloat)w
                               title:(NSString *)title
{
    if (self = [super init])
    {
        self.layer.cornerRadius = corner;
        if (w > 0) {
            self.layer.borderColor = boderColor.CGColor;
            self.layer.borderWidth = w;
        }
        self.layer.masksToBounds = YES;
        
        [self.titleLabel setFont:[UIFont systemFontOfSize:font]];
        [self setTitle:title forState:UIControlStateNormal];
        [self setBackgroundColor:color];
    }
    return self;
}




- (void)setNormarlTitle:(NSString*)title {
    [self setTitle:title forState:UIControlStateNormal];
}
- (void)setSelectedTitle:(NSString*)title {
    [self setTitle:title forState:UIControlStateSelected];
}
- (void)setNormarlTitleColor:(UIColor*)color {
    [self setTitleColor:color forState:UIControlStateNormal];
}
- (void)setSelectedTitleColor:(UIColor*)color {
    [self setTitleColor:color forState:UIControlStateSelected];
}
- (void)setNormarlImage:(UIImage*)img {
    [self setBackgroundImage:img forState:UIControlStateNormal];
}
- (void)setSelectedImage:(UIImage*)img {
    [self setBackgroundImage:img forState:UIControlStateSelected];
    
}
- (void)setFontSize:(CGFloat)size {
    [self.titleLabel setFont:[UIFont systemFontOfSize:size]];
}





@end
