//
//  WBLoadingView.m
//  BtnTest
//
//  Created by rano on 15/12/11.
//  Copyright © 2015年 rano. All rights reserved.
//

#import "WBLoadingView.h"
#import "UIColor+WB.h"

#define kAnimateRotateKey @"ratate"

@interface WBLoadingView ()

@property (nonatomic, strong) UIView *imageView;

@end

@implementation WBLoadingView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createImageView];
    }
    return self;
}

- (void)createImageView
{
    self.imageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width)];
    self.imageView.layer.borderWidth = 1.3f;
    self.imageView.layer.borderColor = [UIColor colorWithHexString:@"#44C0FE"].CGColor;
    [self addSubview:self.imageView];
    
    //添加动画
    [self addAnimate];
    //当应用从后台到前台的时候，开始动画
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appBecomeForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)addAnimate
{
    CAKeyframeAnimation *animate = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animate.values = @[[NSValue valueWithCATransform3D:CATransform3DRotate(CATransform3DIdentity, M_PI_4, 0, 0, 1)],
                       [NSValue valueWithCATransform3D:CATransform3DRotate(CATransform3DIdentity, M_PI_4 + M_PI, 0, 0, 1)],
                       [NSValue valueWithCATransform3D:CATransform3DRotate(CATransform3DIdentity, M_PI_4, 0, 0, 1)]];
    animate.keyTimes = @[@0,@1,@0];
    animate.duration = 1.0f;
    animate.repeatCount = INFINITY;
    animate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.imageView.layer addAnimation:animate forKey:kAnimateRotateKey];
}

- (void)appBecomeForeground
{
    [self.imageView.layer removeAnimationForKey:kAnimateRotateKey];
    [self addAnimate];
}

@end
