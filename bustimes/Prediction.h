//
//  Prediction.h
//  bustimes
//
//  Created by Adela Chang on 2013/09/13.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Custom data structure which represents a bus time prediction as given by AC Transit.
 */
@interface Prediction : NSObject {
    bool valid;
    NSString *line;
    NSString *dir;
    int sec;
    int min;
}

/**
 * Clears and resets the prediction object.
 */
-(void)clear;

/**
 * Calculates the number of seconds until arrival for display purposes, in minute:second form. (e.g. 330s is actually 5min and 30s, so this method will return "30".
 @return a string indicating the number of seconds to display
 */
-(NSString *) derivedSec;

//Whether or not this prediction object contains valid data.
@property(nonatomic) bool valid;

//Amount of time until bus arrives represented in seconds. Note that this is NOT in a minute:second representation (e.g. 30s for a bus arriving in 5min30s) but rather total number of seconds before arrival (e.g. 330s).
@property(nonatomic) int sec;

//TODO: double check if AC transit for sure rounds up and not down
//Number of minutes until bus arrival, rounded up.
@property(nonatomic) int min;

//The direction this bus line is headed in.
@property(nonatomic, retain) NSString *dir;

//The current AC transit bus line.
@property(nonatomic, retain) NSString *line;

@end