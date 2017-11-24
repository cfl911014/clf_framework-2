//
//  ViewControllers13.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers13.h"
#import "YSLoopBanner.h"
@interface ViewControllers13 ()

@end

@implementation ViewControllers13

- (void)viewDidLoad {
    [super viewDidLoad];
    YSLoopBanner *loop = [[YSLoopBanner alloc] initWithFrame:CGRectMake(0, 100, 200, 200) scrollDuration:3.f];
    [self.view addSubview:loop];
    loop.imageURLStrings = @[@"kj_2_1", @"kj_3_1", @"kj_1_1"];
    loop.clickAction = ^(NSInteger index) {
        NSLog(@"curIndex: %ld", index);
    };
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
