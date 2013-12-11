//
//  tipcalculatorTests.m
//  tipcalculatorTests
//
//  Created by Upkar Lidder on 2013-12-08.
//  Copyright (c) 2013 upkar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TipViewController.h"
#import "AppDelegate.h"
#import "SettingsViewController.h"

@interface tipcalculatorTests : XCTestCase

@property (nonatomic, readwrite, weak) AppDelegate *appDelegate;
@property (nonatomic, readwrite, weak) TipViewController *tipViewController;
@property (nonatomic, readwrite, weak) UIView *tipView;
@property (nonatomic, readwrite, weak) SettingsViewController *settingsViewController;
@property (nonatomic, readwrite, weak) UIView *settingsView;

@end

@implementation tipcalculatorTests

- (void)setUp
{
    [super setUp];
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    self.tipViewController = self.appDelegate.tipViewController;
    self.tipView = self.tipViewController.view;
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testAppDelegate{
    //test that the appdelegate is not null
    XCTAssertNotNil(self.appDelegate, @"Cannot find appDelegate");
}

- (void) testDefaultValuesOnStart{
    XCTAssertTrue([self.tipViewController.billTextField.text isEqualToString:@""], @"The bill text field should be on empty on start");
    XCTAssertTrue([self.tipViewController.tipLabel.text isEqualToString:@"$0.00"], @"The tip label should be on empty on start");
    XCTAssertTrue([self.tipViewController.totalLabel.text isEqualToString:@"$0.00"], @"The total label should be on empty on start");
//    XCTAssertTrue(self.tipViewController.tipControl.selectedSegmentIndex == 0, @"10%% should be selected on start");
}

- (void) testOnTapMethod{
    //set up the fields
    self.tipViewController.billTextField.text = @"300.00";
    self.tipViewController.tipControl.selectedSegmentIndex = 0;
    
    //send the onTap signal. The main screen is pressed by the user, the tip will now be calculated
    [self.tipViewController onTap:[self.tipView viewWithTag:99]];
    
    NSLog(@"billTextField: %@s",self.tipViewController.billTextField.text);
    NSLog(@"tipLabel: %@s",self.tipViewController.tipLabel.text);
    
    //assert that 10% of 300 is $30.
    XCTAssertTrue([self.tipViewController.tipLabel.text isEqualToString:@"$30.00"], @"10 of 300 is 30");
}

- (void)testSettingsViewShowsWhenSettingsButtonIsClicked{
    [self.tipViewController onSettingsButton];
    id temp = self.tipViewController.navigationController.visibleViewController;
    XCTAssertEqual([temp class], [SettingsViewController class], @"Current controller should be Settings view controller");
}

- (void) testTitleOfMainView{
    XCTAssertEqualObjects(self.tipViewController.title, @"Tip Calculator", "");
}

- (void) testTitleOfSettingsView{
    SettingsViewController *sut = [[SettingsViewController alloc] init];
    [sut view];    // Accessing the view causes it to load
    XCTAssertEqualObjects(@"Settings", sut.title, "");
}
@end
