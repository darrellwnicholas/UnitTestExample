//
//  PlayingCard.h
//  UnitTestsCardExample
//
//  Created by Darrell Nicholas on 1/27/15.
//  Copyright (c) 2015 Darrell Nicholas. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
