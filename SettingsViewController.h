//
//  SettingsViewController.h
//  tipcalculator
//
//  Created by Upkar Lidder on 2013-12-08.
//  Copyright (c) 2013 upkar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@interface SettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *defaultTipLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipSegment;

extern NSString *SettingsViewControllerFinished;

@property(assign) int defaultTip;

@end


