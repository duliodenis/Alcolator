//
//  ViewController.h
//  Alcolator
//
//  Created by Dulio Denis on 10/28/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) UITextField *beerPercentTextField;
@property (weak, nonatomic) UISlider *beerCountSlider;
@property (weak, nonatomic) UILabel *resultLabel;
@property (weak, nonatomic) UILabel *sliderValueLabel;


- (void)buttonPressed:(id)sender;
@end

