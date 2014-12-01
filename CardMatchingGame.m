//
//  CardMatchingGame.m
//  cardsDemo
//
//  Created by LDH on 14/11/28.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
    
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck {
    
    self = [super init];
    // or if (card)
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
                // or self.cards[i] = card;
            } else {
                self = nil;
                break;
            }
        }
        
    }
    
    
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ?
    [self.cards objectAtIndex:index]: nil;
}

// #define MISMATCH_PENALTY 2 or ...
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
-(void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            // getter name was changed to isChosen, if tap chosen card again will unchoose it.
            card.chosen = NO;
        } else {
            // match against another card
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
                
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
}

@end