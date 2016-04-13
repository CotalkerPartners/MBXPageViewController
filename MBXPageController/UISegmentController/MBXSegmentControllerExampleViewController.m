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

@property (strong, nonatomic) MBXPageViewController* MBXPageController;

@end

@implementation MBXSegmentControllerExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initiate MBXPageController
    self.MBXPageController = [MBXPageViewController new];
    self.MBXPageController.MBXDataSource = self;
    self.MBXPageController.MBXDataDelegate = self;
    self.MBXPageController.pageMode = MBX_SegmentController;
    [self.MBXPageController reloadPages];
}

- (IBAction)goToThirdView:(id)sender {
    
    [self.MBXPageController moveToViewNumber:2 animated:true];
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
    UIViewController *demo2  = [mainStoryboard instantiateViewControllerWithIdentifier:@"secondController"];
    
    // Or Load it from a xib file
    UIViewController *demo3 = [UIViewController new];
    demo3.view = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil] objectAtIndex:0];
    
    // Or create it programatically
    UIViewController *demo4 = [[UIViewController alloc] init];
    demo4.view.backgroundColor = [UIColor orangeColor];
    
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake( (self.view.frame.size.width - 130)/2 , 40, 130, 40)];
    fromLabel.text = @"Fourth Controller";
    
    [demo4.view addSubview:fromLabel];
    
    // The order matters.
    return @[demo,demo2, demo3];
}



#pragma mark - MBXPageViewController Delegate

- (void)MBXPageChangedToIndex:(NSInteger)index
{
    NSLog(@"%@ %ld", [self class], (long)index);
}

@end
