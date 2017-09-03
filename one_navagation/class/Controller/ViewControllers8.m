
//
//  ViewControllers8.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewControllers8.h"
#import "MyTableViewCell.h"
@interface ViewControllers8 ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableview;

@property(nonatomic,strong)NSArray *datasource;

@end

@implementation ViewControllers8

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.datasource = @[@"二和",
                        @"二和二和二和二和二和二和二和二和二和二和二和",
                        @"二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和",
                        @"二和",
                        @"二和二和二和二和二和二和二和二和二和二和二和",
                        @"二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和",
                        @"二和",
                        @"二和二和二和二和二和二和二和二和二和二和二和",
                        @"二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和",
                        @"二和",
                        @"二和二和二和二和二和二和二和二和二和二和二和",
                        @"二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和",
                        @"二和",
                        @"二和二和二和二和二和二和二和二和二和二和二和",
                        @"二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和",
                        @"二和",
                        @"二和二和二和二和二和二和二和二和二和二和二和",
                        @"二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和二和"
                        ];
    [self.tableview registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyTableViewCell"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell"];
    cell.t = self.datasource[indexPath.row];
    return cell;
}


-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]init];
        _tableview.frame = self.view.frame;
        _tableview.delegate= self;
        _tableview.dataSource = self;
        _tableview.estimatedRowHeight = 50;
    //    _tableview.rowHeight = UITableViewAutomaticDimension;
        [self.view addSubview:_tableview];
    }
    return _tableview;
}

@end
