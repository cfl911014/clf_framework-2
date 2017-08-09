//
//  Weather.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "Weather.h"



@implementation Weather

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
         self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

-(void)setArray:(NSArray *)array{
    _array = array;
    //重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    //开始点
    CGFloat x = (ScreenWidth/self.array.count)/2.0;
    CGFloat y = weatherPiontR;
  
    //画圆圈
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    for(int i = 0;i<self.array.count; i++){
        
        x = ScreenWidth/self.array.count*i+ (ScreenWidth/self.array.count)/2;
        y = [self backYFormax:[@"37" intValue] min:[@"27" intValue] current:[self.array[i] intValue]] + weatherPiontR;
    
        CGContextAddArc(context, x, y, weatherPiontR, 0, 2*PI, 0); //添加一个圆
        CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
        CGContextDrawPath(context, kCGPathFill);//绘制填充
    }

    
    //创建曲线点的数组
    NSMutableArray *arrayx = [NSMutableArray array];
    NSMutableArray *arrayy = [NSMutableArray array];
    //第一个随便添加一个数
    [arrayx addObject:@(1)];
    [arrayy addObject:@(2)];
    for(int i = 0;i<self.array.count; i++){
        
        x = ScreenWidth/self.array.count*i+ (ScreenWidth/self.array.count)/2;
        y = [self backYFormax:[@"37" intValue] min:[@"27" intValue] current:[self.array[i] intValue]]+weatherPiontR;
        
        [arrayx addObject:@(x)];
        [arrayy addObject:@(y)];
    }
    //将最后一个点添加两遍
    [arrayx addObject:@(x)];
    [arrayy addObject:@(y)];
    
    //画曲线
    UIBezierPath* path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake((ScreenWidth/6)/2.0, weatherPiontR)];
    for(int i = 0 ; i<arrayy.count-3;i++){
        [self getControlPointx0:[arrayx[i] floatValue]
                          andy0:[arrayy[i] floatValue]
                             x1:[arrayx[i+1] floatValue]
                          andy1:[arrayy[i+1] floatValue]
                             x2:[arrayx[i+2] floatValue]
                          andy2:[arrayy[i+2] floatValue]
                             x3:[arrayx[i+3] floatValue]
                          andy3:[arrayy[i+3] floatValue]
                           path:path];
    }
    [path stroke];
}


//根据最高温度最低温度当前温度计算y值
-(CGFloat)backYFormax:(int)max min:(int)min current:(int)current
{
    float space = (max - min)*1.0;
    return weatherLineHeight/space * (max - current);
}

-(void) getControlPointx0:(CGFloat)x0 andy0:(CGFloat)y0

                       x1:(CGFloat)x1 andy1:(CGFloat)y1

                       x2:(CGFloat)x2 andy2:(CGFloat)y2

                       x3:(CGFloat)x3 andy3:(CGFloat)y3

                     path:(UIBezierPath*) path

{
    CGFloat smooth_value =0.6;
    
    CGFloat ctrl1_x;
    
    CGFloat ctrl1_y;
    
    CGFloat ctrl2_x;
    
    CGFloat ctrl2_y;
    
    CGFloat xc1 = (x0 + x1) /2.0;
    
    CGFloat yc1 = (y0 + y1) /2.0;
    
    CGFloat xc2 = (x1 + x2) /2.0;
    
    CGFloat yc2 = (y1 + y2) /2.0;
    
    CGFloat xc3 = (x2 + x3) /2.0;
    
    CGFloat yc3 = (y2 + y3) /2.0;
    
    CGFloat len1 = sqrt((x1-x0) * (x1-x0) + (y1-y0) * (y1-y0));
    
    CGFloat len2 = sqrt((x2-x1) * (x2-x1) + (y2-y1) * (y2-y1));
    
    CGFloat len3 = sqrt((x3-x2) * (x3-x2) + (y3-y2) * (y3-y2));
    
    CGFloat k1 = len1 / (len1 + len2);
    
    CGFloat k2 = len2 / (len2 + len3);
    
    CGFloat xm1 = xc1 + (xc2 - xc1) * k1;
    
    CGFloat ym1 = yc1 + (yc2 - yc1) * k1;
    
    CGFloat xm2 = xc2 + (xc3 - xc2) * k2;
    
    CGFloat ym2 = yc2 + (yc3 - yc2) * k2;
    
    ctrl1_x = xm1 + (xc2 - xm1) * smooth_value + x1 - xm1;
    
    ctrl1_y = ym1 + (yc2 - ym1) * smooth_value + y1 - ym1;
    
    ctrl2_x = xm2 + (xc2 - xm2) * smooth_value + x2 - xm2;
    
    ctrl2_y = ym2 + (yc2 - ym2) * smooth_value + y2 - ym2;
    
    [path addCurveToPoint:CGPointMake(x2, y2) controlPoint1:CGPointMake(ctrl1_x, ctrl1_y)controlPoint2:CGPointMake(ctrl2_x, ctrl2_y)];
}






@end
