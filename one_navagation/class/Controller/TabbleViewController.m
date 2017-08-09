//
//  TabbleViewController.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TabbleViewController.h"

@interface TabbleViewController ()

@end

@implementation TabbleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    //注意这个的使用ScreenViewHeight
    self.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    NSLog(@"%f",self.tableView.height);
    self.tableView.backgroundColor =[UIColor blueColor];

    self.footerViewHeight = ScreenViewHeight - 49;
    self.showNoDataView = YES;
    
   // [self performSelector:@selector(delays) withObject:nil afterDelay:5.0];
   
}


-(void)delays{
    self.showNoDataView = NO;
}


@end
