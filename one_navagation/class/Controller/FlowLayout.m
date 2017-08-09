//
//  FlowLayout.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FlowLayout.h"

@implementation FlowLayout


-(void)prepareLayout{
    
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *array =[super layoutAttributesForElementsInRect:rect] ;
   
    for(int i = 0;i<array.count;i++){
        UICollectionViewLayoutAttributes *attrs = array[i];
        float x = 0;
        float y = 0;
        if(i<=2){
            switch (i) {
                case 0:
                    x=0;
                    y=0;
                    break;
                case 1:
                    x=ScreenWidth/2;
                    y=0;
                    break;
                case 2:
                    x=ScreenWidth/2;
                    y=30;
                break;
            }
        }else{
            x = i%2?ScreenWidth/2:0;
            y = 60+(i-3)/2*30;
        }
       
        float w = ScreenWidth/2;
        float h = i>0?30:60;
       
        attrs.frame = CGRectMake(x, y, w, h);
        
    }
    
    
    return array;
}






@end
