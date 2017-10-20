//
//  ViewControllers11.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/9/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers11.h"

@interface ViewControllers11 ()

@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UIView *V2;

@end

@implementation ViewControllers11

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //1.
    self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn.frame = CGRectMake(100, 100, 50, 50);
    
    [self.btn setTitle:@"触摸" forState:UIControlStateNormal];
    [self.btn setTitle:@"移动" forState:UIControlStateHighlighted];
    
    [self.btn addTarget:self action:@selector(dragMoving:withEvent: )forControlEvents: UIControlEventTouchDragInside];
    
    [self.view addSubview:self.btn];
    
    
    //2.
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 60, 60)];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(doMoveAction:)];
    [v addGestureRecognizer:pan];
    
  
    //3.
    self.V2 = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 60, 60)];
    self. V2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview: self.V2];

}


//1.
- (void)dragMoving:(UIButton *)c withEvent:ev{
        c.center = [[[ev allTouches] anyObject] locationInView:self.view];
}


//2.
-(void)doMoveAction:(UIPanGestureRecognizer *)recognizer{
    // Figure out where the user is trying to drag the view.

    CGPoint translation = [recognizer translationInView:self.view];
    NSLog(@"%f",translation.x);//变化值
    CGPoint newCenter = CGPointMake(recognizer.view.center.x+ translation.x,
                                    recognizer.view.center.y + translation.y);//`限制屏幕范围：
    newCenter.y = MAX(recognizer.view.frame.size.height/2, newCenter.y);
    newCenter.y = MIN(self.view.frame.size.height - recognizer.view.frame.size.height/2,  newCenter.y);
    newCenter.x = MAX(recognizer.view.frame.size.width/2, newCenter.x);
    newCenter.x = MIN(self.view.frame.size.width - recognizer.view.frame.size.width/2,newCenter.x);
    recognizer.view.center = newCenter;
    [recognizer setTranslation:CGPointZero inView:self.view];
}

//3.
BOOL isMove;
CGPoint legend_point;
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    isMove = NO;
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (CGRectContainsPoint(self.V2.frame, point)) {
        legend_point = [touch locationInView:self.V2];
        isMove = YES;
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    if (!isMove) {
        return;
    }
    @autoreleasepool {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        //转化成相对的中心
        point.x += self.V2.frame.size.width/2.0f - legend_point.x;
        point.y += self.V2.frame.size.height/2.0f - legend_point.y;
        //        限制范围
        if (point.x < self.V2.frame.size.width / 2.0f) {
            point.x = self.V2.frame.size.width / 2.0f;
        }
        if (point.y < self.V2.frame.size.height / 2.0f) {
            point.y = self.V2.frame.size.height / 2.0f;
        }
        
        if (point.x > self.view.frame.size.width - self.V2.frame.size.width / 2.0f) {
            point.x = self.view.frame.size.width - self.V2.frame.size.width / 2.0f;
        }
        if (point.y > self.view.frame.size.height - self.V2.frame.size.height / 2.0f) {
            point.y = self.view.frame.size.height - self.V2.frame.size.height / 2.0f;
        }
        self.V2.center = point;
        
    }
}







@end
