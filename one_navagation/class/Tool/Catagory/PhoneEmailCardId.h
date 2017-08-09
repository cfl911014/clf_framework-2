//
//  PhoneEmailCardId.h
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhoneEmailCardId : NSObject

+ (BOOL)isPhone:(NSString *)phone;

+ (BOOL)isEmail:(NSString *)email;


/**
 省份证号码验证

 @param value 身份证号码
 @return 是否正确
 */
+ (BOOL)validateIDCardNumber:(NSString *)value;


/**
 拨打电话
 
 @param phoneStr phoneNumber
 @param selfvc Controller
 */
+ (void)callPhoneStr:(NSString*)phoneStr withVC:(UIViewController *)selfvc;

@end
