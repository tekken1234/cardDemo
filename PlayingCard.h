//
//  PlayingCard.h
//  cardsDemo
//
//  Created by LDH on 14/11/28.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)vaildSuits;
+ (NSUInteger )maxRank;

@end
