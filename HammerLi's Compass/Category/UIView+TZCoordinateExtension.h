//
//  UIView+TZCoordinateExtension.h
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/6.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (TZCoordinateExtension)

@property (nonatomic, assign) CGFloat tz_width;
@property (nonatomic, assign) CGFloat tz_height;
@property (nonatomic, assign) CGFloat tz_x;
@property (nonatomic, assign) CGFloat tz_y;
@property (nonatomic, assign) CGFloat tz_centerX;
@property (nonatomic, assign) CGFloat tz_centerY;

@property (nonatomic, assign) CGFloat tz_right;
@property (nonatomic, assign) CGFloat tz_bottom;

- (UIView *(^)(CGFloat))tzMakeWidth;
- (UIView *(^)(CGFloat))tzMakeHeight;
- (UIView *(^)(CGFloat))tzMakeX;
- (UIView *(^)(CGFloat))tzMakeY;
- (UIView *(^)(CGFloat))tzMakeCenterX;
- (UIView *(^)(CGFloat))tzMakeCenterY;

@end
