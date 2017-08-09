//
//  KJSizeOfString.m
//  KuaiJing
//
//  Created by mac  on 16/5/9.
//  Copyright © 2016年 北京合力光年信息科技有限公司. All rights reserved.
//

#import "KJSizeOfString.h"

@implementation KJSizeOfString

+(KJSizeOfString *)sizeOfString{
    return [[self alloc] init];
}


+(CGSize)sizeWWithText:(NSString *)text font:(UIFont *)font maxH:(CGFloat)maxH
{
    NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
    attrs[NSFontAttributeName]=font;
    
    CGSize maxSize=CGSizeMake(MAXFLOAT, maxH);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


+(CGSize)sizeHWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
    attrs[NSFontAttributeName]=font;
    
    CGSize maxSize=CGSizeMake(maxW,MAXFLOAT);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


@end
