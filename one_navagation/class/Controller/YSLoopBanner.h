//
//  YSLoopBanner.h
//  one_navagation
//
//  Created by 崔付亮 on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSLoopBanner : UIView

/** click action */
@property (nonatomic, copy) void (^clickAction) (NSInteger curIndex) ;

/** data source */
@property (nonatomic, copy) NSArray *imageURLStrings;


- (instancetype)initWithFrame:(CGRect)frame scrollDuration:(NSTimeInterval)duration;

@end


