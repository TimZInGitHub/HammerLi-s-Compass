//
//  TZTraditionalCompassViewController.m
//  HammerLi's Compass
//
//  Created by Tim.Z on 11/13/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZTraditionalCompassViewController.h"
#import "TZUnderIndicatorView.h"
#import "TZNeedleView.h"


@interface TZTraditionalCompassViewController ()

@property (nonatomic, weak) UILabel *indicatorLabel;

@end

@implementation TZTraditionalCompassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = TZCommonBackgroundColor;
    
    TZUnderIndicatorView *underIndicatorView = [[TZUnderIndicatorView alloc] init];
    [self.view addSubview:underIndicatorView];
    [underIndicatorView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(150);
        make.left.equalTo(self.view.left).offset(5);
        make.right.equalTo(self.view.right).offset(-5);
        make.height.equalTo(self.view.width).offset(10);
    }];
    
    TZNeedleView *needleView = [[TZNeedleView alloc] init];
    [self.view addSubview:needleView];
    [needleView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(underIndicatorView.top);
        make.bottom.equalTo(underIndicatorView.bottom);
        make.left.equalTo(underIndicatorView.left);
        make.right.equalTo(underIndicatorView.right);
        
    }];
    
    UILabel *indicatorLabel = [[UILabel alloc] init];
    self.indicatorLabel = indicatorLabel;
    self.indicatorLabel.text = @"hahaha";
    [self.indicatorLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(64);
        make.left.equalTo(self.view.left).offset(50);
        make.right.equalTo(self.view.right).offset(-50);
        make.height.equalTo(25);
        
    }];

    

    
    
}




@end
