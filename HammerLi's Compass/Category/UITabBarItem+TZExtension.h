//
//  UITabBarItem+TZExtension.h
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/6.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (TZExtension)

- (UITabBarItem *(^)(UIImage *))tzSelectedImage;
- (UITabBarItem *(^)(UIImage *))tzImage;
- (UITabBarItem *(^)(NSString *))tzTitle;

@end
