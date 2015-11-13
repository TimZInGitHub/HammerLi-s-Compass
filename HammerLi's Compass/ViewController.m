//
//  ViewController.m
//  HammerLi's Compass
//
//  Created by Tim.Z on 11/13/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "ViewController.h"
#import "TZUnderIndicatorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TZUnderIndicatorView *underIndicatorV = [[TZUnderIndicatorView alloc] init];
    underIndicatorV.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
    underIndicatorV.center = self.view.center;
    [self.view addSubview:underIndicatorV];
}



@end
