//
//  DrawRectView.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DrawRectView.h"

@implementation DrawRectView

static CGFloat const PI = 3.141592654;
- (void)drawRect:(CGRect)rect {
    
    //文字
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.paragraphSpacing = 10;
    style.alignment = NSTextAlignmentCenter;
    NSDictionary *dic = @{
                          NSForegroundColorAttributeName:[UIColor redColor],
                          NSUnderlineStyleAttributeName:@1,
                          NSParagraphStyleAttributeName:style,
                          NSKernAttributeName:@5
                          };
    [@"文字" drawInRect:CGRectMake(00, 64, 100, 20) withAttributes:dic];
    
    //图片
    UIImage *img = [UIImage imageNamed:@"kj_1_1"];
    [img drawInRect:CGRectMake(200, 80, 60, 60)];//可以设置柔光,变量,变暗等等
    
    //创建上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//红色: 填充颜色
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);//白色: 线颜色
    
    //画线
    //CGContextSetAllowsAntialiasing(context, true);
    //CGContextSetLineCap(context, kCGLineCapRound);
    //CGContextSetLineWidth(context, 3);//线宽
    CGContextMoveToPoint(context, 0, 90);//起点坐标
    CGContextAddLineToPoint(context, 50, 90);//终点坐标
    CGContextAddLineToPoint(context, 100, 80);
    CGContextStrokePath(context);
    
    //画圆圈
    CGContextAddArc(context, 20, 120, 10, 0, 2*PI, 0);//(20,120圆心位置)
    CGContextDrawPath(context, kCGPathStroke);//绘制路径
    
    //画填充圆
    //CGContextSetLineWidth(context, 0);//0无边框 >0有边框
    CGContextAddArc(context, 50, 120, 10, 0, 2*PI, 0);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //笑脸
    CGContextMoveToPoint(context, 20, 140);
    CGContextAddArcToPoint(context, 40, 150, 60, 140, 50);
    CGContextStrokePath(context);
    
    //画矩形
    CGContextSetLineWidth(context, 3);
    //方式1(画两个)
    CGContextStrokeRect(context, CGRectMake(20, 160, 25, 25));
    CGContextFillRect(context,  CGRectMake(20, 160, 20, 20));
    //方式2
    CGContextAddRect(context, CGRectMake(80, 160, 60, 30));//画方框
    CGContextDrawPath(context, kCGPathFillStroke);//绘画路径
    
    //绘制虚线
    CGFloat length[] = {10,10};
    CGContextSetLineDash(context, 0, length, 2);
    CGContextMoveToPoint(context, 10, 200);
    CGContextAddLineToPoint(context, 200, 200);
    CGContextStrokePath(context);
    
    //奇偶填充
    // 1. 获取"图形上下文"
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 220, 200, 100)];
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(30, 245, 140, 50) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(5, 5)];

    CGContextAddPath(ctx, path3.CGPath);
    CGContextAddPath(ctx, path.CGPath);
    CGContextDrawPath(ctx, kCGPathEOFill);
    
    NSLog(@"修复bug");
    
    NSLog(@"新功能开发完成");
}

@end
