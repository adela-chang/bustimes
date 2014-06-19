//
//  Parser.m
//  An XML parser using NSXMLParser which extracts the relevant data from AC Transit's public
//  XML Data Bank per request indicated with stopID.
//
//  Created by Adela Chang on 2013/09/13.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "Parser.h"

@implementation Parser

#pragma mark - Main Methods
-(BOOL)parseDocumentWithURL:(NSURL *)url {
    if (url == nil)
        return NO;
    
    // this is the parsing machine
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    
    // this class will handle the events
    [xmlparser setDelegate:self];
    [xmlparser setShouldResolveExternalEntities:NO];
    
    // now parse the document
    BOOL ok = [xmlparser parse];
    if (ok == NO)
        NSLog(@"error");
    else
        NSLog(@"OK");
    
    return ok;
}

-(NSMutableAttributedString *)returnParsedString {
    NSArray *sortedArray;
    sortedArray = [predictions sortedArrayUsingSelector:@selector(compare:)];
    NSMutableAttributedString *output = [[NSMutableAttributedString alloc] init];
    [output appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\r\r", stopTitle]]];
    
    UIFont *boldFont = [UIFont systemFontOfSize:15];
    NSRange boldedRange = NSMakeRange(0, [stopTitle length]);
    [output beginEditing];
    [output addAttribute:NSFontAttributeName
                            value:boldFont
                            range:boldedRange];
    
    [output endEditing];

    for (int i = 0; i <[predictions count]; i++) {
        Prediction *x = sortedArray[i];
        if (x.valid == YES) {
            NSMutableAttributedString *temp;
            if (x.sec < 60)
                temp = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\tArriving, %@ %@\n", x.line,x.dir]];
            else
                temp = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\t%i:%@, %@ %@\n", x.min,x.derivedSec,x.line,x.dir]];
            [output appendAttributedString:temp];
            
        }
    }
    return output;
}

#pragma mark - NSXMLParserDelegate Methods
-(void)parserDidStartDocument:(NSXMLParser *)parser {
    predictions = [[NSMutableArray alloc] init];
    storedp = NO;
    calculatedShuttles = NO;
    p = [[Prediction alloc] init];
    NSLog(@"didStartDocument");
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"didEndDocument");
}


/**
 * AC transit XML predictions made using a stopID are in the form:
    <body>
        <predictions -- specifies bus line & tag>
            <direction -- specifies direction of line>
                <prediction -- specifies arriving time of specific bus>
                <prediction -- specifies arriving time of specific bus>
                ...
            </direction>
        </predictions>
        <predictions -- another bus line that goes to this stop>
            ...
    </body>

 */
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    //NSLog(@"didStartElement: %@", elementName);
    
    if (namespaceURI != nil) {}
        //NSLog(@"namespace: %@", namespaceURI);
    
    if (qName != nil){}
        //NSLog(@"qualifiedName: %@", qName);
        
    
    // print all attributes for this element
    NSEnumerator *attribs = [attributeDict keyEnumerator];
    NSString *key, *value;
    
    if ([elementName isEqual:@"predictions"]) {
        storedp = NO;
        [p clear];
        while((key = [attribs nextObject]) != nil) {
            value = [attributeDict objectForKey:key];
            if ([key isEqual:@"routeTitle"]) {
                p.line = value;
                p.valid = YES;
            }
            else if ([key isEqual:@"stopTitle"]) {
                stopTitle = value;
            }
            // account for P and H shuttles at the BART stop <3
            else if ([key isEqual:@"stopTag"] && [value isEqual:@"0306210"] && calculatedShuttles == NO) {
                //NSLog(@"VOILA");
                NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:[NSDate date]];
                NSInteger currentHour = [components hour];
                if (currentHour > 6 && currentHour < 20) {
                    //NSLog(@"correct time");
                    [predictions addObject: [self shuttlePrediction:15 :0 :@"P Line"]];
                    [predictions addObject: [self shuttlePrediction:30 :5 :@"H Line"]];
                    calculatedShuttles = YES;
                }
            }
                
        }
    }
    
    else if ([elementName isEqual:@"direction"]) {
        while((key = [attribs nextObject]) != nil) {
            value = [attributeDict objectForKey:key];
            if ([key isEqual:@"title"])
                p.dir = value;
        }
    }
    
    else if ([elementName isEqual:@"prediction"] && storedp == NO) {
        while((key = [attribs nextObject]) != nil) {
            value = [attributeDict objectForKey:key];
            if ([key isEqual:@"seconds"])
                p.sec = [value intValue];
            else if ([key isEqual:@"minutes"])
                p.min = [value intValue];
        }
        [predictions addObject:p.copy];
        storedp = YES;
    }
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    //NSLog(@"didEndElement: %@", elementName);
}

// error handling
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    //NSLog(@"XMLParser error: %@", [parseError localizedDescription]);
}

-(void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
    //NSLog(@"XMLParser error: %@", [validationError localizedDescription]);
}


#pragma mark - Helper Methods
//method to manually adjust the time of predictions to account for the time which has probably elapsed between making the request to AC transit, parsing, and displaying results. also shaves off some extra time so users who procrastinate get a slight buffer and are less likely to run late ;)
-(void)normalize {
    for (int i = 0; i < [predictions count]; i++) {
        Prediction *item = predictions[i];
        if (item.sec%60 < 20) {
            item.sec = item.sec+40;
            item.min = item.min-1;
        } else {
            item.sec = item.sec-20;
        }
            
    }
}

//priv method to retrieve current time in 00:00:00 form
-(NSString *)gettime {
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    NSString *time = [dateFormatter stringFromDate:today];
    return [time substringToIndex:[time length] - 3];
}

//priv method to get just the :00 minutes w/o the hour &secs (for calculation purposes)
-(int)getmins {
    NSString *time = self.gettime;
    NSArray *components=[time componentsSeparatedByString:@":"];
    if ([components count]>3) {
        NSLog(@"Error retrieving correct time!");
        return -1;
    } else {
        return [components[1] intValue];
    }
}

//priv method to get just the :00 seconds w/o the hour &mins (for calculation purposes)
-(int)getsecs {
    NSString *time = self.gettime;
    NSArray *components=[time componentsSeparatedByString:@":"];
    if ([components count]>3) {
        NSLog(@"Error retrieving correct time!");
        return -1;
    } else {
        return [components[2] intValue];
    }
}

/* Creates a prediction object for a UC Campus shuttle based on the interval at which it runs and
 * the time offset from the hour at which it begins running. This is assuming that buses run at such
 * regular intervals that fit nicely within an hour (10, 15, 30... etc). Buses with awkward intervals
 * (12mins, 7mins... etc) will have to be calculated separately.
 */
-(Prediction *)shuttlePrediction:(int)intervals :(int)startTime :(NSString*)name{
    int totalSecs = self.getmins*60 + self.getsecs;
    int timeRemaining = 3600 + startTime*60 - totalSecs;
    NSLog(@"%i, %i, %i", totalSecs, timeRemaining, startTime);
    while (timeRemaining > intervals*60) {
        timeRemaining = timeRemaining-(intervals*60);
    }
    NSLog(@"seconds remaining after calculation, %i", timeRemaining);
    Prediction *shuttle = [[Prediction alloc] init];
    shuttle.line = name;
    shuttle.dir = @"";
    shuttle.sec = timeRemaining;
    shuttle.min = timeRemaining/60;
    shuttle.valid = YES;
    return shuttle;
}

@end
