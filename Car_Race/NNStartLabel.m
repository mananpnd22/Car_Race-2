//
//  NNStartLabel.m
//  Car_Race
//
//  Created by Neema Mahida on 2014-11-20.
//  Copyright (c) 2014 Neema Mahida. All rights reserved.
//

#import "NNStartLabel.h"

@implementation NNStartLabel

+ (NNStartLabel *) generateStartLabel{
    
    NNStartLabel *startLabel = [[NNStartLabel alloc] initWithFontNamed:@"Chalkduster"];
    startLabel.name = startName;
    startLabel.fontSize = 30;
    startLabel.fontColor = [SKColor greenColor];
    startLabel.text = @"Start";
    //startLabel.position = CGPointMake(, 280);
    startLabel.zPosition = 5;
    
    return startLabel;
}


@end
