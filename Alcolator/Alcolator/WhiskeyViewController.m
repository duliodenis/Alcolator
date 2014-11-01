//
//  WhiskeyViewController.m
//  Alcolator
//
//  Created by Dulio Denis on 11/1/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController


- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.title = NSLocalizedString(@"Whiskey", @"Whiskey title");
    }
    
    return self;
}


- (void)buttonPressed:(id)sender {
    [self.beerPercentTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeer = 12; // 12oz can
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] /100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeer * alcoholPercentageOfBeer;
    float ouncesofAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesInOneWhiskyShot = 1; // a 1oz shot
    float alcoholPercentageOfWhisky = 0.4f; // 40 proof
    
    float ouncesOfAlcoholPerWhiskyShot = ouncesInOneWhiskyShot * alcoholPercentageOfWhisky;
    float numberOfWhiskyShotsForEquivalentAlcoholAmount = ouncesofAlcoholTotal / ouncesOfAlcoholPerWhiskyShot;
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer form");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural beer form");
    }
    
    NSString *whiskeyText;
    
    if (numberOfWhiskyShotsForEquivalentAlcoholAmount == 1) {
        whiskeyText = NSLocalizedString(@"shot", @"singular whiskey form");
    } else {
        whiskeyText = NSLocalizedString(@"shots", @"plural whiskey form");
    }
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ contains as much alcohol as %.1f %@ of whiskey.", nil), numberOfBeers, beerText, numberOfWhiskyShotsForEquivalentAlcoholAmount, whiskeyText];
    self.resultLabel.text = resultText;
}


@end
