//
//  UIView+WhenTappedBlocks.h
//
//  Created by FenDou on 15/11/17.
//  Copyright © 2015年 FenDou. All rights reserved.
//
//  添加点击事件

#if NS_BLOCKS_AVAILABLE

#import <UIKit/UIKit.h>

typedef void (^JMWhenTappedBlock)();

@interface UIView (JMWhenTappedBlocks) <UIGestureRecognizerDelegate>

- (void)whenTapped:(JMWhenTappedBlock)block;
- (void)whenDoubleTapped:(JMWhenTappedBlock)block;
- (void)whenTwoFingerTapped:(JMWhenTappedBlock)block;
- (void)whenTouchedDown:(JMWhenTappedBlock)block;
- (void)whenTouchedUp:(JMWhenTappedBlock)block;

@end

#endif
