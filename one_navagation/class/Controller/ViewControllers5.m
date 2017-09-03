//
//  WKWebViewViewController.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers5.h"


@interface ViewControllers5 ()

@property(nonatomic,strong)UIView *animationView;

@end

@implementation ViewControllers5

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.animationView];
    
    [self.animationView whenTapped:^{
        [self animation_CABasicAnimation];
    }];
}

//blockAnimation CGAffineTransform
-(void)blockAnimations
{
    [UIView animateWithDuration:2 animations:^{
        //[self.view setTransform:CGAffineTransformScale(self.view.transform, 1.1, 1.2)];
        //self.view.transform = CGAffineTransformMakeTranslation(100, 100);
        self.view.transform = CGAffineTransformScale(self.view.transform, -1.0, 1.0);
    }];
}


//CABasicAnimation  用于layer
-(void)animation_CABasicAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position";//@"bounds",@"transform"
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    //anima.toValue=[NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    //anima.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2+M_PI_4, 1, 1, 0)];
    //1.2设置动画执行完毕之后不删除动画
    animation.removedOnCompletion=NO;
    //1.3设置保存动画的最新状态
    animation.fillMode=kCAFillModeForwards;
    [self.animationView.layer addAnimation:animation forKey:nil];
}


//CAKeyframeAnimation
-(void)animation_CAKeyframeAnimation{
    
}































-(UIView *)animationView{
    if (!_animationView) {
        _animationView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        _animationView.backgroundColor = [UIColor redColor];
    }
    return _animationView;
}

@end
