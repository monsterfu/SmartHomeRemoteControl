//
//  MainControlViewController.m
//  SmartHomeRemoteControl
//
//  Created by Monster on 14-7-22.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MainControlViewController.h"

#import "MainViewController.h"
#import "LeftViewController.h"
#import "PKRevealController.h"

@interface MainControlViewController ()

@end

@implementation MainControlViewController

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
//    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"img (24)"] forBarMetrics:UIBarMetricsDefault];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    
    _nameArray = [NSMutableArray arrayWithArray:@[@"房间",@"房间",@"房间",@"环境",@"可视电话",@"场景1",@"场景2",@"快捷1",@"快捷2",@"房间",@"房间",@"房间"]];
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
#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _nameArray.count;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    _cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mainControlCellIdentifier" forIndexPath:indexPath];
    _cell.nameLabel.text = [_nameArray objectAtIndex:indexPath.row];
    return _cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectItemAtIndexPath");
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"mainIdentifier"];
    LeftViewController *leftViewController = [storyboard instantiateViewControllerWithIdentifier:@"leftIdentifier"];
    
    UINavigationController *frontViewController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    self.revealController = [PKRevealController revealControllerWithFrontViewController:frontViewController
                                                                     leftViewController:leftViewController
                                                                    rightViewController:nil
                                                                                options:nil];
    // Step 2: Configure an options dictionary for the PKRevealController if necessary - in most cases the default behaviour should suffice. See PKRevealController.h for more option keys.
    /*
     NSDictionary *options = @{
     PKRevealControllerAllowsOverdrawKey : [NSNumber numberWithBool:YES],
     PKRevealControllerDisablesFrontViewInteractionKey : [NSNumber numberWithBool:YES]
     };
     */
    
    // Step 3: Instantiate your PKRevealController.
    
    mainViewController.delegate = _revealController;
    
    [self presentViewController:_revealController animated:YES completion:nil];
}
- (IBAction)addButtonTouch:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"addRoomIdentifier" sender:nil];
}
@end
