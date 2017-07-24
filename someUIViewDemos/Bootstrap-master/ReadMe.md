Demo iOS Objective-C Bootstrap application.
Please copy AppDelegate.h, AppDelegate.m, BootLogic.h, BootLogic.m, ConsoleScreen.h, ConsoleScreen.m, MainScreen.h, MainScreen.m to your new project.

This application has a main screen that is UITableViewController. Modify ```mainScreen.menu``` in file BootLogic.m

```Objective-C
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"Basic A", CLASS: @"BasicA"},
                                    @{TITLE: @"Basic B", CLASS: @"BasicB"}
                          ]};
    NSDictionary* intermediate = @{SECTION: @"Intermediate", MENU: @[
                                    @{TITLE: @"Inter B", CLASS: @"InterB"}
                                  ]};
    NSDictionary* advanced = @{SECTION: @"Advanced", MENU: @[
                                    @{TITLE: @"Advanced C", CLASS: @"AdvancedC"}
                             ]};
    
    mainScreen.menu = @[basic, intermediate, advanced];
    mainScreen.title = @"Bootstrap App";
    mainScreen.about = @"This is demo bootstrap demo app. It is collection of sample code of AVFoundation";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
```

if you want to have a terminal like console screen, create ViewController that inherits ConsoleScreen
```Objective-C
#import <UIKit/UIKit.h>
#import "ConsoleScreen.h"
@interface BasicA : ConsoleScreen
@end
```

To output to console screen, use ```[self writeln: @"text"]```
```Objective-C
#import "BasicA.h"

@implementation BasicA

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self writeln:@"ABC"];
    [self writeln:@"DEF"];
}
@end
```