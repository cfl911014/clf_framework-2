//
//  TimeClass.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/7/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "TimeClass.h"

@implementation TimeClass

+(NSString*)getStartDateToDate:(int)differ withDate:(NSDate*)date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:0];
    [adcomps setMonth:0];
    [adcomps setDay:-differ];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:date options:0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:newdate];
    return destDateString;
}

+(NSString*)getCurrentDate:(NSString *)format {
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:format];
    NSString *locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}
+ (NSString *)currentDateDescription

{
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    
    NSString *fixString = [dateFormatter stringFromDate:[NSDate date]];
    
    
    return fixString;
    
}
+(NSDate*)getDateFromString:(NSString*)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:dateString];
    NSLog(@"%@", date);
    return date;
}
+(NSString*)getStringFromDate:(NSDate*)date {
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    NSString *locationString=[dateformatter stringFromDate:date];
    return locationString;
}
+(NSDateComponents*)getDateComponentFromDate:(NSDate*)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    return dateComponent;
}





@end
