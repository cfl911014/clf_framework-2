//
//  DataSourceView.h
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DataSourceViewDataSource <NSObject>

-(NSInteger)viewtitlesCount;
-(NSString *)viewtitleIndex:(NSInteger)index;

@end

@interface DataSourceView : UIView


@property(nonatomic,assign)id <DataSourceViewDataSource>dataSource;

-(instancetype)initWithFrame:(CGRect)frame;



@end
