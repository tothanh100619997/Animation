//
//  NestedSquare.m
//  someUIViewDemos
//
//  Created by Nguyen Thanh To on 7/14/17.
//  Copyright © 2017 ThanhTo. All rights reserved.
//

#import "NestedSquare.h"

@interface NestedSquare ()

@end

@implementation NestedSquare
-(void) loadView{
    [super loadView];
}
- (void)viewDidLoad {
    self.view.backgroundColor =[UIColor blackColor];
    [self drawNestSquares];
    [self performSelector:@selector(rotateAllSquares) withObject:nil afterDelay:2];
    
  }
-(void) drawNestSquares{
    CGSize mainViewSize =self.view.bounds.size;
    CGFloat margin =20;
    CGFloat secWidth = mainViewSize.width-2*margin;
    CGFloat statusNAvigationBarHeight =[UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    CGPoint center =CGPointMake(mainViewSize.width*0.5, (statusNAvigationBarHeight+mainViewSize.height)*0.5);
    for (int i =0 ; i<10; i++) {
        UIView* squares;
        if(i%2==0){
            squares = [self drawSquaresWidth:secWidth AndRotate:false AtCenter:center];
        }else{
            squares =[self drawSquaresWidth:secWidth AndRotate:true AtCenter:center];
        }
        [self.view addSubview:squares];
        secWidth *=0.707;
    }
    
    
}
-(UIView*) drawSquaresWidth:(CGFloat) width
               AndRotate:(BOOL) rotate
                AtCenter:(CGPoint) center{
    UIView* squares =[[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    squares.center =center;
    squares.backgroundColor = rotate ? [UIColor whiteColor]:[UIColor darkGrayColor];
    squares.transform = rotate ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    return squares;
}
-(void) rotateAllSquares{
    [UIView animateWithDuration:2.0 animations:^{
        for (int i =0; i<self.view.subviews.count; i++) {
            if (i%2==0) {
                self.view.subviews[i].transform =CGAffineTransformMakeRotation(M_PI_4);
            }else{
                self.view.subviews[i].transform = CGAffineTransformIdentity;            }
        }
    }];
    
}



@end
