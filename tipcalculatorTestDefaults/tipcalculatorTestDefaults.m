//
//  tipcalculatorTestDefaults.m
//  tipcalculatorTestDefaults
//
//  Created by Upkar Lidder on 2013-12-13.
//  Copyright (c) 2013 upkar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TipViewController.h"

@interface tipcalculatorTestDefaults : XCTestCase

@end

@implementation tipcalculatorTestDefaults{
    TipViewController *sut;
}

- (void) setUp{
    [super setUp];
    sut = [[TipViewController alloc] init];
}

- (void) testInitialBillTextFieldIsZero{
    //given
    [sut view];
    //when
    //then
    XCTAssertTrue([sut.billTextField.text length] == 0, "");
}

- (void) testInitialTipLabelIsZero{
    //given
    [sut view];
    //when
    //then
    XCTAssertEqualObjects(sut.tipLabel.text, @"$0.00", "");
}

- (void) testInitialTotalLabelIsZero{
    //given
    [sut view];
    //when
    //then
    XCTAssertEqualObjects(sut.totalLabel.text, @"$0.00", "");
}

- (void) testInitialTipControlSegementIsEqualToDefaultValue{
    //given
    [sut view];
    //when
    //then
    XCTAssertEqualObjects(sut.totalLabel.text, @"$0.00", "");
}

@end
