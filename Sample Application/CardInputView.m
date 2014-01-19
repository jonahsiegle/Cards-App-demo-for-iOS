//
//  CardInputView.m
//  Sample Application
//
//  Created by Jonah Siegle on 1/19/2014.
//  Copyright (c) 2014 zuui.org (Philip Kluz). All rights reserved.
//

#import "CardInputView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CardInputView{
    
    UIView *baseView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        baseView = [[UIView alloc]initWithFrame:CGRectMake(10.0f, 50.0f, (self.frame.size.width - 20.0f), (self.frame.size.height - 60.0f))];
        baseView.backgroundColor = [UIColor whiteColor];
        baseView.layer.cornerRadius = 10;
        baseView.layer.masksToBounds = YES;
        [self addSubview:baseView];
        
        UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [doneButton setTitle:@"Done" forState:UIControlStateNormal];
        [doneButton addTarget:self action:@selector(done) forControlEvents:UIControlEventTouchUpInside];
        [doneButton setFrame:CGRectMake(240, 20, 60, 10)];
        [self addSubview:doneButton];
        
        [self setBackgroundColor:[UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:1.0f]];
        
        self.name = [[UITextField alloc]initWithFrame:CGRectMake(20, 20, 258, 43)];
        [self.name setFont:[UIFont fontWithName:@"Avenir" size:18]];
        [self.name setPlaceholder:@"NAME"];
        [self.name setReturnKeyType:UIReturnKeyDone];
        [self.name addTarget:self action:@selector(end) forControlEvents:UIControlEventEditingDidEndOnExit];
        [baseView addSubview:self.name];
        
        self.headline = [[UITextField alloc]initWithFrame:CGRectMake(20, 70, 258, 43)];
        [self.headline setFont:[UIFont fontWithName:@"Avenir" size:18]];
        [self.headline setPlaceholder:@"HEADLINE"];
        [self.headline setReturnKeyType:UIReturnKeyDone];
        [self.headline addTarget:self action:@selector(end) forControlEvents:UIControlEventEditingDidEndOnExit];

        [baseView addSubview:self.headline];
        
        
        self.local = [[UITextField alloc]initWithFrame:CGRectMake(20, 120, 258, 43)];
        [self.local setFont:[UIFont fontWithName:@"Avenir" size:18]];
        [self.local setPlaceholder:@"LOCATION"];
        [self.local setReturnKeyType:UIReturnKeyDone];
        [self.local addTarget:self action:@selector(end) forControlEvents:UIControlEventEditingDidEndOnExit];

        [baseView addSubview:self.local];
        
        
        self.phone = [[UITextField alloc]initWithFrame:CGRectMake(20, 170, 258, 43)];
        [self.phone setFont:[UIFont fontWithName:@"Avenir" size:18]];
        [self.phone setPlaceholder:@"PHONE NUMBER"];
        [self.phone setReturnKeyType:UIReturnKeyDone];
        [self.phone setKeyboardType:UIKeyboardTypeDecimalPad];
        [self.phone addTarget:self action:@selector(end) forControlEvents:UIControlEventEditingDidEndOnExit];

        [baseView addSubview:self.phone];
        
        
        self.email = [[UITextField alloc]initWithFrame:CGRectMake(20, 220, 258, 43)];
        [self.email setFont:[UIFont fontWithName:@"Avenir" size:18]];
        [self.email setPlaceholder:@"EMAIL"];
        [self.email setReturnKeyType:UIReturnKeyDone];
        [self.email addTarget:self action:@selector(end) forControlEvents:UIControlEventEditingDidEndOnExit];

        [baseView addSubview:self.email];
        
        
        self.website = [[UITextField alloc]initWithFrame:CGRectMake(20, 270, 258, 43)];
        [self.website setFont:[UIFont fontWithName:@"Avenir" size:18]];
        [self.website setPlaceholder:@"NAME"];
        [self.website setReturnKeyType:UIReturnKeyDone];
        [self.website addTarget:self action:@selector(end) forControlEvents:UIControlEventEditingDidEndOnExit];

        [baseView addSubview:self.website];
        
        
        self.twitter = [[UITextField alloc]initWithFrame:CGRectMake(20, 320, 258, 43)];
        [self.twitter setFont:[UIFont fontWithName:@"Avenir" size:18]];
        [self.twitter setPlaceholder:@"TWITTER"];
        [self.twitter setReturnKeyType:UIReturnKeyDone];
        [self.twitter addTarget:self action:@selector(end) forControlEvents:UIControlEventEditingDidEndOnExit];

        [baseView addSubview:self.twitter];
        
        //Add dotted lines
        for (int i = 1; i <= 7; i++)
        {
            UIImageView *dots = [[UIImageView alloc]initWithFrame:CGRectMake(22, 55 + (50 * i), 257, 2)];
            [dots setImage:[UIImage imageNamed:@"dashed.png"]];
            [self addSubview:dots];
        }
        
    }
    return self;
}

- (void)end{
    
}

- (void)done{
    
    if ([_delegate respondsToSelector:@selector(didFinishInputtingCard:)]){
        [_delegate didFinishInputtingCard:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
