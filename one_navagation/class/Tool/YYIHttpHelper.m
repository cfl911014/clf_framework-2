//
//  YYIDownLoadManager.m
//  GoldWallet
//
//  Created by 丁玉松 on 15/5/13.
//  Copyright (c) 2015年 Beijing Yingyan Internet Co., Ltd. All rights reserved.
//

#import "YYIHttpHelper.h"
#import "NSString+MD5.h"
#import <AFNetworking/AFNetworking.h>
NSString *kkGNETWORKFAILED =     @"网络不给力，请稍后再试";             //9001
NSString *kkGSERVERFAILED =      @"网络不给力，请稍后再试";             //9002
NSString *kkGSERVERTIMEOUT =     @"网络不给力，请稍后再试";             //9003
NSString *kkGSERVERDATAERROR =   @"服务器返回数据错误，长度为0";       //9004
NSString *kkGSERVERMD5ERROR =    @"服务器返回的数据错误";             //9005


#define timeoutInterva 20


@implementation YYIHttpHelper

/*单例*/
+(id)sharedInstace
{
    static YYIHttpHelper *httpManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpManager = [[YYIHttpHelper alloc]init];
    });
    return httpManager;
}

#pragma mark - get请求
/** get请求 */
-(void)getRequstWithMethod:(NSString *)method params:(NSDictionary *)dict handler:(CompletionHandler)handler fail:(failRequst)fail
{
    if (![self checkNetwork]) {
        handler(nil, @"9001", kkGNETWORKFAILED);
        return;
    }
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain", nil];
    manager.requestSerializer.timeoutInterval = timeoutInterva;
    
    
    NSString * urlSting = [NSString stringWithFormat:@"%@%@?",API_URL,method];
    for (NSString *key in [dict allKeys]) {
        NSString *str = [NSString stringWithFormat:@"%@=%@&",key,dict[key]];
        [urlSting stringByAppendingString:str];
    }
    urlSting = [urlSting substringToIndex:urlSting.length - 1];
    
    
    [manager GET:urlSting parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //调用success的block
        [self parseObject:responseObject method:nil handler:handler];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         fail();
    }];
    
}

#pragma mark - post请求
//post 请求 延时20
-(void)requestWithMethod:(NSString *)method params:(NSDictionary *)params handler:(CompletionHandler)handler fail:(failRequst)fail
{
    
    if (![self checkNetwork]) {
        handler(nil, @"9001", kkGNETWORKFAILED);
        return;
    }
    
    //拼接请求体
    NSMutableDictionary *requestParms = [self postParams:params];
    
    //添加一个参与(签名验证)
    [requestParms setValue:[self md5string:requestParms] forKey:@"chk"];
    
    
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain", nil];
    manager.requestSerializer.timeoutInterval = timeoutInterva;
    
    NSString *naurl = [NSString stringWithFormat:@"%@%@",API_URL,method];
    NSLog(@"\n method：%@\n param:%@\n url:%@ \n",method,requestParms,naurl);
    
     [manager POST:naurl parameters:requestParms progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self parseObject:responseObject method:method handler:handler];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}


#pragma mark - post 上传 延时20  paths未data数组  audioData语音文件data
-(void)requestUpWithMethod:(NSString *)method params:(NSDictionary *)param  pathArray:(NSArray*)paths audioData:(NSData *)audioData handler:(CompletionHandler)handler fail:(failRequst)fail
{
    if (![self checkNetwork]) {
        
        handler(nil, @"9001", kkGNETWORKFAILED);
        return;
    }
    
    //拼接请求体(添加版本号信息)
    NSMutableDictionary *requestParms = [self postParams:param];
    
    //添加一个参与(添加签名验证)
    [requestParms setValue:[self md5string:requestParms] forKey:@"chk"];
    
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain", nil];
    manager.requestSerializer.timeoutInterval = timeoutInterva;
    
    NSString *naurl = [NSString stringWithFormat:@"%@%@",API_URL,method];
    NSLog(@"\n method：%@\n param:%@\n url:%@ \n",method,requestParms,naurl);
    
    [manager POST:naurl parameters:requestParms constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        //上传图片文件
        for(int i=0;i<paths.count;i++){
            // 设置时间格式
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmssfffff";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@%d.jpg",str,i];
            [formData appendPartWithFileData:paths[i] name:[NSString stringWithFormat:@"file%d",i+1] fileName:fileName mimeType:@"image/jpeg"];
        }
        
        //上传语音文件
        if (audioData) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmssfffff";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            [formData appendPartWithFileData:audioData name:@"file0" fileName:[NSString stringWithFormat:@"%@.mp3",str] mimeType:@"audio/mpeg"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self parseObject:responseObject method:method handler:handler];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail();
    }];
    
}


