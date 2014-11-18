//
//  ViewController.m
//  SmartRoutes
//
//  Created by Marcelo Sampaio on 11/18/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "Location.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize testResult;

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.testResult.text=@"";
    
    
    NSLog(@"initial commit - Version 1.0");
}


#pragma mark - UI Actions
- (IBAction)setObject:(id)sender {
    PFObject *location = [PFObject objectWithClassName:@"Location"];
    location[@"title"] = @"Location";
    location[@"subTitle"] = @"Coordinate";
    location[@"latitude"] = [NSString stringWithFormat:@"%f",-15.404040];
    location[@"longitude"] = [NSString stringWithFormat:@"%f",-45.404040];
    
    [location saveInBackground];
    
    self.testResult.text=@"OK";

}

- (IBAction)getObject:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"Location"];
    // ObjectId=h26mwbXtTX
    
    [query getObjectInBackgroundWithId:@"kUs4yYhvUT" block:^(PFObject *objLocation, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSString *title=[objLocation valueForKey:@"title"];
        NSString *subTitle=[objLocation valueForKey:@"subTitle"];
        NSNumber *latitude=[NSNumber numberWithFloat:[[objLocation valueForKey:@"latitude"] floatValue]];
        NSNumber *longitude=[NSNumber numberWithFloat:[[objLocation valueForKey:@"latitude"] floatValue]];
        
        Location *location=[[Location alloc]initWithLatitude:latitude longitude:longitude title:title subTitle:subTitle];
        self.testResult.text=[NSString stringWithFormat:@"latitude= %@",location.latitude];

    }];
    
    
}


@end
