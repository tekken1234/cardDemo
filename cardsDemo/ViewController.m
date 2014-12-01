//
//  ViewController.m
//  cardsDemo
//
//  Created by LDH on 14/11/22.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *filpCountLabel;
@property (nonatomic) int filpcount;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;

@end

@implementation ViewController

-(CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc]initWithCardCount:0 usingDeck:[[PlayingCardDeck alloc]init]];
    return _game;
        
}

/*
-(Deck *)deck {
    if (!_deck) _deck = [[PlayingCardDeck alloc]init];
    return _deck;
}

-(void)setFilpcount:(int) filpcount {
    _filpcount = filpcount;
    self.filpCountLabel.text = [NSString stringWithFormat:@"filpcount : %d", self.filpcount];
} */
 
- (IBAction)touchCardButton:(UIButton *)sender {
   
    
    if ([sender.currentTitle length]) {
        UIImage *image = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:image forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
       // self.filpcount++;
    } else {
        Card *card = [self.deck drawRandomCard];
        if (card) {

        UIImage *image = [UIImage imageNamed:@"cardfront"];
        [sender setBackgroundImage:image forState:UIControlStateNormal];
        [sender setTitle:card.contents forState:UIControlStateNormal];
      //  self.filpcount++;
        }
    }
    
}



@end
