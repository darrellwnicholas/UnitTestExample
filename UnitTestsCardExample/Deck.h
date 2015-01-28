//
//  Deck.h
//  UnitTestsCardExample
//
//  Created by Darrell Nicholas on 1/27/15.
//  Copyright (c) 2015 Darrell Nicholas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end