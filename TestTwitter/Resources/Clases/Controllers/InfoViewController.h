//
//  InfoViewController.h
//  TestTwitter
//
//  Created by Enrique Salazar on 04/02/14.
//  Copyright (c) 2014 Enrique Salazar Sixtos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblContent;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString*)title content:(NSString*)content;
@end
