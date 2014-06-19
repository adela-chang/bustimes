//
//  GoingHomeViewController.m
//  bustimes
//
//  Created by Adela Chang on 2014/06/19.
//  Copyright (c) 2014年 Adela Chang. All rights reserved.
//

#import "GoingHomeViewController.h"
#import "DisplayBusLinesViewController.h"

@interface GoingHomeViewController ()

@end

@implementation GoingHomeViewController

- (IBAction) sproul {
    DisplayBusLinesViewController *controller = [[DisplayBusLinesViewController alloc] init];
    controller.busids = [[NSArray alloc] initWithObjects:@51074,@51076, nil];
    controller.leaving = false;
    controller.busGrpTitle = @"Sproul to Home";
    [self presentViewController:controller animated:YES completion:nil];

}

- (IBAction) haas {
    DisplayBusLinesViewController *controller = [[DisplayBusLinesViewController alloc] init];
    controller.busids = [[NSArray alloc] initWithObjects:@53700,@59555, nil];
    controller.leaving = false;
    controller.busGrpTitle = @"Haas to Home";
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction) bart {
    DisplayBusLinesViewController *controller = [[DisplayBusLinesViewController alloc] init];
    controller.busids = [[NSArray alloc] initWithObjects:@55551,@55559, nil];
    controller.leaving = false;
    controller.busGrpTitle = @"BART to Home";
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction) rsf {
    DisplayBusLinesViewController *controller = [[DisplayBusLinesViewController alloc] init];
    controller.busids = [[NSArray alloc] initWithObjects:@55593, nil];
    controller.leaving = false;
    controller.busGrpTitle = @"RSF to Home";
    [self presentViewController:controller animated:YES completion:nil];
    
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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
