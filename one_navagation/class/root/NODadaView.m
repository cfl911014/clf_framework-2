//
//  NODadaView.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NODadaView.h"

@implementation NODadaView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void) createUI{
    self.backgroundColor = [UIColor redColor];
    UILabel *lable =[[UILabel alloc]init];
    lable.size = CGSizeMake(100,30);
    lable.textAlignment = NSTextAlignmentCenter;
    lable.center = self.center;
    lable.text = @"暂无数据";
    [self addSubview:lable];
}

@end
