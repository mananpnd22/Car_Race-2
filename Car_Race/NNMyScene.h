//
//  NNMyScene.h
//  Car_Race
//

//  Copyright (c) 2014 Neema Mahida. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "NNBackground.h"
#import "NNMoving_Car.h"
#import "NNMoving_EnemyCar.h"
#import "NNStartLabel.h"
#import "NNGame.h"
#import "NNSettingLabel.h"
#import "NNSetting.h"

@interface NNMyScene : SKScene

@property (strong,nonatomic) NNStartLabel *startLable;
@property (strong,nonatomic) NNSettingLabel *settingLable;

@end
