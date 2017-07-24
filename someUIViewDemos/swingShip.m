//
//  swingShip.m
//  someUIViewDemos
//
//  Created by Nguyen Thanh To on 7/17/17.
//  Copyright © 2017 ThanhTo. All rights reserved.
//

#import "swingShip.h"

@interface swingShip ()
{
    UIImageView* red;
    UIImageView* violet;
    UIImageView* brow;
    UIImageView* green;
    CGPoint center;
}
@end

@implementation swingShip

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    CGSize size =self.view.bounds.size;
    center =CGPointMake(size.width*0.5, (size.height-60)*0.5);
    red =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red.png"]];
    red.center =center;
    [self.view addSubview:red];
    
}


@end
