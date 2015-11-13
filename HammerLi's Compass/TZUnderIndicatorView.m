//
//  TZUnderIndicatorView.m
//  HammerLi's Compass
//
//  Created by Tim.Z on 11/13/15.
//  Copyright © 1015 Tim.Z. All rights reserved.
//

#import "TZUnderIndicatorView.h"

@implementation TZUnderIndicatorView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.backgroundColor = TZCommonBackgroundColor;

    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawArc];
    [self drawLine];
}

- (void)drawLine
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat originalAngle = 0;
    
    for (int i = 0; i < 4; ++i) {
        [path moveToPoint:[self makePoingWithCenter:CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5) radius:self.frame.size.width * 0.5 - 10 angle:originalAngle]];
        
        [path addLineToPoint:[self makePoingWithCenter:CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5) radius:self.frame.size.width * 0.5 - 10 angle:originalAngle + 180]];
        
        originalAngle = originalAngle + 45;
    }
    
    
    CGContextSetLineWidth(ctx, 2);
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    [[UIColor blackColor] set];
    
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextStrokePath(ctx);
    
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    
    CGFloat originalAngle2 = 0;
    
    originalAngle = 0;
    
    for (int i = 0; i < 72; ++i) {
        [path2 moveToPoint:[self makePoingWithCenter:CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5) radius:self.frame.size.width * 0.5 angle:originalAngle2]];
        
        [path2 addLineToPoint:[self makePoingWithCenter:CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5) radius:self.frame.size.width * 0.5 - 10 angle:originalAngle2]];
        
        originalAngle2 = originalAngle2 + 5;
    }
    
    CGContextSetLineWidth(ctx2, 2);
    CGContextSetLineJoin(ctx2, kCGLineJoinMiter);
    CGContextSetLineCap(ctx2, kCGLineCapSquare);
    [[UIColor darkGrayColor] set];
    
    CGContextAddPath(ctx2, path2.CGPath);
    
    CGContextStrokePath(ctx2);
    
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
        [[UIColor whiteColor] set];
        [path fill];
    }
    
    for (NSNumber *num in dataArray) {
        startA = endA;
        angle = num.intValue / 100.0 * M_PI * 2;
        endA = startA + angle;
        UIBezierPath  *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius - 10 startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[UIColor yellowColor] set];
        [path fill];
    }
}

- (CGPoint)makePoingWithCenter:(CGPoint)center radius:(CGFloat)radius angle:(CGFloat)angle
{
    CGFloat pX = 0;
    CGFloat pY = 0;
    
    angle = angle / 180 * M_PI;
    
    pX = center.x + radius * sin(angle);
    pY = center.y - radius * cos(angle);
    
    CGPoint newPoint = CGPointMake(pX, pY);
    
    return newPoint;
}








@end
