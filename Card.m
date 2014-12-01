//
//  Card.m
//  cardsDemo
//
//  Created by LDH on 14/11/22.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards {
    int score = 0;
    for (Card *card in otherCards) {
    
    if ([card.contents isEqualToString:self.contents]) {
        score = 1;
        }
    }
    return score;
}
@end
