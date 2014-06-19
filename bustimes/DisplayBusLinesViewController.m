//
//  DisplayBusLinesViewController.m
//  bustimes
//
//  Created by Adela Chang on 2014/06/19.
//  Copyright (c) 2014年 Adela Chang. All rights reserved.
//

#import "DisplayBusLinesViewController.h"
#import "Utilities.h"
#import "ViewController.h"

@interface DisplayBusLinesViewController ()

@end

@implementation DisplayBusLinesViewController

- (IBAction) back {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    UIViewController *vc;

    if (_leaving) {
        vc = [storyboard instantiateViewControllerWithIdentifier:@"leavinghome"];
    } else {
        vc = [storyboard instantiateViewControllerWithIdentifier:@"goinghome"];
    }
    [self presentViewController:vc animated:YES completion:nil];

}

- (IBAction) home {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"main"];    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction) refreshData {
    [Utilities setTextView:_info GivenStopIDs:_busids];

}

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
    // Do any additional setup after loading the view from its nib.
    _titleLabel.text = _busGrpTitle;
    _titleLabel.font = [UIFont boldSystemFontOfSize:25];
    [self refreshData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
