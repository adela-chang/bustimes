//
//  Parser.h
//  bustimes
//
//  Created by Adela Chang on 2013/09/13.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Prediction.h"

@interface Parser: NSObject <NSXMLParserDelegate> {
    
    //Array of prediction objects representing the group of predictions for a specific bus stop, parsed from a given XML doc
    NSMutableArray *predictions;
    
    //Title of the bus stop that all predictions for this document are associated with.
    NSString *stopTitle;

    //variables to help faciliate computation
    Prediction *p;
    BOOL storedp;
    BOOL calculatedShuttles;
}

/**
 * Parse an AC Transit XML document given its NSURL and stores the result in an array of Prediction objects.
 * @param url The location of the specified XML document, which should be the result of a valid "predictions" request for XML data from AC Transit. (http://www.actransit.org/rider-info/nextbus-xml-data/ )
 * @return YES if method succeeded, NO if failed
 */
-(BOOL)parseDocumentWithURL:(NSURL *)url;


/**
 * @return the contents of the predictions array in string format, grouped by bus stop and sorted per stop by the earliest arrival time 
 */
-(NSMutableAttributedString *)returnParsedString;


@end
