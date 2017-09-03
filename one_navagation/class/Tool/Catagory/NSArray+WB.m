//
//  NSArray+WB.m
//  Picasso
//
//  Created by  崔付亮  on 15/6/11.
//  Copyright (c) 2015年  崔付亮 . All rights reserved.
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
