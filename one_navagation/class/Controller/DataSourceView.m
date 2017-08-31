//
//  DataSourceView.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DataSourceView.h"

@interface DataSourceView()


@end

@implementation DataSourceView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

-(void)setDataSource:(id<DataSourceViewDataSource>)dataSource{
    _dataSource = dataSource;
    for (int i = 0; i<[_dataSource viewtitlesCount];i++){
        UILabel *l = [[UILabel alloc]init];
        l.text = [_dataSource viewtitleIndex:i];
        [self addSubview:l];
    }
}


-(void)layoutSubviews{
    CGFloat w = self.width/(self.subviews.count);
    for (int i =0;i<self.subviews.count;i++) {
        CGFloat x = w*i;
        UIView *v =self.subviews[i];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(x);
            make.top.mas_equalTo(100);
            make.width.mas_equalTo(w);
            make.height.mas_equalTo(100);
        }];
    }
}



@end
