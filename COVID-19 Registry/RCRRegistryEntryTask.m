//
//  RCRRegistryEntryTask.m
//  COVID-19 Registry
//
//  Created by Fiumara, Gregory (Fed) on 4/2/20.
//

#import "RCRRegistryEntryTask.h"

@implementation RCRRegistryEntryTask

+ (instancetype)new
{
	return ([[RCRRegistryEntryTask alloc] init]);
}

- (instancetype)init
{
	NSArray *steps = @[
		[RCRBiographicalInfoStep new],
		[RCRCOVID19InfoStep new]
	];

	self = [super initWithIdentifier:@"RegistryEntryTask" steps:steps];

	return (self);
}

@end
