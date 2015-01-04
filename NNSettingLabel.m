//
//  NNSettingLabel.m
//  Car_Race
//
//  Created by Neema Mahida on 2014-11-27.
//  Copyright (c) 2014 Neema Mahida. All rights reserved.
//

#import "NNSettingLabel.h"

@implementation NNSettingLabel

+ (NNSettingLabel *) generateSettingLabel{
    NNSettingLabel *settingLabel = [[NNSettingLabel alloc] initWithFontNamed:@"Chalkduster"];
    settingLabel.name = settingName ;
    settingLabel.fontSize = 30;
    settingLabel.fontColor = [SKColor greenColor];
    settingLabel.text = @"Setting";
    settingLabel.position = CGPointMake(150, 220);
    settingLabel.zPosition = 5;
    
    return settingLabel;
    
}


@end
