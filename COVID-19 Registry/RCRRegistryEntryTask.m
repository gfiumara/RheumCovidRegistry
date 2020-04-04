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
		[RCRCOVID19InfoStep new],
		[RCRRheumInfoStep new],
		[[RCRRheumTreatmentInfoStep alloc] initWithMedicineNumber:1],
		[RCRMedicationAtDiagnosisStep new],
		[RCRMorePatientInfoStep new]
	];

	self = [super initWithIdentifier:@"RegistryEntryTask" steps:steps];

	return (self);
}

- (ORKStep *)stepAfterStep:(ORKStep *)step withResult:(ORKTaskResult *)result
{
	// If in the process of adding multiple medications...
	if ([step.identifier containsString:RheumTreatmentStepIdentifier]) {
		// ...and we're not at the max number of medicines supported in the database...
		if (![step.identifier isEqualToString:[NSString stringWithFormat:@"%@%lu", RheumTreatmentStepIdentifier, (unsigned long)RheumTreatmentMaxMedicineCount]]) {
			// ...then check to see if we want to add another medicine
			ORKStepResult *stepResult = [result stepResultForStepIdentifier:step.identifier];
			ORKQuestionResult *result = (ORKQuestionResult *)stepResult.results.lastObject;
			if ([result isKindOfClass:[ORKBooleanQuestionResult class]]) {
				// If we said we want to add another medicine...
				if (((ORKBooleanQuestionResult *)result).booleanAnswer.boolValue) {
					// ...get the next medicine number (it's the last character in the result identifier)...
					NSUInteger nextMedicineNumber = [[result.identifier substringFromIndex:result.identifier.length - 1] integerValue] + 1;
					// ...and slip it in!
					return ([[RCRRheumTreatmentInfoStep alloc] initWithMedicineNumber:nextMedicineNumber]);
				}
			}
		}
	}

	// Otherwise, go to the normal next step.
	return ([super stepAfterStep:step withResult:result]);
}

@end
