//
//  TimeClass.h
//  one_navagation
//
//  Created by 崔付亮 on 2017/7/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeClass : NSObject

/**
 *  获取当前日期
 *  format @"yyyy-MM-dd"
 *  @return 当前日期
 */
+(NSString*)getCurrentDate:(NSString *)format;


/**
 *  获取距离指定的日期的指定时间范围的日期
 *
 *  @param differ 距指定日期多少天
 *  @param date   指定日期
 *
 *  @return 所需的日期
 */
+(NSString*)getStartDateToDate:(int)differ withDate:(NSDate*)date;
+(NSDate*)getDateFromString:(NSString*)dateString;
+(NSString*)getStringFromDate:(NSDate*)date;
+ (NSString *)currentDateDescription;
+(NSDateComponents*)getDateComponentFromDate:(NSDate*)date;

@end
