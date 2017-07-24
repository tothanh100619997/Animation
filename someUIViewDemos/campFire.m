//
//  campFire.m
//  someUIViewDemos
//
//  Created by Nguyen Thanh To on 7/13/17.
//  Copyright © 2017 ThanhTo. All rights reserved.
//

#import "campFire.h"

@interface campFire ()
{
    UIImageView* fire;
}
@end

@implementation campFire
-(void) loadView{
    [super loadView];
}

- (void)viewDidLoad {
    self.view.backgroundColor =[UIColor blackColor];
    self.edgesForExtendedLayout =UIRectEdgeNone;
    [self burnFire];
   
                               
}
-(void) burnFire{
    fire =[[UIImageView alloc] initWithFrame:self.view.bounds];
    NSMutableArray* images =[[NSMutableArray alloc] initWithCapacity:17];
    for (int i =1; i<18; i++) {
        NSString* fileName;
        if (i<10) {
            fileName=[NSString stringWithFormat:@"campFire0%d.gif",i];
        }else{
            fileName=[NSString stringWithFormat:@"campFire%d.gif",i];
        }
        [images addObject:[UIImage imageNamed:fileName]];
        
        
        
    }
    fire.animationImages=images;
    fire.animationDuration=1;
    fire.animationRepeatCount=0;
    [self.view addSubview:fire];
    [fire startAnimating];
}

@end
