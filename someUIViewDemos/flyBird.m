//
//  flyBird.m
//  someUIViewDemos
//
//  Created by Nguyen Thanh To on 7/16/17.
//  Copyright © 2017 ThanhTo. All rights reserved.
//

#import "flyBird.h"

@interface flyBird ()
{
    UIImageView* bird;
}

@end

@implementation flyBird

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    self.edgesForExtendedLayout =UIRectEdgeNone;
    [self drawjungle];
    [self drawbird];
    [self flyUpAndDown];
   }
-(void) drawjungle{
    UIImageView* background =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    background.frame =self.view.bounds;
    background.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:background];
}
-(void) drawbird{
    bird =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 68)];
    NSMutableArray* images =[[NSMutableArray alloc] initWithCapacity:6];
    for (int i =0; i<6; i++) {
        NSString* fileName;
        fileName =[NSString stringWithFormat:@"Bird%d",i];
        [images addObject:[UIImage imageNamed:fileName]];
    }
    bird.animationImages=images;
    bird.animationDuration =1;
    bird.animationRepeatCount = 0;
    [self.view addSubview:bird];
    [bird startAnimating];
}
-(void) flyUpAndDown{
    bird.transform =CGAffineTransformIdentity;
    [UIView animateWithDuration:5
                     animations:^{
        
        bird.center=CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1,1), CGAffineTransformMakeRotation(M_PI_4));

        [UIView animateWithDuration:5
                         animations:^{
                             bird.center=CGPointMake(0, 0);
                                                      } completion:^(BOOL finished) {
                             [self flyUpAndDown];
                         }];
    }];
    
}
@end
