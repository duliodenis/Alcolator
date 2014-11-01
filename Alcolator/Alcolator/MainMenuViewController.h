//
//  MainMenuViewController.h
//  Alcolator
//
//  Created by Dulio Denis on 11/1/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController
@property (nonatomic) UIButton *wineButton;
@property (nonatomic) UIButton *whiskyButton;

- (void)winePressed:(UIButton *)sender;
- (void)whiskeyPressed:(UIButton *)sender;

@end
