//
//  UIFont+WB.h
//  Picasso
//
//  Created by wanglc on 15/12/15.
//  Copyright © 2015年  崔付亮 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (WB)

/**
 *  Folio BdCn BT 粗体
 *  @param pointSize:字号大小
 *  @return 字体类型
 */
+ (UIFont *) appFoliobcFontOfSize:(CGFloat) pointSize;


/**
 *  兰亭细黑
 *  @param pointSize:字号大小
 *  @return 字体类型
 */
+ (UIFont *) appLantingThinBlack:(CGFloat) pointSize;


/**
 *  Helvetiac
 *  @param pointSize:字号大小
 *  @return 字体类型
 */
+ (UIFont *) appHelvetiacNeueFontOfSize:(CGFloat) pointSize;

@end
