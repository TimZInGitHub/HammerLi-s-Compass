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
#import "TZMotionModel.h"
#import "TZMotionManager.h"
#import "TZBallView.h"

static const NSTimeInterval deviceMotionMin = 0.01;

@interface TZTraditionalCompassViewController () <CLLocationManagerDelegate>

@property (nonatomic, weak) UILabel *indicatorLabel;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, weak) TZNeedleView *needleView;
@property (nonatomic, weak) TZBallView *ballView;
@property (nonatomic, weak) TZUnderIndicatorView *underIndicatorView;
@property (nonatomic, strong) TZMotionModel *motionModel;

@end

@implementation TZTraditionalCompassViewController

#pragma mark - lazyloading
- (TZMotionModel *)motionModel
{
    if (_motionModel == nil) {
        _motionModel = [[TZMotionModel alloc] init];
    }
    return _motionModel;
}



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
    
    [self.locationManager startUpdatingHeading];
    
    self.view.backgroundColor = TZCommonBackgroundColor;
    
    [self drawView];
    
    [self getTheMotionData];
}

- (void)drawView
{
    UILabel *indicatorLabel = [[UILabel alloc] init];
    self.indicatorLabel = indicatorLabel;
    self.indicatorLabel.textAlignment = NSTextAlignmentCenter;
    self.indicatorLabel.text = @"hahaha";
    self.indicatorLabel.font = [UIFont systemFontOfSize:30];
    self.indicatorLabel.frame = CGRectMake(0, 20, self.view.frame.size.width, 30);
    [self.view addSubview:self.indicatorLabel];
    
    TZUnderIndicatorView *underIndicatorView = [[TZUnderIndicatorView alloc] init];
    self.underIndicatorView = underIndicatorView;
    [self.view addSubview:self.underIndicatorView];
    [self.underIndicatorView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.indicatorLabel.bottom).offset(10);
        make.left.equalTo(self.view.left).offset(5);
        make.right.equalTo(self.view.right).offset(-5);
        make.height.equalTo(self.view.width).offset(10);
    }];
    
    TZNeedleView *needleView = [[TZNeedleView alloc] init];
    self.needleView = needleView;
    [self.view addSubview:self.needleView];
    [self.needleView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.underIndicatorView.top);
        make.bottom.equalTo(self.underIndicatorView.bottom);
        make.left.equalTo(self.underIndicatorView.left);
        make.right.equalTo(self.underIndicatorView.right);
        
    }];
    
    TZBallView *ballView = [[TZBallView alloc] init];
    self.ballView = ballView;
    [self.view addSubview:self.ballView];
    [self.ballView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.underIndicatorView);
        make.height.equalTo(20);
        make.width.equalTo(20);
    }];
    
    
    
}

- (void)getTheMotionData
{
    NSTimeInterval delta = 0.05;
    int value = 0.02;
    NSTimeInterval updateInterval = deviceMotionMin + delta * value;
    
    TZMotionManager *mManager = [TZMotionManager shareTZMotionManager];
    
    __weak typeof(self) weakSelf = self;
    
    if ([mManager isDeviceMotionAvailable] == YES) {
        [mManager setDeviceMotionUpdateInterval:updateInterval];
        [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
            weakSelf.motionModel.gravity = motion.gravity;
            
            self.ballView.transform = CGAffineTransformMakeTranslation(self.motionModel.gravity.x * 500, self.motionModel.gravity.y * 500);
            TZLog(@"%.2f,%.2f,",self.motionModel.gravity.x, self.motionModel.gravity.y);
        }];
    }
}

#pragma mark - 
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    if (newHeading.headingAccuracy < 0) {
        return;
    }
    self.motionModel.magneticHeading = newHeading.magneticHeading;
    
    float radius = self.motionModel.magneticHeading / 180 * M_PI;
    self.indicatorLabel.text = [NSString stringWithFormat:@"%f",self.motionModel.magneticHeading];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        self.needleView.transform = CGAffineTransformMakeRotation(-radius);
    }];
}





@end
