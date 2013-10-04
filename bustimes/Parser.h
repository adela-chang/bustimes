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
    NSMutableArray *arr;
    Prediction *p;
    BOOL storedp;
    BOOL calculatedShuttles;
    NSMutableString *stopTitle;
}

-(BOOL)parseDocumentWithURL:(NSURL *)url;
-(NSMutableString *)returnParsedString;


@end
