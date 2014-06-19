//
//  Utilities.h
//  bustimes
//
//  Created by Adela Chang on 2013/09/15.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parser.h"

@interface Utilities : NSObject

-(void)setTextViewWithTags:(UITextView *)t :(int)count, ...;
+(void)setTextView: (UITextView*)t GivenStopIDs:(NSArray*)arr;

@end
