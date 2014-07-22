//
//  MainViewController.m
//  SmartHomeRemoteControl
//
//  Created by Monster on 14-7-7.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    UIBarButtonItem* barItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(leftButtonTouched)];
    self.navigationItem.leftBarButtonItem = barItem;
    
    
}


- (void)test{
    
    AsyncUdpSocket *socket=[[AsyncUdpSocket alloc]initWithDelegate:self];
//    socket.localPort = 16747;
    NSTimeInterval timeout=5000;
    NSString *request=@"quick_stat";
    NSData *data=[NSData dataWithData:[request dataUsingEncoding:NSASCIIStringEncoding] ];
    UInt16 port= 11041;
    NSError *error;
    
    [socket bindToPort:port error:&error];
    [socket enableBroadcast:YES error:&error];
    [socket sendData :data toHost:@"255.255.255.255" port:port withTimeout:timeout tag:1];
    [socket receiveWithTimeout:-1 tag:0];
    NSLog(@"begin scan socket.localPort:%d",socket.localPort);
    
}

- (BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port{
    
    NSString* result;
    result = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSLog(@"%@",result);
    NSLog(@"received");
    _testLabel.text = result;
    return NO;
}

-(void)onUdpSocket:(AsyncUdpSocket *)sock didNotReceiveDataWithTag:(long)tag dueToError:(NSError *)error{
    
    NSLog(@"not received");
}

-(void)onUdpSocket:(AsyncUdpSocket *)sock didNotSendDataWithTag:(long)tag dueToError:(NSError *)error{
    
    NSLog(@"%@",error);
    NSLog(@"not send");
}

-(void)onUdpSocket:(AsyncUdpSocket *)sock didSendDataWithTag:(long)tag{
    
    NSLog(@"send");
}

-(void)onUdpSocketDidClose:(AsyncUdpSocket *)sock{
    
    NSLog(@"closed");
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

- (IBAction)testButtonTouch:(UIButton *)sender {
    
//    [self.revealController showViewController:leftViewController];
    [self test];
}

-(void)leftButtonTouched
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(leftTopButtonTouch)]) {
        [self.delegate leftTopButtonTouch];
    }
}
@end
