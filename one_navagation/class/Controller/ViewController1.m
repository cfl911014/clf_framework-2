//
//  ViewController1.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController1.h"


@interface ViewController1 ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *array;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    
    
    
    
    
    self.array = @[
                   @"自定义UICollectionViewFlowLayout",
                   @"天气预报画虚线",
                   @"UIView某一个角为圆角",
                   @"DrawRect",
                   @"Block",
                   @"动画",
                   @"YYKit",
                   @"ReactiveCocoa",
                   @"UITableview自适应高度",
                   @"DataSource",
                   @"未定",
                   @"未定",
                   @"未定"
                   ];
    
    
    
    
    
    
    
    
}

-(void)selectIndex:(NSInteger)row
{
    NSString* className =[NSString stringWithFormat:@"ViewControllers%lu",row];
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
