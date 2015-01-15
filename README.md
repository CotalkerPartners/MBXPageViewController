#MBXPageViewController

A library that allows to have a UIPageController with control buttons (One per VC / Left-Right Buttons) or an UISegmentController. This is not a difficult task, but the intention of this library is to make it extremely easy, clean and fast. We resemble the use of a UITableView in a UIViewController.

## How it looks
### Free Buttons
![Free Buttons Gif](AnimatedGif/FreeButtons.gif)
### Left/ Right Arrow Buttons
![Arrow Buttons Gif](AnimatedGif/ArrowButtons.gif)
### SegmentController Buttons
![Segment Gif](AnimatedGif/Segment.gif)

## Features
### Page Modes
- MBX_FreeButtons: Add as many buttons as Viewcontrollers. You can jump to an specific ViewController with that Button or you can swipe your way through
- MBX_LeftRightButtons: Use two buttons to move left or right through the ViewControllers.
- MBX_SegmentController: Use a SegmentController to move between the ViewControllers.

### Other Features
- Delegate: Everytime that a new ViewController Appear you can trigger other actions.
- Storyboard / Xib / Programmatically Created Views: You can use any of those or even mix them.

## What can I include in the ViewControllers
- UITableViewControllers
- UICollectionViewControllers
- UIViewControllers
- Pretty much anything!

## Installation

### CocoaPod

Available in [Cocoa Pods](http://cocoapods.org/?q=MBXPageViewController)
```
pod 'MBXPageViewController'
```

### Adding the Files

Add MBXPageViewController.h / .m to your project and you are ready to go.

## Examples

You can find examples for the three different ways to use this (Free Buttons, Left Right or with an UISegmentController) in the project.

## Code Example

```
#import "MBXSegmentControllerExampleViewController.h"
#import "MBXPageViewController.h"

@interface MBXSegmentControllerExampleViewController () <MBXPageControllerDataSource, MBXPageControllerDataDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation MBXSegmentControllerExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initiate MBXPageController
    MBXPageViewController *MBXPageController = [MBXPageViewController new];
    MBXPageController.MBXDataSource = self;
    MBXPageController.MBXDataDelegate = self;
    MBXPageController.pageMode = MBX_SegmentController;
    [MBXPageController reloadPages];
}

#pragma mark - MBXPageViewController Data Source

- (NSArray *)MBXPageButtons
{
    return @[self.segmentController];
}

- (UIView *)MBXPageContainer
{
    return self.containerView;
}

- (NSArray *)MBXPageControllers
{
    // You can Load a VC directly from Storyboard
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *demo  = [mainStoryboard instantiateViewControllerWithIdentifier:@"firstController"];
    
    // Or Load it from a xib file
    UIViewController *demo2 = [UIViewController new];
    demo2.view = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil] objectAtIndex:0];
    
    // Or create it programatically
    UIViewController *demo3 = [[UIViewController alloc] init];
    demo3.view.backgroundColor = [UIColor orangeColor];
    
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 40, 300, 40)];
    fromLabel.text = @"Third Controller";
    
    [demo3.view addSubview:fromLabel];
    
    // The order matters.
    return @[demo,demo2,demo3];
}



#pragma mark - MBXPageViewController Delegate

- (void)MBXPageChangedToIndex:(NSInteger)index
{
    NSLog(@"%@ %ld", [self class], (long)index);
}

```

## Based in the Work of cwRichardKim

Based in: https://github.com/cwRichardKim/RKSwipeBetweenViewControllers

MBXPageViewController
=====================

The MIT License (MIT)

Copyright (c) 2014 Moblox

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
