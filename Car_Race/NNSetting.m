//
//  NNSetting.m
//  Car_Race
//
//  Created by Neema Mahida on 2014-11-20.
//  Copyright (c) 2014 Neema Mahida. All rights reserved.
//

#import "NNSetting.h"

@implementation NNSetting

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
      
        SKLabelNode *labl = [SKLabelNode labelNodeWithFontNamed:@"chalkduster"];
        labl.fontColor = [SKColor yellowColor];
        labl.text = [NSString stringWithFormat:@"Select Your Car"];
        labl.fontSize = 30;
        labl.position = CGPointMake(self.size.width/2, (self.size.height/2) + 120);
        [self addChild:labl];
        
        SKSpriteNode *car1 = [SKSpriteNode spriteNodeWithImageNamed:@"red"];
        [car1 setScale:1.5];
        car1.name = redCar;
        car1.position = CGPointMake((self.frame.size.width / 2) - 60 , (self.frame.size.height/2));

        [self addChild:car1];
        
        SKSpriteNode *car2 = [SKSpriteNode spriteNodeWithImageNamed:@"white"];
        [car2 setScale:1.1];
        car2.name = whitecar;
        car2.position = CGPointMake((self.frame.size.width / 2) + 60 , (self.frame.size.height/2));
        
        [self addChild:car2];
        
        
        SKSpriteNode *car3 = [SKSpriteNode spriteNodeWithImageNamed:@"grey"];
        [car3 setScale:2.2];
        car3.name = greycar;
        car3.position = CGPointMake((self.frame.size.width / 2) , (self.frame.size.height/2) - 130);
        
        [self addChild:car3];


        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint touchLocation = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:touchLocation];
        
        if ([node.name isEqualToString:redCar]) {
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setInteger:1 forKey:@"carNo"];
            [self changeToGameScene];
        }
        if ([node.name isEqualToString:whitecar]) {
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setInteger:2 forKey:@"carNo"];
            [self changeToGameScene];
        }
        if ([node.name isEqualToString:greycar]) {
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setInteger:3 forKey:@"carNo"];
            [self changeToGameScene];
        }
    }
}
-(void) changeToGameScene
{
    NNMyScene *start = [NNMyScene sceneWithSize:self.size];
    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionRight duration:1.0];
    [self.scene.view presentScene:start transition:reveal];
    
}

@end
