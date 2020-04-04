// SPDX-License-Identifier: CC0-1.0

#import "RCRFollowUpStep.h"

NSString * const FollowUpStepIdentifier = @"FollowUp";
NSString * const FollowUpStep_MayWeContactIdentifier = @"FollowUp_MayWeContact";
NSString * const FollowUpStep_EmailIdentifier = @"FollowUp_Email";

@implementation RCRFollowUpStep

+ (instancetype)new
{
	return ([[RCRFollowUpStep alloc] init]);
}

- (instancetype)init
{
	self = [super initWithIdentifier:FollowUpStepIdentifier
				   title:NSLocalizedString(@"Follow-up", @"")
				    text:nil];
	self.optional = NO;

	self.formItems = @[
		[RCRFollowUpStep mayWeContactQuestion],
		[RCRFollowUpStep emailAddressQuestion],
	];

	return (self);
}

+ (ORKFormItem *)mayWeContactQuestion
{
	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:FollowUpStep_MayWeContactIdentifier
								   text:NSLocalizedString(@"May we contact you to get more information about the outcomes of this case?", @"")
							   answerFormat:[ORKAnswerFormat booleanAnswerFormat]
							       optional:NO];
	return (question);
}

+ (ORKFormItem *)emailAddressQuestion
{
	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:FollowUpStep_EmailIdentifier
								   text:NSLocalizedString(@"E-mail address", @"")
							   answerFormat:[ORKAnswerFormat emailAnswerFormat]
							       optional:YES];
	return (question);
}



@end
