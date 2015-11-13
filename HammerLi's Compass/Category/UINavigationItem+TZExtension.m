//
//  UINavigationItem+TZExtension.m
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/7.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "UINavigationItem+TZExtension.h"

@implementation UINavigationItem (TZExtension)

- (UINavigationItem *(^)(NSString *))tzTitle
{
    return ^(NSString *title){
        self.title = title;
        
        return self;
    };
}

- (UINavigationItem *(^)(UIView *))tzTitleView
{
    return ^(UIView *image){
        self.titleView = image;
        
        return self;
    };
}

- (UINavigationItem *(^)(NSArray<UIBarButtonItem *> *))tzLeftBarButtonItems
{
    return ^(NSArray<UIBarButtonItem *> *leftBarButtonItems){
        self.leftBarButtonItems = leftBarButtonItems;
        
        return self;
    };
}

- (UINavigationItem *(^)(NSArray<UIBarButtonItem *> *))tzRightBarButtonItems
{
    return ^(NSArray<UIBarButtonItem *> *rightBarButtonItems){
        self.rightBarButtonItems = rightBarButtonItems;
        
        return self;
    };
}

- (UINavigationItem *(^)(UIBarButtonItem *))tzLeftBarButtonItem
{
    return ^(UIBarButtonItem *leftBarButtonItem){
        self.leftBarButtonItem = leftBarButtonItem;
        
        return self;
    };
}

- (UINavigationItem *(^)(UIBarButtonItem *))tzRightBarButtonItem
{
    return ^(UIBarButtonItem *RightBarButtonItem){
        self.rightBarButtonItem = RightBarButtonItem;
        
        return self;
    };
}

@end
