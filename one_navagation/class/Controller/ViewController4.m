//
//  ViewController4.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController4.h"
@interface ViewController4 ()

@property(nonatomic,strong) UILabel *label;
@property(nonatomic,strong) UITextField *textField;


@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 100,100)];
    self.textField.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.textField];
    
}




-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}


@end
