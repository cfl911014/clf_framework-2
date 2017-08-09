//
//  HWDropdownMenu.m
//  
//
//  Created by apple on 14-10-8.
//  Copyright (c) 2014年 CFL. All rights reserved.
//

#import "GHDropdownMenu.h"
#import "UIView+Extension.h"
@interface GHDropdownMenu()<UITableViewDelegate,UITableViewDataSource>


/**
 *  将来用来显示具体内容的容器
 */
@property (nonatomic, weak) UIImageView *containerView;


/**
 *  内容
 */
@property (nonatomic, strong) UIView *content;


/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contentController;


@end

@implementation GHDropdownMenu
{
    UITableView *tableview;
    UIImageView *imageV;
    NSInteger _tableView_hight;
}


- (UIImageView *)containerView
{
    if (!_containerView) {
        // Q一个灰色图片控件
        UIImageView *containerView = [[UIImageView alloc] init];
        //containerView.image = [UIImage imageNamed:@"popover_background"];
        containerView.userInteractionEnabled = YES; // 开启交互
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return _containerView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 清除颜色
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}


+ (instancetype)menu
{
    return [[self alloc] init];
}



- (void)setContent:(UIView *)content
{
    _content = content;
    
    // 调整内容的位置
    content.x = 0;
    content.y = 0;
    
    // 调整内容的宽度
//    content.width = self.containerView.width - 2 * content.x;
    
    // 设置灰色的高度
    self.containerView.height = CGRectGetMaxY(content.frame) + 11;
    // 设置灰色的宽度
    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    
    // 添加内容到灰色图片中
    [self.containerView addSubview:content];
}

- (void)setContentController:(UIViewController *)contentController
{
    _contentController = contentController;
    
    self.content = contentController.view;
}

/**
 *  显示
 */
- (void)showFrom:(UIView *)from
{
    imageV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,_sz.width ,_sz.height)];
    imageV.userInteractionEnabled=YES;
    imageV.image=imageVimage;
    
    if(_data.count*40< _sz.height-10){
        imageV.height=_data.count*40+10;
        _tableView_hight=_data.count*40;
    }
    else{
        _tableView_hight=_sz.height;
    }
    
    //创建tableView
    tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,5, _sz.width-5, _tableView_hight)];
    tableview.delegate=self;
    tableview.dataSource=self;
    tableview.rowHeight=40;
    //tableview.layer.cornerRadius=8;
    tableview.layer.borderWidth=1;
    tableview.backgroundColor=[UIColor colorWithWhite:1 alpha:1.00];
    tableview.layer.borderColor=[UIColor grayColor].CGColor;
   
    tableview.tableFooterView=[[UIView alloc]init];
    [imageV addSubview:tableview];
    self.content=imageV;
    
    // 1.获得最上面的窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    

    // 2.添加自己到窗口上
    [window addSubview:self];
    
    // 3.设置尺寸
    self.frame = window.bounds;
    
    // 4.调整灰色图片的位置
    // 默认情况下，frame是以父控件左上角为坐标原点
    // 转换坐标系
    CGRect newFrame = [from convertRect:from.bounds toView:window];
    self.containerView.x = from.x;
    self.containerView.y = CGRectGetMaxY(newFrame);
    imageV.size=CGSizeMake(_sz.width, 0);
    tableview.size=CGSizeMake(_sz.width-5, 0);
    [UIView animateWithDuration:0.2 animations:^{
        imageV.size=CGSizeMake(_sz.width,_tableView_hight+10);
        tableview.size=CGSizeMake(_sz.width-5, _tableView_hight);
    } completion:^(BOOL finished) {
        
    }];
}

/**
 *  销毁
 */
- (void)dismiss
{
    [UIView animateWithDuration:0.2 animations:^{
        imageV.size=CGSizeMake(_sz.width, 0);
        tableview.size=CGSizeMake(_sz.width-5, 0);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableview dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundView=[[UIView alloc]init];
        cell.backgroundColor=[UIColor clearColor];
        cell.textLabel.font=[UIFont systemFontOfSize:14];
        cell.textLabel.textColor=[UIColor blackColor];
        cell.textLabel.highlightedTextColor=[UIColor colorWithRed:0.086 green:0.720 blue:0.000 alpha:1.000];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    UIView *v=[[UIView alloc]initWithFrame:CGRectMake(cell.x+16, cell.y, cell.width, cell.height)];
    v.backgroundColor=[UIColor colorWithRed:0.918 green:0.830 blue:1.000 alpha:1.000];
    cell.selectedBackgroundView=v;
    cell.selectedBackgroundView.frame=CGRectMake(cell.x+16, cell.y, cell.width, cell.height);

    cell.textLabel.text=_data[indexPath.row];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",_data[indexPath.row]);
    
    self.selectBlock(_data[indexPath.row],indexPath.row);
    [self dismiss];
}

@end
