//
//  ProfileViewController.h
//  TestTwitter
//
//  Created by Enrique Salazar on 04/02/14.
//  Copyright (c) 2014 Enrique Salazar Sixtos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DEMOMenuViewController.h"

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *usrAcount;
@property (weak, nonatomic) IBOutlet UIImageView *profileImg;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil usr:(NSString*)usr usrAccount:(NSString*)usrAccount urlImg:(NSString*)urlImg;
@end
