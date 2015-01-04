//
//  NNMyScene.m
//  Car_Race
//
//  Created by Neema Mahida on 2014-11-19.
//  Copyright (c) 2014 Neema Mahida. All rights reserved.
//

#import "NNMyScene.h"

@implementation NNMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        //self.backgroundColor = [SKColor whiteColor];
        self.startLable = [NNStartLabel generateStartLabel];
        self.startLable.position = CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 2 )+ 35);
        self.settingLable = [NNSettingLabel generateSettingLabel];
        self.settingLable.position = CGPointMake(self.frame.size.width / 2, (self.frame.size.height / 2 ) - 35);
        [self addChild:self.startLable];
        [self addChild:self.settingLable];
        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint touchLocation = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:touchLocation];
        
        if ([node.name isEqualToString:startName]) {
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            NSUserDefaults *prefs1 = [NSUserDefaults standardUserDefaults];
            NSUserDefaults *p = [NSUserDefaults standardUserDefaults];
            [prefs setFloat:120.0 forKey:@"screenMovingSpeed"];
            [prefs1 setFloat:60.0 forKey:@"objectMoivingSpeed"];
            [p setInteger:1 forKey:@"level"];
            [self changeToGameScene];
            
        }
        if ([node.name isEqualToString:settingName]) {
            [self changeToSettingScene];
        }
    }
}

-(void) changeToGameScene
{
        NNGame *game = [NNGame sceneWithSize:self.size];
        SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
        [self.scene.view presentScene:game transition:reveal];
        
}
-(void) changeToSettingScene
{
    NNSetting *setting = [NNSetting sceneWithSize:self.size];
    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
    [self.scene.view presentScene:setting transition:reveal];
    
}


@end
