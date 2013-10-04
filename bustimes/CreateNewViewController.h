//
//  CreateNewViewController.h
//  bustimes
//
//  Created by Adela Chang on 2013/09/28.
//  Copyright (c) 2013年 Adela Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utilities.h"

@interface CreateNewViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UILabel *newstop;
    IBOutlet UILabel *newfolder;
    IBOutlet UITextField *stopids;
    IBOutlet UITextField *grpname;
    IBOutlet UITextField *fldername;
    BOOL overwrite;
    NSUserDefaults *standardDefaults;
}
@property (nonatomic,assign) id <UITextFieldDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIButton *grpgo;
@property (nonatomic, retain) IBOutlet UILabel *newstop;
@property (nonatomic, retain) IBOutlet UILabel *newfolder;
@property (nonatomic, retain) IBOutlet UITextField *stopids;
@property (nonatomic, retain) IBOutlet UITextField *grpname;
@property (nonatomic, retain) IBOutlet UITextField *fldername;
@property (strong, nonatomic) IBOutlet UIButton *fldergo;

- (IBAction)onClick1:(id)sender;
- (IBAction)onClick2:(id)sender;
- (BOOL)checkIdFormat:(NSString *)ids;
- (BOOL) textFieldShouldReturn:(UITextField *)textField;

@end
