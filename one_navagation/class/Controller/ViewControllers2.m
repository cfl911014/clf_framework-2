//
//  ViewController7.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers2.h"

@interface ViewControllers2 ()

@end

@implementation ViewControllers2

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(100,100, 100, 100)];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    
    
    //添加mask属性
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:v.bounds byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(5, 5)];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    layer.path = path.CGPath;
    v.layer.mask = layer;
    
}

@end
