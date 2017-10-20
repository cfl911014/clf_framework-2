//
//  ViewControllers10.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/9/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers10.h"

@interface ViewControllers10 ()

@end

@implementation ViewControllers10

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    //红色控件中有一个蓝色控件
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    blueView.backgroundColor = [UIColor blueColor];
    [redView addSubview:blueView];
    
    
    //计算 蓝色控件在 self.view中的frame
    CGRect newRect = [redView convertRect:blueView.frame toView:self.view];
   

    
    
    
    
    //应用实例
    //Controller的view中有一个tableView，tableView的cell上有一个button，现在需要将button的frame转为在Controller的view中的frame，怎么实现呢？
     UIButton *btn;
     CGRect rect = [btn.superview convertRect:btn.frame toView:self.view];
    
    

}
@end
