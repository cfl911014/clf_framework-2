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
@property(nonatomic,assign) NSInteger pageSize;
@property (strong, nonatomic) NSMutableArray *dataArray;

@property (nonatomic) BOOL showRefreshHeader;//是否显示下拉刷新
@property (nonatomic) BOOL showRefreshFooter;//是否显示上拉加载

@property (nonatomic) CGFloat footerViewHeight;//暂无数据Footer的frame
@property (nonatomic) BOOL showNoDataView;   //显示暂无数据的Footer

//让头部主动下拉刷新 (点击选择城市,分类的时候用到)
- (void)headerBeginRefresh;

//刷新对应的方法,pageIndex,requstData已经处理 只处理其他参数的变化即可
- (void)headerRefresh;
- (void)footerRefresh;

- (void)requstData;


- (instancetype)initWithStyle:(UITableViewStyle)style;




//frame;  默认self.view (没有导航栏和tabbar的高度!)
//showRefreshHeader 默认NO
//showRefreshFooter 默认NO
//footerViewFrame   先设置frame 在设置 showNoDataView
//
//endRefresh
//cell选中颜色   cell.selectionStyle = UITableViewCellSelectionStyleNone;


/*
 self.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64 - 49);

 //加载成功后显示再无数据
 self.footerViewFrame = self.tableView.frame;
 self.showNoDataView = YES; //如果有数据直接设置成NO就行
 */
@end
