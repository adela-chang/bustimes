//
//  TimesViewController.m
//  bustimes
//
//  Created by Adela Chang on 2013/09/13.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "LSViewController.h"
#import "Parser.h"

@interface LSViewController ()

@end

@implementation LSViewController
@synthesize info;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Utilities *u = [[Utilities alloc] init];
    [u setTextViewWithTags:info :3,57200,54466,55555];


 /*SOME CONVENIENT CODE TO SEE THE XML DOC WITH
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=actransit&stopId=55551"]
                                                        cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                        timeoutInterval:10];
    
    [request setHTTPMethod: @"GET"];
    
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    
    
    NSData *response1 = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
    NSLog(@"%@", [[NSString alloc] initWithData:response1 encoding:NSUTF8StringEncoding]);*/
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
