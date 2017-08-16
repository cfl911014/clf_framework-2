//
//  YYIHttpDownloadHelp.m
//  one_navagation
//
//  Created by mac  on 16/10/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "YYIHttpDownloadHelp.h"
#import "MyDefaults.h"



@interface YYIHttpDownloadHelp()<NSURLSessionDataDelegate>



/** NSURLSession */
@property (nonatomic, strong) NSURLSession *session;

@property (nonatomic, copy) NSString *savePathString;

@end

@implementation YYIHttpDownloadHelp

singleton_m(YYIHttpDownloadHelp)

- (NSURLSession *)session {
    if (!_session) {
        // 创建一个session的配置对象(一般用默认的即可)
        NSURLSessionConfiguration *cfg = [NSURLSessionConfiguration defaultSessionConfiguration];
        // 用这个配置对象创建一个session
        _session = [NSURLSession sessionWithConfiguration:cfg delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}


/** 开始下载任务 */
- (void)startDownloadingWithUrlString:(NSString *)urlString {
    // 创建下载任务并监听
    NSURL *url = [NSURL URLWithString:urlString];
    self.downloadTask = [self.session downloadTaskWithURL:url];
    // 开启下载任务
    [self.downloadTask resume];
}

/**  暂停下载任务 */
- (void)suspendDownloading {
    __weak typeof(self) weakSelf = self;
    // 取消下载任务, 返回一个resumeData(记录着下载请求需要的信息,可以利用这个重启下载任务)
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        [MyDefaults saveValue:resumeData forKey:kRESUMEDATAKEY];   // 保存这个恢复信息
        weakSelf.downloadTask = nil;        // 下载任务置为空
    }];
}

/** 恢复下载任务 */
- (void)resumeDownloading:(NSData *)resumeData{
    // 使用resumeData开启恢复下载的任务
    self.downloadTask = [self.session downloadTaskWithResumeData:resumeData];
    // 恢复下载
    [self.downloadTask resume];
}




/**
 *  开始下载时调用
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes {
    NSLog(@"恢复下载%lld %lld",fileOffset,expectedTotalBytes);
}

/**
 *  每当下载完（写完）一部分时就会调用（可能会被调用多次）
 *
 *  @param bytesWritten              这次调用写了多少
 *  @param totalBytesWritten         累计写了多少长度到沙盒中了
 *  @param totalBytesExpectedToWrite 文件的总长度
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    NSLog(@"下载中%f",1.0 * totalBytesWritten/totalBytesExpectedToWrite);
    self.progress(1.0 * totalBytesWritten/totalBytesExpectedToWrite);
}

/**
 *  下载完毕后调用
 *  @param location     临时文件的路径（下载好的文件路径）
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSLog(@"下载完毕%@",location);
    
    //设置下载路径，通过沙盒获取缓存地址，最后返回NSURL对象
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [cachesPath stringByAppendingPathComponent:self.savePathString];
    NSLog(@"%@",path);
    //保存到path下
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    [fileMgr moveItemAtPath:location.path toPath:path error:nil];
    self.completion();
    [self removeResumeData];
}




//#pragma mark - 网络监测
//- (void)synchronizeFileOperation {
//    // 获得网络监控的管理者
//    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
//    
//    if (mgr.reachableViaWiFi) {     // 如果当前是WiFi网络状态, 开始下载
//        NSLog(@"WIFI");
//#warning 开始下载
//        //[self startDownloading:self.syncFile.downloadUrl];
//    }
//    
//    // 设置网络状态改变时的处理
//    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {   // 当网络状态改变了, 就会调用这个block
//        
//        switch (status) {
//            case AFNetworkReachabilityStatusUnknown: // 未知网络
//                NSLog(@"未知网络");
//                
//                if (self.session) {     // 如果 self.session 有值,说明开启过下载任务; 否则 self.session 为 nil
//                    [self suspendDownloading];    // 暂停下载任务
//                }
//                break;
//                
//            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
//                NSLog(@"没有网络(断网)");
//                
//                if (self.session) {
//                    [self suspendDownloading];    // 暂停下载任务
//                }
//                break;
//                
//            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
//                NSLog(@"手机自带网络");
//                
//                if (self.session) {
//                    [self suspendDownloading];    // 暂停下载任务
//                }
//                break;
//                
//            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
//                NSLog(@"WIFI");
//                
//                if (self.downloadTask == nil) {    // 如果下载任务为空
//                    
////                    if (self.resumeData) {  // 如果resumeData不为空, 说明已下载过, 恢复下载任务
//#warning 开始下载
////                        [self resumeDownloading];
//                        
////                    } else {                // 如果resumeData为空, 说明从未下载过, 开始下载任务
//#warning 开始下载
//                        //[self startDownloading:self.syncFile.downloadUrl];
////                    }
//                }
////
//                break;
//                
//            default:
//                break;
//        }
//    }];
//    // 开始监控
//    [mgr startMonitoring];
//}




- (void) downLoadFileWithUrlString:(NSString *)urlString resumData:(NSData *)resumeData saveFilePath:(NSString *)filePath progress:(DownloadProgress)progress completion:(DownloadCompletion)completion{
    self.savePathString = filePath;
    if (resumeData) {
        [self resumeDownloading:resumeData];
    }
    else{
        [self startDownloadingWithUrlString:urlString];
    }
    self.progress = progress;
    self.completion = completion;
}

- (void)removeResumeData
{
    [MyDefaults removeKey:kRESUMEDATAKEY];
}



@end



/*
 1.手动点击暂停/下载
 2.网络环境发生变化
 3.关闭app
 */


