//
//  BusGroupController.m
//  bustimes
//
//  Created by Adela Chang on 2013/10/08.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "BusGroupController.h"
#import "Parser.h"

@interface BusGroupController ()

@end

@implementation BusGroupController

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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // returns a dictionary of {groupname: [arr of stopids]} format
    NSDictionary *stopGroups = [defaults objectForKey:_groupName];
    
    [self displayStopTimesWithDict:stopGroups];
}


-(void)displayStopTimesWithDict:(NSDictionary *)dict
{
    UITextView *t = [[UITextView alloc] initWithFrame:self.view.bounds];
    
    Parser* p = [[Parser alloc] init];
    NSMutableString *retval = [[NSMutableString alloc] init];
    
    for(NSString *key in [dict allKeys]) {
        NSString *stopid = [dict objectForKey:key];
        NSLog(@"key: %@", key);
        NSLog(@"stopid: %@", stopid);
        NSString *s = [NSString stringWithFormat:@"http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=actransit&stopId=%@", stopid];
        if ([p parseDocumentWithURL:[NSURL URLWithString:s]] == NO)
            NSLog(@"oh no");
        NSString *segment = [p returnParsedString];
        
        [retval appendString:segment];
        [retval appendString:@"\r"];
    }
    
    t.text = retval;
    [self.view addSubview:t];
    return;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
