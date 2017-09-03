
//
//  MyTableViewCell.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/31.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MyTableViewCell.h"

@interface  MyTableViewCell()


@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@end
@implementation MyTableViewCell


-(void)setT:(NSString *)t{
    _t= t;
    
    self.titleLable.text = _t;

}

@end

