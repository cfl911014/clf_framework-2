//
//  ViewControllers12.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/10/13.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers12.h"
#import "BulletView.h"
#import "BulletManager.h"
@interface ViewControllers12 ()

@property(nonatomic,strong)BulletManager *manager;

@end

@implementation ViewControllers12

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"开始弹幕" forState:UIControlStateNormal];
    btn.backgroundColor =[UIColor blueColor];
    btn .frame = CGRectMake(100, 100, 100, 30);
    [btn addTarget:self action:@selector(clickStartBullet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    
    //view manager controller
    
    self.manager = [[BulletManager alloc]init];
    __weak typeof(self) weakSelf = self;
    self.manager.genarateViewBlock = ^(BulletView* view){
        view.frame = CGRectMake(ScreenWidth, 300+view.tra*40, view.width, view.height);
        [weakSelf.view addSubview:view];
        [view startAnimation];
    };
}

-(void)clickStartBullet{
    [self.manager start];
}


@end
