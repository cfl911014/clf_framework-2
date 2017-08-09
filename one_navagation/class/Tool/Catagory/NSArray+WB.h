//
//  NSArray+WB.h
//  Picasso
//
//  Created by 张玲玉 on 15/6/11.
//  Copyright (c) 2015年 bj.58.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (WB)

/**
 *  防止数组越界
 */
- (id)objectByIndex:(NSUInteger)index;



@end
