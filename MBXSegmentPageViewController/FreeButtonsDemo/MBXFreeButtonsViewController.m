//
//  MBXFreeButtonsViewController.m
//  MBXPageViewController
//
//  Created by Nico Arqueros on 12/16/14.
//  Copyright (c) 2014 Moblox. All rights reserved.
//

#import "MBXFreeButtonsViewController.h"
#import "MBXPageViewController.h"

@interface MBXFreeButtonsViewController () <MBXPageControllerDataSource>

@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button1;

@property (weak, nonatomic) IBOutlet UIView *container;

@end

@implementation MBXFreeButtonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initiate MBXPageController
    MBXPageViewController *MBXPageController = [MBXPageViewController new];
    MBXPageController.MBXDataSource = self;
    [MBXPageController reloadPages];
}

#pragma mark - MBXPageViewController Data Source

- (NSArray *)MBXPageButtons
{
    return @[self.button1, self.button2, self.button3];
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
    
    return @[demo,demo2,demo3];
}

@end
