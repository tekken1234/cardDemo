//
//  Card.h
//  cardsDemo
//
//  Created by LDH on 14/11/22.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL *chosen;
@property (nonatomic, getter = isMatched) BOOL *matched;

- (int)match:(NSArray *)otherCards;

@end
