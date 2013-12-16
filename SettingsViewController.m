//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Upkar Lidder on 2013-12-08.
//  Copyright (c) 2013 upkar. All rights reserved.
//

#import "SettingsViewController.h"
#import "Constants.h"


@interface SettingsViewController ()

@end

@implementation SettingsViewController

NSString *SettingsViewControllerFinished = @"SettingsViewControllerFinished";
id defaultChanged = @"FALSE";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"settingsTitle", @"This is the title of the Settings view");
        
        // get the defaults
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.defaultTip = [defaults integerForKey:DEFAULT_TIP_KEY];
        NSLog(@"settingsviewcontroller initWithNibName default tip: %d", self.defaultTip);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.descLabel.text = NSLocalizedString(@"settingsFirstLabel", @"Main description label for the settings page");
    self.defaultTipLabel.text = NSLocalizedString(@"settingsSegmentControlLabel", @"Label for segment control");
    NSLog(@"settingsviewcontroller viewDidLoad default tip: %d", self.defaultTip);
    self.defaultTipSegment.selectedSegmentIndex = self.defaultTip;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)defaultTipOptionChanged:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipSegment.selectedSegmentIndex forKey:DEFAULT_TIP_KEY];
    [defaults synchronize];
    defaultChanged = [NSString stringWithFormat:@"TRUE"];
}

- (void) viewDidAppear:(BOOL)animated{
    NSLog(@"settingsviewcontoller viewDidAppear");
}

- (void) viewWillAppear:(BOOL)animated{
    defaultChanged = @"FALSE";
    NSLog(@"settingsviewcontoller viewWillAppear");
}

- (void) viewDidDisappear:(BOOL)animated{
    NSLog(@"settingsviewcontoller viewDidDisappear");
}

- (void) viewWillDisappear:(BOOL)animated{
    NSLog(@"settingsviewcontoller viewWillDisappear");
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:defaultChanged
                                                         forKey:SettingsViewControllerFinished];
    
    
//    [[NSNotificationCenter defaultCenter]
//     postNotificationName:SettingsViewControllerFinished
//     object:defaultChanged];
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:SettingsViewControllerFinished
     object:nil
     userInfo:userInfo];
}

@end
