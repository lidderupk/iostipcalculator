//
//  TipViewController.m
//  tipcalculator
//
//  Created by Upkar Lidder on 2013-12-08.
//  Copyright (c) 2013 upkar. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"
#import "Constants.h"

@interface TipViewController ()

@end

@implementation TipViewController{
    NSInteger currentTip;
    id defaultsChangedInSettingsController;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
        [self.view setTag:[@(99) integerValue]];
        [self.tipLabel setTag:[@(100) integerValue]];
        [self.totalLabel setTag:[@(101) integerValue]];
        [self.tipControl setTag:[@(102) integerValue]];
        [self.billTextField setTag:[@(103) integerValue]];
        
        //get the default tip
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.defaultTip = [defaults integerForKey:DEFAULT_TIP_KEY];
        NSLog(@"tipviewcontroller initWithNibName default tip: %d", self.defaultTip);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    self.tipControl.selectedSegmentIndex = self.defaultTip;
    NSLog(@"tipviewcontroller viewDidLoad default tip: %d", self.defaultTip);
    
    //register observer on settingsviewcontroller returning defaultchanged
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(downloadFinished:)
                                                 name:SettingsViewControllerFinished
                                               object:nil];
    
//    [self updateValues];
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues{
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.20)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    
    //write back to the labels
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
//    defaultsChangedInSettingsController = nil;
}

- (void) onSettingsButton{
    SettingsViewController *svc = [[SettingsViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}

- (void) viewDidAppear:(BOOL)animated{
    NSLog(@"tipviewcontroller viewDidAppear");
}

- (void) viewWillAppear:(BOOL)animated{
    NSLog(@"tipviewcontroller viewWillAppear");
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    self.defaultTip = [defaults integerForKey:DEFAULT_TIP_KEY];
//    self.tipControl.selectedSegmentIndex = self.defaultTip;
//    [self updateValues];
//    NSLog(@"tipviewcontroller viewWillAppear default tip: %d", self.defaultTip);
}

- (void) viewDidDisappear:(BOOL)animated{
    NSLog(@"tipviewcontroller viewDidDisappear");
}

- (void) viewWillDisappear:(BOOL)animated{
    NSLog(@"tipviewcontroller viewWillDisappear");
}

- (void)downloadFinished:(NSNotification *)notification {

    NSLog(@"TipViewController downloadFinished called");
    NSDictionary *userInfo = [notification userInfo];
    defaultsChangedInSettingsController = [userInfo objectForKey:SettingsViewControllerFinished];
    
    
    if([defaultsChangedInSettingsController isEqualToString:@"TRUE"]){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.defaultTip = [defaults integerForKey:DEFAULT_TIP_KEY];
        self.tipControl.selectedSegmentIndex = self.defaultTip;
        [self updateValues];
        //    NSLog(@"tipviewcontroller viewWillAppear default tip: %d", self.defaultTip);
    }
//    [self updateValues];
}
@end
