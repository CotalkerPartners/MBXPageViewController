//
//  MBXSegmentControllerExampleViewController.m
//  MBXSegmentPageViewController
//
//  Created by Nico Arqueros on 12/21/14.
//  Copyright (c) 2014 Moblox. All rights reserved.
//

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

@end
