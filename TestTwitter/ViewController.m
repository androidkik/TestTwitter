//
//  ViewController.m
//  TestTwitter
//
//  Created by Enrique Salazar Sixtos on 03/02/14.
//  Copyright (c) 2014 Enrique Salazar Sixtos. All rights reserved.
//

#import "ViewController.h"
#import "FHSTwitterEngine.h"

@interface ViewController ()<FHSTwitterEngineAccessTokenDelegate>
- (IBAction)logInDo:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[FHSTwitterEngine sharedEngine]permanentlySetConsumerKey:@"Mo6Alt38js649OKBQfdP3g" andSecret:@"nq1gr1A0O0Ob7yIj8Y4FleEnxTuTDFdsJaZay4QmmE"];
    [[FHSTwitterEngine sharedEngine]setDelegate:self];
    [[FHSTwitterEngine sharedEngine]loadAccessToken];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logInDo:(id)sender {
    UIViewController *loginController = [[FHSTwitterEngine sharedEngine]loginControllerWithCompletionHandler:^(BOOL success) {
        NSLog(success?@"Acces Ok":@"O noes!!! Loggen Fail!!!");
        //[_theTableView reloadData];
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
@end
