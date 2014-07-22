//
//  homeModel.m
//  SmartHomeRemoteControl
//
//  Created by 符鑫 on 14-7-23.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "homeModel.h"

@implementation homeModel

-(id)initwithName:(NSString*)name type:(NSString*)type
{
    if (self) {
        self.name = name;
        self.type = type;
    }
    return self;
}
@end
