//
//  Card.h
//  UnitTestsCardExample
//
//  Created by Darrell Nicholas on 1/27/15.
//  Copyright (c) 2015 Darrell Nicholas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
