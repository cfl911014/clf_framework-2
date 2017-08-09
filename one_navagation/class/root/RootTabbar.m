//
//  RootTabbar.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RootTabbar.h"

@implementation RootTabbar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *topV =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
        topV.backgroundColor =[UIColor colorWithWhite:0.867 alpha:1];
        [self addSubview:topV];
        
        self.plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.plusBtn];
        [self.plusBtn addTarget:self action:@selector(clickPlus) forControlEvents:UIControlEventTouchUpInside];
        
        //        self.plusBtn.backgroundColor = [UIColor colorWithRed:0.583 green:0.480 blue:0.027 alpha:1.000];
        //        self.plusBtn.layer.cornerRadius = 4;
        //        self.plusBtn.clipsToBounds = YES;
        //        [self.plusBtn setImage:[UIImage imageNamed:@"plusBtn_image"] forState:UIControlStateNormal];
        
        
#warning +Image
        [self.plusBtn setImage:[UIImage imageNamed:@"11111"] forState:UIControlStateNormal];
        
        CGRect rect = CGRectMake(0, -1 , ScreenWidth  , 1);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [self setBackgroundImage:img];
        [self setShadowImage:img];
        
        
        self.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.000];
        self.alpha = 0.975;
    }
    return self;
    
}

-(void)clickPlus
{
    if (self.nBarDelegate && [self.nBarDelegate respondsToSelector:@selector(clickPlusButton)]) {
        [self.nBarDelegate clickPlusButton];
    }
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.plusBtn.centerX = self.width/2 ;
    
    self.plusBtn.centerY = self.height/2 - 10;
    self.plusBtn.size = CGSizeMake(70 , 67);

    
    CGFloat tabbarButtonW = ScreenWidth/5;
    CGFloat tabbarButtonIndex = 0;
    
    for (UIView *child in self.subviews) {
        Class class =  NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.width = tabbarButtonW;
            child.x = tabbarButtonIndex * tabbarButtonW;
            
            tabbarButtonIndex ++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex ++;
            }
        }
    }
}




//超出父试图部分响应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        for (UIView *subView in self.subviews) {
            CGPoint tp = [subView convertPoint:point fromView:self];
            if (CGRectContainsPoint(subView.bounds, tp)) {
                view = subView;
            }
        }
    }
    return view;
}
@end
