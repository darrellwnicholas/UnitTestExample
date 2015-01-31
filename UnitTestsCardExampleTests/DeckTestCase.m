//
//  DeckTestCase.m
//  UnitTestsCardExample
//
//  Created by Darrell Nicholas on 1/31/15.
//  Copyright (c) 2015 Darrell Nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Deck.h"

@interface DeckTestCase : XCTestCase

@end

@implementation DeckTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDrawCardFromEmptyDeckAnswersNoCard
{
    Deck *deck = [[Deck alloc] init];
    Card *drawnCard = [deck drawRandomCard];
    XCTAssertNil(drawnCard, @"Should not crash; just answer a nil object");
}

// test where the Deck has only one card in it.
- (void)testOneCardDeckShouldAnswerThatCard
{
    Deck *deck = [[Deck alloc] init];
    Card *card = [[Card alloc] init];
    card.contents = @"test";
    [deck addCard:card];
    Card *drawnCard = [deck drawRandomCard];
    XCTAssertEqualObjects(card, drawnCard, @"Should have drawn the same card we added.");
}

// test small deck with 2 cards in it, yield different cards as each is drawn.
- (void)testDrawnRandomCardsAreDifferent
{
    Deck *deck = [[Deck alloc] init];
    Card *card1 = [[Card alloc] init];
    card1.contents = @"one";
    Card *card2 = [[Card alloc] init];
    card2.contents = @"two";
    [deck addCard:card1];
    [deck addCard:card2];
    Card *drawnCard1 = [deck drawRandomCard];
    Card *drawnCard2 = [deck drawRandomCard];
    XCTAssertNotNil(drawnCard1, @"Should have found a card");
    XCTAssertNotNil(drawnCard2, @"Other card should have been found too");
    XCTAssertNotEqualObjects(drawnCard1, drawnCard2, @"The cards must be different");
}

// test that fills deck with several cards and then proves, after it draws them all out, that the deck is empty and that it held the correct number of cards...
- (void)testDeckWithMultipleCardsWillRandomlyDrawThemAll
{
    Deck *deck = [[Deck alloc] init];
    NSUInteger numberOfCards = 20;  // arbitrary number > 1
    Card *card;
    for (int index = 0; index < numberOfCards; index++)
    {
        card = [[Card alloc] init];
        card.contents = [NSString stringWithFormat:@"%d", index];
        [deck addCard:card];
    }
    Card *randomlyDrawnCard;
    for (int index = 0; index < numberOfCards; index++)
    {
        randomlyDrawnCard = [deck drawRandomCard];
        XCTAssertNotNil(randomlyDrawnCard, @"Should have found a card.");
    }
    randomlyDrawnCard = [deck drawRandomCard];
    XCTAssertNil(randomlyDrawnCard, @"No more cards left.");
}
// In above method I decide upon 20 card deck, populate it by giving each Card contents a number, so they are all unique. I then draw 20 cards out of the Deck, checking that they really are Card objects, and then attempt to draw one more card to prove it is nil.

@end
