//
//  KJSizeOfString.h
//  KuaiJing
//
//  Created by mac  on 16/5/9.
//  Copyright © 2016年 北京合力光年信息科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KJSizeOfString : NSObject


+(KJSizeOfString *)sizeOfString;

//根据文字最大高度 返回宽度
+(CGSize)sizeWWithText:(NSString *)text font:(UIFont *)font maxH:(CGFloat)maxH;


//根据文字最大宽度 返回高度
+(CGSize)sizeHWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW;

@end
