//
//  Utilities.m
//  bustimes
//
//  Created by Adela Chang on 2013/09/15.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

//TODO: refactor methods out of utilities? no longer necessary after changes in data struct
-(void)setTextViewWithTags:(UITextView*)t :(int)count, ... {
    va_list args;
    va_start(args, count);
    
    Parser* p = [[Parser alloc] init];
    int value;
    NSMutableString *retval = [[NSMutableString alloc] init];
    
    for(int i = 0; i < count; i++ ) {
        value = va_arg(args, int);
        NSString *s = [NSString stringWithFormat:@"http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=actransit&stopId=%i", value];
        if ([p parseDocumentWithURL:[NSURL URLWithString:s]] == NO)
            NSLog(@"oh no");
        NSString *segment = [p returnParsedString];

        [retval appendString:segment];
        [retval appendString:@"\r"];
    }
    
    va_end(args);
    t.text = retval;
    return;
}

+(void)setTextView: (UITextView*)t GivenStopIDs:(NSArray*)arr {
    Parser* p = [[Parser alloc] init];
    int value;
    NSMutableAttributedString *retval = [[NSMutableAttributedString alloc] init];
    
    for(int i = 0; i < [arr count]; i++ ) {
        value = [((NSNumber*) [arr objectAtIndex:i]) intValue];
        NSString *s = [NSString stringWithFormat:@"http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=actransit&stopId=%i", value];
        if ([p parseDocumentWithURL:[NSURL URLWithString:s]] == NO)
            NSLog(@"oh no");
        NSMutableAttributedString *segment = [p returnParsedString];
        
        [retval appendAttributedString:segment];
        [retval appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\r"]];
    }
    
    t.attributedText = retval;
    return;
}

@end
