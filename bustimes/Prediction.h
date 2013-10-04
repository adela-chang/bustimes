//
//  Prediction.h
//  bustimes
//
//  Created by Adela Chang on 2013/09/13.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Prediction : NSObject {
    bool valid;
    NSString *line;
    NSString *dir;
    int sec;
    int min;
}

-(void)clear;
-(NSString *) derivedSec;

@property(nonatomic) bool arriving;
@property(nonatomic) bool valid;
@property(nonatomic) int sec;
@property(nonatomic) int min;
@property(nonatomic, retain) NSString *dir;
@property(nonatomic, retain) NSString *line;

@end