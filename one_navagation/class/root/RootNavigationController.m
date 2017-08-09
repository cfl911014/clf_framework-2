//
//  RootNavigationController.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RootNavigationController.h"

@implementation RootNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //[self.navigationBar setBarTintColor:[UIColor redColor]];
    //[self.navigationBar setBackgroundImage:[UIImage imageNamed:@"kj_1"] forBarMetrics:UIBarMetricsDefault];
    
    
    __block __weak RootNavigationController *weakSelf = self;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
    
}

#pragma mark - 封装返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //返回按钮的封装
    if (self.viewControllers.count>0) {
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;

#warning +返回按钮image
        UIImage *image=[UIImage imageNamed:@"kj_1"];
        image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame=CGRectMake(0, 5, 25, 25);
        [btn addTarget:self action:@selector(popNavigation) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:image forState:UIControlStateNormal];
        viewController.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:btn];
    }
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        self.interactivePopGestureRecognizer.enabled = NO;
    [super pushViewController:viewController animated:animated];
    
    
}
- (void)popNavigation {
    [self popViewControllerAnimated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    // Enable the gesture again once the new controller is shown
    //保证最底层不能被推出;左滑手势,对底层NO
    if ( self.viewControllers.count > 1 ) {
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
            self.interactivePopGestureRecognizer.enabled = YES;
    }
    else{
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
            self.interactivePopGestureRecognizer.enabled = NO;
    }
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
