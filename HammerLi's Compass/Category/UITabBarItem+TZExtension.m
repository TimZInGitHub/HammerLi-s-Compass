//
//  UITabBarItem+TZExtension.m
//  TZBSBDJ
//
//  Created by Tim.Z on 15/11/6.
//  Copyright © 2015年 Tim.Z. All rights reserved.
//

#import "UITabBarItem+TZExtension.h"

@implementation UITabBarItem (TZExtension)


- (UITabBarItem *(^)(UIImage *))tzSelectedImage
{
    return ^(UIImage *image){
        self.selectedImage = image;
        
        return self;
    };
}

- (UITabBarItem *(^)(UIImage *))tzImage
{
    return ^(UIImage *image){
        self.image = image;
        
        return self;
    };
}

- (UITabBarItem *(^)(NSString *))tzTitle
{
    return ^(NSString *title){
        self.title = title;
        
        return self;
    };
}


@end
