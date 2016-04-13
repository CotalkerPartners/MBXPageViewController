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

@property (strong, nonatomic) MBXPageViewController *MBXPageController;
@end

@implementation MBXLeftRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initiate MBXPageController
    self.MBXPageController = [MBXPageViewController new];
    self.MBXPageController.MBXDataSource = self;
    self.MBXPageController.MBXDataDelegate = self;
    self.MBXPageController.pageMode = MBX_LeftRightArrows;
    [self.MBXPageController reloadPages];
}

- (IBAction)goToThirdScreen:(id)sender {
    [self.MBXPageController moveToViewNumber:2 animated:true];
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

- (void)MBXPageChangedToIndex:(NSInteger)index {
    NSInteger humanizeIndex = index + 1;
    self.currentIndicator.text = [NSString stringWithFormat:@"%li", (long)humanizeIndex];
    NSLog(@"%@ %ld", [self class], (long)index);
}

@end
