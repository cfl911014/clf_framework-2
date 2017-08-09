//
//  CalculateUtil.m
//  Picasso
//
//  Created by 雷华 on 15/12/16.
//  Copyright © 2015年 张玲玉. All rights reserved.
//

#import "CalculateUtil.h"

@implementation CalculateUtil


+(NSString*)getCurrentDate {
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm:dd"];
    NSString *locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}


+(NSString*)getStartDateToDate:(int)differ withDate:(NSDate*)date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:0];
    [adcomps setMonth:0];
    [adcomps setDay:-differ];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:date options:0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:dd"];
    NSString *destDateString = [dateFormatter stringFromDate:newdate];
    return destDateString;
}


@end
