//
//  dropBall.m
//  someUIViewDemos
//
//  Created by Nguyen Thanh To on 7/22/17.
//  Copyright © 2017 ThanhTo. All rights reserved.
//

#import "dropBall.h"

@interface dropBall ()

@end

@implementation dropBall
{
    UIImageView* ball;
    NSTimer *timer;
    CGFloat radius;
    CGFloat velocityY;
    CGFloat heightMax;
    CGFloat acceleration;
    CGFloat x;
    CGFloat y;
    float angle;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    [self addBall];
    [NSTimer scheduledTimerWithTimeInterval:0.0167
                                     target:self
                                   selector:@selector(dropBall)
                                   userInfo:nil
                                    repeats:true];
    
    
}
-(void)addBall{
    ball =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football"]];
    CGSize mainViewSize =self.view.bounds.size;
    
    CGFloat statusNAvigationBarHeight =[UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    radius =32;
    heightMax =mainViewSize.height-statusNAvigationBarHeight-radius;
    x=mainViewSize.width*0.5;
    y = radius;
    velocityY =0.0;
    acceleration =0.25;
    ball.center =CGPointMake(x, y);
    [self.view addSubview:ball];

   
    
}
-(void) dropBall{
    angle+=0.5;
    velocityY+=acceleration;
    y+=velocityY;
    if (y>=heightMax) {
        velocityY=-velocityY*0.98;
        y=heightMax;
        
    }
    ball.center=CGPointMake(x, y);
    ball.transform=CGAffineTransformMakeRotation(angle);
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer =nil;
}

@end
