//
//  tipcalculator_Tests.m
//  tipcalculator Tests
//
//  Created by Upkar Lidder on 2013-12-12.
//  Copyright (c) 2013 upkar. All rights reserved.
//
// Is the Outlet hooked up?
// Is the Outlet connection to an action?
// Invoke action directly

#import <XCTest/XCTest.h>
#import "TipViewController.h"

@interface tipcalculatorTestOutletsAndActions : XCTestCase

@end

@implementation tipcalculatorTestOutletsAndActions{
    TipViewController *sut;
}


- (void) setUp{
    [super setUp];
    sut = [[TipViewController alloc] init];
}

- (void) testOutletShouldBeConnected{
    //given
    
    //[sut view];
    //when
    //then
}

- (void) testBillTextFieldShouldBeConnected{
    //given
    [sut view];
    //when
    //then
    XCTAssertNotNil(sut.billTextField, "");
}

- (void) testTipLabelShouldBeConnected{
    //given
    [sut view];
    //when
    //then
    XCTAssertNotNil(sut.tipLabel, "");
}

- (void) testTipControlShouldBeConnected{
    //given
    [sut view];
    //when
    //then
    XCTAssertNotNil(sut.tipControl, "");
}

- (void) testTotalLabelShouldBeConnected{
    //given
    [sut view];
    //when
    //then
    XCTAssertNotNil(sut.totalLabel, "");
}

- (void) testTipControllSegementAction{
    //when
    [sut view];
    //given
    //then
    UISegmentedControl *control = sut.tipControl;
    NSArray *actions = [control actionsForTarget:sut forControlEvent:UIControlEventValueChanged];
    XCTAssertTrue([actions containsObject:@"onTap:"], "");
}

- (void) testOnTapShouldUpdateTipLabel{
    //given
    [sut view];
    sut.billTextField.text = @"100";
    UISegmentedControl *control =  sut.tipControl;
    control.selectedSegmentIndex = 0;
    //when
    [sut onTap:control];
    //then
    XCTAssertEqualObjects(sut.tipLabel.text, @"$10.00", "");
}
@end
