//
//  MBXTableViewController.m
//  MBXPageController
//
//  Created by Nico Arqueros on 1/15/15.
//  Copyright (c) 2015 Moblox. All rights reserved.
//

#import "MBXTableViewController.h"

@interface MBXTableViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation MBXTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    // No extra Cells
    self.tableView.tableFooterView  = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - UITableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [tableView dequeueReusableCellWithIdentifier:@"text_cell" forIndexPath:indexPath];
    }
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"image_cell" forIndexPath:indexPath];
    
    UIImageView *image = (UIImageView *)[cell viewWithTag:1];
    
    NSString* imageName = [NSString stringWithFormat:@"photo_%li", (long)indexPath.row];
    image.image = [UIImage imageNamed:imageName];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 56;
    }
    return 98;
}


@end
