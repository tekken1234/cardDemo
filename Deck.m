//
//  Deck.m
//  cardsDemo
//
//  Created by LDH on 14/11/22.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "Deck.h"

@interface Deck ()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

- (NSMutableArray *)cards {
    
    // _cards == nil another way round
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}


- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}


- (void)addCard:(Card *)card;
{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    if ([self.cards count]) {
        
    unsigned index = arc4random() % [self.cards count];
    randomCard = [self.cards objectAtIndex:index];
    [self.cards removeObjectAtIndex:index];
    
    }
    return randomCard;
}

@end


