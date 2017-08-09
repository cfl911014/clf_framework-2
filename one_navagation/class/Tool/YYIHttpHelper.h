//
//  YYIDownLoadManager.h
//  GoldWallet
//
//  Created by 丁玉松 on 15/5/13.
//  Copyright (c) 2015年 Beijing Yingyan Internet Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#define SuccessCode(code) ([(code) isEqualToString:@"1"])

typedef void (^CompletionHandler)(id result, NSString *code, NSString *msg);
typedef void (^failRequst)();
typedef void (^DownloadCompletion)(void);


@interface YYIHttpHelper : NSObject

+ (id)sharedInstace;

/** get请求 */
- (void)getRequstWithMethod:(NSString *)method params:(NSDictionary *)dict handler:(CompletionHandler)handler fail:(failRequst)fail;

/** post请求 */
- (void)requestWithMethod:(NSString *)method params:(NSDictionary *)params handler:(CompletionHandler)handler fail:(failRequst)fail;

/** post上传图片及其语音(参数内部已经处理)  数组元素:NSData */
- (void)requestUpWithMethod:(NSString *)method
                     params:(NSDictionary *)param
                  pathArray:(NSArray*)paths
                  audioData:(NSData *)audioData
                    handler:(CompletionHandler)handler
                       fail:(failRequst)fail;

/** 下载文件 */
+ (void)download:(NSString *)urlStr saveTo:(NSString *)folderPath  handler:(DownloadCompletion)handler;

@end
