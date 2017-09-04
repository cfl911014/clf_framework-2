//
//  ViewController2.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController1.h"
#import "TabbleViewController.h"
@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
   //[[HUD sharedHUD] showLoading:self.view dimBackground:YES];
    [self drawLayer];
}

-(void)drawLayer{
    //获得根图层
    CALayer *layer = [[CALayer alloc]init];
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.position = CGPointMake(ScreenWidth/2.0, ScreenHeight/2.0);
    layer.bounds = CGRectMake(0, 0, 40, 40);
    layer.cornerRadius = 40/2.0;
    
    layer.shadowColor=[UIColor grayColor].CGColor;
    layer.shadowOffset=CGSizeMake(2, 2);
    layer.shadowOpacity=0.9;
   
    [self.view.layer addSublayer:layer];
//     CALayer *layer1 = self.view.layer.sublayers.firstObject;
//    layer1.hidden = YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CALayer *layer = self.view.layer.sublayers.firstObject;
    
    CGFloat width=layer.bounds.size.width;
    if (width==40) {
        width=40*4;
    }else{
        width=40;
    }
    layer.bounds=CGRectMake(0, 0, width, width);
    layer.position=[touch locationInView:self.view];
    layer.cornerRadius=width/2;
}

@end
