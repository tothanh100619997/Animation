//
//  BootLogic.h
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SECTION @"section"
#define MENU @"menu"
#define TITLE @"title"
#define CLASS @"class"
#import <UIKit/UIKit.h>

@interface BootLogic : NSObject
+ (void) boot: (UIWindow*) window;
@end
