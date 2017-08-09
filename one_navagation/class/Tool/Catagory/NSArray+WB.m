//
//  NSArray+WB.m
//  Picasso
//
//  Created by 张玲玉 on 15/6/11.
//  Copyright (c) 2015年 bj.58.com. All rights reserved.
//

#import "NSArray+WB.h"

@implementation NSArray (WB)

/**
 *  防止数组越界
 */
- (id)objectByIndex:(NSUInteger)index
{
    if (index<self.count) {
        return self[index];
    }
    else {
        return nil;
    }
}


@end
