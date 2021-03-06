//
//  SMPLAppDelegate.h
//  Sample Application
//
//  Created by Philip Kluz on 10/21/13.
//  Copyright (c) 2013 zuui.org (Philip Kluz). All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PKRevealController/PKRevealController.h>
#import "CRDCardView.h"
#import "CRDSlidingCardViewController.h"

#import "SMPLAppDelegate.h"

#import "CardTransferViewController.h"

#import "CardInputView.h"

@interface SMPLAppDelegate : UIResponder <UIApplicationDelegate, UIGestureRecognizerDelegate, CardInputViewDelegate>

@property (strong, nonatomic) UIWindow *window;
//@property UIViewController *frontViewController;


@end
