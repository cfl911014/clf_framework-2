//
//  ReactiveCocoaViewController1.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/25.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ReactiveCocoaViewController1.h"

@interface ReactiveCocoaViewController1 ()


@end

@implementation ReactiveCocoaViewController1

- (void)viewDidLoad {
    [super viewDidLoad];

    UITextField *userName = [[UITextField alloc]initWithFrame:CGRectMake(0, 100, 200, 40)];
    userName.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:userName];
    UITextField *passWord = [[UITextField alloc]initWithFrame:CGRectMake(0, 150, 200, 40)];
    passWord.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:passWord];
    UIButton *login = [UIButton buttonWithType:UIButtonTypeCustom];
    login.frame = CGRectMake(0, 200, 100, 40);
    login.backgroundColor = [UIColor redColor];
    [login setTitle:@"可点击" forState:UIControlStateHighlighted];
    [login setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:login];
    
    
    
    RACSignal *ennableSignal = [[RACSignal combineLatest:@[userName.rac_textSignal,passWord.rac_textSignal]] map:^id(id value) {
        return ([value[0] length]>0&&[value[1] length]>0)?@[@(YES),[UIColor redColor]]:@[@(NO),[UIColor grayColor]];
    }];
    //第一种写法
    [ennableSignal subscribeNext:^(id x) {
        login.enabled = x[0];
        login.backgroundColor =x[1];
    }];
    //第二种写法
    RAC(login,enabled) = [ennableSignal map:^id(id value) {
        return value[0];
    }];
    RAC(login,backgroundColor) = [ennableSignal map:^id(id value) {
        return value[1];
    }];
    
    
//    RACSignal *btnColor = [[RACSignal combineLatest:@[userName.rac_textSignal,passWord.rac_textSignal]] map:^id(id value) {
//        return ([value[0] length]>0&&[value[1] length]>0)?[UIColor redColor]:[UIColor grayColor];
//    }];
//    
//    [RACSignal combineLatest:@[] reduce:^id{
//        return @(1);
//    }];
//    
   // RAC(login,enabled) = ennableSignal[0];
   // RAC(login,backgroundColor) = btnColor;
//
    
//    login.rac_command = [[RACCommand alloc]initWithEnabled:ennableSignal signalBlock:^RACSignal *(id input) {
//        return [RACSignal empty];
//    }];
    
   
    
    

}

@end
