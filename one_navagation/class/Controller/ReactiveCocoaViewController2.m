//
//  ReactiveCocoaViewController2.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/25.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ReactiveCocoaViewController2.h"

@interface ReactiveCocoaViewController2 ()

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UITextField *redTextfile;
@property (weak, nonatomic) IBOutlet UITextField *greenTextfile;
@property (weak, nonatomic) IBOutlet UITextField *blueTextfile;
@property (weak, nonatomic) IBOutlet UIView *showView;

@property (nonatomic,assign)CGFloat r;
@property (nonatomic,assign)CGFloat f;
@property (nonatomic,assign)CGFloat b;

@end

@implementation ReactiveCocoaViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.redTextfile.text = self.greenTextfile.text = self.blueTextfile.text  = @"0.5";
    
    RACSignal *signalRed =  [self blindSlider:self.redSlider textFiled:self.redTextfile];
    RACSignal *signalGreen =  [self blindSlider:self.greenSlider textFiled:self.greenTextfile];
    RACSignal *signalBlue = [self blindSlider:self.blueSlider textFiled:self.blueTextfile];
    

    [[[RACSignal combineLatest:@[signalRed,signalGreen,signalBlue]] map:^id(id value) {
        return  [UIColor colorWithRed:[value[0] floatValue] green:[value[1] floatValue]  blue:[value[2] floatValue] alpha:1.0f];
    }] subscribeNext:^(id x) {
         self.showView.backgroundColor  = x;
    }];
    
    
}

-(RACSignal *)blindSlider:(UISlider *)selider textFiled:(UITextField *)textFiled{
    
    RACSignal *signalText = [[textFiled rac_textSignal] take:1];
    RACChannelTerminal *sliderSignal = [selider rac_newValueChannelWithNilValue:nil];
    RACChannelTerminal *textSignal = [textFiled rac_newTextChannel];
    //双向绑定
    [textSignal subscribe:sliderSignal];
    [[sliderSignal map:^id(id value) {//数据处理
        return [NSString stringWithFormat:@"%.2f",[value floatValue]];
    }] subscribe:textSignal];
    //返回一个新信号
    return [[sliderSignal merge:textSignal]merge:signalText];
}


@end
