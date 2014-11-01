//
//  MainMenuViewController.m
//  Alcolator
//
//  Created by Dulio Denis on 11/1/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

#import "MainMenuViewController.h"
#import "ViewController.h"
#import "WhiskeyViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

#pragma mark - Lifecycle Methods

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.wineButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.whiskyButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.view addSubview:self.wineButton];
    [self.view addSubview:self.whiskyButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.495 green:0.607 blue:1.000 alpha:1.000];
    self.title = @"Select Drink";
    
    // Set the button to call buttonPressed on TouchUp Inside Event and set title
    [self.wineButton addTarget:self action:@selector(winePressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.wineButton setTitle:NSLocalizedString(@"Wine", @"Wine Button") forState:UIControlStateNormal];
    
    // Set the button to call buttonPressed on TouchUp Inside Event and set title
    [self.whiskyButton addTarget:self action:@selector(whiskeyPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.whiskyButton setTitle:NSLocalizedString(@"Whisky", @"Whisky Button") forState:UIControlStateNormal];
}

- (void)viewWillLayoutSubviews {
    UIFont *boldFont = [UIFont fontWithName:@"Avenir-Heavy" size:14];
    UIColor *textColor = [UIColor whiteColor];
    
    int iPadWidth = 0;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        iPadWidth = 300;
    }

    self.wineButton.frame = CGRectMake(40, 200, 50, 50);
    self.wineButton.titleLabel.font = boldFont;
    [self.wineButton setTitleColor:textColor forState:UIControlStateNormal];
    
    self.whiskyButton.frame = CGRectMake(200+iPadWidth, 200, 50, 50);
    self.whiskyButton.titleLabel.font = boldFont;
    [self.whiskyButton setTitleColor:textColor forState:UIControlStateNormal];
}


#pragma mark - Button Pressed Methods

- (void)winePressed:(UIButton *)sender {
    ViewController *viewController = [[ViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)whiskeyPressed:(UIButton *)sender {
    WhiskeyViewController *viewController = [[WhiskeyViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
