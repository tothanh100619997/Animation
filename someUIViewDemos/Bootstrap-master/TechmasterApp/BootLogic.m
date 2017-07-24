//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"demoCamFire", CLASS: @"campFire"},
                                    @{TITLE: @"Nest Square", CLASS: @"NestedSquare"},
                                    @{TITLE: @"Fly Bird", CLASS: @"flyBird"},
                                    @{TITLE: @"stars animo", CLASS: @"Stars"},
                                    @{TITLE: @"HexColor", CLASS: @"DemoColor"}
                                    
                          ]};
    NSDictionary* intermediate = @{SECTION: @"Intermediate", MENU: @[
                                    @{TITLE: @"Eather Around Sun", CLASS: @"EatherAroundSun"}
                                  ]};
    NSDictionary* timerAnimation = @{SECTION: @"Timer Animation", MENU: @[
                                    @{TITLE: @"Rolling Ball", CLASS: @"RollingBall"},
                                    @{TITLE: @"drop Ball", CLASS: @"dropBall"}
                             ]};
    
    mainScreen.menu = @[basic, intermediate, timerAnimation];
    mainScreen.title = @"Bootstrap App";
    mainScreen.about = @"This is demo bootstrap demo app. It is collection of sample code of AVFoundation";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
