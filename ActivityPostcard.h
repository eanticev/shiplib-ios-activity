//
//  ActivityPostcard.h
//  Frametastic
//
//  Created by Emil Anticevic on 8/23/13.
//  Copyright (c) 2013 Imaginary Feet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Sincerely/Sincerely.h>

@interface ActivityPostcard : UIActivity <SYSincerelyControllerDelegate>

@property (nonatomic, retain) UIImage *shareImage;

@end
