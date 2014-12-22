//
//  MBXLeftRightViewController.m
//  MBXSegmentPageViewController
//
//  Created by Nico Arqueros on 12/21/14.
//  Copyright (c) 2014 Moblox. All rights reserved.
//

#import "MBXLeftRightViewController.h"
#import "MBXPageViewController.h"

@interface MBXLeftRightViewController () <MBXPageControllerDataSource, MBXPageControllerDataDelegate>
@property (weak, nonatomic) IBOutlet UIButton *left;
@property (weak, nonatomic) IBOutlet UIButton *right;
@property (weak, nonatomic) IBOutlet UILabel *currentIndicator;

@property (weak, nonatomic) IBOutlet UIView *container;
@end

@implementation MBXLeftRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initiate MBXPageController
    MBXPageViewController *MBXPageController = [MBXPageViewController new];
    MBXPageController.MBXDataSource = self;
    MBXPageController.MBXDataDelegate = self;
    MBXPageController.pageMode = MBX_LeftRightArrows;
    [MBXPageController reloadPages];
}

#pragma mark - MBXPageViewController Data Source

- (NSArray *)MBXPageButtons
{
    return @[self.left, self.right];
}

- (UIView *)MBXPageContainer
{
    return self.container;
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
    
    UIViewController *demo4  = [mainStoryboard instantiateViewControllerWithIdentifier:@"fourthController"];
    
    // The order matters.
    return @[demo,demo2,demo3, demo4];
}



#pragma mark - MBXPageViewController Delegate

- (void)MBXPageChangedToIndex:(NSInteger)index
{
    NSInteger humanizeIndex = index + 1;
    self.currentIndicator.text = [NSString stringWithFormat:@"%li", (long)humanizeIndex];
    NSLog(@"%@ %ld", [self class], (long)index);
}

@end
