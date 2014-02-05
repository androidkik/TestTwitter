//
//  ProfileViewController.m
//  TestTwitter
//
//  Created by Enrique Salazar on 04/02/14.
//  Copyright (c) 2014 Enrique Salazar Sixtos. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
{
    NSString *strUserName;
    NSString *strUserAccountName;
    NSString *strUrlImage;
}

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
            }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil usr:(NSString*)usr usrAccount:(NSString*)usrAccount urlImg:(NSString*)urlImg
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"This is your profile";
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                                 style:UIBarButtonItemStylePlain
                                                                                target:self
                                                                                action:@selector(showMenu)];

        strUserName = [NSString stringWithFormat:@"%@",usr];
        strUserAccountName = [NSString stringWithFormat:@"%@",usrAccount];
        strUrlImage = [NSString stringWithFormat:@"%@",urlImg];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[self name]setText:[NSString stringWithFormat:@"Full Name : %@",strUserName]];
    [[self usrAcount]setText:[NSString stringWithFormat:@"Nick Name : %@",strUserAccountName]];
    [[self profileImg]setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strUrlImage]]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showMenu
{
    [self.sideMenuViewController presentMenuViewController];
}
@end