/** 拼接请求体 信息 */
-(NSMutableDictionary *)postParams:(NSDictionary *)param
{
    NSMutableDictionary *postDict = [NSMutableDictionary dictionaryWithDictionary:param];
    [postDict setObject:@"iOS" forKey:@"apptype"];
    [postDict setObject:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forKey:@"version"];
    return postDict;
}


/** 签名验证的字符串 */
-(NSString *)md5string:(NSDictionary *)dict
{
    //创建一个字符串
    NSMutableString *md5str = [[NSMutableString alloc]init];
    [md5str appendString:@"kuaijingapi"];
    
    //获取字典的所有键
    NSArray *keys = [dict allKeys];
    
    //对字典的键排序存入新的数组
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return  [obj1 compare:obj2 options:NSCaseInsensitiveSearch];
    }];
    
    //将排序后的键值分别拼接到字符串
    for (NSString *key in sortedArray) {
        [md5str appendString:key];
        
        NSString *velue  = [dict objectForKey:key];
        NSString *velue1 = [velue  stringByReplacingOccurrencesOfString:@"+" withString:@" "];
        NSString *velue2 = [velue1 stringByReplacingOccurrencesOfString:@"'" withString:@"‘"];
        
        [md5str appendString:velue2];
    }
    
    [md5str appendString:@"kuaijingapi"];
    
    NSLog(@"%@",md5str);
    
    //返回加密后的字符串
    return [md5str stringFromMD5];
}



//返回数据处理
-(void)parseObject:(NSDictionary *)responseDict method:(NSString *)method handler:(CompletionHandler)handler
{
    
    NSLog(@"\n method:%@ \n responseDict:%@",method,responseDict);
    id data = [responseDict objectForKey:@"data"];
    NSString *code = [NSString stringWithFormat:@"%@",[responseDict objectForKey:@"code"]];
    NSString *msg = [responseDict objectForKey:@"msg"];
    
    if (code || msg) {
        
        //"9001" 没有网络
        if ([code isEqualToString:@"9001"]){
            [[Tips sharedtips]showTips:@"您还未链接网络"];
            return;
        }
        
        handler(data, code, msg);
    } else {
        handler(nil, @"9004", kkGSERVERDATAERROR);
    }
    
}

//网络监测
- (BOOL)checkNetwork
{
    AFNetworkReachabilityManager *reachability = [AFNetworkReachabilityManager sharedManager];
    AFNetworkReachabilityStatus status = reachability.networkReachabilityStatus;
    BOOL isOK = YES;
    switch (status) {
        case 0:
            isOK = NO;
            break;
        default:
            break;
    }
//    AFNetworkReachabilityStatusUnknown          = -1,
//    AFNetworkReachabilityStatusNotReachable     = 0,
//    AFNetworkReachabilityStatusReachableViaWWAN = 1,
//    AFNetworkReachabilityStatusReachableViaWiFi = 2,
    
    return isOK;
}




+ (void)download:(NSString *)urlStr saveTo:(NSString *)folderPath handler:(DownloadCompletion)handler {
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if ([response expectedContentLength] != 0) {
            [data writeToFile:folderPath atomically:YES];
            handler();
        }
    }];
}








@end
