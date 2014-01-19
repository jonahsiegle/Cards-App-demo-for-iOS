//
//  CardTransferViewController.m
//  JSVerticalPagingDemo
//
//  Created by Jonah Siegle on 1/18/2014.
//  Copyright (c) 2014 Jonah Siegle. All rights reserved.
//

#import "CardTransferViewController.h"

@interface CardTransferViewController ()

@end

@implementation CardTransferViewController{
    
    UIView *acceptOrDecline;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:1.0f]];
    
    //Card simply set as UIView, completely customizable.
    self.yourCard = [[UIView alloc]initWithFrame:self.view.bounds];
    self.yourCard.backgroundColor = [UIColor greenColor];
    
    
    UILabel *cardTxt = [[UILabel alloc]initWithFrame:self.yourCard.frame];
    cardTxt.text = @"Jonah Siegle";
    cardTxt.textAlignment = NSTextAlignmentCenter;
    [self.yourCard addSubview:cardTxt];
    
    [self.view addSubview:self.yourCard];
    
    
    //Card simply set as UIView, completely customizable.
    self.incomingCard = [[UIView alloc]initWithFrame:self.view.bounds];
    self.incomingCard.backgroundColor = [UIColor blueColor];
    
    
    UILabel *othercardTxt = [[UILabel alloc]initWithFrame:self.yourCard.frame];
    othercardTxt.text = @"Joe Kennedy";
    othercardTxt.textAlignment = NSTextAlignmentCenter;
    [self.incomingCard addSubview:othercardTxt];
    [self.incomingCard setHidden:TRUE];
    [self.view addSubview:self.incomingCard];
    
    UIPanGestureRecognizer *swipeCard = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGestureRecognizer:)];
    [swipeCard setDelegate:self];
    [self.view addGestureRecognizer:swipeCard];
    
    
    //USE FOR IBEACON (simulate when you receive a card)
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        [self receiveCard];
//    });
    
    acceptOrDecline = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
    [acceptOrDecline setBackgroundColor:[UIColor colorWithRed:0.3f green:0.3f blue:0.3f alpha:1.0f]];
    [acceptOrDecline setHidden:TRUE];
    
    UIButton *acceptButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [acceptButton setTitle:@"Accept" forState:UIControlStateNormal];
    [acceptButton setFrame:CGRectMake(0, 0, 150, 80)];
    [acceptButton addTarget:self action:@selector(accept) forControlEvents:UIControlEventTouchUpInside];
    
    [acceptOrDecline addSubview:acceptButton];
    
    UIButton *declineButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [declineButton setTitle:@"Decline" forState:UIControlStateNormal];
    [declineButton setFrame:CGRectMake(acceptOrDecline.frame.size.width - 150, 0, 150, 80)];
    [declineButton addTarget:self action:@selector(decline) forControlEvents:UIControlEventTouchUpInside];
    
    [acceptOrDecline addSubview:declineButton];
                                                           
    
    [self.view addSubview:acceptOrDecline];
    
	// Do any additional setup after loading the view.
}

- (void)handlePanGestureRecognizer:(UIPanGestureRecognizer *)gesture {
    
    NSLog(@"delegate");
    
    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
        
        NSLog(@"gesture req");
        
        CGPoint translation = [gesture translationInView:self.view];
        
        self.yourCard.transform = CGAffineTransformMakeTranslation(0, translation.y);
    }else{
        
        if (fabs(self.yourCard.transform.ty) >= (self.view.bounds.size.height - 200)){
            
            //IBEACON SENDING CODE GOES HERE
            
    
            [UIView animateWithDuration:0.30f animations:^{
                self.yourCard.transform = CGAffineTransformMakeTranslation(0, -480);

            }completion:^(BOOL finsihed){
                [self restoreCard];
                
            }];
             
                
        }else{
        
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.35];
            self.yourCard.transform = CGAffineTransformMakeTranslation(0, 0);
            [UIView commitAnimations];
            
        }
    }
    
}

- (void)restoreCard{
    self.yourCard.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height);
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.35];
        self.yourCard.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView commitAnimations];
    });

}

- (void)receiveCard{
    
    self.incomingCard.transform = CGAffineTransformMakeTranslation(0, -self.view.bounds.size.height);
    [self.incomingCard setHidden:FALSE];
    [acceptOrDecline setHidden:FALSE];
    acceptOrDecline.transform = CGAffineTransformMakeTranslation(0, -self.view.bounds.size.height - 80.0f);

    
    
    [UIView animateWithDuration:0.5f animations:^{
        self.yourCard.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height + 80.0f);
        self.incomingCard.transform = CGAffineTransformMakeTranslation(0, 80);
        acceptOrDecline.transform = CGAffineTransformMakeTranslation(0, 0);

        
    }completion:^(BOOL finsihed){
    }];
}

- (void)decline{
    
    [UIView animateWithDuration:0.5f animations:^{
        self.incomingCard.transform = CGAffineTransformMakeTranslation(0, -self.view.bounds.size.height);
        acceptOrDecline.transform = CGAffineTransformMakeTranslation(0, -self.view.bounds.size.height - 80.0f);
        self.yourCard.transform = CGAffineTransformMakeTranslation(0, 0);
        
    }completion:^(BOOL finsihed){
        
        [self.incomingCard setHidden:TRUE];
        [acceptOrDecline setHidden:TRUE];
    }];
}

- (void)accept{
    
    [UIView animateWithDuration:0.5f animations:^{
        self.incomingCard.transform = CGAffineTransformMakeTranslation(0, 0.0f);
        acceptOrDecline.transform = CGAffineTransformMakeTranslation(0, -80.0f);
        
    }completion:^(BOOL finsihed){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.25 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.3f animations:^{
                self.incomingCard.transform = CGAffineTransformMakeTranslation(-self.view.frame.size.width, 0.0f);
                
            }completion:^(BOOL finsihed){
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.25 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

                
                    [UIView animateWithDuration:0.3 animations:^{
                        
                        self.yourCard.transform = CGAffineTransformMakeTranslation(0, 0.0f);

                    }];
                    
                });
            }];

        });
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
