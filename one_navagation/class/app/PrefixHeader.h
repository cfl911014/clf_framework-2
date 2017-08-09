//
//  PrefixHeader.h
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#ifndef PrefixHeader_h
#define PrefixHeader_h




//登陆成功返回的数据
#define kUserName     @"UserName"
#define kUserId       @"userId"

/**  跳转到登陆界面 */
//#define KJLOGIN \
//NSString *userName = [MyDefaults  readKey:kUserId];\
//if (userName.length <= 0) {\
//KJLoginViewController *lvc = [[KJLoginViewController alloc]init];\
//lvc.disableGestureBack = YES;\
//[self.navigationController pushViewController:lvc animated:YES];\
//return;\
//}


//获取物理设备的高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取物理设备的宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define ScreenViewHeight (ScreenHeight-64)




#endif /* PrefixHeader_h */
