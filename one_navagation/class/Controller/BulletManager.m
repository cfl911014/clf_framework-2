//
//  BulletManager.m
//  
//
//  Created by 崔付亮 on 2017/10/13.
//

#import "BulletManager.h"

@interface BulletManager()

//数据源
@property(nonatomic,strong)NSMutableArray *dataSource;
//数据存储
@property(nonatomic,strong)NSMutableArray *bulletContents;
//view
@property(nonatomic,strong)NSMutableArray *bulletViews;

@end

@implementation BulletManager

-(void)start{
    [self.bulletContents removeAllObjects];
    [self.bulletContents addObjectsFromArray:self.dataSource];
    
    //弹道数组
    NSMutableArray *bulletTra = [NSMutableArray arrayWithArray:@[@(1),@(2),@(3)]];
    for(int i = 0;i<3;i++){
        if (self.bulletContents.count>0) {
            //取出随机弹道
            NSInteger index = arc4random()%bulletTra.count;
            int tra = [bulletTra[index] intValue];
            [bulletTra removeObjectAtIndex:index];
            //取出弹幕
            NSString *commnet = [self.bulletContents firstObject];
            [self.bulletContents removeFirstObject];
            
            //创建弹幕
            [self createBullet:commnet tra:tra];
        }
    }
}

//创建弹幕
-(void)createBullet:(NSString *)commnet tra:(int)tra{
    BulletView *view = [[BulletView alloc]initWithCommnet:commnet];
    view.tra = tra;
    [self.bulletViews addObject:view];
    
    __weak typeof(view) weakView = view;
    __weak typeof(self) weakSelf = self;
    view.moveStateBlock = ^(bulletState state){
        if (state==start) {
        }
        else if(state==middel){
            if (self.bulletContents.count>0) {
                [weakSelf createBullet:self.bulletContents.firstObject tra:tra];
                [self.bulletContents removeFirstObject];
            }
        }else{
            //移除后停止动画
            [weakView stopAnimation];
            [weakSelf.bulletViews removeObject:weakView];
        }
    };
    if (self.genarateViewBlock) {
        self.genarateViewBlock(view);
    }
}

-(void)stop{
    
}



-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        [_dataSource addObjectsFromArray:@[@"弹幕1~~~~~~~~~~~~~~~~~~~~~~~~~",
                                           @"弹幕2~~",
                                           @"弹幕3~~!!!!!!!",
                                           @"弹幕4~~~~~~~~~~",
                                           @"弹幕5~~~~",
                                           @"弹幕6~~~~~~~~~~~",
                                           @"弹幕7~~~~~~",
                                           @"弹幕8~~~~",
                                           @"弹幕9~~~~~~~~~~~~~~~"]];
    }
    return _dataSource;
}
-(NSMutableArray *)bulletContents{
    if (!_bulletContents) {
        _bulletContents = [NSMutableArray array];
    }
    return _bulletContents;
}
-(NSMutableArray *)bulletViews{
    if (!_bulletViews) {
        _bulletViews = [NSMutableArray array];
    }
    return _bulletViews;
}


@end
