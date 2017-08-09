//
//  ViewController5.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self.collectionView registerClass:[CollectionViewCell1 class] forCellWithReuseIdentifier:@"CollectionViewCell1"];
    [self.collectionView registerClass:[CollectionViewCell2 class] forCellWithReuseIdentifier:@"CollectionViewCell2"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 5;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item == 0) {
        CollectionViewCell1 *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell1" forIndexPath:indexPath];
        return  cell;
    }else{
        CollectionViewCell2 *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell2" forIndexPath:indexPath];
        return  cell;
    }
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.item == 0) {
//        return CGSizeMake(ScreenWidth/2-1, 60);
//    }else{
//        return CGSizeMake(ScreenWidth/2-1, 29);
//    }
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 0;
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 0;
//}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}



-(UICollectionView *)collectionView
{
    if (!_collectionView) {
         FlowLayout*flow = [[FlowLayout alloc]init];
        flow.itemSize = CGSizeMake(100, 100);
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flow];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}



@end
