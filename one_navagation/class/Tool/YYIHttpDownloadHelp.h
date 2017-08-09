//
//  YYIHttpDownloadHelp.h
//  one_navagation
//
//  Created by mac  on 16/10/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kRESUMEDATAKEY  @"resumeData"


@interface YYIHttpDownloadHelp : NSObject

singleton_h(YYIHttpDownloadHelp)

typedef void (^DownloadProgress)(CGFloat progess);
typedef void (^DownloadCompletion)(void);
@property (nonatomic,copy)DownloadProgress progress;
@property (nonatomic,copy)DownloadCompletion completion;

/**

 */
- (void) downLoadFileWithUrlString:(NSString *)urlString resumData:(NSData *)resumeData saveFilePath:(NSString *)filePath progress:(DownloadProgress)progress completion:(DownloadCompletion)completion;


/**  暂停下载任务 (要注意这个方法的调用) */
- (void)suspendDownloading;

/**  将记录移除 */
- (void)removeResumeData;
@end
