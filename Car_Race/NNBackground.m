//
//  NNBackground.m
//  Car_Race
//
//  Created by Neema Mahida on 2014-11-19.
//  Copyright (c) 2014 Neema Mahida. All rights reserved.
//

#import "NNBackground.h"

@implementation NNBackground

+ (NNBackground *)generateBackground{
    
    NNBackground *background = [[NNBackground alloc]initWithImageNamed:@"background"];
    
    background.anchorPoint = CGPointMake(0, 0);
    background.name = backgroundName;
    background.position = CGPointMake(0, 0);
    
    return background;
}

@end
