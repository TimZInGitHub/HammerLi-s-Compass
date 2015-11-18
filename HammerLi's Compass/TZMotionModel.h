//
//  TZMotionModel.h
//  HammerLi's Compass
//
//  Created by Tim.Z on 11/17/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "TZMotionManager.h"


@interface TZMotionModel : NSObject

@property (nonatomic) CMAcceleration gravity;
@property (nonatomic) CLLocationDirection magneticHeading;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end
