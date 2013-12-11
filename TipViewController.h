//
//  TipViewController.h
//  tipcalculator
//
//  Created by Upkar Lidder on 2013-12-08.
//  Copyright (c) 2013 upkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (assign) int defaultTip;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;

@end
