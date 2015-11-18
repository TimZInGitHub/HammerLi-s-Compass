//
//  TZBallView.m
//  HammerLi's Compass
//
//  Created by Tim.Z on 11/17/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZBallView.h"

@implementation TZBallView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawArc];
    TZFUNC
}


- (void)drawArc
{
    NSArray *dataArray = @[@25, @25, @50];
    
    CGPoint center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    CGFloat radius = self.frame.size.width * 0.5 ;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    
    for (NSNumber *num in dataArray) {
        startA = endA;
        angle = num.intValue / 100.0 * M_PI * 2;
        endA = startA + angle;
        UIBezierPath  *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[UIColor greenColor] set];
        [path fill];
    }
}

@end
