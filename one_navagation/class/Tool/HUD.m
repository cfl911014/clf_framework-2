//
//  HUD.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HUD.h"
#import "MBProgressHUD.h"
#import "WBLoadingView.h"

#define BG_VIEW_TAG 101

@interface HUD ()<MBProgressHUDDelegate>

@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation HUD

+ (HUD *)sharedHUD
{
    static HUD *shared = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shared = [[self alloc] init];
    });
    return shared;
}


#pragma mark - 基本功能

- (void)showHUD:(UIView *)superview message:(NSString *)message
{
    _hud = [MBProgressHUD showHUDAddedTo:superview animated:YES];
    _hud.labelText = message?message:@"加载中...";
    _hud.dimBackground = NO;
}

- (void)hideHUD
{
    [_hud hide:YES];
}




#pragma mark - 加载功能

- (void)showLoading:(UIView *)superview dimBackground:(BOOL)dimBackground
{
    [self hide];
    _hud = [MBProgressHUD showHUDAddedTo:superview animated:YES];
    WBLoadingView *loadingView = [[WBLoadingView alloc] initWithFrame:CGRectMake(0, 0, 35, 45)];
    if (dimBackground) {
        UIView *bgView = [[UIView alloc] initWithFrame:_hud.bounds];
        bgView.tag = BG_VIEW_TAG;
#warning ＋bgImage_loading
        bgView.layer.contents = (id)[UIImage imageNamed:@"background.png"].CGImage;
        bgView.alpha = 0.95f;
        [_hud insertSubview:bgView atIndex:0];
    }
    _hud.color = [UIColor clearColor];
    _hud.mode = MBProgressHUDModeCustomView;
    _hud.customView = loadingView;
    _hud.labelText = @"L O A D I N G . . .";
    _hud.labelColor = [UIColor colorWithHexString:@"#44C0FE"];
}


- (void)showSuccess
{
    _hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    _hud.mode = MBProgressHUDModeCustomView;
    _hud.labelText = @"加载成功";
    [_hud hide:YES afterDelay:1.0];
}

- (void)showFailure
{
    _hud.mode = MBProgressHUDModeText;
    _hud.labelText = @"数据加载失败，请稍后重试";
    [_hud hide:YES afterDelay:1.0];
}

- (void)hide
{
    UIView *firstView = [_hud.subviews objectAtIndex:0];
    if (firstView && firstView.tag == BG_VIEW_TAG) {
        [firstView removeFromSuperview];
    }
    [_hud hide:YES];
}
@end
