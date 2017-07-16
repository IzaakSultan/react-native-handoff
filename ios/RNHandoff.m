#import "RNHandoff.h"

@implementation RNHandoff

RCT_EXPORT_MODULE()

NSMutableArray *activities = nil;

- (NSMutableArray *)activityList
{
    if (activities == nil) activities = [NSMutableArray array];
    return activities;
}

RCT_EXPORT_METHOD(becomeCurrent:(NSNumber * _Nonnull)activityId type:(NSString *)type title:(NSString *)title url:(NSString *)url)
{
    NSUserActivity* activity = [[NSUserActivity alloc] initWithActivityType:type];
    activity.title = title;
    activity.webpageURL = [[NSURL alloc] initWithString:url];
    
    [activity becomeCurrent];
    
    [[self activityList] addObject:@{ @"id": activityId, @"activity": activity }];
}

RCT_EXPORT_METHOD(invalidate:(NSNumber * _Nonnull)i)
{
    int ix = [[self activityList] indexOfObjectPassingTest:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([[obj objectForKey:@"id"] intValue] == [i intValue]) {
            *stop = YES;
            return YES;
        } else {
            return NO;
        }
        
    }];
    
    [[[[self activityList] objectAtIndex:ix] objectForKey:@"activity"] invalidate];

    [[self activityList] removeObjectAtIndex:ix];
}

@end
