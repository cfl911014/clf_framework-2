//
//  ReactiveCocoaViewController0.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/25.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ReactiveCocoaViewController0.h"

@interface ReactiveCocoaViewController0 ()

@end

@implementation ReactiveCocoaViewController0

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 信号量
    RACSignal *viewdidAppear = [self rac_signalForSelector:@selector(viewDidAppear:)];
    [viewdidAppear subscribeNext:^(id x) {
        
    }];
    [viewdidAppear subscribeError:^(NSError *error) {
        
    }];
    [viewdidAppear subscribeCompleted:^{
        
    }];
    
    
    //2. RACCommand UIKit绑定
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, 100, 100);
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    
    [btn setRac_command:[[RACCommand alloc]initWithEnabled:nil signalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSLog(@"Click");
            //可进行异步操作,当一步操作完成后按钮回复可点击状态
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [subscriber sendNext:[[NSDate date] description]];
                [subscriber sendCompleted];
            });
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }]];
    //二次订阅
    [[[btn rac_command] executionSignals] subscribeNext:^(id x) {
        [x subscribeNext:^(id x) {
            //输出的是上一个订阅的时间戳
            NSLog(@"%@",x);
        }];
    }];
    
    

}
@end
