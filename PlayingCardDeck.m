//
//  PlayingCardDeck.m
//  cardsDemo
//
//  Created by LDH on 14/11/28.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

- (instancetype)init {
   self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard vaildSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
