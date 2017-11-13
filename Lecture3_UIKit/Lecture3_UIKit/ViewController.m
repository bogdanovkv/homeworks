//
//  ViewController.m
//  Lecture3_UIKit
//
//  Created by admin on 11.11.17.
//  Copyright © 2017 admin. All rights reserved.
//kvb

#import "ViewController.h"
#import "SBTTouchView.h"
@interface ViewController ()
@property (nonatomic, strong) SBTTouchView* touchView;
@property (nonatomic, strong) UILabel* label;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(5, 20, 200, 30)];
    self.label = label;
    
    SBTTouchView* view1 = [[SBTTouchView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
   
    view1.backgroundColor = [UIColor greenColor];
    view1.center = self.view.center;
    self.touchView = view1;
    self.touchView.delegate = self;
    
    label.text = [NSString stringWithFormat:@"Alpha = %.1f", self.touchView.alpha];
    label.center = CGPointMake(self.view.center.x, label.center.y);
    label.textAlignment = NSTextAlignmentCenter;
   
    self.touchView.multipleTouchEnabled = YES;
    
    [self addGestureRecognisersOnView:self.touchView];
    [self.view addSubview:view1];
    [self.view addSubview:self.label];
    
    
    
}

- (void) removeView
{
    self.view = nil;
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UI

- (void) addGestureRecognisersOnView: (UIView*) view
{
    
    UITapGestureRecognizer* tapRecogniser = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeColor)];
    [view addGestureRecognizer:tapRecogniser];
    
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeAlpha:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [view addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer* swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeAlpha:)];
    swipe1.direction = UISwipeGestureRecognizerDirectionLeft ;
    [view addGestureRecognizer:swipe1];
//    
//    UIPanGestureRecognizer* panRecogniser = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
//    [view addGestureRecognizer:panRecogniser];
    
}

- (void) rewriteLabelWithValue: (CGFloat) value{
    
    self.label.text = [NSString stringWithFormat:@"Alpha = %.1f", value];

}
#pragma mark Homework

- (void) alphaHasChangedValue: (CGFloat) newAlpha
{
    
    self.label.text = [NSString stringWithFormat:@"Alpha = %.1f", newAlpha];
    
}

#pragma mark GestureAction
-(void) changeAlpha: (UISwipeGestureRecognizer*) recogniser
{
    
    
    if (recogniser.direction == UISwipeGestureRecognizerDirectionLeft )
    {
        if(self.touchView.alpha<1)
        {
            self.touchView.alpha = self.touchView.alpha + 0.1;

        }
    }
    if (recogniser.direction == UISwipeGestureRecognizerDirectionRight )
    {
        if(self.touchView.alpha>0.1)
        {
            self.touchView.alpha = self.touchView.alpha - 0.1;

        }
    }
    [self rewriteLabelWithValue: self.touchView.alpha];

}

- (void) changeColor
{
    CGFloat red = ((float)(arc4random()%255))/255;
    CGFloat green = ((float)(arc4random()%255))/255;
    CGFloat blue = ((float)(arc4random()%255))/255;

    self.touchView.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
}
@end
