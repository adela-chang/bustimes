//
//  Prediction.m
//  bustimes
//
//  Created by Adela Chang on 2013/09/13.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "Prediction.h"

@implementation Prediction

// Compares two prediction objects based on arrival time
- (NSComparisonResult)compare:(Prediction *)otherObject {
    if (self.sec < otherObject.sec) {
        return NSOrderedAscending;
    }
    else if (self.sec > otherObject.sec) {
        return NSOrderedDescending;
    }
    else {
        return NSOrderedSame;
    }
    //return [self.sec compare:otherObject.sec];
}

// Creates a copy of a prediction object
- (Prediction *)copy {
    Prediction *result = [[Prediction alloc] init];
    result.min = self.min;
    result.sec = self.sec;
    result.dir = self.dir;
    result.line = self.line;
    result.valid = self.valid;
    return result;
}

// Clears the current prediction object
-(void)clear {
    self.min = -1;
    self.sec = -1;
    self.dir = nil;
    self.line = nil;
    self.valid = NO;
}

-(NSString *) derivedSec {
    int i = self.sec - self.min*60;
    if (i >= 10)
        return [NSString stringWithFormat:@"%i", i];
    else
        return [NSString stringWithFormat:@"0%i", i]; 
}

@end
