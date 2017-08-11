//
//  ViewControllers3.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers3.h"
#import "DrawRectView.h"
@interface ViewControllers3 ()

@property(nonatomic,strong)DrawRectView *drawRectView;

@end

@implementation ViewControllers3

- (void)viewDidLoad {
    [super viewDidLoad];

    self.drawRectView = [[DrawRectView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.drawRectView];
    

}

@end
