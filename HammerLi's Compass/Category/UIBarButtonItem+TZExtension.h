//
//  UIBarButtonItem+TZExtension.h
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/7.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (TZExtension)

+ (instancetype)tz_initWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
