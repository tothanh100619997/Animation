//
//  EatherAroundSun.m
//  someUIViewDemos
//
//  Created by Nguyen Thanh To on 7/21/17.
//  Copyright © 2017 ThanhTo. All rights reserved.
//

#import "EatherAroundSun.h"

@interface EatherAroundSun ()
@end

@implementation EatherAroundSun
{
    UIImageView* Earth;
    UIImageView* Sun;
    NSTimer* timer;
    CGPoint sunCenter;
    CGFloat distanceEarthTosun;
    CGFloat angle;// goc quay
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self addEarthAndSun];
    timer =[NSTimer scheduledTimerWithTimeInterval:0.0167
                                            target:self
                                          selector:@selector(SpinEarth)
                                          userInfo:nil
                                           repeats:true];
}
-(void) addEarthAndSun{
    CGSize mainViewSize =self.view.bounds.size;
    CGFloat margin =20;
    CGFloat statusNAvigationBarHeight =[UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    
    sunCenter =CGPointMake(mainViewSize.width*0.5,
                           (mainViewSize.height+statusNAvigationBarHeight)*0.5);
    distanceEarthTosun = mainViewSize.width*0.5-margin;
    
    Sun =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sun"]];
    Sun.center=sunCenter;
    
   
    Earth =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth"]];
    angle =0.0;
    Earth.center=[self computePosintionOfEarth:angle];
    
    
    [self.view addSubview:Earth];
    [self.view addSubview:Sun];
    
}
-(CGPoint)computePosintionOfEarth: (CGFloat) _angle{
    return CGPointMake(sunCenter.x+ distanceEarthTosun*cosf(angle),
                       sunCenter.y+distanceEarthTosun*sinf(angle));
}
-(void)SpinEarth{
    angle+=0.01;
    Earth.center=[self computePosintionOfEarth:angle];
    if ([Sun.backgroundColor isEqual:[UIColor yellowColor]]) {
        Sun.backgroundColor =[UIColor redColor];
    }else{
        Sun.backgroundColor=[UIColor yellowColor];
    }
}
-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer=nil;
}


@end
