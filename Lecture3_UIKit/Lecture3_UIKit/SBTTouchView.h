//
//  SBTTouchView.h
//  Lecture3_UIKit
//
//  Created by admin on 11.11.17.
//  Copyright © 2017 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@protocol SBTAlphaChangesDelegate <NSObject>

@required
- (void) alphaHasChangedValue: (CGFloat) newAlpha;

@end


@interface SBTTouchView : UIView
@property (nonatomic, weak)  id <SBTAlphaChangesDelegate> delegate;

@end

