//
//  ViewController1.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController2.h"
#import "ZLPhotoPickerCollectionView.h"
#import "ClickAndSelectPhoto.h"
#import "ZLPhoto.h"
#import "ViewController5.h"

@interface ViewController1 ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>


@property(nonatomic,strong)UIButton *btn;

@property (nonatomic,strong)ClickAndSelectPhoto *photos;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.btn];
    self.view.backgroundColor = [UIColor redColor];
    [self.btn addTarget:self action:@selector(clickbtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 64, 100, 100)];

//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:point1];
//    [path addLineToPoint:point2];
//    [path addLineToPoint:point3];
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, 100, 100);
    shapeLayer.strokeEnd = 0.7f;
    shapeLayer.strokeStart = 0.1f;
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    
    [self.view.layer addSublayer:shapeLayer];
 
    


    
}



- (void)clickbtn
{
    [self.navigationController pushViewController:[[ViewController5 alloc]init] animated:YES];
}


-(UIButton *)btn
{
    if (_btn == nil) {
        _btn = [UIButton cornerButton:4.0f
                                 font:15.0f
                              bgColor:[UIColor redColor]
                           boderColor:[UIColor blueColor]
                           boderWight:1.0f
                                title:@"hehe"];
        _btn.frame = CGRectMake(100, 100, 100, 100);
        
    }
    return _btn;
}






@end
