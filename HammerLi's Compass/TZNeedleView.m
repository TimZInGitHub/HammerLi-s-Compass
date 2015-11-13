//
//  TZNeedleView.m
//  HammerLi's Compass
//
//  Created by Tim.Z on 11/13/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZNeedleView.h"

@implementation TZNeedleView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
//        self.backgroundColor = TZCommonBackgroundColor;
        
        UIImageView *needleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"needle"]];
        [self addSubview:needleView];
        
        [needleView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.centerX);
            make.centerY.equalTo(self.centerY).offset(-6);
            make.height.equalTo(self.height).offset(80);
            make.width.equalTo(40);
        }];
    }
    
    return self;
}

@end
