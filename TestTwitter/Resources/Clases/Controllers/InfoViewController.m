//
//  InfoViewController.m
//  TestTwitter
//
//  Created by Enrique Salazar on 04/02/14.
//  Copyright (c) 2014 Enrique Salazar Sixtos. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
{
    NSString *strTitle;
    NSString *strContent;
}
@end

@implementation InfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString*)title content:(NSString*)content
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        strContent = [NSString stringWithFormat:@"%@",content];
        strTitle = [NSString stringWithFormat:@"%@",title];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[self lblContent]setText:strContent];
    [[self lblTitle]setText:strTitle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
