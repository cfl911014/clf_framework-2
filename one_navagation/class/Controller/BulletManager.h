//
//  BulletManager.h
//  
//
//  Created by 崔付亮 on 2017/10/13.
//

#import <Foundation/Foundation.h>
#import "BulletView.h"
@interface BulletManager : NSObject

@property(nonatomic,copy) void(^genarateViewBlock)(BulletView * view);

-(void)start;
-(void)stop;




@end
