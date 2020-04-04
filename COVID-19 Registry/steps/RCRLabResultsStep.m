// SPDX-License-Identifier: CC0-1.0

#import "RCRLabResultsStep.h"

NSString * const LabResultsInfoStepIdentifier = @"LabResults";
NSString * const LabResultsInfoStep_LabResultsExistIdentifier = @"LabResults_LabResultsExist";

@implementation RCRLabResultsStep

+ (instancetype)new
{
	return ([[RCRLabResultsStep alloc] init]);
}

- (instancetype)init
{
	self = [super initWithIdentifier:LabResultsInfoStepIdentifier
				   title:NSLocalizedString(@"Laboratory Test Results", @"")
				    text:nil];
	self.optional = NO;

	self.formItems = @[[RCRLabResultsStep labResultsExistQuestion]];

	return (self);
}

+ (ORKFormItem *)labResultsExistQuestion
{
	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:LabResultsInfoStep_LabResultsExistIdentifier
								   text:NSLocalizedString(@"Are there any laboratory test results available related to this patient's COVID-19 infection?", @"")
							   answerFormat:[ORKAnswerFormat booleanAnswerFormat]
							       optional:NO];
	return (question);
}

@end
