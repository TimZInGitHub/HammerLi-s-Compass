//
//  TZTraditionalCompassViewController.m
//  HammerLi's Compass
//
//  Created by Tim.Z on 11/13/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZTraditionalCompassViewController.h"
#import "TZUnderIndicatorView.h"
#import "TZNeedleView.h"
#import <CoreLocation/CoreLocation.h>


@interface TZTraditionalCompassViewController () <CLLocationManagerDelegate>

@property (nonatomic, weak) UILabel *indicatorLabel;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, weak) TZNeedleView *needleView;

@end

@implementation TZTraditionalCompassViewController

#pragma mark - lazyloading
- (CLLocationManager *)locationManager
{
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.locationManager startUpdatingHeading];
    
    self.view.backgroundColor = TZCommonBackgroundColor;


    
    UILabel *indicatorLabel = [[UILabel alloc] init];
    self.indicatorLabel = indicatorLabel;
    self.indicatorLabel.textAlignment = NSTextAlignmentCenter;
    self.indicatorLabel.text = @"hahaha";
    self.indicatorLabel.font = [UIFont systemFontOfSize:30];
    self.indicatorLabel.frame = CGRectMake(0, 20, self.view.frame.size.width, 30);
    [self.view addSubview:indicatorLabel];
    
    TZUnderIndicatorView *underIndicatorView = [[TZUnderIndicatorView alloc] init];
    [self.view addSubview:underIndicatorView];
    [underIndicatorView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.indicatorLabel.bottom).offset(10);
        make.left.equalTo(self.view.left).offset(5);
        make.right.equalTo(self.view.right).offset(-5);
        make.height.equalTo(self.view.width).offset(10);
    }];
  
    TZNeedleView *needleView = [[TZNeedleView alloc] init];
    self.needleView = needleView;
    [self.view addSubview:needleView];
    [self.needleView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(underIndicatorView.top);
        make.bottom.equalTo(underIndicatorView.bottom);
        make.left.equalTo(underIndicatorView.left);
        make.right.equalTo(underIndicatorView.right);
        
    }];
}

#pragma mark - 
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    if (newHeading.headingAccuracy < 0) {
        return;
    }
    CLLocationDirection angle = newHeading.magneticHeading;
    
    float radius = angle / 180 * M_PI;
    self.indicatorLabel.text = [NSString stringWithFormat:@"%f",angle];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.needleView.transform = CGAffineTransformMakeRotation(-radius);
    }];
}




@end
