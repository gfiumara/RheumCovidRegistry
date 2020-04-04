//
//  RCRMorePatientInfoStep.m
//  COVID-19 Registry
//
//  Created by Fiumara, Gregory (Fed) on 4/4/20.
//

#import "ORKAnswerFormat+YesNoUnknown.h"

#import "RCRMorePatientInfoStep.h"

NSString * const MorePatientInfoStepIdentifier = @"MorePatientInfo";
NSString * const MorePatientInfoStep_ComorbidityIdentifier = @"MorePatientInfo_Comorbidity";
NSString * const MorePatientInfoStep_RaceIdentifier = @"MorePatientInfo_Race";
NSString * const MorePatientInfoStep_SmokerIdentifier = @"MorePatientInfo_Smoker";
NSString * const MorePatientInfoStep_VaperIdentifier = @"MorePatientInfo_Vaper";

@implementation RCRMorePatientInfoStep

+ (instancetype)new
{
	return ([[RCRMorePatientInfoStep alloc] init]);
}

- (instancetype)init
{
	self = [super initWithIdentifier:MorePatientInfoStepIdentifier
				   title:NSLocalizedString(@"Patient Info", @"")
				    text:nil];
	self.optional = NO;

	self.formItems = @[
		[RCRMorePatientInfoStep comorbidityQuestion],
		[RCRMorePatientInfoStep raceQuestion],
		[RCRMorePatientInfoStep smokingQuestion],
		[RCRMorePatientInfoStep vapingQuestion]
	];

	return (self);
}

+ (ORKFormItem *)comorbidityQuestion
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"None", @"") value:@"None"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Interstitial lung disease (e.g. NSIP, UIP, IPF)", @"") value:@"Interstitial lung disease (e.g. NSIP, UIP, IPF)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Obstructive lung disease (COPD/asthma)", @"") value:@"Obstructive lung disease (COPD/asthma)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Other lung disease", @"") value:@"Other lung disease"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Diabetes", @"") value:@"Diabetes"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Morbid obesity (BMI 40+)", @"") value:@"Morbid obesity (BMI 40+)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Hypertension", @"") value:@"Hypertension"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Cardiovascular disease (coronary artery disease, congestive heart failure)", @"") value:@"Cardiovascular disease (coronary artery disease, congestive heart failure)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Pulmonary hypertension", @"") value:@"Pulmonary hypertension"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Chronic renal insufficiency or end stage renal disease", @"") value:@"Chronic renal insufficiency or end stage renal disease"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Cancer", @"") value:@"Cancer"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Organ transplant recipient", @"") value:@"Organ transplant recipient"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Immunodeficiency", @"") value:@"Immunodeficiency"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Inflammatory bowel disease", @"") value:@"Inflammatory bowel disease"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Liver disease", @"") value:@"Liver disease"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Chronic neurological or neuromuscular disease", @"") value:@"Chronic neurological or neuromuscular disease"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Trisomy 21", @"") value:@"Trisomy 21"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Psychiatric condition (e.g., schizophrenia, bipolar disorder)", @"") value:@"Psychiatric condition (e.g., schizophrenia, bipolar disorder)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Pregnancy", @"") value:@"Pregnancy"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Post-partum (< 6 weeks)", @"") value:@"Post-partum (< 6 weeks)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Unknown", @"") value:@"Unknown"]];
	ORKAnswerFormat *format = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleMultipleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:MorePatientInfoStep_ComorbidityIdentifier
								   text:NSLocalizedString(@"Comorbidity and Pregnancy", @"")
							   answerFormat:format
							       optional:NO];
	return (question);
}

+ (ORKFormItem *)raceQuestion
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Arab", @"") value:@"Arab"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Black", @"") value:@"Black"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"East Asian", @"") value:@"East Asian"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"South Asian", @"") value:@"South Asian"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"West Asian / Middle Eastern", @"") value:@"West Asian / Middle Eastern"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Pacific Islander", @"") value:@"Pacific Islander"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Latin American", @"") value:@"Latin American"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"White", @"") value:@"White"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Native American / Aboriginal / 1st Nations Other", @"") value:@"Native American / Aboriginal / 1st Nations Other"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Unknown or prefer not to answer", @"") value:@"Unknown or prefer not to answer"]];
	ORKAnswerFormat *format = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleMultipleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:MorePatientInfoStep_RaceIdentifier
								   text:NSLocalizedString(@"Race/ethnic origin", @"")
							   answerFormat:format
							       optional:NO];
	return (question);
}

+ (ORKFormItem *)smokingQuestion
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Current smoker", @"") value:@"Current smoker"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Former smoker", @"") value:@"Former smoker"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Never smoked", @"") value:@"Never smoked"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Unknown smoking status", @"") value:@"Unknown smoking status"]];
	ORKAnswerFormat *format = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleSingleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:MorePatientInfoStep_SmokerIdentifier
								   text:NSLocalizedString(@"Smoking status", @"")
							   answerFormat:format
							       optional:NO];
	return (question);
}

+ (ORKFormItem *)vapingQuestion
{
	ORKAnswerFormat *format = [ORKAnswerFormat yesNoUnknown];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:MorePatientInfoStep_VaperIdentifier
								   text:NSLocalizedString(@"Does the patient currently use e-cigarettes or vape?", @"")
							   answerFormat:format
							       optional:NO];
	return (question);
}

@end

