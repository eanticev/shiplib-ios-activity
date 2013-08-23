//
//  ActivityPostcard.m
//  Frametastic
//
//  Created by Emil Anticevic on 8/23/13.
//  Copyright (c) 2013 Imaginary Feet. All rights reserved.
//

#import "ActivityPostcard.h"

@implementation ActivityPostcard

- (NSString *)activityType {
    return @"UIActivityTypeSendPostcard";
}

- (NSString *)activityTitle {
    return @"Postcard";
}

- (UIImage *)activityImage {
    return [UIImage imageNamed:@"postcard.png"];
}


- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    for (id item in activityItems) {
        if ([item isKindOfClass:[UIImage class]])
            self.shareImage = item;
    }
}

- (UIViewController *)activityViewController {
    
    SYSincerelyController *controller = [[SYSincerelyController alloc] initWithImages:[NSArray arrayWithObject:self.shareImage]
                                                                              product:SYProductTypePostcard
                                                                       applicationKey:@"P1H1U01VP7B1F5EMYFULYZHCO92LQV1N8QXKXI7D"
                                                                             delegate:self];
    controller.shouldSkipCrop = YES;
    
	return controller;
}


#pragma mark -
#pragma mark SYSincerelyControllerDelegate

- (void)sincerelyControllerDidFinish:(SYSincerelyController *)controller {
    /*
     * Here I know that the user made a purchase and I can do something with it
     */
    
    [self activityDidFinish:YES];
    [[[TTNavigator navigator] visibleViewController] dismissModalViewControllerAnimated:YES];
}

- (void)sincerelyControllerDidCancel:(SYSincerelyController *)controller {
    /*
     * Here I know that the user hit the cancel button and they want to leave the Sincerely controller
     */
    
    [self activityDidFinish:NO];
    [[[TTNavigator navigator] visibleViewController] dismissModalViewControllerAnimated:YES];
}

- (void)sincerelyControllerDidFailInitiationWithError:(NSError *)error {
    /*
     * Here I know that incorrect inputs were given to initWithImages:product:applicationKey:delegate;
     */
    
    [self activityDidFinish:NO];
    NSLog(@"Error: %@", error);
}


@end
