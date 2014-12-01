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
//@property (weak, nonatomic) IBOutlet UILabel *filpCountLabel;
//@property (nonatomic) int filpcount;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

-(CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
        
}

-(Deck *)createDeck {
    return [[PlayingCardDeck alloc]init];
}

/*
-(Deck *)deck {
    if (!_deck) _deck = [self createDeck];
    return _deck;
}



-(void)setFilpcount:(int) filpcount {
    _filpcount = filpcount;
    self.filpCountLabel.text = [NSString stringWithFormat:@"filpcount : %d", self.filpcount];
} */

- (IBAction)touchCardButton:(UIButton *)sender {
    
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];



}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImage:card]forState:UIControlStateNormal];
        // 符合的卡將不會翻面
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card{
    
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImage:(Card *)card {
    return [UIImage imageNamed:card.chosen ? @"cardfront" : @"cardback"];
}

/*
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
*/


@end
