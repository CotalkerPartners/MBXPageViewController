//
//  MBXCollectionViewController.m
//  MBXPageController
//
//  Created by Nico Arqueros on 1/15/15.
//  Copyright (c) 2015 Moblox. All rights reserved.
//

#import "MBXCollectionViewController.h"

@interface MBXCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation MBXCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 14;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"image_cell" forIndexPath:indexPath];
    
    UIImageView *image = (UIImageView *)[cell viewWithTag:1];
    NSInteger count = indexPath.row + 1;
    NSString* imageName = [NSString stringWithFormat:@"photo_%li", (long)count];
    image.image = [UIImage imageNamed:imageName];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(115, 115);
}

@end
