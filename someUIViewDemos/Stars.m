//
//  Stars.m
//  someUIViewDemos
//
//  Created by Nguyen Thanh To on 7/18/17.
//  Copyright © 2017 ThanhTo. All rights reserved.
//

#import "Stars.h"

@interface Stars ()
{
    UIImageView* red,*green,*brown,*violet;
    CGPoint center;

    
}
@end

    CGFloat deltaX =100;
    CGFloat deltaY =100;


@implementation Stars

- (void)viewDidLoad {
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGSize size = self.view.bounds.size;
    center = CGPointMake(size.width*0.5, (size.height-60)*0.5);
    red =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red"]];
    green =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    brown =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown"]];
    violet =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet"]];
    
    red.center=center;
    green.center=center;
    brown.center=center;
    violet.center=center;
    
    [self.view addSubview:red];
    [self.view addSubview:green];
    [self.view addSubview:brown];
    [self.view addSubview:violet];
    
    [self AnimateStar];
}
-(void) AnimateStar{
    [UIView animateWithDuration:1 animations:^{
        red.center=CGPointMake(red.center.x-deltaX, red.center.y-deltaY);
        green.center=CGPointMake(green.center.x+deltaX,green.center.y-deltaY );
        brown.center=CGPointMake(brown.center.x-deltaX, brown.center.y+deltaY);
        violet.center=CGPointMake(violet.center.x+deltaX, violet.center.y+deltaY);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3 animations:^{
            red.center=CGPointMake(red.center.x, red.center.y+deltaY);
          
            brown.center=CGPointMake(brown.center.x+deltaX, brown.center.y);
            
            violet.center=CGPointMake(violet.center.x, violet.center.y-deltaY);
            
            green.center =CGPointMake(green.center.x-deltaX, green.center.y);
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1
                             animations:^{
                                 red.center=CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
                                 brown.center=CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
                                 violet.center=CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
                                 green.center=CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
                                 
                             } completion:^(BOOL finished) {
                                 [self AnimateStar];
                             }];
        }];
        
    }];
}


@end
