// SPDX-License-Identifier: CC0-1.0

#import "RCRMedicationAtDiagnosisStep.h"

NSString * const MedicationAtDiagnosisStepIdentifier = @"MedicationAtDiagnosis";
NSString * const MedicationAtDiagnosisStep_StatusIdentifier = @"MedicationAtDiagnosis_";

@implementation RCRMedicationAtDiagnosisStep

+ (instancetype)new
{
	return ([[RCRMedicationAtDiagnosisStep alloc] init]);
}

- (instancetype)init
{
	self = [super initWithIdentifier:MedicationAtDiagnosisStepIdentifier
				   title:NSLocalizedString(@"At the time of COVID-19 symptom onset (or diagnosis if asymptomatic), was the patient taking:", @"")
				    text:nil];
	self.optional = NO;

	NSMutableArray *formItems = [NSMutableArray new];
	for (NSString *medicationTypeName in [RCRMedicationAtDiagnosisStep medicationTypes])
		[formItems addObject:[RCRMedicationAtDiagnosisStep medicationQuestionWithName:medicationTypeName]];

	self.formItems = formItems;

	return (self);
}

+ (ORKFormItem *)medicationQuestionWithName:(NSString *)medicationTypeName
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Yes and medication continued", @"") value:@"Yes and medication continued"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Yes and medication stopped", @"") value:@"Yes and medication stopped"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"No", @"") value:@"No"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Unknown", @"") value:@"Unknown"]];
	ORKAnswerFormat *format = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleSingleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:[NSString stringWithFormat:@"%@%@", MedicationAtDiagnosisStep_StatusIdentifier, medicationTypeName]
								   text:[NSString stringWithFormat:@"%@?", medicationTypeName]
							   answerFormat:format
							       optional:NO];
	return (question);
}

+ (NSArray<NSString *> *)medicationTypes
{
	return (@[NSLocalizedString(@"ACE inhibitor", @""),
		  NSLocalizedString(@"Angiotensin receptor blocker", @""),
		  NSLocalizedString(@"Nonsteroidal anti-flammatory (NSAID)", @""),
		  NSLocalizedString(@"PD5 inhibitor (e.g., sildenafil)", @"")
		]);
}

@end
