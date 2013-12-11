//
//  AppDelegate.h
//  tipcalculator
//
//  Created by Upkar Lidder on 2013-12-08.
//  Copyright (c) 2013 upkar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipViewController.h"
#import "SettingsViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TipViewController *tipViewController;
@property (strong, nonatomic) SettingsViewController *settingsViewController;

@end
