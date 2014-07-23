//
//  saveImageToFile.m
//  ClipAndShare
//
//  Created by Scott Twichel on 7/23/14.
//  Copyright (c) 2014 Pepper Gum Games. All rights reserved.
//

#import "saveImageToFile.h"

@implementation saveImageToFile

+(void)saveImage:(UIImage*)image{
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSURL *documentFolder = [fileManager URLForDirectory:NSDocumentDirectory
                                                inDomain:NSUserDomainMask
                                       appropriateForURL:nil
                                                  create:YES
                                                   error:nil];
    
    // A timestamp is added to the file name to prevent overwriting itself
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MMM-yy_hh.mm.ss_a"];
    NSString *dateString = [dateFormat stringFromDate:today];
    
    // Define the item's name, path, and data
    NSString *fileName = [NSString stringWithFormat:@"screenshot%@.png",dateString];
    NSURL *imageToSaveUrl = [documentFolder URLByAppendingPathComponent:fileName];
    NSData *imageToSaveData = UIImagePNGRepresentation(image);
    
    // Write the data to the specified directory
    if ([imageToSaveData writeToURL:imageToSaveUrl atomically:YES]){
        NSLog(@"Successfully saved screenshot to %@", imageToSaveUrl);
    } else {
        NSLog(@"Failed to save screenshot.");
    }

}
@end
