//
//  NNGameOverScene.m
//  Car_Race
//
//  Created by MANAN PANDYA on 2014-11-25.
//  Copyright (c) 2014 Neema Mahida. All rights reserved.
//

#import "NNGameOverScene.h"
#import "NNMyScene.h"
#import "NNGame.h"


@implementation NNGameOverScene


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        // 1
        //self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        
        // 2
        
        extern int count;
        // self.label.text = [NSString stringWithFormat:@"Game Over: -> %i",count];
        
       // NSString c = count;
            SKLabelNode *labl = [SKLabelNode labelNodeWithFontNamed:@"chalkduster"];
            labl.fontColor = [SKColor redColor];
            labl.text = [NSString stringWithFormat:@"Game Over"];
            labl.fontSize = 30;
            labl.position = CGPointMake(self.size.width/2, self.size.height/2);
            [self addChild:labl];
        
        SKLabelNode *labl2 = [SKLabelNode labelNodeWithFontNamed:@"chalkduster"];
        labl2.fontColor = [SKColor greenColor];
        labl2.text = [NSString stringWithFormat:@"Distance cover : %d",count];
        labl2.fontSize = 20;
        labl2.position = CGPointMake(self.size.width/2, (self.size.height/2)-30);
        [self addChild:labl2];
            
            NSString * retrymessage;
            retrymessage = @"Main Menu";
            SKLabelNode *retryButton = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
            retryButton.text = retrymessage;
            retryButton.fontColor = [SKColor greenColor];
        retryButton.fontSize = 40;
            retryButton.position = CGPointMake(self.size.width/2, 80);
            retryButton.name = @"retry";
            [retryButton setScale:.5];
            
            [self addChild:retryButton];
            
    
        
        //        NSString * message;
        //        message = @"Game Over";
        //        // 3
        //        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        //        label.text = message;
        //        label.fontSize = 40;
        //        label.fontColor = [SKColor blackColor];
        //        label.position = CGPointMake(self.size.width/2, self.size.height/2);
        //        [self addChild:label];
        
        
        
        
    }
    return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"retry"]) {
        SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
        
        NNMyScene * myscene = [NNMyScene sceneWithSize:self.view.bounds.size];
        myscene.scaleMode = SKSceneScaleModeAspectFill;
        [self.view presentScene:myscene transition: reveal];
        
    }
    
    
}



@end
