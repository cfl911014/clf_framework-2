//
//  ZLPicker.h
//  ZLAssetsPickerDemo
//
//  Created by 张磊 on 14-12-17.
//  Copyright (c) 2014年 com.zixue101.www. All rights reserved.
//

#ifndef ZLAssetsPickerDemo_ZLPicker_h
#define ZLAssetsPickerDemo_ZLPicker_h

#import "ZLPhotoPickerBrowserViewController.h"
#import "ZLPhotoPickerAssetsViewController.h"
#import "ZLPhotoPickerViewController.h"
#import "ZLPhotoPickerDatas.h"
#import "ZLPhotoPickerCommon.h"
#import "UIView+ZLExtension.h"

/**
 *
 使用方法：看Demo啦~~
 有什么不懂的也可以联系QQ：120886865 (*^__^*) 嘻嘻……
 *
 */

//点击选取相册图片
//- (void)clickbtn
//{
//    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
//    pickerVc.maxCount = 5;
//    pickerVc.status = PickerViewShowStatusCameraRoll;
//    pickerVc.photoStatus = PickerPhotoStatusPhotos;
//    pickerVc.selectPickers = self.assets;
//    pickerVc.topShowPhotoPicker = YES;
//    pickerVc.isShowCamera = YES;
//    pickerVc.callBack = ^(NSArray<ZLPhotoAssets *> *status){
//        self.assets = status.mutableCopy;
//        for (ZLPhotoAssets *set in status) {
//            NSLog(@"%@",set.originImage);
//        }
//    };
//    [pickerVc showPickerVc:self];
//}

#endif
