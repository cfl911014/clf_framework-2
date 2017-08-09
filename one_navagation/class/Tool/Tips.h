//
//  Tips.h
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"


@interface Tips : NSObject


singleton_h(tips)

- (void)showTips:(NSString *)text;

- (void)hiddenTips;

@end
