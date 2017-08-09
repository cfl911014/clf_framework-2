//
//  ViewController4.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController4.h"
#import "Weather.h"
@interface ViewController4 ()

@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)Weather *weather;

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.weather];
}

-(NSArray *)array{
    if (!_array) {
        _array = @[@"37",@"31",@"36",@"33",@"37",@"27"];
    }
    return _array;
}

-(Weather *)weather{
    if (!_weather) {
        _weather = [[Weather alloc]initWithFrame:CGRectMake(0, 100, ScreenWidth, 40)];
        _weather.array = self.array;
    }
    return _weather;
}
















-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}


@end
