MBProgressHUDManager
====================

Easier to use MBProgressHUD

##Screenshot

[![](screenshot/1-thumb.png)](screenshot/1.png)
[![](screenshot/2-thumb.png)](screenshot/2.png)
[![](screenshot/3-thumb.png)](screenshot/3.png)
[![](screenshot/4-thumb.png)](screenshot/4.png)
[![](screenshot/5-thumb.png)](screenshot/5.png)
[![](screenshot/6-thumb.png)](screenshot/6.png)
[![](screenshot/7-thumb.png)](screenshot/7.png)
[![](screenshot/8-thumb.png)](screenshot/8.png)
[![](screenshot/9-thumb.png)](screenshot/9.png)
[![](screenshot/10-thumb.png)](screenshot/10.png)

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

[@hendrixwu](https://twitter.com/hendrixwu)

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
