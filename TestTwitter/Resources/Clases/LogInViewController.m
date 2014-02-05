//
//  LogInViewController.m
//  TestTwitter
//
//  Created by Enrique Salazar Sixtos on 03/02/14.
//  Copyright (c) 2014 Enrique Salazar Sixtos. All rights reserved.
//

#import "LogInViewController.h"
#import "FHSTwitterEngine.h"
#import "TimeLineViewController.h"
#import "DEMOMenuViewController.h"

@interface LogInViewController ()<FHSTwitterEngineAccessTokenDelegate>
- (IBAction)logInDo:(id)sender;

@end

@implementation LogInViewController

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
    [[FHSTwitterEngine sharedEngine]permanentlySetConsumerKey:@"Mo6Alt38js649OKBQfdP3g" andSecret:@"nq1gr1A0O0Ob7yIj8Y4FleEnxTuTDFdsJaZay4QmmE"];
    [[FHSTwitterEngine sharedEngine]setDelegate:self];
    [[FHSTwitterEngine sharedEngine]loadAccessToken];
    NSLog(@"%@",FHSTwitterEngine.sharedEngine.authenticatedUsername);
    if (FHSTwitterEngine.sharedEngine.authenticatedUsername) {
        NSLog(@"Directo");
        [self performSelector:@selector(showMenu) withObject:nil afterDelay:1.0f];
    }
    else{
        NSLog(@"No tiene");
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logInDo:(id)sender {
    UIViewController *loginController = [[FHSTwitterEngine sharedEngine]loginControllerWithCompletionHandler:^(BOOL success) {
        NSLog(success?@"Acces Ok":@"O noes!!! Loggen Fail!!!");
        if (success) {
            NSLog(@"Done!");
            [self performSelector:@selector(showMenu) withObject:nil afterDelay:1.0f];
            
            
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"The logIn fail!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
    [self presentViewController:loginController animated:YES completion:nil];
}

- (void)storeAccessToken:(NSString *)accessToken {
    [[NSUserDefaults standardUserDefaults]setObject:accessToken forKey:@"SavedAccessHTTPBody"];
}

- (NSString *)loadAccessToken {
    return [[NSUserDefaults standardUserDefaults]objectForKey:@"SavedAccessHTTPBody"];
}
- (void)logout {
    [[FHSTwitterEngine sharedEngine]clearAccessToken];
}


#pragma mark -
#pragma mark RESideMenu Delegate

- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willShowMenuViewController");
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didShowMenuViewController");
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willHideMenuViewController");
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didHideMenuViewController");
}
-(void)showMenu{
        TimeLineViewController *tes = [[TimeLineViewController alloc]initWithNibName:@"TimeLineViewController" bundle:nil];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tes];
        DEMOMenuViewController *menuViewController = [[DEMOMenuViewController alloc] init];
        
        RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navigationController menuViewController:menuViewController];
        [self presentViewController:sideMenuViewController animated:YES completion:nil];
    
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"VWA %@",FHSTwitterEngine.sharedEngine.authenticatedUsername);
}
@end
