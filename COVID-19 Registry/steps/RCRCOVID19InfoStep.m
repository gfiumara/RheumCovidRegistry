// SPDX-License-Identifier: CC0-1.0

#import "ORKAnswerFormat+YesNoUnknown.h"

#import "RCRCOVID19InfoStep.h"

NSString * const COVID19InfoStepIdentifier = @"COVID19Info";
NSString * const COVID19InfoStep_DiagnosisDateIdentifier = @"COVID19Info_DiagnosisDate";
NSString * const COVID19InfoStep_DiagnosisLocationIdentifier = @"COVID19Info_DiagnosisLocationIdentifier";
NSString * const COVID19InfoStep_DiagnosisHowMadeIdentifier = @"COVID19Info_DiagnosisHowMade";
NSString * const COVID19InfoStep_HadSymptomsIdentifier = @"COVID19Info_HadSymptoms";
NSString * const COVID19InfoStep_TreatmentIdentifier = @"COVID19Info_Treatment";
NSString * const COVID19InfoStep_TreatmentOtherIdentifier = @"COVID19Info_TreatmentOther";
NSString * const COVID19InfoStep_DeceasedIdentifier = @"COVID19Info_Deceased";
NSString * const COVID19InfoStep_ComplicationsIdentifier = @"COVID19Info_Complications";
NSString * const COVID19InfoStep_InfectionInquisitionIdentifier = @"COVID19Info_InfectionInquisition";

@implementation RCRCOVID19InfoStep

+ (instancetype)new
{
	return ([[RCRCOVID19InfoStep alloc] init]);
}

- (instancetype)init
{
	self = [super initWithIdentifier:COVID19InfoStepIdentifier
				   title:NSLocalizedString(@"COVID-19 Information", @"")
				    text:NSLocalizedString(@"Please enter information regarding the COVID-19 diagnosis", @"")];
	self.optional = NO;

	self.formItems = @[
		self.dateQuestion,
		self.locationQuestion,
		self.howMadeQuestion,
		self.hadSymptomsQuestion,
		self.treatmentQuestion,
		self.treatmentOtherQuestion,
		self.deceasedQuestion,
		self.complicationsQuestion,
		self.infectionInquisitionQuestion
	];

	return (self);
}

- (ORKFormItem *)dateQuestion
{
	const NSTimeInterval Jan_01_2020 = 1577836799;
	ORKAnswerFormat *format = [ORKAnswerFormat dateAnswerFormatWithDefaultDate:[NSDate now] minimumDate:[NSDate dateWithTimeIntervalSince1970:Jan_01_2020] maximumDate:[NSDate now] calendar:nil];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:COVID19InfoStep_DiagnosisDateIdentifier
								   text:NSLocalizedString(@"Diagnosis Date", @"")
							   answerFormat:format
							       optional:NO];

	return (question);
}

- (ORKFormItem *)locationQuestion
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Home or standalone testing (e.g., mobile testing site)", @"") value:@"Home or standalone testing (e.g., mobile testing site)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Nursing home or assisted living facility", @"") value:@"Nursing home or assisted living facility"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Outpatient facility", @"") value:@"Outpatient facility"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Emergency department", @"") value:@"Emergency department"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Inpatient/hospital", @"") value:@"Inpatient/hospital"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Unknown", @"") value:@"Unknown"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Other", @"") value:@"Other"]];
	ORKAnswerFormat *format = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleSingleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:COVID19InfoStep_DiagnosisLocationIdentifier
								   text:NSLocalizedString(@"Diagnosis Location", @"")
							   answerFormat:format
							       optional:NO];

	return (question);
}

- (ORKFormItem *)howMadeQuestion
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Presumptive diagnosis based on symptoms only", @"") value:@"Presumptive diagnosis based on symptoms only"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"PCR", @"") value:@"PCR"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Antibody", @"") value:@"Antibody"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Metagenomic testing", @"") value:@"Metagenomic testing"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"CT scan", @"") value:@"CT scan"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Laboratory assay, type unknown Unknown", @"") value:@"Laboratory assay, type unknown Unknown"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Other", @"") value:@"Other"]];
	ORKAnswerFormat *format = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleSingleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:COVID19InfoStep_DiagnosisHowMadeIdentifier
								   text:NSLocalizedString(@"How was the COVID-19 diagnosis made?", @"")
							   answerFormat:format
							       optional:NO];

	return (question);
}

