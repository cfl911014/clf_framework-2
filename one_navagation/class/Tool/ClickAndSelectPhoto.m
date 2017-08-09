//
//  ClickAndSelectPhoto.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ClickAndSelectPhoto.h"

@interface ClickAndSelectPhoto ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end


@implementation ClickAndSelectPhoto

#pragma mark - 点击放大图片
+ (void)clickBigPhotoImages:(NSArray *)images index:(NSInteger)index{
    //数据源
    NSMutableArray *photos=[NSMutableArray array];
    
    //将url或者image添加到数据源中
    for (id image in images) {
        if([image isKindOfClass:[UIImage class]])
        {
            ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
            photo.photoImage = image;
            [photos addObject:photo];
        }
        else if([image isKindOfClass:[NSURL class]])
        {
            ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
            photo.photoURL = image;
            [photos addObject:photo];
        }
        else if([image isKindOfClass:[NSString class]])
        {
            ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
            photo.photoURL = [NSURL URLWithString:image];
            [photos addObject:photo];
        }
    }
    
    ZLPhotoPickerBrowserViewController *pickerBrowser = [[ZLPhotoPickerBrowserViewController alloc] init];
    
    // 数据源可以不传，传photos数组 photos<里面是ZLPhotoPickerBrowserPhoto>
    pickerBrowser.photos =photos;
    // 当前选中的值
    pickerBrowser.currentIndex = index;
    // 获得最上面的窗
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    // 展示控制器
    [pickerBrowser showPickerVc:appRootVC];
}

#pragma mark - 相册多选
+ (void)pickerPhotoMaxCount:(NSInteger)maxCount showVC:(UIViewController *)VC callBack:(CallBack)callBack
{
    [[[self alloc]init] pickerPhotoMaxCount:maxCount showVC:VC callBack:^(NSArray<UIImage *> *statusArray) {
        callBack(statusArray);
    }];
}

- (void)pickerPhotoMaxCount:(NSInteger)maxCount showVC:(UIViewController *)VC callBack:(CallBack)callBack
{
       ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
        pickerVc.maxCount = maxCount;
        pickerVc.status = PickerViewShowStatusCameraRoll;
        pickerVc.photoStatus = PickerPhotoStatusPhotos;
        //pickerVc.selectPickers = self.assets;
        pickerVc.topShowPhotoPicker = YES;
        pickerVc.isShowCamera = YES;
        pickerVc.callBack = ^(NSArray<ZLPhotoAssets *> *status){
            NSMutableArray *arrayM = [NSMutableArray array];
            for (id set in status) {
                if([set isKindOfClass:[UIImage class]]){
                    [arrayM addObject:set];
                }
                else if([set isKindOfClass:[ZLPhotoAssets class]]){
                    [arrayM addObject:((ZLPhotoAssets *)set).originImage];
                }
            }
            callBack(arrayM);
        };
        [pickerVc showPickerVc:VC];
}


#pragma mark - 拍照 (用这个方法必须用强引用)
- (void)takePhotoVC:(UIViewController *)VC
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑 (这里改变的话 代理方法中也改变)
        picker.allowsEditing = NO;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.showsCameraControls = YES;
        [VC presentViewController:picker animated:YES completion:nil];
    }
    else{
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    [picker dismissViewControllerAnimated:YES completion:^{
        __block UIImage *image = info[UIImagePickerControllerOriginalImage];
        self.takePhotoBlock(@[image]);
    }];
}


#pragma mark - actionSheet
- (void)showActionSheerInViewController:(UIViewController *)VC maxCount:(NSInteger)maxCount callBack:(completBlcik)callback{
    self.takePhotoBlock = callback;
    
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"添加图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self pickerPhotoMaxCount:maxCount showVC:VC callBack:^(NSArray<UIImage *> *statusArray) {
            self.takePhotoBlock(statusArray);
        }];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self takePhotoVC:VC];
    }];
    
    [alertCon addAction:action1];
    [alertCon addAction:action2];
    [alertCon addAction:action3];
    [VC presentViewController:alertCon animated:YES completion:nil];
}

@end
