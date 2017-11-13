//
//  SBTTouchView.m
//  Lecture3_UIKit
//
//  Created by admin on 11.11.17.
//  Copyright © 2017 admin. All rights reserved.
//

#import "SBTTouchView.h"
@interface SBTTouchView()

@property (nonatomic, assign) CGFloat xCoordinate;
@property (nonatomic, assign) CGFloat changedApha;
@end

@implementation SBTTouchView

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint location = [self locationInCurrentView:touches ];
    
    self.xCoordinate = location.x;
    self.changedApha = self.alpha;
    
    NSLog(@"Touches began on coordinate x = %f y = %f",location.x , location.y );

}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    CGPoint location = [self locationInCurrentView:touches ];
    CGFloat alpha = self.changedApha +  (self.xCoordinate - location.x) / (3*self.frame.size.width);
    
    if((alpha > 0.05) && (alpha <= 1))
    {
        self.alpha = alpha;
    }
    
    [self.delegate alphaHasChangedValue:self.alpha];
    
    NSLog(@"Alpha = %f", self.alpha);

}


-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}


- (CGPoint) locationInCurrentView: (NSSet*) set
{
    
    UITouch* touch = [set anyObject];

    return [touch locationInView:self];
}

- (void) setChangedApha:(CGFloat)changedApha
{
    if((changedApha > 0.05) & (changedApha <= 1))
    {
        _changedApha = changedApha;
    }
    
}

- (void) dealloc
{
    NSLog(@"View has been deallocated");
}

@end
