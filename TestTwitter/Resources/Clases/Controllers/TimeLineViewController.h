//
//  TimeLineViewController.h
//  TestTwitter
//
//  Created by Enrique Salazar on 04/02/14.
//  Copyright (c) 2014 Enrique Salazar Sixtos. All rights reserved.
//

#import "ViewController.h"
#import "DEMOMenuViewController.h"
#import "FHSTwitterEngine.h"

@interface TimeLineViewController : ViewController<FHSTwitterEngineAccessTokenDelegate,UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end
