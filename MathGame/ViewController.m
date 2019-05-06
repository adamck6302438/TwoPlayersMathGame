//
//  ViewController.m
//  MathGame
//
//  Created by Frances ZiyiFan on 5/6/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *player1Life;
@property (weak, nonatomic) IBOutlet UILabel *player2Life;
@property (weak, nonatomic) IBOutlet UILabel *playerTurn;
@property (strong, nonatomic) NSString* finalAnswer;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UILabel *answer;
@property (assign, nonatomic) NSInteger turn;
@property (strong, nonatomic) Player* player1;
@property (strong, nonatomic) Player* player2;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (strong, nonatomic) UIAlertController* alert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _player1 = [[Player alloc]initWithName:@"Player 1"];
    _player2 = [[Player alloc]initWithName:@"Player 2"];
    [_player1Life setText:[NSString stringWithFormat:@"Player 1: %d", _player1.life]];
    [_player2Life setText:[NSString stringWithFormat:@"Player 2: %d", _player2.life]];
    [_playerTurn setText:[NSString stringWithFormat:@"%@'s turn", _player1.name]];
    _turn = 1;
    NSInteger num1 = arc4random_uniform(20)+1;
    NSInteger num2 = arc4random_uniform(20)+1;
    _finalAnswer = [[NSString alloc]init];
    [_question setText:[_player1 generateQuestionWithNumber1:num1 andNumber2:num2]];
    [_answer setText:@""];
    [_result setText:@""];
    _alert = [UIAlertController alertControllerWithTitle:@"Game Over!" message:@"Restart?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        [self viewDidLoad];
    }];
    UIAlertAction* action2 = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        exit(1);
    }];
    [_alert addAction: action];
    [_alert addAction: action2];
}
- (IBAction)zero:(UIButton *)sender {
    self.finalAnswer = [self.finalAnswer stringByAppendingString:@"0"];
    [self.answer setText:[NSString stringWithFormat:@"%@", self.finalAnswer]];
}

- (IBAction)one:(UIButton *)sender {
    self.finalAnswer = [self.finalAnswer stringByAppendingString:@"1"];
    [self.answer setText:[NSString stringWithFormat:@"%@", self.finalAnswer]];
}

- (IBAction)two:(UIButton *)sender {
    self.finalAnswer = [self.finalAnswer stringByAppendingString:@"2"];
    [self.answer setText:[NSString stringWithFormat:@"%@", self.finalAnswer]];
}

- (IBAction)three:(UIButton *)sender {
    self.finalAnswer = [self.finalAnswer stringByAppendingString:@"3"];
    [self.answer setText:[NSString stringWithFormat:@"%@", self.finalAnswer]];
}

- (IBAction)four:(UIButton *)sender {
    self.finalAnswer = [self.finalAnswer stringByAppendingString:@"4"];
    [self.answer setText:[NSString stringWithFormat:@"%@", self.finalAnswer]];
}

- (IBAction)five:(UIButton *)sender {
    self.finalAnswer = [self.finalAnswer stringByAppendingString:@"5"];
    [self.answer setText:[NSString stringWithFormat:@"%@", self.finalAnswer]];
}

- (IBAction)six:(UIButton *)sender {
    self.finalAnswer = [self.finalAnswer stringByAppendingString:@"6"];
    [self.answer setText:[NSString stringWithFormat:@"%@", self.finalAnswer]];
}

- (IBAction)seven:(UIButton *)sender {
    self.finalAnswer = [self.finalAnswer stringByAppendingString:@"7"];
    [self.answer setText:[NSString stringWithFormat:@"%@", self.finalAnswer]];
}

- (IBAction)eight:(UIButton *)sender {
    self.finalAnswer = [self.finalAnswer stringByAppendingString:@"8"];
    [self.answer setText:[NSString stringWithFormat:@"%@", self.finalAnswer]];
}

- (IBAction)nine:(UIButton *)sender {
    self.finalAnswer = [self.finalAnswer stringByAppendingString:@"9"];
    [self.answer setText:[NSString stringWithFormat:@"%@", self.finalAnswer]];
}
- (IBAction)minus:(UIButton *)sender {
    self.finalAnswer = [self.finalAnswer stringByAppendingString:@"-"];
    [self.answer setText:[NSString stringWithFormat:@"%@", self.finalAnswer]];
}

- (IBAction)decimal:(UIButton *)sender {
    self.finalAnswer = [self.finalAnswer stringByAppendingString:@"."];
    [self.answer setText:[NSString stringWithFormat:@"%@", self.finalAnswer]];
}

- (IBAction)confirmAnswer:(UIButton *)sender {
    [self.result setText:@""];
    self.result.alpha =1;
    [self.answer setText:@""];
    NSInteger num1 = arc4random_uniform(20)+1;
    NSInteger num2 = arc4random_uniform(20)+1;
    switch (self.turn) {
        case 1:
            if(![self.player1 checkAnswer:[self.finalAnswer integerValue]]){
                self.player1.life --;
                [self.result setTextColor:UIColor.redColor];
                [self.result setText:@"Wrong!"];
                [self.player1Life setText:[NSString stringWithFormat:@"Player 1: %d", self.player1.life]];
                if(self.player1.life == 0){
                    [self presentViewController: self.alert animated:YES completion:nil];
                    NSLog(@"Game over.");
                }
            }
            else{
                [self.result setTextColor:UIColor.greenColor];
                [self.result setText:@"Correct!"];
            }
            self.turn = 2;
            [self.playerTurn setText:[NSString stringWithFormat:@"%@'s turn", self.player2.name]];
            [self.question setText:[self.player2 generateQuestionWithNumber1:num1 andNumber2:num2]];
            break;
            
        case 2:
            if(![self.player2 checkAnswer:[self.finalAnswer integerValue]]){
                self.player2.life --;
                [self.result setTextColor:UIColor.redColor];
                [self.result setText:@"Wrong!"];
                [self.player2Life setText:[NSString stringWithFormat:@"Player 2: %d", self.player2.life]];
                if(self.player2.life == 0){
                    [self presentViewController: self.alert animated:YES completion:nil];
                    NSLog(@"Game over.");
                }
            }else{
                [self.result setTextColor:UIColor.greenColor];
                [self.result setText:@"Correct!"];
            }
            self.turn = 1;
            [self.playerTurn setText:[NSString stringWithFormat:@"%@'s turn", self.player1.name]];
            [self.question setText:[self.player1 generateQuestionWithNumber1:num1 andNumber2:num2]];
            break;
        default:
            break;
    }
    [UIView animateWithDuration:1.5 animations:^{
        self.result.alpha=0;
    }];
    self.finalAnswer = @"";;
}



@end
