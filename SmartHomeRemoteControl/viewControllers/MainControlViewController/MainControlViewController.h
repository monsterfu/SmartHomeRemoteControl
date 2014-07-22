//
//  MainControlViewController.h
//  SmartHomeRemoteControl
//
//  Created by Monster on 14-7-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainControlCell.h"
@class PKRevealController;

@interface MainControlViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    mainControlCell* _cell;
    NSMutableArray* _nameArray;
    UIBarButtonItem* _addButton;
}

- (IBAction)addButtonTouch:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong, readwrite) PKRevealController *revealController;
@end
