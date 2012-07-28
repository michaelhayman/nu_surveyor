//
//  NUSectionTVCTest.h
//  NUSurveyor
//
//  Created by John Dzak on 7/27/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface NUSectionTVCTest : SenTestCase

- (void)useQuestion:(NSString*)question;
    
- (NSDictionary*)builder:(NSArray*)questions;

- (NSString*)createQuestions:(NSArray*)questions;

- (NSString*)createQuestionWithText:(NSString*)text uuid:(NSString*)uuid type:(NSString*)type;

@end
