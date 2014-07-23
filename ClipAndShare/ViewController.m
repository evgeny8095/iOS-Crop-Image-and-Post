//
//  ViewController.m
//  ClipAndShare
//
//  Created by Scott Twichel on 7/22/14.
//  Copyright (c) 2014 Pepper Gum Games. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postToFacebook:(id)sender {
    [self postToSocialMediaAccount:SLServiceTypeFacebook];
}

- (IBAction)postToTwitter:(id)sender{
    [self postToSocialMediaAccount:SLServiceTypeTwitter];
}

- (void)postToSocialMediaAccount:(NSString*)serviceType{
    
    /* Post the image to the selected social media account */
    if ([SLComposeViewController isAvailableForServiceType:serviceType]) {
        SLComposeViewController *socialSheet = [SLComposeViewController composeViewControllerForServiceType:serviceType];
        
        // TODO: add default message string and the correct URL
        [socialSheet setInitialText:@""];
        [socialSheet addImage: [clipScreenShot clipResultsImageFrom:self.view]];
        //[socialSheet addURL:<#(NSURL *)#>]
        [self presentViewController:socialSheet animated:YES completion:nil];
    }
    else{
        // creates a modal alert if the selected service isn't set up on the device
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry..."
                                  message:@"Please check that the service is set up in your device's Settings and try again."
                                  delegate:self
                                  cancelButtonTitle:@"Ok"
                                  otherButtonTitles:nil];
        [alertView show];

    }
}

@end
