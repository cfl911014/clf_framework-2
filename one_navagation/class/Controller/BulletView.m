//
//  BulletView.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/10/13.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BulletView.h"

#define Padding 10

@interface BulletView()

@property(nonatomic,strong)UILabel *lbCommnetLable;

@end

@implementation BulletView

-(instancetype)initWithCommnet:(NSString *)comment{
    if (self = [super init]) {
        
        NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]};
        CGFloat wight = [comment sizeWithAttributes:attr].width;
        self.bounds= CGRectMake(0, 0,  wight+2*Padding, 30);
        self.backgroundColor = [UIColor blackColor];
        
        self.lbCommnetLable.text = comment;
        self.lbCommnetLable.frame = CGRectMake(Padding, 0, wight, 30);
    }
    return self;
}

-(void)startAnimation{
    CGFloat duration = 4.0;
    CGFloat allWight = CGRectGetWidth(self.bounds)+ScreenWidth;
    
    __block CGRect frame = self.frame;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        frame.origin.x -= allWight;
        self.frame = frame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (self.moveStateBlock) {
            self.moveStateBlock(end);
        }
    }];

    CGFloat time = (self.width+20)/((ScreenWidth+self.width)/4.0);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.moveStateBlock(middel);
    });
}


-(void)stopAnimation{
    [self.layer removeAllAnimations];
    [self removeFromSuperview];
}


-(UILabel *)lbCommnetLable{
    if (!_lbCommnetLable) {
        _lbCommnetLable =[[UILabel alloc]initWithFrame:CGRectZero];
        _lbCommnetLable.textColor = [UIColor redColor];
        _lbCommnetLable.font =[UIFont systemFontOfSize:14.0f];
        _lbCommnetLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbCommnetLable];
    }
    return _lbCommnetLable;
}


@end
