//
//  TimeLineViewController.m
//  TestTwitter
//
//  Created by Enrique Salazar on 04/02/14.
//  Copyright (c) 2014 Enrique Salazar Sixtos. All rights reserved.
//

#import "TimeLineViewController.h"
#import "Cell.h"
#import "AppDelegate.h"
#import "InfoViewController.h"

@interface TimeLineViewController ()
{
    NSArray *responseTop;
}

@end

@implementation TimeLineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"This is your timeline";
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                                 style:UIBarButtonItemStylePlain
                                                                                target:self
                                                                                action:@selector(showMenu)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"VDL");
    [self logTimeline];
    // Do any additional setup after loading the view from its nib.
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

- (void)logTimeline {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @autoreleasepool {
            responseTop = [[FHSTwitterEngine sharedEngine]getTimelineForUser:[[FHSTwitterEngine sharedEngine]authenticatedID] isID:YES count:10 ];
           
            NSLog(@"%@",[[FHSTwitterEngine sharedEngine]getTimelineForUser:[[FHSTwitterEngine sharedEngine]authenticatedID] isID:YES count:10]);
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                @autoreleasepool {
                    [[self table]reloadData];
                    [self loadData:[[[responseTop objectAtIndex:0] objectForKey:@"user"]objectForKey:@"name"] :FHSTwitterEngine.sharedEngine.authenticatedUsername :[[[responseTop objectAtIndex:0] objectForKey:@"user"]objectForKey:@"profile_image_url"]];
                }
            });
        }
    });
}
- (void)storeAccessToken:(NSString *)accessToken {
    [[NSUserDefaults standardUserDefaults]setObject:accessToken forKey:@"SavedAccessHTTPBody"];
}

- (NSString *)loadAccessToken {
    return [[NSUserDefaults standardUserDefaults]objectForKey:@"SavedAccessHTTPBody"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [responseTop count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    InfoViewController *info = [[InfoViewController alloc]initWithNibName:@"InfoViewController" bundle:nil title:[[responseTop objectAtIndex:[indexPath row]]objectForKey:@"in_reply_to_screen_name"] content:[[responseTop objectAtIndex:[indexPath row]]objectForKey:@"text"]];
    
    [[self navigationController]pushViewController:info animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellID = @"CellID";
    
    Cell *cell = (Cell*)[tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [[cell usrLabel]setText:[[responseTop objectAtIndex:[indexPath row]]objectForKey:@"in_reply_to_screen_name"]];
    [[cell contentLabel]setText:[[responseTop objectAtIndex:[indexPath row]]objectForKey:@"text"]];
    if ([indexPath row] == ([responseTop count] - 1)) {
        NSLog(@"Last");
    }
    return cell;
}
-(void)loadData:(NSString*)usr :(NSString*)nick :(NSString*)url{
    [((AppDelegate*)[UIApplication sharedApplication].delegate) setUserName:usr];
    [((AppDelegate*)[UIApplication sharedApplication].delegate) setUserAcount:nick];
    [((AppDelegate*)[UIApplication sharedApplication].delegate) setUrlImg:url];
}
@end
