//
//  ISO8601TimeZoneTests.m
//  UnitTesting
//
//  Created by Devin Chalmers on 3/21/14.
//
//

#import <XCTest/XCTest.h>

#import "ISO8601DateFormatter.h"

@interface ISO8601TimeZoneTests : XCTestCase

@end

@implementation ISO8601TimeZoneTests

- (void)testExample
{
    NSInteger timestamp = 1395440609;
    
    NSString *utcDateStringExpected = @"2014-03-21T22:23:29Z";
    NSString *pstDateStringExpected = @"2014-03-21T15:23:29-0700";
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSTimeZone *utc = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSTimeZone *pst = [NSTimeZone timeZoneWithName:@"PST"];
    
    NSLog(@"PST: %@", pst);
    
    ISO8601DateFormatter *formatter = [[ISO8601DateFormatter alloc] init];
    formatter.includeTime = YES;
    
    NSString *utcDateString = [formatter stringFromDate:date timeZone:utc];
    XCTAssertEqualObjects(utcDateString, utcDateStringExpected, @"Incorrect date string in UTC!");
    
    NSString *pstDateString = [formatter stringFromDate:date timeZone:pst];
    XCTAssertEqualObjects(pstDateString, pstDateStringExpected, @"Incorrect date string in PST!");
}

@end
