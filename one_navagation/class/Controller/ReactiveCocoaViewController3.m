//
//  ReactiveCocoaViewController3.m
//  one_navagation
//
//  Created by 崔付亮 on 2017/8/28.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ReactiveCocoaViewController3.h"

@interface ReactiveCocoaViewController3 ()<CLLocationManagerDelegate>

@property(nonatomic,strong )UILabel *lable;

@property(nonatomic, strong) CLLocationManager *manager;
@property(nonatomic, strong)CLGeocoder *geocoder;


@end
@implementation ReactiveCocoaViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    [[[[[self authorizedSignal] filter:^BOOL(id value) {
        return [value boolValue];
    }] flattenMap:^RACStream *(id value){
        return [[[[self rac_signalForSelector:@selector(locationManager:didUpdateLocations:) fromProtocol:@protocol(CLLocationManagerDelegate)] map:^id(id value) {
            return value[1];
        }] initially:^{
            [self.manager startUpdatingLocation];
        }] finally:^{
            [self.manager stopUpdatingLocation];
        }];
    }] flattenMap:^RACStream *(id value) {
        CLLocation *locaiton = value[0];
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [self.geocoder reverseGeocodeLocation:locaiton completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                [subscriber sendNext:[placemarks firstObject]];
                [subscriber sendCompleted];
            }];
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
      [self.manager stopUpdatingLocation];
}


-(RACSignal *)authorizedSignal{
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [self.manager requestAlwaysAuthorization];
        return [[self rac_signalForSelector:@selector(locationManager:didChangeAuthorizationStatus:) fromProtocol:@protocol(CLLocationManagerDelegate)] map:^id(id value) {
            return @([value[1] integerValue] == kCLAuthorizationStatusAuthorizedAlways);
        }];
    }
    return [RACSignal return:@([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)];
}





-(CLLocationManager *)manager{
    if (!_manager) {
        _manager = [[CLLocationManager alloc]init];
        _manager.delegate = self;
    }
    return _manager;
}
-(CLGeocoder *)geocoder{
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc]init];
    }
    return _geocoder;
}
-(UILabel *)lable{
    if (!_lable) {
        _lable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _lable.backgroundColor = [UIColor redColor];
        [self.view addSubview:_lable];
    }
    return _lable;
}

@end
