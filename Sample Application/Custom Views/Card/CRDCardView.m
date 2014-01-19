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

}

- (id)initWithFrame:(CGRect)frame andName:(NSString *)name andTagline:(NSString *)tagline andLocation:(NSString*)location andPhoneNumber:(NSString *)phoneNumber
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        
        self.avatar = [UIImage imageNamed:@"avatar"];
        self.avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(15.0f, 15.0f, 60.0f, 60.0f)];
        self.avatarView.image = self.avatar;
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0f, 19.0f, (frame.size.width - 90.0f - 15.0f), 29.0f)];
        self.nameLabel.font = [UIFont fontWithName:@"Avenir-Black" size:26.0f];
        self.nameLabel.text = name;
        
        self.taglineLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0f, 50.0f, (frame.size.width - 90.0f - 15.0f), 22.0f)];
        self.taglineLabel.font = [UIFont fontWithName:@"Avenir-Roman" size:20.0f];
        self.taglineLabel.textColor = [UIColor colorWithRed:0.33f green:0.33f blue:0.36f alpha:1.0f];
        self.taglineLabel.text = tagline;
        
        UIFont *attributeFont = [UIFont fontWithName:@"Avenir-Roman" size:15.0f];
        
        if (location) {
            UIImage *locationImage = [UIImage imageNamed:@"location"];
            UIImageView *locationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30.0f, 100.0f, 24.0f, 41.0f)];
            locationImageView.image = locationImage;
            
            self.locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(83.0f, 112.0f, (frame.size.width - 44.0f - 10.0f), 16.0f)];
            self.locationLabel.font = attributeFont;
            self.locationLabel.text = location;
            
            [self addSubview:locationImageView];
            [self addSubview:self.locationLabel];
        }
        
        if (phoneNumber) {
            UIImage *phoneImage = [UIImage imageNamed:@"phone"];
            UIImageView *phoneImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30.0f, 161.0f, 33.0f, 33.0f)];
            phoneImageView.image = phoneImage;
            
            self.phoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(83.0f, 163.0f, (frame.size.width - 40.0f), 16.0f)];
            self.phoneNumberLabel.font = attributeFont;
            self.phoneNumberLabel.text = phoneNumber;
            
            [self addSubview:phoneImageView];
            [self addSubview:self.phoneNumberLabel];
        }
        

        [self addSubview:self.avatarView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.taglineLabel];
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
