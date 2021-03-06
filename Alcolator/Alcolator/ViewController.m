//
//  ViewController.m
//  Alcolator
//
//  Created by Dulio Denis on 10/28/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) UIButton *calculateButton;
@property (weak, nonatomic) UITapGestureRecognizer *hideKeyboardTapGestureRecognizer;
@end

@implementation ViewController


#pragma mark - View Lifecycle

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.title = NSLocalizedString(@"Wine", @"Wine title");
        [self.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -18)];
    }
    
    return self;
}


- (void)loadView {
    // Allocate and intialize the all-encompassing view
    self.view = [[UIView alloc] init];
    
    // Allocate and initialize each of the views and the gesture recognizer
    UITextField *textField = [[UITextField alloc] init];
    UISlider *slider = [[UISlider alloc]init];
    UILabel *label = [[UILabel alloc]init];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    UILabel *label2 = [[UILabel alloc] init];
    
    [self.view addSubview:textField];
    [self.view addSubview:slider];
    [self.view addSubview:label];
    [self.view addSubview:button];
    [self.view addSubview:label2];
    [self.view addGestureRecognizer:tap];
    
    // Assign the views and gesture recognizer to our properties
    self.beerPercentTextField = textField;
    self.beerCountSlider = slider;
    self.resultLabel = label;
    self.sliderValueLabel = label2;
    self.calculateButton = button;
    self.hideKeyboardTapGestureRecognizer = tap;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set primary view background to lightGrayColor
    self.view.backgroundColor = [UIColor colorWithRed:0.465 green:0.427 blue:0.667 alpha:1.000];
    
    // set the delegate to the text field to be self and the placeholder text
    self.beerPercentTextField.delegate = self;
    self.beerPercentTextField.placeholder = NSLocalizedString(@"% Alcohol Content Per Beer", @"Beer percent placeholder text");
    
    // Set beerCountSlider to call sliderValueDidChange when the value changes
    [self.beerCountSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    // Set the minimum and maximum number of beers
    self.beerCountSlider.minimumValue = 1.0f;
    self.beerCountSlider.maximumValue = 10.0f;
    
    // Set the button to call buttonPressed on TouchUp Inside Event and set title
    [self.calculateButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.calculateButton setTitle:NSLocalizedString(@"Calculate!", @"Calculate Command") forState:UIControlStateNormal];
    
    // Set the tap gesture recognizer to call tapGestureDidFire: when a tap is detected
    [self.hideKeyboardTapGestureRecognizer addTarget:self action:@selector(tapGestureDidFire:)];

    // Remove the maximum number of lines on the label
    self.resultLabel.numberOfLines = 0;
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UIFont *font = [UIFont fontWithName:@"Avenir-Light" size:14];
    UIFont *boldFont = [UIFont fontWithName:@"Avenir-Heavy" size:14];
    UIColor *textColor = [UIColor whiteColor];
    
    CGFloat viewWidth = 320;
    
    if (([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft) ||
        ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight)) {
        viewWidth = 480;
    }
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        viewWidth = 680;
    }
    
    CGFloat padding = 20;
    CGFloat itemWidth = viewWidth - padding - padding;
    CGFloat itemHeight = 44; //+ 84; Added Navigation Bar
    
    self.beerPercentTextField.frame = CGRectMake(padding, padding, itemWidth, itemHeight);
    self.beerPercentTextField.font = font;
    self.beerPercentTextField.textColor = textColor;
    self.beerPercentTextField.tintColor = textColor;
    self.beerPercentTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.beerPercentTextField.placeholder attributes:@{NSForegroundColorAttributeName: textColor}];
    
    CGFloat bottomOfTextField = CGRectGetMaxY(self.beerPercentTextField.frame);
    self.beerCountSlider.frame = CGRectMake(padding, bottomOfTextField + padding, itemWidth, itemHeight);
    self.beerCountSlider.tintColor = textColor;
    
    CGFloat bottomOfSlider = CGRectGetMaxY(self.beerCountSlider.frame);
    self.resultLabel.frame = CGRectMake(padding, bottomOfSlider + padding, itemWidth, itemHeight);
    self.resultLabel.font = font;
    self.resultLabel.textColor = textColor;
    self.resultLabel.tintColor = textColor;
    
    CGFloat bottomOfLabel = CGRectGetMaxY(self.resultLabel.frame);
    self.calculateButton.frame = CGRectMake(padding, bottomOfLabel + padding, itemWidth, itemHeight);
    self.calculateButton.titleLabel.font = boldFont;
    [self.calculateButton setTitleColor:textColor forState:UIControlStateNormal];
}


#pragma mark - Action Methods

- (void)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    
    if (enteredNumber == 0) {
        sender.text = nil;
    }
}


- (void)sliderValueDidChange:(UISlider *)sender {
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d",(int)sender.value]];
    [self.beerPercentTextField resignFirstResponder];
}



- (void)buttonPressed:(id)sender {
    [self.beerPercentTextField resignFirstResponder];
    
    // calculate how much alcohol is in all those beers
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12; // assumption: 12oz beer bottles
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    // calculate the equivalent amount of wine
    float ouncesInOneWineGlass = 5; // smaller 5oz wine glass
    float alcoholPercentageOfWine = 0.13; // 13% average
    
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    // decide on pluralization
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *wineText;
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural glasses");
    }
    
    // generate the result text, and display it on the label
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ contains as much alcohol as %.1f %@ of wine.", nil), numberOfBeers, beerText, numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
    
    self.resultLabel.text = resultText;
}


#pragma mark - Gesture Method

- (void)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}


#pragma mark - Status Bar Tint

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
