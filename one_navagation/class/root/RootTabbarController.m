//
//  RootTabbarController.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RootTabbarController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "TabbleViewController.h"
#import "ViewController4.h"
#import "RootTabbar.h"
#import "RootNavigationController.h"

@interface RootTabbarController ()<UITabBarDelegate>

@end

@implementation RootTabbarController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.navigationItem.hidesBackButton = YES;
 
    [self _initTabbarView];
}


#pragma mark - 初始化tabbar

- (void)_initTabbarView
{
    //背景
    //[self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar"]];
    self.tabBar.tintColor = [UIColor redColor];

    ViewController1 *main = [[ViewController1 alloc] init];
    ViewController2 *messageVC = [[ViewController2 alloc] init];
    TabbleViewController *marketVC = [[TabbleViewController alloc] init];
    ViewController4 *settingVC = [[ViewController4 alloc] init];
    NSArray *controllers = @[main,messageVC, marketVC,settingVC];
    
    NSArray *titles = @[@"首页",@"项目",@"管理",@"我的"];
    for (int i = 0; i<4; i++) {
        [self addChildVc:controllers[i]
                         image:[NSString stringWithFormat:@"kj_%d",i+1]
                   selectImage:[NSString stringWithFormat:@"kj_%d_1",i+1]
                         title:titles[i]];
    }
    
//    RootTabbar *tabbar = [[RootTabbar alloc]init];
//    [self setValue:tabbar forKey:@"tabBar"];
//    [self.view bringSubviewToFront:tabbar.plusBtn];
    
}

-(void)addChildVc:(UIViewController *)childVc image:(NSString*)image selectImage:(NSString*)selectImage title:(NSString *)title{
    
    childVc.title = title;
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    RootNavigationController *nav = [[RootNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}


//点击加号按钮
- (void) clickPlusButton
{
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
     [self tabBarButtonClick:[self getTabBarButton]];
    
    if ([viewController isKindOfClass:ViewController4.class]) {
        
    }
    else{

    }
}

#pragma mark - 点击动画
- (UIControl *)getTabBarButton{
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    return tabBarButton;
}
- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据自己需求改动
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            //添加动画
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}


@end
