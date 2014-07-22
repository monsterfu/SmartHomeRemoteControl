//
//  AddRoomViewController.m
//  SmartHomeRemoteControl
//
//  Created by Monster on 14-7-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "AddRoomViewController.h"

@interface AddRoomViewController ()

@end

@implementation AddRoomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView.SKSTableViewDelegate = self;
    _tableView.shouldExpandOnlyOneCell = YES;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"img_02.png"] forBarMetrics:UIBarMetricsDefault];
    //去掉TABLEVIEW 多余分割线
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [_tableView setTableFooterView:view];
    
    _typeNameArray = [NSMutableArray arrayWithArray:@[@"卧室",@"客厅",@"厨房",@"书房",@"卫生间",@"浴室",]];
    _selectedIndex = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)tableView:(SKSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            return 0;
        }
            break;
            
        case 1:
        {
            return _typeNameArray.count;
        }
            break;
        default:
            return 0;
            break;
    }
}
- (UITableViewCell *)tableView:(SKSTableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    SKSTableViewCell* _cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"typeDetailCell%d",indexPath.row]];
    if (!_cell) {
        _cell = [[SKSTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"typeDetailCell%d",indexPath.row]];
    }
    _cell.textLabel.text = [_typeNameArray objectAtIndex:indexPath.subRow -1];
    return _cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58.0f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        _nameCell = [tableView dequeueReusableCellWithIdentifier:@"roomNameCell"];
        _nameCell.isExpandable = NO;
        return _nameCell;
    }else{
        _typeCell = [tableView dequeueReusableCellWithIdentifier:@"roomTypeCell"];
        _typeCell.isExpandable = YES;
        _typeCell.typeLabel.text = [_typeNameArray objectAtIndex:_selectedIndex];
        _typeCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return _typeCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    }else{
        if (indexPath.row == 0) {
            return;
        }
        _selectedIndex = indexPath.row-1;
        _typeCell.typeLabel.text = [_typeNameArray objectAtIndex:_selectedIndex];
    }
}

- (IBAction)cancelButtonTouch:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)okButtonTouch:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
