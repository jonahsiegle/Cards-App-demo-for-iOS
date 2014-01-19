//
//  CRDCardView.m
//  Sample Application
//
//  Created by Joe Kennedy on 1/18/14.
//  Copyright (c) 2014 Joe Kennedy. All rights reserved.
//

#import "CRDCardView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CRDCardView {
    UIImage *avatar;
    UIImageView *avatarView;
    UILabel *nameLabel;
    UILabel *taglineLabel;
    UILabel *locationLabel;
    UILabel *phoneNumberLabel;
}

- (id)initWithFrame:(CGRect)frame andName:(NSString *)name andTagline:(NSString *)tagline andLocation:(NSString*)location andPhoneNumber:(NSString *)phoneNumber
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        
        avatar = [UIImage imageNamed:@"avatar"];
        avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(15.0f, 15.0f, 60.0f, 60.0f)];
        avatarView.image = avatar;
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0f, 19.0f, (frame.size.width - 90.0f - 15.0f), 29.0f)];
        nameLabel.font = [UIFont fontWithName:@"Avenir-Black" size:26.0f];
        nameLabel.text = name;
        
        taglineLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0f, 50.0f, (frame.size.width - 90.0f - 15.0f), 22.0f)];
        taglineLabel.font = [UIFont fontWithName:@"Avenir-Roman" size:20.0f];
        taglineLabel.textColor = [UIColor colorWithRed:0.33f green:0.33f blue:0.36f alpha:1.0f];
        taglineLabel.text = tagline;
        
        UIFont *attributeFont = [UIFont fontWithName:@"Avenir-Roman" size:15.0f];
        
        if (location) {
            UIImage *locationImage = [UIImage imageNamed:@"location"];
            UIImageView *locationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30.0f, 100.0f, 24.0f, 41.0f)];
            locationImageView.image = locationImage;
            
            locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(83.0f, 112.0f, (frame.size.width - 44.0f - 10.0f), 16.0f)];
            locationLabel.font = attributeFont;
            locationLabel.text = location;
            
            [self addSubview:locationImageView];
            [self addSubview:locationLabel];
        }
        
        if (phoneNumber) {
            UIImage *phoneImage = [UIImage imageNamed:@"phone"];
            UIImageView *phoneImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30.0f, 161.0f, 33.0f, 33.0f)];
            phoneImageView.image = phoneImage;
            
            phoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(83.0f, 163.0f, (frame.size.width - 40.0f), 16.0f)];
            phoneNumberLabel.font = attributeFont;
            phoneNumberLabel.text = phoneNumber;
            
            [self addSubview:phoneImageView];
            [self addSubview:phoneNumberLabel];
        }
        

        [self addSubview:avatarView];
        [self addSubview:nameLabel];
        [self addSubview:taglineLabel];
    }
    return self;
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
