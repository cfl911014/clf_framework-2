//
//  BlockUse.h
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockUse : NSObject

//1.封装到方法中
typedef void(^successBlock)(NSString * str);
-(void)requstURL:(NSString *)url back:(successBlock)success;



@end
