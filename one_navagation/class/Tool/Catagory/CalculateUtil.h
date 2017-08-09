//
//  CalculateUtil.h
//  Picasso
//
//  Created by 雷华 on 15/12/16.
//  Copyright © 2015年 张玲玉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateUtil : NSObject

/**
 *  获取当前日期
 *
 *  @return 当前日期
 */
+(NSString*)getCurrentDate;


/**
 *  获取距离指定的日期的指定时间范围的日期
 *
 *  @param differ 距指定日期多少天
 *  @param date   指定日期
 *
 *  @return 所需的日期
 */
+(NSString*)getStartDateToDate:(int)differ withDate:(NSDate*)date;


@end
