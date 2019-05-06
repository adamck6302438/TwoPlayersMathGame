//
//  Player.h
//  MathGame
//
//  Created by Frances ZiyiFan on 5/6/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property (nonatomic, assign) NSInteger life;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) NSInteger solution;


- (instancetype)initWithName: (NSString *)name;
- (NSString*) generateQuestionWithNumber1: (NSInteger) n1 andNumber2: (NSInteger) n2;
- (BOOL) checkAnswer: (NSInteger) input;
@end

NS_ASSUME_NONNULL_END
