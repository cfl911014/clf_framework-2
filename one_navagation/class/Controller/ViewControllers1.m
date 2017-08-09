//
//  ViewController6.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers1.h"
#import "FLWeatherView.h"

@interface ViewControllers1 ()

@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)FLWeatherView *weather;


@end

@implementation ViewControllers1

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

-(FLWeatherView *)weather{
    if (!_weather) {
        _weather = [[FLWeatherView alloc]initWithFrame:CGRectMake(0, 100, ScreenWidth, 40)];
        _weather.array = self.array;
    }
    return _weather;
}



@end
