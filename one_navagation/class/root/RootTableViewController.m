//
//  RootTableViewController.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RootTableViewController.h"
#import "MJRefresh.h"
#import "NODadaView.h"

@interface RootTableViewController ()

@property (nonatomic, readonly) UITableViewStyle style;
@property (nonatomic, strong) NODadaView *noDataView;
@property (nonatomic,strong) UIView *footerView;

@end

@implementation RootTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        _style = style;
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.pageIndex = 1;
    self.showRefreshHeader = NO;
    self.showRefreshFooter = NO;
    self.showNoDataView = NO;
    [self.view addSubview:self.tableView];
}



#pragma mark - lazy

-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 50.0f;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UIView *)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, _footerViewHeight)];
        _noDataView = [[NODadaView alloc]initWithFrame:_footerView.frame];
        [_footerView addSubview:_noDataView];
    }
    return _footerView;
}


#pragma mark - setter
- (void)headerBeginRefresh
{
    [self.tableView headerBeginRefreshing];
}

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader
{
    if (_showRefreshHeader != showRefreshHeader) {
        _showRefreshHeader = showRefreshHeader;
        if (_showRefreshHeader) {
            __weak typeof(self) weakSelf=self;
            
            [self.tableView addHeaderWithCallback:^{
                weakSelf.pageIndex=1;
                [weakSelf requstData];
                [weakSelf headerRefresh];
            }];
        }
        else{
            [self.tableView removeHeader];
        }
    }
}

- (void)setShowRefreshFooter:(BOOL)showRefreshFooter
{
    if (_showRefreshFooter != showRefreshFooter) {
        _showRefreshFooter = showRefreshFooter;
        if (_showRefreshFooter) {
            __weak typeof(self) weakSelf=self;
            
            [self.tableView addFooterWithCallback:^{
                weakSelf.pageIndex = weakSelf.pageIndex+1;
                [weakSelf requstData];
                [weakSelf footerRefresh];
            }];
        }
        else{
            [self.tableView removeFooter];
        }
    }
}

- (void)requstData{
    
}

- (void)headerRefresh{
    self.pageIndex = 1;
}
- (void)footerRefresh{
    self.pageIndex ++;
}
- (void)endRefresh{
    [self.tableView headerEndRefreshing];
    [self.tableView footerEndRefreshing];
}

- (void)setShowNoDataView:(BOOL)showNoDataView{
    if(_showNoDataView != showNoDataView){
        _showNoDataView = showNoDataView;
        if (_showNoDataView) {
            self.tableView.tableFooterView = self.footerView;
        }
        else{
            self.tableView.sectionFooterHeight = 0;
            self.tableView.tableFooterView = [[UIView alloc]init];
        }
    }
}


#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


@end
