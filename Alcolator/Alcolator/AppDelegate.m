//
//  AppDelegate.m
//  Alcolator
//
//  Created by Dulio Denis on 10/28/14.
//  Copyright (c) 2014 ddApps. All rights reserved.
//

#import "AppDelegate.h"
//#import "ViewController.h"
#import "MainMenuViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //ViewController *viewController = [[ViewController alloc] init];
    MainMenuViewController *viewController = [[MainMenuViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];    
    return YES;
}

@end
