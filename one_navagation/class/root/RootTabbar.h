//
//  RootTabbar.h
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RootTabbarDelegate <NSObject>

- (void) clickPlusButton;

@end

@interface RootTabbar : UITabBar

@property (nonatomic,strong)UIButton *plusBtn;

@property(nonatomic,weak) id<RootTabbarDelegate>nBarDelegate;

@end


/*
 //初始化tabarItem中添加
 KJTabbar *tabbar = [[RootTabbar alloc]init];
 [self setValue:tabbar forKey:@"tabBar"];
 [self.view bringSubviewToFront:tabbar.plusBtn];
 */