//
//  DemoViewController.h
//  MBProgressHUDManager
//
//  Created by YU-HENG WU on 2013/11/22.
//  Copyright (c) 2013年 xjimi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUDManager.h"

@interface DemoViewController : UITableViewController
{
    MBProgressHUDManager *HUDManager;
    NSTimer *timer;
    long long expectedLength;
	long long currentLength;
}

@property (nonatomic, strong) NSArray *collection;

@end
