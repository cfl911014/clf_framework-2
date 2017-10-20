//
//  BulletView.h
//  one_navagation
//
//  Created by 崔付亮 on 2017/10/13.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, bulletState) {
    start,
    middel,
    end,
};


@interface BulletView : UIView

@property(nonatomic,assign)int tra;//弹道
@property(nonatomic,copy) void(^moveStateBlock)(bulletState);//弹幕状态回调

-(instancetype)initWithCommnet:(NSString *)comment;


-(void)startAnimation;
-(void)stopAnimation;

@end
