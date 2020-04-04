// SPDX-License-Identifier: CC0-1.0

@import ResearchKit;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT const NSUInteger RheumTreatmentMaxMedicineCount;
FOUNDATION_EXPORT NSString * const RheumTreatmentStepIdentifier;
FOUNDATION_EXPORT NSString * const RheumTreatmentStep_GlucocorticoidsIdentifier;
FOUNDATION_EXPORT NSString * const RheumTreatmentStep_ModulatingMedicationsIdentifier;
FOUNDATION_EXPORT NSString * const RheumTreatmentStep_ModulatingMedicationsStoppedIdentifier;
FOUNDATION_EXPORT NSString * const RheumTreatmentStep_ModulatingMedicationsMoreIdentifier;

@interface RCRRheumTreatmentInfoStep : ORKFormStep

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithMedicineNumber:(NSUInteger)medicineNumber NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
