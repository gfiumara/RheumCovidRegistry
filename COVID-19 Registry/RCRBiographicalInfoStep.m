//
//  RCRBiographicalInfoStep.m
//  COVID-19 Registry
//
//  Created by Fiumara, Gregory (Fed) on 4/2/20.
//

#import "RCRBiographicalInfoStep.h"

NSString * const BiographicalInfoStepIdentifier = @"BiographicalInfo";
NSString * const BiographicalInfoStep_AgeQuestionIdentifier = @"BiographicalInfo_Age";
NSString * const BiographicalInfoStep_GenderQuestionIdentifier = @"BiographicalInfo_Gender";

@implementation RCRBiographicalInfoStep

+ (instancetype)new
{
	return ([[RCRBiographicalInfoStep alloc] init]);
}

- (instancetype)init
{
	self = [super initWithIdentifier:BiographicalInfoStepIdentifier
				   title:NSLocalizedString(@"Patient Information", @"")
				    text:NSLocalizedString(@"Please enter patient's biographical information", @"")];
	self.optional = NO;

	self.formItems = @[self.ageQuestion, self.genderQuestion];

	return (self);
}

- (ORKFormItem *)ageQuestion
{
	ORKNumericAnswerFormat *format = [ORKNumericAnswerFormat integerAnswerFormatWithUnit:@"years"];
	format.minimum = @(19);

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:BiographicalInfoStep_AgeQuestionIdentifier
								   text:NSLocalizedString(@"Patient Age", @"")
							   answerFormat:format
							       optional:NO];

	return (question);
}

- (ORKFormItem *)genderQuestion
{
	ORKAnswerFormat *format = [ORKHealthKitCharacteristicTypeAnswerFormat answerFormatWithCharacteristicType:
				   [HKCharacteristicType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex]];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:BiographicalInfoStep_GenderQuestionIdentifier
								   text:NSLocalizedString(@"Patient Gender", @"")
							   answerFormat:format
							       optional:NO];
	return (question);
}

@end
