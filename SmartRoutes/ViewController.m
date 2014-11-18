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
    location[@"array"] = [[NSMutableArray alloc]initWithObjects:@"a",@"b",@"c", nil];
    
    [location saveInBackground];
    
    self.testResult.text=@"OK";

}

- (IBAction)getObject:(id)sender {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Location"];
    [query whereKey:@"title" equalTo:@"Location"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d rows.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
//    PFQuery *query = [PFQuery queryWithClassName:@"Location"];
//    // ObjectId=h26mwbXtTX
//    
//    [query getObjectInBackgroundWithId:@"lb3KgNnLX0" block:^(PFObject *objLocation, NSError *error) {
//
//        // Do something with the returned PFObject in the gameScore variable.
//        NSString *title=[objLocation valueForKey:@"title"];
//        NSString *subTitle=[objLocation valueForKey:@"subTitle"];
//        NSNumber *latitude=[NSNumber numberWithFloat:[[objLocation valueForKey:@"latitude"] floatValue]];
//        NSNumber *longitude=[NSNumber numberWithFloat:[[objLocation valueForKey:@"latitude"] floatValue]];
//        NSMutableArray *array = [objLocation valueForKey:@"array"];
//
//        Location *location=[[Location alloc]initWithLatitude:latitude longitude:longitude title:title subTitle:subTitle array:array];
//        
//        NSLog(@"count array=%d",array.count);
//        NSLog(@"--> array:%@",array);
//        
//        self.testResult.text=[NSString stringWithFormat:@"latitude= %@",location.latitude];
//
//    }];
    
    
}


@end
