//
//  TZGeographyCompassViewController.m
//  HammerLi's Compass
//
//  Created by Tim.Z on 11/13/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZGeographyCompassViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "TZMotionManager.h"

static const NSTimeInterval deviceMotionMin = 0.01;

@interface TZGeographyCompassViewController ()  <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *qingxiang;
@property (weak, nonatomic) IBOutlet UILabel *zouxiang;
@property (weak, nonatomic) IBOutlet UILabel *cefujiao;
@property (weak, nonatomic) IBOutlet UILabel *qingjiao;
@property (nonatomic, strong) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet UILabel *temp1;
@property (weak, nonatomic) IBOutlet UILabel *temp2;
@property (weak, nonatomic) IBOutlet UILabel *temp3;
@property (weak, nonatomic) IBOutlet UILabel *temp4;
@property (weak, nonatomic) IBOutlet UILabel *temp5;
@property (weak, nonatomic) IBOutlet UILabel *temp6;
@property (weak, nonatomic) IBOutlet UILabel *temp7;
@property (weak, nonatomic) IBOutlet UILabel *temp8;
@property (weak, nonatomic) IBOutlet UILabel *temp9;
@property (weak, nonatomic) IBOutlet UILabel *temp10;
@property (weak, nonatomic) IBOutlet UILabel *temp11;
@property (weak, nonatomic) IBOutlet UILabel *temp12;


@end

@implementation TZGeographyCompassViewController

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
}

#pragma mark -
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    if (newHeading.headingAccuracy < 0) {
        return;
    }
    CLLocationDirection angle = newHeading.magneticHeading;
    
//    float radius = angle / 180 * M_PI;
    self.qingxiang.text = [NSString stringWithFormat:@"倾向%f",angle];
    
}

- (void)startUp
{
    NSTimeInterval delta = 0.005;
    int value = 0.02;
    NSTimeInterval updateInterval = deviceMotionMin + delta * value;
    
    TZMotionManager *mManager = [TZMotionManager shareTZMotionManager];
    
    __weak typeof(self) weakSelf = self;
    
    if ([mManager isDeviceMotionAvailable] == YES) {
        [mManager setDeviceMotionUpdateInterval:updateInterval];
        [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
            weakSelf.temp1.text = [NSString stringWithFormat:@"attitude.roll:%f",motion.attitude.roll];
            weakSelf.temp2.text = [NSString stringWithFormat:@"attitude.pith:%f",motion.attitude.pitch];
            weakSelf.temp3.text = [NSString stringWithFormat:@"attitude.yaw:%f",motion.attitude.yaw];
            
            weakSelf.temp4.text = [NSString stringWithFormat:@"rotationRate.x:%f",motion.rotationRate.x];
            weakSelf.temp5.text = [NSString stringWithFormat:@"rotationRate.y:%f",motion.rotationRate.y];
            weakSelf.temp6.text = [NSString stringWithFormat:@"rotationRate.z:%f",motion.rotationRate.z];
            
            weakSelf.temp7.text = [NSString stringWithFormat:@"gravity.x:%f",motion.gravity.x];
            weakSelf.temp8.text = [NSString stringWithFormat:@"gravity.y:%f",motion.gravity.y];
            weakSelf.temp9.text = [NSString stringWithFormat:@"gravity.z:%f",motion.gravity.z];
            
            weakSelf.temp10.text = [NSString stringWithFormat:@"userAcceleration.x:%f",motion.userAcceleration.x];
            weakSelf.temp11.text = [NSString stringWithFormat:@"userAcceleration.y:%f",motion.userAcceleration.y];
            weakSelf.temp12.text = [NSString stringWithFormat:@"userAcceleration.z:%f",motion.userAcceleration.z];
        }];
    }
}



















@end
