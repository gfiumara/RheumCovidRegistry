//
//  RCRRheumInfoStep.m
//  COVID-19 Registry
//
//  Created by Fiumara, Gregory (Fed) on 4/4/20.
//

#import "RCRRheumInfoStep.h"

NSString * const RheumInfoStepIdentifier = @"RheumInfo";
NSString * const RheumInfoStep_PrimaryDiseaseIdentifier = @"RheumInfo_PrimaryDisease";
NSString * const RheumInfoStep_ActivityIdentifier = @"RheumInfo_Activity";

@implementation RCRRheumInfoStep

+ (instancetype)new
{
	return ([[RCRRheumInfoStep alloc] init]);
}

- (instancetype)init
{
	self = [super initWithIdentifier:RheumInfoStepIdentifier
				   title:NSLocalizedString(@"Rheumatic or Autoimmune Disease and Treatment", @"")
				    text:nil];
	self.optional = NO;

	self.formItems = @[
		self.primaryDiseaseQuestion,
		self.activityQuestion
	];

	return (self);
}

- (ORKFormItem *)primaryDiseaseQuestion
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"ANCA-associated vasculitis (e.g., GPA, EGPA)", @"") value:@"ANCA-associated vasculitis (e.g., GPA, EGPA)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Other vasculitis including Kawasaki disease", @"") value:@"Other vasculitis including Kawasaki disease"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Anti-phospholipid antibody syndrome", @"") value:@"Anti-phospholipid antibody syndrome"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Autoinflammatory syndrome (including TRAPS, CAPS, FMF)", @"") value:@"Autoinflammatory syndrome (including TRAPS, CAPS, FMF)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Axial spondyloarthritis (including ankylosing spondylitis)", @"") value:@"Axial spondyloarthritis (including ankylosing spondylitis)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Other spondyloarthritis (including reactive arthritis)", @"") value:@"Other spondyloarthritis (including reactive arthritis)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Behcet's", @"") value:@"Behcet's"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Chronic recurrent multifocal osteomyelitis", @"") value:@"Chronic recurrent multifocal osteomyelitis"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Giant cell arteritis", @"") value:@"Giant cell arteritis"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"IgG4-related disease", @"") value:@"IgG4-related disease"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Inflammatory myopathy (e.g. dermatomyositis, polymyositis)", @"") value:@"Inflammatory myopathy (e.g. dermatomyositis, polymyositis)"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Juvenile idiopathic arthritis, not systemic", @"") value:@"Juvenile idiopathic arthritis, not systemic"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Systemic juvenile idiopathic arthritis", @"") value:@"Systemic juvenile idiopathic arthritis"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Mixed connective tissue disease", @"") value:@"Mixed connective tissue disease"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Ocular inflammation", @"") value:@"Ocular inflammation"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Polymyalgia rheumatica", @"") value:@"Polymyalgia rheumatica"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Psoriatic arthritis", @"") value:@"Psoriatic arthritis"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Rheumatoid arthritis", @"") value:@"Rheumatoid arthritis"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Other inflammatory arthritis", @"") value:@"Other inflammatory arthritis"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Sarcoidosis", @"") value:@"Sarcoidosis"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Sjogren's syndrome", @"") value:@"Sjogren's syndrome"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Systemic lupus erythematosus", @"") value:@"Systemic lupus erythematosus"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Systemic sclerosis", @"") value:@"Systemic sclerosis"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Undiflerentiated connective tissue disease", @"") value:@"Undiflerentiated connective tissue disease"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Other", @"") value:@"Other"]];
	ORKAnswerFormat *format = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleSingleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:RheumInfoStep_PrimaryDiseaseIdentifier
								   text:NSLocalizedString(@"Primary rheumatic/autoimmune diagnosis(es)", @"")
							   answerFormat:format
							       optional:NO];

	return (question);
}

- (ORKFormItem *)activityQuestion
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Remission", @"") value:@"Remission"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Minimal or low disease activity", @"") value:@"Minimal or low disease activity"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Moderate disease activity", @"") value:@"Moderate disease activity"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Severe or high disease activity", @"") value:@"Severe or high disease activity"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Unknown", @"") value:@"Unknown"]];
	ORKAnswerFormat *format = [ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleSingleChoice textChoices:choices];

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:RheumInfoStep_ActivityIdentifier
								   text:NSLocalizedString(@"Rheumatic/autoimmune disease activity at the time of COVID-19 symptom onset", @"")
							     detailText:NSLocalizedString(@"(or at COVID-19 diagnosis if asymptomatic)", @"")
							  learnMoreItem:nil
							  showsProgress:YES
							   answerFormat:format
								tagText:nil
							       optional:NO];

	return (question);
}

@end
