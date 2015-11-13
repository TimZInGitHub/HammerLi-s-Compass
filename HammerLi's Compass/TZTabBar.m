//
//  TZTabBar.m
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/6.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "TZTabBar.h"
#import "UIView+TZCoordinateExtension.h"
#import <objc/runtime.h>

@interface TZTabBar ()



@end

@implementation TZTabBar

#pragma mark - lazyloading


#pragma mark - initialization
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    unsigned int count;
//    Ivar *ivaList = class_copyIvarList([UITabBarController class], &count);
//    for (int i = 0; i < count; ++i) {
//        Ivar ivar = ivaList[i];
//        NSLog(@"%s", ivar_getName(ivar));
//    }
//    free(ivaList);

    
}


@end


