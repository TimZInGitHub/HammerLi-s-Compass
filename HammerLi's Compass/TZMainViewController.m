//
//  TZMainViewController.m
//  HammerLi's Compass
//
//  Created by Tim.Z on 11/13/15.
//  Copyright © 2015 Tim.Z. All rights reserved.
//

#import "TZMainViewController.h"
#import "TZTraditionalCompassViewController.h"
#import "TZTabBar.h"
#import "TZGeographyCompassViewController.h"

@interface TZMainViewController ()

@end

@implementation TZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpChildViewController];
    [self setUpTabBar];
    [self setUpItemTitleAttributes];
}

- (void)setUpItemTitleAttributes
{
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
#warning 如何改selected的字体大小?
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)setUpChildViewController
{
    TZTraditionalCompassViewController *traditionCompassVC = [[TZTraditionalCompassViewController alloc] init];
    traditionCompassVC.tabBarItem.tzTitle(@"Tradition");
    
    [self addChildViewController:traditionCompassVC];
    
    TZGeographyCompassViewController *geographyCompassVC = [[TZGeographyCompassViewController alloc] init];
    geographyCompassVC.tabBarItem.tzTitle(@"Geography");
    [self addChildViewController:geographyCompassVC];
}

- (void)setUpTabBar
{
    [self setValue:[[TZTabBar alloc] init] forKey:@"tabBar"];
}

@end
