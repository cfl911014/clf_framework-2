//
//  ViewControllers6.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/15.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers6.h"
#import "YYIHttpDownloadHelp.h"
#define kImageUrl @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1503387651&di=cf6fdffd556eeb44ecb9e8deaf227222&imgtype=jpg&er=1&src=http%3A%2F%2Fimg2.niutuku.com%2Fdesk%2F1208%2F1033%2Fbizhi-1033-15974.jpg"

@interface ViewControllers6 ()

@property(nonatomic,strong)UIImageView *imageV;

@end

@implementation ViewControllers6

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableData *data = [NSMutableData new];
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    NSString *p = [cachePath stringByAppendingPathComponent:@"aa"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        [[YYIHttpDownloadHelp sharedYYIHttpDownloadHelp] downLoadFileWithUrlString:kImageUrl resumData:nil saveFilePath:@"aa" progress:^(CGFloat progess) {
            
            if (progess>0.5) {
                
                [[YYIHttpDownloadHelp sharedYYIHttpDownloadHelp].downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
                    NSData *data1 = [MyDefaults readKey:kRESUMEDATAKEY];
                    
                    
//                    NSLog(@"%lu",data1.length);
//                    
//                    YYImageDecoder *decoder = [[YYImageDecoder alloc] initWithScale:[UIScreen mainScreen].scale];
//                    [decoder updateData:data1 final:NO];
//                    
//                    
//                    //空
//                    YYImageFrame *frame = [decoder frameAtIndex:0 decodeForDisplay:YES];
//                    
//                    
//                    UIImage *image = frame.image;
//                    
//                    
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        self.imageV.image = image;
//                    });
                    
                  
                    YYImageDecoder *decoder = [[YYImageDecoder alloc] initWithScale:2.0];
                    [data appendData:data1];
                    [decoder updateData:data final:NO];
                    if (decoder.frameCount > 0) {
                        UIImage *image = [decoder frameAtIndex:0 decodeForDisplay:YES].image;
                    }
                    //                    }
                    [decoder updateData:data final:YES];
                    UIImage *image = [decoder frameAtIndex:0 decodeForDisplay:YES].image;
                    NSLog(@"%@",image);
                
                }];
            }
        } completion:^{
            
            NSData *data = [NSData dataWithContentsOfFile:p];
            UIImage *image = [UIImage imageWithData:data];
            NSLog(@"%@",image);
            
            
        }];
    });
    
 }


-(UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc]init];
        _imageV.frame = CGRectMake(100, 100, 300, 500);
        _imageV.backgroundColor = [UIColor redColor];
        _imageV.contentMode = UIViewContentModeScaleAspectFill;
        _imageV.clipsToBounds = YES;
        [self.view addSubview:_imageV];
    }
    return _imageV;
}

@end
