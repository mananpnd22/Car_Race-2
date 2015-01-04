//
//  NNMoving_Car.m
//  Car_Race
//
//  Created by Neema Mahida on 2014-11-19.
//  Copyright (c) 2014 Neema Mahida. All rights reserved.
//

#import "NNMoving_Car.h"

@implementation NNMoving_Car

-(instancetype)init{
    self = [super initWithImageNamed:@"red"];
    {
        self.name = redCar;
        self.zPosition = 10;
        self.position = CGPointMake(160, 40);
    }
    return self;
    
}

@end
