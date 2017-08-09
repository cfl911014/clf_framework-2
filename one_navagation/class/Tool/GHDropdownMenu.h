//
//  HWDropdownMenu.h
//
//
//  Created by apple on 14-10-8.
//  Copyright (c) 2014年 CFL. All rights reserved.
//

#import <UIKit/UIKit.h>

#define imageVimage [UIImage imageNamed:@""];
typedef  void(^SelectBlock)(NSString * ,NSInteger );


@interface GHDropdownMenu : UIView


/* 用法说明
 
menu = [GHDropdownMenu menu];
menu.data=@[@"1",@"2",@"3",@"4",@"5"]; //数据源
menu.sz=CGSizeMake(100, 100);          //tableview的size
menu.selectBlock=^(NSString *str,NSInteger row){
    NSLog(@"%@,%ld",str,(long)row);
};
[menu showFrom:_btn];                  //再btn的左边
touch的时候会移除该视图，这个不用处理
*/


/**
 *  选中cell的回调
 *  block中两个参数，（NSString，NSInteger）分别为选中cell的字符串，和选中cell的indexpath.row
 */
@property(nonatomic,copy)SelectBlock selectBlock;


/**
 *  内容视图的数据 
 */
@property(nonatomic,strong)NSArray  *data;


/**
 *  内容视图的尺寸
 */
@property(nonatomic)CGSize sz;


+ (instancetype)menu;

/**
 *  显示
 */
- (void)showFrom:(UIView *)from;


/**
 *  销毁 (touch时调用)
 */
- (void)dismiss;

@end