- (ORKFormItem *)hadSymptomsQuestion
{
	ORKAnswerFormat *format = [ORKAnswerFormat yesNoUnknown];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:COVID19InfoStep_HadSymptomsIdentifier
								   text:NSLocalizedString(@"Has this patient ever had symptoms of COVID-19 infection?", @"")
							   answerFormat:format
							       optional:NO];

	return (question);
}

- (ORKFormItem *)treatmentQuestion
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"No treatment except supportive care", @"") value:@"No treatment except supportive care"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Remdesivir", @"") value:@"Remdesivir"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Lopinavir/ritonavir", @"") value:@"Lopinavir/ritonavir"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Anti-malarials (e.g. chloroquine, hydroxychloroquine)", @"") value:@"Anti-malarials (e.g. chloroquine, hydroxychloroquine)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"IL-6 inhibitors (e.g. tocilizumab, sarilumab, siltuximab)", @"") value:@"IL-6 inhibitors (e.g. tocilizumab, sarilumab, siltuximab)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Bevacizumab", @"") value:@"Bevacizumab"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"JAK inhibitors (e.g. tofacitinib, baricitinib, upadacitinib)", @"") value:@"JAK inhibitors (e.g. tofacitinib, baricitinib, upadacitinib)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Serpin inhibitors", @"") value:@"Serpin inhibitors"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Ciclesonide", @"") value:@"Ciclesonide"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Glucocorticoids", @"") value:@"Glucocorticoids"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"IVIG", @"") value:@"IVIG"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Plasma from recovered patients", @"") value:@"Plasma from recovered patients"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Other", @"") value:@"Other"]];
	ORKAnswerFormat *format = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleMultipleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:COVID19InfoStep_TreatmentIdentifier
								   text:NSLocalizedString(@"Treatment", @"")
							     detailText:NSLocalizedString(@"Only include medications given as treatment for this infection. Treatment for underlying rheumatic disease listed in next section.", @"")
							  learnMoreItem:nil
							  showsProgress:YES
							   answerFormat:format
								tagText:nil
							       optional:NO];

	return (question);
}

- (ORKFormItem *)treatmentOtherQuestion
{
	ORKTextAnswerFormat *format = [ORKAnswerFormat textAnswerFormat];
	format.defaultTextAnswer = @"";
	format.placeholder = NSLocalizedString(@"Enter additional notes here", @"");
	format.multipleLines = YES;

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:COVID19InfoStep_TreatmentOtherIdentifier
								   text:NSLocalizedString(@"Additional notes", @"")
							   answerFormat:format
							       optional:NO];

	return (question);
}

- (ORKFormItem *)deceasedQuestion
{
	ORKBooleanAnswerFormat *format = [ORKAnswerFormat booleanAnswerFormat];
	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:COVID19InfoStep_DeceasedIdentifier
								   text:NSLocalizedString(@"Is the patient deceased?", @"")
							   answerFormat:format
							       optional:NO];

	return (question);
}

- (ORKFormItem *)complicationsQuestion
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"No known complications", @"") value:@"No known complications"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Acute Respiratory Distress Syndrome or ARDS", @"") value:@"Acute Respiratory Distress Syndrome or ARDS"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Sepsis", @"") value:@"Sepsis"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Myocarditis or new heart failure", @"") value:@"Myocarditis or new heart failure"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Concomitant or secondary infection (e.g. Influenza)", @"") value:@"Concomitant or secondary infection (e.g. Influenza)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Other serious complication", @"") value:@"Other serious complication"]];
	ORKAnswerFormat *format = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleMultipleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:COVID19InfoStep_ComplicationsIdentifier
								   text:NSLocalizedString(@"Complications", @"")
							   answerFormat:format
							       optional:NO];

	return (question);
}

- (ORKFormItem *)infectionInquisitionQuestion
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"History of travel to an area with documented cases of COVID-19 infection", @"") value:@"History of travel to an area with documented cases of COVID-19 infection"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Close contact with a confirmed or probable case of COVID-19 infection", @"") value:@"Close contact with a confirmed or probable case of COVID-19 infection"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Presence in a healthcare facility where COVID-19 infections have been managed", @"") value:@"Presence in a healthcare facility where COVID-19 infections have been managed"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"None of the above (community acquired)", @"") value:@"None of the above (community acquired)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Unknown", @"") value:@"Unknown"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Other", @"") value:@"Other"]];
	ORKAnswerFormat *format = [ORKTextChoiceAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleMultipleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:COVID19InfoStep_InfectionInquisitionIdentifier
								   text:NSLocalizedString(@"Infection Acquisition: In the 14 days before onset of illness did the patient have any of the following?", @"")
							   answerFormat:format
							       optional:NO];

	return (question);
}

@end
