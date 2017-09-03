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
    
    self.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    
    [self headerBeginRefresh];
    self.showRefreshHeader = YES;
    self.showRefreshFooter = YES;
    
}

-(void)requstData{
   
    BOOL count  = NO;
    if (count) {
        self.showNoDataView = NO;
    }else{
        self.footerViewHeight = ScreenViewHeight - 49;
        self.showNoDataView = YES;
    }
    NSLog(@"1");
    [self endRefresh];
    
}



@end
