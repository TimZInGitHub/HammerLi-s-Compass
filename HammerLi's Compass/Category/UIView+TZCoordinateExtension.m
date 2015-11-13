//
//  UIView+TZCoordinateExtension.m
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/6.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "UIView+TZCoordinateExtension.h"


@implementation UIView (TZCoordinateExtension)
#pragma mark - property
@dynamic tz_width;
@dynamic tz_height;
@dynamic tz_x;
@dynamic tz_y;
@dynamic tz_centerX;
@dynamic tz_centerY;

@dynamic tz_right;
@dynamic tz_bottom;

#pragma mark - getter
- (CGFloat)tz_width
{
    return self.frame.size.width;
}

- (CGFloat)tz_height
{
    return self.frame.size.height;
}

- (CGFloat)tz_x
{
    return self.frame.origin.x;
}

- (CGFloat)tz_y
{
    return self.frame.origin.y;
}

- (CGFloat)tz_centerX
{
    return self.center.x;
}

- (CGFloat)tz_centerY
{
    return self.center.y;
}

- (CGFloat)tz_right
{
        //    return self.tz_x + self.tz_width;
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)tz_bottom
{
        //    return self.tz_y + self.tz_height;
    return CGRectGetMaxY(self.frame);
}


#pragma mark - setter

- (void)setTz_width:(CGFloat)tz_width
{
    CGRect frame = self.frame;
    frame.size.width = tz_width;
    self.frame = frame;
}

- (void)setTz_height:(CGFloat)tz_height
{
    CGRect frame = self.frame;
    frame.size.height = tz_height;
    self.frame = frame;
}

- (void)setTz_x:(CGFloat)tz_x
{
    CGRect frame = self.frame;
    frame.origin.x = tz_x;
    self.frame = frame;
}


- (void)setTz_y:(CGFloat)tz_y
{
    CGRect frame = self.frame;
    frame.origin.y = tz_y;
    self.frame = frame;
}


- (void)setTz_centerX:(CGFloat)tz_centerX
{
    CGPoint center = self.center;
    center.x = tz_centerX;
    self.center = center;
}


- (void)setTz_centerY:(CGFloat)tz_centerY
{
    CGPoint center = self.center;
    center.y = tz_centerY;
    self.center = center;
}


- (void)setTz_right:(CGFloat)tz_right
{
    self.tz_x = tz_right - self.tz_width;
}

- (void)setTz_bottom:(CGFloat)tz_bottom
{
    self.tz_y = tz_bottom - self.tz_height;
}

#pragma mark - makeValue
- (UIView *(^)(CGFloat))tzMakeWidth
{
    return ^(CGFloat width){
        self.tz_width = width;
        
        return self;
    };
}

- (UIView *(^)(CGFloat))tzMakeHeight
{
    return ^(CGFloat height){
        self.tz_height = height;
        
        return self;
    };
}

- (UIView *(^)(CGFloat))tzMakeX
{
    return ^(CGFloat x){
        self.tz_x = x;
        
        return self;
    };
}

- (UIView *(^)(CGFloat))tzMakeY
{
    return ^(CGFloat y){
        self.tz_y = y;
        
        return self;
    };
}

- (UIView *(^)(CGFloat))tzMakeCenterX
{
    return ^(CGFloat centerX){
        self.tz_centerX = centerX;
        
        return self;
    };
}

- (UIView *(^)(CGFloat))tzMakeCenterY
{
    return ^(CGFloat centerY){
        self.tz_centerY = centerY;
        
        return self;
    };
}



@end
