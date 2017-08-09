//
//  KJHtmlFilter.h
//  
//
//  Created by mac  on 15/11/19.
//
//

#import <Foundation/Foundation.h>

@interface KJHtmlFilter : NSObject

//将标签转换成相应的 空格或回车
+(NSString *)flattenHTML:(NSString *)html ;

//将标签直接去掉
+(NSString *)flattenHTMLDelete:(NSString *)html ;

//去掉前后空格
+ (NSString *)trimWhitespace:(NSString *)val;

//去掉前后回车符
+ (NSString *)trimNewline:(NSString *)val;

//去掉前后空格和回车符
+ (NSString *)trimWhitespaceAndNewline:(NSString *)val;

//去掉字符串中间的空格 
+ (NSString *)replaceString:(NSString *)content;

@end
