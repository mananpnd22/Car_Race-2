//
//  NNGameChange.m
//  Car_Race
//
//  Created by Neema Mahida on 2014-11-27.
//  Copyright (c) 2014 Neema Mahida. All rights reserved.
//

#import "NNGameChange.h"
#import "NNMyScene.h"
#import "NNGame.h"

int level;

@implementation NNGameChange
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        // 1
     //   self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        
        // 2
        
        extern int count;
        // self.label.text = [NSString stringWithFormat:@"Game Over: -> %i",count];
        
        // NSString c = count;
//        SKLabelNode *labl = [SKLabelNode labelNodeWithFontNamed:@"chalkduster"];
//        labl.fontColor = [SKColor redColor];
//        labl.text = [NSString stringWithFormat:@""];
//        labl.fontSize = 30;
//        labl.position = CGPointMake(self.size.width/2, self.size.height/2);
//        [self addChild:labl];
        
        SKLabelNode *labl2 = [SKLabelNode labelNodeWithFontNamed:@"chalkduster"];
        labl2.fontColor = [SKColor greenColor];
        labl2.text = [NSString stringWithFormat:@"Distance cover : %d",count];
        labl2.fontSize = 20;
        labl2.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:labl2];
        
        NSString * retrymessage;
        retrymessage = @"Main Menu";
        SKLabelNode *retryButton = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        retryButton.text = retrymessage;
        retryButton.fontColor = [SKColor greenColor];
        retryButton.position = CGPointMake(self.size.width/2, 80);
        retryButton.name = @"retry";
        [retryButton setScale:.5];
        
        [self addChild:retryButton];
        
        NSString * newmessage;
        newmessage = @"Continu.. Next Level";
        SKLabelNode *newButton = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        newButton.text = newmessage;
        newButton.fontColor = [SKColor greenColor];
        newButton.position = CGPointMake(self.size.width/2, 120);
        newButton.name = @"con";
        [newButton setScale:.5];
        
        [self addChild:newButton];

        
        
        
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
    else{
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSUserDefaults *prefs1 = [NSUserDefaults standardUserDefaults];
        NSUserDefaults *p = [NSUserDefaults standardUserDefaults];
        [prefs setFloat:180.0 forKey:@"screenMovingSpeed"];
        [prefs1 setFloat:80.0 forKey:@"objectMoivingSpeed"];
        [p setInteger:2 forKey:@"level"];
        
        SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
        
        NNGame * gamescene = [NNGame sceneWithSize:self.view.bounds.size];
        gamescene.scaleMode = SKSceneScaleModeAspectFill;
        [self.view presentScene:gamescene transition: reveal];
        
    }
    
    
}


@end
