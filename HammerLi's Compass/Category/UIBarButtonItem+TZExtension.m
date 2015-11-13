//
//  UIBarButtonItem+TZExtension.m
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/7.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "UIBarButtonItem+TZExtension.h"

@implementation UIBarButtonItem (TZExtension)

+ (instancetype)tz_initWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}


@end
