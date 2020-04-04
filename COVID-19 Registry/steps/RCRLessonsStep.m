//
//  RCRLessonsStep.m
//  COVID-19 Registry
//
//  Created by Fiumara, Gregory (Fed) on 4/4/20.
//

#import "RCRLessonsStep.h"

NSString * const LessonsStepIdentifier = @"Lessons";
NSString * const LessonsStep_LessonsIdentifier = @"Lessons_Lessons";

@implementation RCRLessonsStep

+ (instancetype)new
{
	return ([[RCRLessonsStep alloc] init]);
}

- (instancetype)init
{
	self = [super initWithIdentifier:LessonsStepIdentifier
				   title:NSLocalizedString(@"Notes", @"")
				    text:nil];
	self.optional = YES;

	self.formItems = @[[RCRLessonsStep lessonsQuestion]];

	return (self);
}

+ (ORKFormItem *)lessonsQuestion
{
	ORKTextAnswerFormat *format = [ORKAnswerFormat textAnswerFormat];
	format.multipleLines = YES;

	ORKFormItem *question = [[ORKFormItem alloc] initWithIdentifier:LessonsStep_LessonsIdentifier
								   text:NSLocalizedString(@"Use this space to optionally share any lessons or other aspects from this case", @"")
							   answerFormat:format
							       optional:YES];

	return (question);
}


@end
