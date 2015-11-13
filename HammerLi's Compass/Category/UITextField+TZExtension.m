//
//  UITextField+TZExtension.m
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/9.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "UITextField+TZExtension.h"

static NSString * const TZPlaceholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (TZExtension)

@dynamic placeholderColor;

- (UIColor *)placeholderColor
{
    return [self valueForKeyPath:TZPlaceholderColorKey];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
#warning !!!!!!!
    NSString *oldPlaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = oldPlaceholder;
    
    if (placeholderColor == nil) {
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    
    [self setValue:placeholderColor forKeyPath:TZPlaceholderColorKey];
}



@end
