//
//  AppDelegate.m
//  Alcolator
//
//  Created by Dulio Denis on 10/28/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "WhiskeyViewController.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *wineVC= [[ViewController alloc] init];
    WhiskeyViewController *whiskeyVC = [[WhiskeyViewController alloc] init];
    
    UITabBarController *tabBarVC= [[UITabBarController alloc] init];
    tabBarVC.viewControllers = @[wineVC, whiskeyVC];
    tabBarVC.delegate = self;
    
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];    
    return YES;
}


- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController {
    NSLog(@"New view controller selected: %@", viewController.title);
}

@end
