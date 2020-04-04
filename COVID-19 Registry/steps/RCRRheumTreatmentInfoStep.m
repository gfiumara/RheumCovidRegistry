// SPDX-License-Identifier: CC0-1.0

#import "ORKAnswerFormat+YesNoUnknown.h"

#import "RCRRheumTreatmentInfoStep.h"

const NSUInteger RheumTreatmentMaxMedicineCount = 5;
NSString * const RheumTreatmentStepIdentifier = @"RheumTreatment";
NSString * const RheumTreatmentStep_GlucocorticoidsIdentifier = @"RheumTreatment_Glucocorticoids";
NSString * const RheumTreatmentStep_ModulatingMedicationsIdentifier = @"RheumTreatment_Medication";
NSString * const RheumTreatmentStep_ModulatingMedicationsStoppedIdentifier = @"RheumTreatment_MedicationStopped";
NSString * const RheumTreatmentStep_ModulatingMedicationsMoreIdentifier = @"RheumTreatment_MoreMedications";

@interface RCRRheumTreatmentInfoStep ()

@property (nonatomic, assign) NSUInteger medicineNumber;

@end

@implementation RCRRheumTreatmentInfoStep

- (instancetype)initWithMedicineNumber:(NSUInteger)medicineNumber
{
	NSAssert(medicineNumber <= RheumTreatmentMaxMedicineCount, @"medicineNumber > %lu", (unsigned long)RheumTreatmentMaxMedicineCount);
	_medicineNumber = medicineNumber;

	self = [super initWithIdentifier:RheumTreatmentStepIdentifier
				   title:NSLocalizedString(@"Treatments for underlying rheumatic/autoimmune disease", @"")
				    text:nil];
	self.optional = NO;

	NSMutableArray<ORKFormItem *> *formItems = [NSMutableArray new];

	// Only add the Glucocorticoids question once
	if (medicineNumber == 1)
		[formItems addObject:self.glucocorticoidsQuestion];

	[formItems addObject:self.medicineQuestion];
	[formItems addObject:self.medicineStoppedQuestion];

	// Don't ask for to add more medications if we've reached the maximum
	if (medicineNumber < RheumTreatmentMaxMedicineCount)
		[formItems addObject:self.anotherMedicineQuestion];
	self.formItems = formItems;

	return (self);
}

- (ORKFormItem *)glucocorticoidsQuestion
{
	ORKAnswerFormat *format = [ORKAnswerFormat yesNoUnknown];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:RheumTreatmentStep_GlucocorticoidsIdentifier
								   text:NSLocalizedString(@"Glucocorticoids (including prednisone, methylprednisolone) at time of COVID-19 symptom onset (or at COVID-19 diagnosis if asymptomatic)", @"")
							   answerFormat:format
							       optional:NO];

	return (question);
}

- (ORKFormItem *)medicineQuestion
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	// TODO: Need list of medicines
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Need list of medicines", @"") value:@"Need list of medicines"]];
	ORKAnswerFormat *format = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleSingleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:[NSString stringWithFormat:@"%@%lu", RheumTreatmentStep_ModulatingMedicationsIdentifier, (unsigned long)self.medicineNumber]
								   text:NSLocalizedString(@"Immune modulating medications immediately prior to the time of COVID-19 symptom onset (or at COVID-19 diagnosis if asymptomatic)", @"")
							     detailText:[NSString stringWithFormat:@"%@ #%lu (Max of %lu)", NSLocalizedString(@"Medicine", @""), (unsigned long)self.medicineNumber, (unsigned long)RheumTreatmentMaxMedicineCount]
							  learnMoreItem:nil
							  showsProgress:YES
							   answerFormat:format
								tagText:nil
							       optional:NO];

	return (question);
}

- (ORKFormItem *)medicineStoppedQuestion
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Stopped", @"") value:@"Stopped"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Continued", @"") value:@"Continued"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Unknown", @"") value:@"Unknown"]];
	ORKAnswerFormat *format = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleSingleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:[NSString stringWithFormat:@"%@%lu", RheumTreatmentStep_ModulatingMedicationsStoppedIdentifier, (unsigned long)self.medicineNumber]
								   text:NSLocalizedString(@"Was this medication stopped or continued after COVID-19 diagnosis?", @"")
							     detailText:nil
							  learnMoreItem:nil
							  showsProgress:YES
							   answerFormat:format
								tagText:nil
							       optional:NO];

	return (question);
}

- (ORKFormItem *)anotherMedicineQuestion
{
	ORKAnswerFormat *format = [ORKAnswerFormat booleanAnswerFormat];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:[NSString stringWithFormat:@"%@%lu", RheumTreatmentStep_ModulatingMedicationsMoreIdentifier, (unsigned long)self.medicineNumber]
								   text:NSLocalizedString(@"Add another medication?", @"")
							   answerFormat:format];
	return (question);
}

@end
