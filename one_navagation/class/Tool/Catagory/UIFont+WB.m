//
//  UIFont+WB.m
//  Picasso
//
//  Created by wanglc on 15/12/15.
//  Copyright © 2015年  崔付亮 . All rights reserved.
//

#import "UIFont+WB.h"

@implementation UIFont (WB)

+ (UIFont *) appFoliobcFontOfSize:(CGFloat) pointSize {
    return [UIFont fontWithName:@"Folio BdCn BT" size:pointSize];
}

+ (UIFont *) appLantingThinBlack:(CGFloat) pointSize {
    return [UIFont fontWithName:@"FZLanTingHei-L-GBK" size:pointSize];
}

+ (UIFont *) appHelvetiacNeueFontOfSize:(CGFloat) pointSize {
    return [UIFont fontWithName:@"Helvetiac Neue" size:pointSize];
}

@end
