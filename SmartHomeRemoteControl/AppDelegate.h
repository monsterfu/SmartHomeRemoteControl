//
//  AppDelegate.h
//  SmartHomeRemoteControl
//
//  Created by Monster on 14-7-3.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PKRevealController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong, readwrite) PKRevealController *revealController;
@property (strong, nonatomic) UIWindow *window;

@end
