MBProgressHUDManager
====================

Easier to use MBProgressHUD

## Installation

Just copy the files in `"MBProgressHUDManager/..."` into your project.

## Usage

See [MBProgressHUDManager.h](MBProgressHUDManager/MBProgressHUDManager.h) for the complete API.

### Example usage

```  objc

#import "MBProgressHUDManager.h"

@property (nonatomic, strong) MBProgressHUDManager *HUDManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.HUDManager = [[MBProgressHUDManager alloc] initWithView:self.navigationController.view];
    [self.HUDManager showIndeterminateWithMessage:@"With a block" duration:2 complection:^{
        
    }];
}

```
## Demos

**MBProgressHUDManager** contains a demo app giving you a quick overview of many of its features.

## ARC

**MBProgressHUDManager** uses **automatic reference counting (ARC)**.

## Creator

[XJIMI](https://www.facebook.com/fn5128)


