//
//  RootTableViewController.h
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RootViewController.h"



@interface RootTableViewController : RootViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,assign) NSInteger pageIndex;
@property (strong, nonatomic) NSMutableArray *dataArray;

@property (nonatomic) BOOL showRefreshHeader;//是否显示下拉刷新
@property (nonatomic) BOOL showRefreshFooter;//是否显示上拉加载

@property (nonatomic) CGFloat footerViewHeight;//暂无数据Footer的frame
@property (nonatomic) BOOL showNoDataView;   //显示暂无数据的Footer

//让头部主动下拉刷新 (点击选择城市,分类的时候用到)//不需要调用requstdata
- (void)headerBeginRefresh;
//结束刷新
- (void)endRefresh;

//子控制器中只在viewdidload 调用requstData即可  上啦下拉都不用调用,只处理pageindex即可
- (void)requstData;



////刷新对应的方法,pageIndex,requstData已经处理 只处理其他参数的变化即可
//- (void)headerRefresh;
//- (void)footerRefresh;
- (instancetype)initWithStyle:(UITableViewStyle)style;


@end
