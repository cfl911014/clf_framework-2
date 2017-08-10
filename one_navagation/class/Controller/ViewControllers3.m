//
//  ViewControllers3.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers3.h"
#import "DrawRectView.h"
@interface ViewControllers3 ()

@property(nonatomic,strong)DrawRectView * drawRectView;

@end

@implementation ViewControllers3

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.drawRectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
}

-(DrawRectView *)drawRectView{
    if (!_drawRectView) {
        _drawRectView = [[DrawRectView alloc]init];
        [self.view addSubview:_drawRectView];
    }
    return _drawRectView;
}



@end
