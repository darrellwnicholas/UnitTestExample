//
//  PlayingCardTestCase.m
//  UnitTestsCardExample
//
//  Created by Darrell Nicholas on 1/31/15.
//  Copyright (c) 2015 Darrell Nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PlayingCard.h"

@interface PlayingCardTestCase : XCTestCase

@end

@implementation PlayingCardTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// writing test case to protect the requirements of the class. Tests like these will ensure that the code we write or refactor doesn't break functionality in the future...
- (void)testTheValidSuits
{
    NSArray *theSuits = [PlayingCard validSuits];
    NSUInteger howMany = [theSuits count];
    XCTAssertEqual(howMany, 4, @"Should only be 4");
    XCTAssertTrue([theSuits containsObject:@"♥"], "@Must have a heart");
    XCTAssertTrue([theSuits containsObject:@"♦"], "@Must have a diamond");
    XCTAssertTrue([theSuits containsObject:@"♠"], "@Must have a spade");
    XCTAssertTrue([theSuits containsObject:@"♣"], "@Must have a club");
}

// checking that when I set the suit value with a proper value, and I'm checking all 4 suits, that they work. This test is also validating the getter method as well.
- (void)testSetSuitAnyValidAccepted
{
    PlayingCard *card = [[PlayingCard alloc] init];
    [card setSuit:@"♥"];
    XCTAssertEqualObjects(card.suit, @"♥", "Should be a Heart");
    [card setSuit:@"♦"];
    XCTAssertEqualObjects(card.suit, @"♦", "Should be a Diamond");
    [card setSuit:@"♠"];
    XCTAssertEqualObjects(card.suit, @"♠", "Should be a Spade");
    [card setSuit:@"♣"];
    XCTAssertEqualObjects(card.suit, @"♣", "Should be a Club");
}

// Here I am checking if I attempt to set 'suit' to a nonsense value that it will both always answer '?' when checked and that 'suit' did not accept the input.
- (void)testSetSuitInvalidRejected
{
    PlayingCard *card = [[PlayingCard alloc] init];
    [card setSuit:@"A"];
    XCTAssertEqualObjects(card.suit, @"?", "Should not have been recognized");
    XCTAssertNotEqualObjects(card.suit, @"A", "Should not have matched");
}

//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
