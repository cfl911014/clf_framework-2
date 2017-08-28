//
//  ViewControllers7.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/25.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers7.h"

@interface ViewControllers7 ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *array;

@end

@implementation ViewControllers7

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    
    self.array = @[
                   @"信号量 , RACCommand UIKit绑定",
                   @"登录的实现",
                   @"颜色选择器实例",
                   @"定位实现"
                   ];

    
    
    
}



-(void)selectIndex:(NSInteger)row
{
    NSString* className =[NSString stringWithFormat:@"ReactiveCocoaViewController%lu",row];
    UIViewController *c =[[NSClassFromString(className) alloc]init];
    if (c) {
        [self.navigationController pushViewController:c animated:YES];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self selectIndex:indexPath.row];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell =[[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:@"cell"];
        cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 40;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


@end
