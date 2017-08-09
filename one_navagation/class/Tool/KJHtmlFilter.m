//
//  KJHtmlFilter.m
//  
//
//  Created by mac  on 15/11/19.
//
//

#import "KJHtmlFilter.h"

@implementation KJHtmlFilter

+(NSString *)flattenHTML:(NSString *)html {
    NSScanner *theScanner;
    NSString *text = @"";
    theScanner = [NSScanner scannerWithString:html];
    while ([theScanner isAtEnd] == NO) {
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        [theScanner scanUpToString:@">" intoString:&text] ;
        html = [html stringByReplacingOccurrencesOfString:
                [NSString stringWithFormat:@"%@>", text]
                                               withString:@"\n"];
        html = [html stringByReplacingOccurrencesOfString:
                [NSString stringWithFormat:@"&nbsp;"]
                                               withString:@" "];
    }
    html =[self trimNewline:html];
    html =[self trimWhitespace:html];
    return html;
}

+(NSString *)flattenHTMLDelete:(NSString *)html {
    NSScanner *theScanner;
    NSString *text = @"";
    theScanner = [NSScanner scannerWithString:html];
    while ([theScanner isAtEnd] == NO) {
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        [theScanner scanUpToString:@">" intoString:&text] ;
        html = [html stringByReplacingOccurrencesOfString:
                [NSString stringWithFormat:@"%@>", text]
                                               withString:@""];
        html = [html stringByReplacingOccurrencesOfString:
                [NSString stringWithFormat:@"&nbsp;"]
                                               withString:@""];
    }
    html = [self trimWhitespaceAndNewline:html];
    html = [self replaceString:html];
    return html;
}



+ (NSString *)trim:(NSString *)val trimCharacterSet:(NSCharacterSet *)characterSet {
         NSString *returnVal = @"";
         if (val) {
                returnVal = [val stringByTrimmingCharactersInSet:characterSet];
           }
      return returnVal;
 }
 + (NSString *)trimWhitespace:(NSString *)val {
     return [self trim:val trimCharacterSet:[NSCharacterSet whitespaceCharacterSet]]; //去掉前后空格
 }
 + (NSString *)trimNewline:(NSString *)val {
     return [self trim:val trimCharacterSet:[NSCharacterSet newlineCharacterSet]]; //去掉前后回车符
}
 + (NSString *)trimWhitespaceAndNewline:(NSString *)val {
      return [self trim:val trimCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //去掉前后空格和回车符
 }



/**  去掉字符串中间的空格 */
+ (NSString *)replaceString:(NSString *)content
{
    NSScanner *scanner = [[NSScanner alloc] initWithString:content];
    [scanner setCharactersToBeSkipped:nil];
    NSMutableString *result = [[NSMutableString alloc] init];
    NSString *temp;
    NSCharacterSet *newLineAndWhitespaceCharacters = [ NSCharacterSet newlineCharacterSet];
    // Scan
    while (![scanner isAtEnd]) {
        
        // Get non new line or whitespace characters
        temp = nil;
        [scanner scanUpToCharactersFromSet:newLineAndWhitespaceCharacters intoString:&temp];
        if (temp) [result appendString:temp];
        
        // Replace with a space
        if ([scanner scanCharactersFromSet:newLineAndWhitespaceCharacters intoString:NULL]) {
            if (result.length > 0 && ![scanner isAtEnd]) // Dont append space to beginning or end of result
                [result appendString:@"\n        "];
        }
    }
    
    NSString *retString = [NSString stringWithString:result];
   
    return retString;
   
}

@end
