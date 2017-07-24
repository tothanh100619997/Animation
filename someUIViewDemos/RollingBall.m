//
//  RollingBall.m
//  someUIViewDemos
//
//  Created by Nguyen Thanh To on 7/20/17.
//  Copyright © 2017 ThanhTo. All rights reserved.
//

#import "RollingBall.h"

@interface RollingBall ()

@end



@implementation RollingBall
{
    UIImageView* ball;
    NSTimer* timer;
    CGFloat angle;
    CGFloat ballRadius;
    CGFloat velocityX;
    CGFloat x;
    CGFloat y;
    CGFloat widthMax;
    CGFloat deltaAngle;
   
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.edgesForExtendedLayout=UIRectEdgeNone;
    [self drawBall];
    timer=[NSTimer scheduledTimerWithTimeInterval:0.07
                                           target:self
                                         selector:@selector(rollBall)
                                         userInfo:nil
                                          repeats:true];
}
-(void) drawBall{
    CGSize mainViewSize =self.view.bounds.size;
    ball =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football.png"]];
   
    ballRadius =32;
    velocityX =0.0;
    x =ballRadius;
    y=mainViewSize.height*0.5;
    angle=0.0;
    deltaAngle=0.2;
    
    widthMax =mainViewSize.width-ballRadius;
    
    ball.center= CGPointMake(x, y);
    [self.view addSubview:ball];
  
    
    
}
-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}
-(void) rollBall{
    
    
    angle +=deltaAngle;
    velocityX = deltaAngle*ballRadius;
    x = x + velocityX;
    if (x<ballRadius) {
        deltaAngle=-deltaAngle;
        x=ballRadius;
    }
    if (x>widthMax) {
        deltaAngle=-deltaAngle;
        x=widthMax;
        
    }
    
    ball.transform=CGAffineTransformMakeRotation(angle);
        ball.center =CGPointMake(x,y );
    
    
    
    
}

@end
