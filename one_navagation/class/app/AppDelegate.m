//
//  AppDelegate.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AppDelegate.h"

#import "KJFirstUserViewController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>


@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //判断第一次使用app或更新版本 创建window
    [self setUpAppWindow];
    
    //键盘
    [self keyBoard];
    
    return YES;
}

#pragma mark - keyboard
-(void)keyBoard{
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager]; // 获取类库的单例变量
    
    keyboardManager.enable = YES; // 控制整个功能是否启用
    
    keyboardManager.shouldResignOnTouchOutside = YES; // 控制点击背景是否收起键盘
    
    keyboardManager.shouldToolbarUsesTextFieldTintColor = YES; // 控制键盘上的工具条文字颜色是否用户自定义
    
    keyboardManager.toolbarManageBehaviour = IQAutoToolbarBySubviews; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    
    keyboardManager.enableAutoToolbar = YES; // 控制是否显示键盘上的工具条
    
    keyboardManager.shouldShowTextFieldPlaceholder = YES; // 是否显示占位文字
    
    keyboardManager.placeholderFont = [UIFont boldSystemFontOfSize:12]; // 设置占位文字的字体
    
    keyboardManager.keyboardDistanceFromTextField = 10.0f; // 输入框距离键盘的距离
}



#pragma mark====== 创建window ======
-(void)setUpAppWindow
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //获得上次登陆与本次登陆的版本号
    NSString *key=@"CFBundleVersion";
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *lastVersion=[defaults stringForKey:key];
    NSString *currentVersion=[NSBundle mainBundle].infoDictionary[key];
    
    //第一次使用或者版本更新
    if ([currentVersion isEqualToString:lastVersion]==NO){
        [UIApplication sharedApplication].statusBarHidden = YES;
        self.window.rootViewController=[[KJFirstUserViewController alloc]init];
    } else {
        
        self.window.rootViewController = [[RootTabbarController alloc]init];
        
    }
    //报存本次登陆的版本号
    [defaults setObject:currentVersion forKey:key];
    [defaults synchronize];
    
    [self.window makeKeyAndVisible];
}



- (void)applicationWillResignActive:(UIApplication *)application {
  
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
   
}

@end
