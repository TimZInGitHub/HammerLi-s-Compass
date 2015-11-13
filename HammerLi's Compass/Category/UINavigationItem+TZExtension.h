//
//  UINavigationItem+TZExtension.h
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/7.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (TZExtension)

- (UINavigationItem *(^)(NSString *))tzTitle;
- (UINavigationItem *(^)(UIView *))tzTitleView;
- (UINavigationItem *(^)(NSArray<UIBarButtonItem *> *))tzLeftBarButtonItems;
- (UINavigationItem *(^)(NSArray<UIBarButtonItem *> *))tzRightBarButtonItems;
- (UINavigationItem *(^)(UIBarButtonItem *))tzLeftBarButtonItem;
- (UINavigationItem *(^)(UIBarButtonItem *))tzRightBarButtonItem;

@end
