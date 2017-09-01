//
//  Weather.h
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

//曲线所占高度
static CGFloat const weatherLineHeight = 30;
//圆点半径
static CGFloat const weatherPiontR = 5;
//viwe总高度
static CGFloat const weatherHeight = weatherLineHeight + weatherPiontR*2;

static CGFloat const PI = 3.14592654;




@interface FLWeatherView : UIView

//温度数组
@property(nonatomic,strong)NSArray<NSString *> *array;


-(instancetype)initWithFrame:(CGRect)frame;


@end
