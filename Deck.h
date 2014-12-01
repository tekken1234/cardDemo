//
//  Deck.h
//  cardsDemo
//
//  Created by LDH on 14/11/22.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end
