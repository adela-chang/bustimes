//
//  CreateNewViewController.m
//  bustimes
//
//  Created by Adela Chang on 2013/09/28.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import "CreateNewViewController.h"

@interface CreateNewViewController ()

@end

@implementation CreateNewViewController

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
    standardDefaults = [NSUserDefaults standardUserDefaults];
    _newstop.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(18.0)];
    _newfolder.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(18.0)];
    _stopids.delegate = self;
    _stopids.placeholder = @"StopIDs (55551, 51072... etc)";
    _grpname.delegate = self;
    _grpname.placeholder = @"Group Name";
    _fldername.delegate = self;
    _fldername.placeholder = @"Folder Name";
    overwrite = NO;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onClick1:(id)sender
{
    if ([_stopids.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No stop ids were entered!"
                                                       delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else if ([self checkIdFormat:_stopids.text] == NO){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Stop IDs format incorrect (must be of the form 12345, 12345)"
                                                       delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];

    } else if ([standardDefaults stringArrayForKey:_grpname.text] != nil && overwrite == NO) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                message:@"Group with the same name already exists, overwrite?"
                                                delegate:self
                                                cancelButtonTitle:@"Cancel"
                                                otherButtonTitles:@"OK", nil];
        [alert show];
    } else {
        [self segueGroup:sender];
    }
}

- (void) segueGroup:(id)sender
{
    NSString *newid = [_stopids.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSArray *idList = [newid componentsSeparatedByString:@","];
    NSString *mainType = [standardDefaults stringForKey: @"main_type"];
    if (mainType == nil) {
        [standardDefaults setObject:@"group" forKey:@"main_type"];
        NSMutableDictionary *main = [[NSMutableDictionary alloc] initWithCapacity:5];
        [main setObject:idList forKey:_grpname.text];
    }
    [standardDefaults setObject:idList forKey:_grpname.text];
    [standardDefaults synchronize];
    [self performSegueWithIdentifier:@"Go Group" sender:sender];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        overwrite = YES;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
/*    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"Go Group"])
    {
        // Get reference to the destination view controller
        MsgViewController *vc = [segue destinationViewController];
        vc.displayText = @"You have successfully added a new group!";
        vc.key = _grpname.text;
    } else if ([[segue identifier] isEqualToString:@"Go Folder"])
    {
        // Get reference to the destination view controller
        MsgViewController *vc = [segue destinationViewController];
        vc.displayText = @"You have successfully added a new folder!";
    }*/
}

- (BOOL)checkIdFormat:(NSString*)ids
{
    NSString *newid = [ids stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSArray *idList = [newid componentsSeparatedByString:@","];
    for (id item in idList) {
        if ([item length] == 5) {}
        else { return NO; }
    }
    return YES;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)onClick2:(id)sender {
    if ([_fldername.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No name was entered!"
                                                       delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}
@end
