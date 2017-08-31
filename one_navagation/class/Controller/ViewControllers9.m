//
//  ViewControllers9.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers9.h"
#import "DataSourceView.h"
@interface ViewControllers9 ()<DataSourceViewDataSource>

@end

@implementation ViewControllers9

- (void)viewDidLoad {
    [super viewDidLoad];
    DataSourceView *v = [[DataSourceView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
    v.dataSource = self;
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    
}

static  NSArray *a ;
-(NSInteger)viewtitlesCount{
    a=@[@"123",@"456",@"12345"];
    return a.count;
}

-(NSString *)viewtitleIndex:(NSInteger)index{
    return a[index];
}

@end
