//
//  SMPLAppDelegate.m
//  Sample Application
//
//  Created by Philip Kluz on 10/21/13.
//  Copyright (c) 2013 zuui.org (Philip Kluz). All rights reserved.
//

#import "SMPLAppDelegate.h"

@interface SMPLAppDelegate() <PKRevealing>

#pragma mark - Properties
@property (nonatomic, strong, readwrite) PKRevealController *revealController;

@end

@implementation SMPLAppDelegate {
    UIView *acceptOrDecline;
}

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Create the controllers
    self.frontViewController = [[UIViewController alloc] init];
    self.frontViewController.view.backgroundColor = [self colorWithHexString:@"131315"];

//    self.yourCard = [[CRDCardView alloc] initWithFrame:CGRectMake(10.0f, 50.0f, (self.window.frame.size.width - 20.0f), (self.window.frame.size.height - 60.0f))
//                                                       andName:@"Joe Kennedy"
//                                                    andTagline:@"Designer"
//                                                   andLocation:@"Fort Myers, FL"
//                                                andPhoneNumber:@"5555550123"];
//    
//    [self.frontViewController.view addSubview:self.yourCard];
    
    
    
    // Step 2: Instantiate.
    self.revealController = [PKRevealController revealControllerWithFrontViewController:self.frontViewController
                                                                     leftViewController:[self leftViewController]];

    // Step 3: Configure.
    self.revealController.delegate = self;
    self.revealController.animationDuration = 0.25;
    
    // Step 4: Apply.
    self.window.rootViewController = self.revealController;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Receiving Card


#pragma mark - PKRevealing

- (void)revealController:(PKRevealController *)revealController didChangeToState:(PKRevealControllerState)state
{
    NSLog(@"%@ (%d)", NSStringFromSelector(_cmd), (int)state);
}

- (void)revealController:(PKRevealController *)revealController willChangeToState:(PKRevealControllerState)next
{
    PKRevealControllerState current = revealController.state;
    NSLog(@"%@ (%d -> %d)", NSStringFromSelector(_cmd), (int)current, (int)next);
}

#pragma mark - Helpers


- (UIViewController *)leftViewController
{
    UIViewController *leftViewController = [[UIViewController alloc] init];
    leftViewController.view.backgroundColor = [self colorWithHexString:@"131315"];
    
    UIImage *image = [UIImage imageNamed:@"collection"];
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    [iv setImage:image];
    [leftViewController.view addSubview:iv];
    
    return leftViewController;
}

@end
