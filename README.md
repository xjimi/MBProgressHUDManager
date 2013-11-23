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

# License

```
The MIT License (MIT)

Copyright (c) 2013 XJIMI

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
