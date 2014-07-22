//
//  homeModel.h
//  SmartHomeRemoteControl
//
//  Created by 符鑫 on 14-7-23.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface homeModel : NSObject

@property(nonatomic,strong)NSString* name;
@property(nonatomic,strong)NSString* type;

-(id)initwithName:(NSString*)name type:(NSString*)type;
@end
