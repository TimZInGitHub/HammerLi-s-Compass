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
@property (weak, nonatomic) IBOutlet UILabel *zhenqingxiang;
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

@property (weak, nonatomic) IBOutlet UILabel *attitude;

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
    
    [self startUp];
}

#pragma mark -
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    if (newHeading.headingAccuracy < 0) {
        return;
    }
    CLLocationDirection angle = newHeading.magneticHeading;
    
//    float radius = angle / 180 * M_PI;
    self.qingxiang.text = [NSString stringWithFormat:@"%.2f",angle];
    
}

- (void)startUp
{
    NSTimeInterval delta = 0.05;
    int value = 0.02;
    NSTimeInterval updateInterval = deviceMotionMin + delta * value;
    
    TZMotionManager *mManager = [TZMotionManager shareTZMotionManager];
    
    __weak typeof(self) weakSelf = self;
    
    if ([mManager isDeviceMotionAvailable] == YES) {
        [mManager setDeviceMotionUpdateInterval:updateInterval];
        [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
//            weakSelf.temp1.text = [NSString stringWithFormat:@"attitude.roll:%.2f",motion.attitude.roll];
//            weakSelf.temp2.text = [NSString stringWithFormat:@"attitude.pith:%.2f",motion.attitude.pitch];
//            weakSelf.temp3.text = [NSString stringWithFormat:@"attitude.yaw:%.2f",motion.attitude.yaw];
            
            weakSelf.temp1.text = [NSString stringWithFormat:@"attitude.roll:%.1f",motion.attitude.roll * 10];
            weakSelf.temp2.text = [NSString stringWithFormat:@"attitude.pith:%.1f",motion.attitude.pitch * 10];
            weakSelf.temp3.text = [NSString stringWithFormat:@"attitude.yaw:%.1f",motion.attitude.yaw * 10];
            
            weakSelf.temp4.text = [NSString stringWithFormat:@"Rate.x:%.2f",motion.rotationRate.x];
            weakSelf.temp5.text = [NSString stringWithFormat:@"Rate.y:%.2f",motion.rotationRate.y];
            weakSelf.temp6.text = [NSString stringWithFormat:@"Rate.z:%.2f",motion.rotationRate.z];
            
            weakSelf.temp7.text = [NSString stringWithFormat:@"gravity.x:%.2f",motion.gravity.x * 10];
            weakSelf.temp8.text = [NSString stringWithFormat:@"gravity.y:%.2f",motion.gravity.y * 10];
            weakSelf.temp9.text = [NSString stringWithFormat:@"gravity.z:%.2f",motion.gravity.z * 10];
            
            weakSelf.temp10.text = [NSString stringWithFormat:@"tion.x:%.2f",motion.userAcceleration.x];
            weakSelf.temp11.text = [NSString stringWithFormat:@"tion.y:%.2f",motion.userAcceleration.y];
            weakSelf.temp12.text = [NSString stringWithFormat:@"tion.z:%.2f",motion.userAcceleration.z];
            
            self.attitude.text = [NSString stringWithFormat:@"x:%.2f y:%.2f z:%.2f w:%.2f",motion.attitude.quaternion.x, motion.attitude.quaternion.y, motion.attitude.quaternion.z, motion.attitude.quaternion.w];
//            TZLog(@"%s",self.attitude.text);
            
            self.qingjiao.text = [NSString stringWithFormat:@"%.2f",acosf(fabsf(motion.gravity.z)) / M_PI * 180];

            float angleYaw = (motion.attitude.yaw + 3) / 3 * 180;
            
            
            
            self.zhenqingxiang.text = [NSString stringWithFormat:@"%.2f", angleYaw-68];
            
            if (self.qingxiang.text) {
                
                self.zouxiang.text = [NSString stringWithFormat:@"%.2f",angleYaw-68 - [self.qingxiang.text floatValue]];
            }
            
            }];
    }
    [self math];
}

- (void)math
{

    
}





















@end
