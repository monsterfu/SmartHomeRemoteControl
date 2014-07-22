//
//  AddRoomViewController.h
//  SmartHomeRemoteControl
//
//  Created by Monster on 14-7-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "common.h"
#import "addRoomNameCell.h"
#import "addRoomTypeCell.h"

@interface AddRoomViewController : UIViewController<SKSTableViewDelegate,UITextFieldDelegate>
{
    addRoomNameCell* _nameCell;
    addRoomTypeCell* _typeCell;
    
    NSUInteger _selectedIndex;//默认类型
    NSMutableArray* _typeNameArray;
}
@property (weak, nonatomic) IBOutlet SKSTableView *tableView;

- (IBAction)cancelButtonTouch:(UIBarButtonItem *)sender;

- (IBAction)okButtonTouch:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@end
