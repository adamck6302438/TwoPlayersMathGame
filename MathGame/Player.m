//
//  Player.m
//  MathGame
//
//  Created by Frances ZiyiFan on 5/6/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName: (NSString *)name;
{
    self = [super init];
    if (self) {
        _life = 3;
        _name = name;
    }
    return self;
}

- (NSString*) generateQuestionWithNumber1: (NSInteger) n1 andNumber2: (NSInteger) n2{
    NSInteger type = arc4random_uniform(4);
    NSString* output = [[NSString alloc]init];
    switch (type) {
        case 0:
            self.solution = n1 + n2;
            output = [[NSString alloc]initWithString:[NSString stringWithFormat:@"%d + %d = ?", n1, n2]];
            break;
        case 1:
            self.solution = n1 - n2;
            output = [[NSString alloc]initWithString:[NSString stringWithFormat:@"%d - %d = ?", n1, n2]];
            break;
        case 2:
            self.solution = n1 * n2;
            output = [[NSString alloc]initWithString:[NSString stringWithFormat:@"%d * %d = ?", n1, n2]];
            break;
        case 3:
            self.solution = n1 / n2;
            output = [[NSString alloc]initWithString:[NSString stringWithFormat:@"%d / %d = ?", n1, n2]];
            break;
        default:
            break;
    }
    return output;
}

- (BOOL) checkAnswer: (NSInteger) input{
    if(input == self.solution){
        return true;
    }else{
        return false;
    }
}


@end
