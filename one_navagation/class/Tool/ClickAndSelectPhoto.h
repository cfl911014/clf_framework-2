//
//  ClickAndSelectPhoto.h
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//  依赖于ZLPhotoLib

#import <Foundation/Foundation.h>


@interface ClickAndSelectPhoto : NSObject 


/**
 *  点击图片放大
 *
 *  @param images 数组(UIImage,NSUrl,NSString)
 *  @param index  点击了第几张图片
 */
+ (void)clickBigPhotoImages:(NSArray *)images index:(NSInteger)index;

/**
 *  相册多选
 *
 *  @param maxCount  最多选多少张图片
 *  @param VC        所在控制器
 *  @param callBack  回调block，返回UIImage类型数组
 */
typedef void(^CallBack)(NSArray<UIImage *> *statusArray);
@property(nonatomic,copy)CallBack zlphotoAssets;

+ (void)pickerPhotoMaxCount:(NSInteger)maxCount showVC:(UIViewController *)VC callBack:(CallBack)callBack;










/**
 *  actionSheet 选择照片 (用上面的类方即可)
 *
 *  @param VC       所在的控制器
 *  @param maxCount 多选最大数量
 */
typedef void (^completBlcik)(NSArray<UIImage *> *imageArray);
@property (nonatomic,copy)completBlcik takePhotoBlock;

- (void)showActionSheerInViewController:(UIViewController *)VC maxCount:(NSInteger)maxCount callBack:(completBlcik)callback;


@end


