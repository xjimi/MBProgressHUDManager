//
//  DemoViewController.m
//  MBProgressHUDManager
//
//  Created by YU-HENG WU on 2013/11/22.
//  Copyright (c) 2013年 xjimi. All rights reserved.
//

#import "DemoViewController.h"

@implementation DemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"MBProgressHUDManager";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.collection = @[@"Simple_indeterminate_progress",
                        @"With_label",
                        @"With_details_label",
                        @"Determinate_mode",
                        @"Annular_determinate_mode",
                        @"Bar_determinate_mode",
                        @"Custom_view",
                        @"Mode_switching",
                        @"Using_blocks",
                        @"On_Window",
                        @"NSURLConnection",
                        @"Dim_background",
                        @"Text_only",
                        @"Colored"
                        ];
    
    HUDManager = [[MBProgressHUDManager alloc] initWithView:self.navigationController.view];
}

- (void)Simple_indeterminate_progress
{
    [HUDManager showIndeterminateWithMessage:nil duration:2];
}

- (void)With_label
{
    [HUDManager showIndeterminateWithMessage:@"Loading" duration:2];
}

- (void)With_details_label
{
    [HUDManager showIndeterminateWithMessage:@"Loading" duration:2];
    HUDManager.HUD.detailsLabelText = @"updating data";
}

- (void)Determinate_mode
{
    [HUDManager showMessage:@"Loading" mode:MBProgressHUDModeDeterminate];
    [self progressTask];
}

- (void)Annular_determinate_mode
{
    [HUDManager showMessage:@"Loading" mode:MBProgressHUDModeAnnularDeterminate];
    [self progressTask];
}

- (void)Bar_determinate_mode
{
    [HUDManager showMessage:nil mode:MBProgressHUDModeDeterminateHorizontalBar];
    [self progressTask];
}

- (void)Custom_view
{
    [HUDManager showSuccessWithMessage:@"Completed" duration:2];
    //UIImageView *customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    //[HUDManager showMessage:@"Completed" customView:customView duration:2];
}

- (void)Mode_switching
{
    [HUDManager showIndeterminateWithMessage:@"Connecting" duration:2 complection:^{

        [HUDManager showMessage:@"Progress" mode:MBProgressHUDModeDeterminate duration:2 complection:^{
            
            [HUDManager showIndeterminateWithMessage:@"Cleaning up" duration:2 complection:^{
                
                [HUDManager showSuccessWithMessage:@"Completed" duration:2 complection:^{
                
                }];
                
            }];
            
        }];
        [self progressTask];
    }];
}

- (void)Using_blocks
{
    [HUDManager showIndeterminateWithMessage:@"With a block" duration:2 complection:^{
        
    }];
}

- (void)On_Window
{
    [HUDManager showIndeterminateWithMessage:@"Loading" duration:2];
}

- (void)NSURLConnection
{
    NSURL *URL = [NSURL URLWithString:@"http://a1408.g.akamai.net/5/1408/1388/2005110403/1a1a1ad948be278cff2d96046ad90768d848b41947aa1986/sample_iPod.m4v.zip"];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	[connection start];
}

- (void)Dim_background
{
    [HUDManager showIndeterminateWithMessage:nil duration:2];
    HUDManager.HUD.dimBackground = YES;
}

- (void)Text_only
{
    [HUDManager showMessage:@"Some message..." duration:2];
    HUDManager.HUD.margin = 10.f;
	HUDManager.HUD.yOffset = 150.f;
}

- (void)Colored
{
    [HUDManager showIndeterminateWithMessage:nil duration:2];
    HUDManager.HUD.color = [UIColor colorWithRed:0.23 green:0.50 blue:0.82 alpha:0.90];
}

- (void)progressTask
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(progressUpdate) userInfo:nil repeats:YES];
}

- (void)progressUpdate
{
    float progress = HUDManager.HUD.progress + 0.01f;
    [HUDManager showProgress:progress];
    if (progress >= 1.0f)
    {
        [timer invalidate];
        if (!HUDManager.completionBlock) {
            [HUDManager hideWithAfterDuration:1 completion:nil];
        }
    }
}

#pragma mark -
#pragma mark NSURLConnectionDelegete

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	expectedLength = MAX([response expectedContentLength], 1);
	currentLength = 0;
    [HUDManager showIndeterminateWithMessage:nil];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	currentLength += [data length];
    float progress = (currentLength / (float)expectedLength);
    [HUDManager showMessage:nil mode:MBProgressHUDModeDeterminate];
	[HUDManager showProgress:progress];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    UIImageView *customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    [HUDManager showMessage:nil customView:customView duration:2];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[HUDManager showErrorWithMessage:nil duration:2];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.collection.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *title = [self.collection objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectorName = [self.collection objectAtIndex:indexPath.row];
    SEL selector = NSSelectorFromString(selectorName);
    ((void (*)(id, SEL))[self methodForSelector:selector])(self, selector);
}

@end
