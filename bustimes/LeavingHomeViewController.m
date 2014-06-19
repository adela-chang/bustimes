//
//  LeavingHomeViewController.m
//  bustimes
//
//  Created by Adela Chang on 2014/06/19.
//  Copyright (c) 2014年 Adela Chang. All rights reserved.
//

#import "LeavingHomeViewController.h"
#import "DisplayBusLinesViewController.h"

@interface LeavingHomeViewController ()

@end

@implementation LeavingHomeViewController

- (IBAction) south {
    DisplayBusLinesViewController *controller = [[DisplayBusLinesViewController alloc] init];
    controller.busids = [[NSArray alloc] initWithObjects:@57200,@54466,@55555, nil];
    controller.leaving = true;
    controller.busGrpTitle = @"Going South";
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction) ne {
    DisplayBusLinesViewController *controller = [[DisplayBusLinesViewController alloc] init];
    controller.busids = [[NSArray alloc] initWithObjects:@57200,@51072,@55551, nil];
    controller.leaving = true;
    controller.busGrpTitle = @"Going Northeast";
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction) pigpen {
    DisplayBusLinesViewController *controller = [[DisplayBusLinesViewController alloc] init];
    controller.busids = [[NSArray alloc] initWithObjects:@50444,@54588, nil];
    controller.leaving = true;
    controller.busGrpTitle = @"To PigPen";
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
