//
//  Tips.m
//  one_navagation
//
//  Created by mac  on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Tips.h"

@interface Tips()
{
    UIView *_view_tips;
}

@end


@implementation Tips

singleton_m(tips)


- (void)showTips:(NSString *)text
{
    text = [self  dealTipsString:text];
    
    if (_view_tips != nil)
    {
        _view_tips.alpha = 0;
        _view_tips = nil;
        [_view_tips removeFromSuperview];
    }
    
    _view_tips = [[UIView alloc] initWithFrame:CGRectZero];
    _view_tips.backgroundColor = [UIColor blackColor];
    _view_tips.layer.masksToBounds = YES;
    _view_tips.layer.cornerRadius = 4.0;
    _view_tips.layer.borderWidth = 1.0;
    _view_tips.layer.borderColor = [[UIColor clearColor] CGColor];
    _view_tips.alpha = 0.7;
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:15.0];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = text;
    
    UIFont *font = label.font;            //跟label的字体大小一样
    CGSize constrainSize = CGSizeMake(ScreenWidth - 40 - 60 , 29999); //跟label的宽设置一样
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    CGSize size =[text boundingRectWithSize:constrainSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    
    CGRect rect = label.frame;
    rect.size = size;
    label.frame = rect;
    
    //    [label sizeToFit];
    
    label.textColor = [UIColor whiteColor];
    label.left = (ScreenWidth-label.width)/2;
    _view_tips.frame = CGRectMake((ScreenWidth - (label.width + 40))/2, (ScreenHeight-20-44)/2, label.width+40, label.height+20);
    
    label.left = 20;
    label.top = 10;
    [_view_tips addSubview:label];
    
    [[UIApplication sharedApplication].keyWindow addSubview:_view_tips];
    
    [self performSelector:@selector(hiddenTips) withObject:self afterDelay:1];

}
-(NSString *)dealTipsString:(NSString *)string
{
    if (TESTBUILD == 0) {
        NSRange range = [string rangeOfString:@"#"];
        
        if (range.location != NSNotFound) {
            NSArray *resuArr = [string componentsSeparatedByString:@"#"];
            return [resuArr objectAtIndex:1];
        }
    }
    return string;
}

- (void)hiddenTips
{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGAffineTransform newTransform =
        CGAffineTransformScale(_view_tips.transform, 0.7, 0.7);
        [_view_tips setTransform:newTransform];
        _view_tips.center = _view_tips.center;
        
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 animations:^{
            _view_tips.alpha = 0;
        }completion:^(BOOL finished) {
            [_view_tips removeFromSuperview];
        }];
    }];
}


@end
