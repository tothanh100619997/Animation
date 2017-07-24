//
//  colorView.h
//  someUIViewDemos
//
//  Created by Nguyen Thanh To on 7/20/17.
//  Copyright © 2017 ThanhTo. All rights reserved.
//

#import "UIKit/UIKit.h"

@interface colorView : UIView

-(instancetype) initWithHex: (NSString*) hex
                      alpha: (CGFloat) alpha
                      frame: (CGRect) rect;
@property(nonatomic,strong) NSString* hex;
-(void) fadeOut;

@end
