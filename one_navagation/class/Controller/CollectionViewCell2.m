//
//  CollectionViewCell2.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "CollectionViewCell2.h"

@implementation CollectionViewCell2


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 1;
    }
    return self;
}

@end
