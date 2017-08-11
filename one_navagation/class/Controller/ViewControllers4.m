//
//  ViewControllers4.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers4.h"
#import "BlockUse.h"
@interface ViewControllers4 ()

@property (nonatomic,strong)UILabel *blockLable;

@end

@implementation ViewControllers4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blockLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 100)];
    self.blockLable.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.blockLable];
    
    //block封装到方法中
    [[[BlockUse alloc]init] requstURL:@"" back:^(NSString *str) {
        self.blockLable.text = str;
    }];
    

}





@end
