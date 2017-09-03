//
//  NSArray+WB.h
//  Picasso
//
//  Created by  崔付亮  on 15/6/11.
//  Copyright (c) 2015年  崔付亮 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (WB)

/**
 *  防止数组越界
 */
- (id)objectByIndex:(NSUInteger)index;



@end
