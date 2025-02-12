//
//  IngredientDataModel.swift
//  RadianceSearch
//
//  Created by admin2 on 15/11/24.
//

import Foundation
import UIKit

struct IngredientDataModel: Codable {
    var name: String
    var rating: Int
}

struct IngredientDescription {
    var image: UIImage?
    var name: String
    var aka: String
    var description: String
    var usage: String
    var healthImpact: String
    var sourceLink : [String]
    var riskLevel: String
}

var ingredients = [
    IngredientDataModel(name: "Methylparaben" , rating: 8),
    IngredientDataModel(name: "Propylparaben" ,rating: 8),
    IngredientDataModel(name: "Butylparaben", rating: 8),
    IngredientDataModel(name: "Sodium Lauryl Sulfate", rating: 5),
    IngredientDataModel(name: "Propylene Glycol" , rating: 3),
    IngredientDataModel(name: "Aqua", rating: 3),
    IngredientDataModel(name: "Cetyl Alcohol", rating: 2),
    IngredientDataModel(name: "Stearyl Alcohol", rating: 2),
    IngredientDataModel(name: "Glycerin", rating: 1),
    IngredientDataModel(name: "Myristic Acid" , rating: 3),
    IngredientDataModel(name: "Palmitic Acid", rating: 2),
    IngredientDataModel(name: "Stearic Acid" , rating: 2),
    IngredientDataModel(name: "Potassium Hydroxide" , rating: 6),
    IngredientDataModel(name: "Lauric Acid" , rating: 3),
    IngredientDataModel(name: "Glyceryl Distearate", rating: 2),
    IngredientDataModel(name: "Glyceryl Stearate", rating: 2),
    IngredientDataModel(name: "Kaolin", rating: 2),
    IngredientDataModel(name: "Salicylic Acid" , rating: 4),
    IngredientDataModel(name: "Phenoxyethanol", rating: 4),
    IngredientDataModel(name: "Limonene" , rating: 5),
    IngredientDataModel(name: "Butylene Glycol", rating: 2),
    IngredientDataModel(name: "Benzyl Salicylate" , rating: 5),
    IngredientDataModel(name: "Benzyl Alcohol", rating: 6),
    IngredientDataModel(name: "Benzophenone-3 " , rating: 6),
    IngredientDataModel(name: "Diethylhexyl Carbonate", rating: 1),
    IngredientDataModel(name: "Phospholipids" , rating: 1),
    IngredientDataModel(name: "Titanium Dioxide", rating: 2),
    IngredientDataModel(name: "Propanediol", rating: 1),
    IngredientDataModel(name: "Ascorbyl Glucoside", rating: 1),
    IngredientDataModel(name: "Tocopheryl Acetate", rating: 1),
    IngredientDataModel(name: "Ethylhexylglycerin", rating: 2),
    IngredientDataModel(name: "Xanthan Gum" , rating: 1),
    IngredientDataModel(name: "Niacinamide", rating: 1),
    IngredientDataModel(name: "Ceramides" , rating: 1),
    IngredientDataModel(name: "Ethyl Macadamiate", rating: 1),
    IngredientDataModel(name: "Sodium Benzoate" , rating: 3),
    IngredientDataModel(name: "Capric Triglycerides ", rating: 3),
    IngredientDataModel(name: "Lactobacillus", rating: 3),
    IngredientDataModel(name: "Hydrolyzed Silk ", rating: 3),
    IngredientDataModel(name:"Vegetable Glycerin", rating: 0),
    IngredientDataModel(name: "Gluconolactone", rating: 0),
    IngredientDataModel(name: "Cera Alba" , rating: 3),
    IngredientDataModel(name: "Cocos Nucifera Oil", rating: 0),
    IngredientDataModel(name: "Olea Europaea Oil" , rating: 0)
]

var selectedIngredientTitle: String?

class IngredientDescriptionDataSource {
    // Static dictionary holding ingredient descriptions
    static let descriptions: [String: IngredientDescription] = [
        "Methylparaben": IngredientDescription(
                    image: imageForRiskLevel("High"),
                    name: "Methylparaben",
                    aka: "Methyl 4-hydroxybenzoate",
                    description: "A commonly used preservative in cosmetics to prevent microbial growth and extend shelf life.",
                    usage: "Present in makeup, moisturizers, and personal care products.",
                    healthImpact: "Studies suggest it may be a weak endocrine disruptor; it can cause irritation in sensitive individuals and is associated with potential skin reactions.",
                    sourceLink: ["https://www.safecosmetics.org", "https://www.cancer.org"],
                    riskLevel: "High"
                ),
                "Propylparaben": IngredientDescription(
                    image: imageForRiskLevel("High"),
                    name: "Propylparaben",
                    aka: "Propyl 4-hydroxybenzoate",
                    description: "Used to prevent microbial growth in cosmetics and other personal care items.",
                    usage: "Common in moisturizers, shampoos, and products prone to contamination.",
                    healthImpact: "May disrupt endocrine functions at higher usage levels; can cause skin irritation in some users.",
                    sourceLink: ["https://www.drugs.com", "https://safecosmetics.org"],
                    riskLevel: "High"
                ),
                "Butylparaben": IngredientDescription(
                    image: imageForRiskLevel("High"),
                    name: "Butylparaben",
                    aka: "Butyl 4-hydroxybenzoate",
                    description: "A preservative that extends the shelf life of cosmetic products.",
                    usage: "Found in lotions, hair care products, and makeup.",
                    healthImpact: "Linked to potential endocrine disruption and may be carcinogenic in large quantities.",
                    sourceLink: ["https://safecosmetics.org", "https://cancer.org"],
                    riskLevel: "High"
                ),
                "Sodium Lauryl Sulfate": IngredientDescription(
                    image: imageForRiskLevel("Medium"),
                    name: "Sodium Lauryl Sulfate",
                    aka: "Sodium Dodecyl Sulfate",
                    description: "An ingredient used to create a lathering effect in personal care items.",
                    usage: "Common in shampoos, body washes, and toothpaste.",
                    healthImpact: "May cause skin irritation or dryness, especially in sensitive skin.",
                    sourceLink: ["https://cdc.gov", "https://safecosmetics.org"],
                    riskLevel: "Medium"
                ),
                "Propylene Glycol": IngredientDescription(
                    image: imageForRiskLevel("Low"),
                    name: "Propylene Glycol",
                    aka: "1,2-Propane Diol",
                    description: "A synthetic compound used to retain moisture and enhance skin absorption.",
                    usage: "Common in moisturizers, serums, and deodorants.",
                    healthImpact: "Generally safe but may cause skin irritation in sensitive individuals.",
                    sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                    riskLevel: "Low"
                ),
               
        "Aqua": IngredientDescription(
                    image: imageForRiskLevel("Low"),
                    name: "Aqua",
                    aka: "Water",
                    description: "The primary solvent in many cosmetic products, serving as a base.",
                    usage: "Used in almost all water-based products like creams and serums.",
                    healthImpact: "Generally safe, although water quality can vary.",
                    sourceLink: ["https://fda.gov", "https://safecosmetics.org"],
                    riskLevel: "Low"
                ),
                "Cetyl Alcohol": IngredientDescription(
                    image: imageForRiskLevel("Low"),
                    name: "Cetyl Alcohol",
                    aka: "Hexadecanol",
                    description: "A fatty alcohol used as an emollient and thickening agent.",
                    usage: "Found in creams, lotions, and hair conditioners.",
                    healthImpact: "Non-irritating and generally safe, but may cause sensitivity in some cases.",
                    sourceLink: ["https://cosmeticsinfo.org", "https://safecosmetics.org"],
                    riskLevel: "Low"
                ),
                "Stearyl Alcohol": IngredientDescription(
                    image: imageForRiskLevel("Low"),
                    name: "Stearyl Alcohol",
                    aka: "Octadecanol",
                    description: "A fatty alcohol used for its emulsifying and stabilizing properties.",
                    usage: "Present in lotions, creams, and hair conditioners.",
                    healthImpact: "Considered non-irritating; generally safe for all skin types.",
                    sourceLink: ["https://fda.gov", "https://cosmeticsinfo.org"],
                    riskLevel: "Low"
                ),
                "Glycerin": IngredientDescription(
                    image: imageForRiskLevel("Low"),
                    name: "Glycerin",
                    aka: "Glycerol",
                    description: "A humectant that attracts moisture to the skin.",
                    usage: "Widely used in moisturizers, cleansers, and masks.",
                    healthImpact: "Generally safe and non-irritating, suitable for sensitive skin.",
                    sourceLink: ["https://cosmeticsinfo.org", "https://safecosmetics.org"],
                    riskLevel: "Low"
                ),
                "Myristic Acid": IngredientDescription(
                    image: imageForRiskLevel("Low"),
                    name: "Myristic Acid",
                    aka: "Tetradecanoic Acid",
                    description: "A fatty acid that provides cleansing and foaming properties.",
                    usage: "Common in soaps, cleansers, and creams.",
                    healthImpact: "Can cause irritation in high concentrations; typically safe in moderation.",
                    sourceLink: ["https://cosmeticsinfo.org", "https://safecosmetics.org"],
                    riskLevel: "Low"
                ),
                "Palmitic Acid": IngredientDescription(
                    image: imageForRiskLevel("Low"),
                    name: "Palmitic Acid",
                    aka: "Hexadecanoic Acid",
                    description: "A fatty acid that acts as a surfactant and emollient.",
                    usage: "Found in soaps, cleansers, and lotions.",
                    healthImpact: "Generally safe, but can be mildly irritating in high amounts.",
                    sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                    riskLevel: "Low"
                ),
                "Stearic Acid": IngredientDescription(
                    image: imageForRiskLevel("Low"),
                    name: "Stearic Acid",
                    aka: "Octadecanoic Acid",
                    description: "A fatty acid used for thickening and stabilizing formulas.",
                    usage: "Common in creams, lotions, and soaps.",
                    healthImpact: "Typically non-irritating and considered safe for use.",
                    sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                    riskLevel: "Low"
                ),
                "Potassium Hydroxide": IngredientDescription(
                    image: imageForRiskLevel("Medium"),
                    name: "Potassium Hydroxide",
                    aka: "Caustic Potash",
                    description: "An alkaline compound used to adjust pH and saponify oils.",
                    usage: "Present in soaps, cleansers, and hair care products.",
                    healthImpact: "Potentially irritating if used in high concentrations.",
                    sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                    riskLevel: "Medium"
                ),
                
        "Lauric Acid": IngredientDescription(
                   image: imageForRiskLevel("Low"),
                   name: "Lauric Acid",
                   aka: "Dodecanoic Acid",
                   description: "A fatty acid with cleansing and foaming properties.",
                   usage: "Used in soaps, shampoos, and conditioners.",
                   healthImpact: "Generally safe, though it can be drying on sensitive skin.",
                   sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                   riskLevel: "Low"
               ),
               "Glyceryl Distearate": IngredientDescription(
                   image: imageForRiskLevel("Low"),
                   name: "Glyceryl Distearate",
                   aka: "Octadecanoic Acid, 2,3-dihydroxypropyl ester",
                   description: "An emollient that provides skin conditioning and texture-enhancing properties.",
                   usage: "Common in moisturizers, creams, and lotions.",
                   healthImpact: "Generally safe with low irritation potential.",
                   sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                   riskLevel: "Low"
               ),
               "Glyceryl Stearate": IngredientDescription(
                   image: imageForRiskLevel("Low"),
                   name: "Glyceryl Stearate",
                   aka: "Octadecanoic Acid, 2,3-dihydroxypropyl ester",
                   description: "An emulsifier and stabilizer for creams and lotions.",
                   usage: "Found in a variety of creams, moisturizers, and sunscreens.",
                   healthImpact: "Considered safe with minimal irritation potential.",
                   sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                   riskLevel: "Low"
               ),
               "Kaolin": IngredientDescription(
                   image: imageForRiskLevel("Low"),
                   name: "Kaolin",
                   aka: "China Clay",
                   description: "A natural clay used to absorb excess oil and impurities from the skin.",
                   usage: "Common in masks, cleansers, and other skin care products.",
                   healthImpact: "Generally safe and non-irritating; suitable for most skin types.",
                   sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                   riskLevel: "Low"
               ),
               "Salicylic Acid": IngredientDescription(
                   image: imageForRiskLevel("Medium"),
                   name: "Salicylic Acid",
                   aka: "Beta Hydroxy Acid (BHA)",
                   description: "A chemical exfoliant that helps unclog pores and reduce acne.",
                   usage: "Widely used in acne treatments, exfoliants, and cleansers.",
                   healthImpact: "Can be irritating for sensitive skin; avoid overuse.",
                   sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                   riskLevel: "Medium"
               ),
               "Phenoxyethanol": IngredientDescription(
                   image: imageForRiskLevel("Medium"),
                   name: "Phenoxyethanol",
                   aka: "2-Phenoxyethanol",
                   description: "A preservative used to prevent microbial growth in products.",
                   usage: "Common in creams, lotions, and serums.",
                   healthImpact: "Potentially irritating to skin in high concentrations.",
                   sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                   riskLevel: "Medium"
               ),
               "Limonene": IngredientDescription(
                   image: imageForRiskLevel("Medium"),
                   name: "Limonene",
                   aka: "Dipentene",
                   description: "A fragrance component derived from citrus oils with antioxidant properties.",
                   usage: "Found in fragranced skincare products and perfumes.",
                   healthImpact: "Can cause irritation and sensitivity, especially in sun-exposed skin.",
                   sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                   riskLevel: "Medium"
               ),
               "Butylene Glycol": IngredientDescription(
                   image: imageForRiskLevel("Low"),
                   name: "Butylene Glycol",
                   aka: "1,3-Butanediol",
                   description: "A humectant that attracts moisture to the skin, improving hydration.",
                   usage: "Common in moisturizers, serums, and lotions.",
                   healthImpact: "Generally safe with low irritation potential.",
                   sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                   riskLevel: "Low"
               ),
               "Benzyl Salicylate": IngredientDescription(
                   image: imageForRiskLevel("Medium"),
                   name: "Benzyl Salicylate",
                   aka: "Phenylmethyl Salicylate",
                   description: "A fragrance component with mild UV-absorbing properties.",
                   usage: "Found in perfumes, skincare, and hair products.",
                   healthImpact: "Can cause skin irritation, especially in sensitive individuals.",
                   sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                   riskLevel: "Medium"
               ),
               "Benzyl Alcohol": IngredientDescription(
                   image: imageForRiskLevel("Medium"),
                   name: "Benzyl Alcohol",
                   aka: "Phenylmethanol",
                   description: "A preservative and fragrance ingredient with antimicrobial properties.",
                   usage: "Used in creams, lotions, and cosmetic products.",
                   healthImpact: "Can be irritating to sensitive skin in high concentrations.",
                   sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
                   riskLevel: "Medium"
               ),
        
        "Benzophenone-3": IngredientDescription(
            image: imageForRiskLevel("Medium"),
            name: "Benzophenone-3",
            aka: "Oxybenzone",
            description: "A UV filter that protects skin from harmful UV radiation.",
            usage: "Common in sunscreens and skincare products.",
            healthImpact: "Potential skin irritant and associated with environmental concerns.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Medium"
        ),

        "Diethylhexyl Carbonate": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Diethylhexyl Carbonate",
            aka: "C12-15 Alkyl Benzoate",
            description: "An emollient that improves the texture of skin and product spreadability.",
            usage: "Used in sunscreens, moisturizers, and cosmetics.",
            healthImpact: "Generally safe with a low risk of irritation.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Phospholipids": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Phospholipids",
            aka: "Lecithin",
            description: "A skin-conditioning agent with hydrating properties.",
            usage: "Common in serums, moisturizers, and lotions.",
            healthImpact: "Considered safe and non-irritating.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Titanium Dioxide": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Titanium Dioxide",
            aka: "TiO2",
            description: "A mineral UV filter that protects skin from UVA and UVB radiation.",
            usage: "Widely used in sunscreens and tinted products.",
            healthImpact: "Considered safe when used as a sunscreen; non-irritating.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Propanediol": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Propanediol",
            aka: "1,3-Propanediol",
            description: "A natural humectant that hydrates skin without irritation.",
            usage: "Found in moisturizers, serums, and cleansers.",
            healthImpact: "Considered safe and non-irritating.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Ascorbyl Glucoside": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Ascorbyl Glucoside",
            aka: "Vitamin C Glucoside",
            description: "A stable form of vitamin C with antioxidant properties.",
            usage: "Used in serums, moisturizers, and brightening products.",
            healthImpact: "Generally safe and beneficial for skin health.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Tocopheryl Acetate": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Tocopheryl Acetate",
            aka: "Vitamin E Acetate",
            description: "A vitamin E derivative with antioxidant and skin-conditioning properties.",
            usage: "Common in moisturizers, sunscreens, and serums.",
            healthImpact: "Considered safe and beneficial for skin health.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Ethylhexylglycerin": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Ethylhexylglycerin",
            aka: "Octoxyglycerin",
            description: "A skin-conditioning agent with antimicrobial properties.",
            usage: "Used as a preservative booster in many skincare products.",
            healthImpact: "Generally safe with a low risk of irritation.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Xanthan Gum": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Xanthan Gum",
            aka: "Polysaccharide Gum",
            description: "A thickening and stabilizing agent derived from sugar.",
            usage: "Used in lotions, creams, and hair products.",
            healthImpact: "Considered safe and non-irritating.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Niacinamide": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Niacinamide",
            aka: "Vitamin B3",
            description: "A form of vitamin B3 with anti-inflammatory and skin-brightening effects.",
            usage: "Common in serums, moisturizers, and brightening products.",
            healthImpact: "Safe for most skin types and beneficial for skin health.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Ceramides": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Ceramides",
            aka: "Lipid Molecules",
            description: "Natural lipids that help strengthen the skin barrier.",
            usage: "Found in moisturizers, creams, and serums.",
            healthImpact: "Generally safe and beneficial for skin health.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Ethyl Macadamiate": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Ethyl Macadamiate",
            aka: "Macadamia Seed Oil Derivative",
            description: "An emollient that enhances skin softness and texture.",
            usage: "Used in moisturizers, lotions, and hair products.",
            healthImpact: "Considered safe with a low risk of irritation.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Sodium Benzoate": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Sodium Benzoate",
            aka: "Benzoate Salt",
            description: "A preservative with antimicrobial properties.",
            usage: "Common in skincare and haircare products.",
            healthImpact: "Generally safe, but can be mildly irritating for sensitive skin.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Capric Triglycerides": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Capric Triglycerides",
            aka: "MCT Oil",
            description: "A mix of coconut-derived fatty acids used as an emollient.",
            usage: "Common in lotions, creams, and hair care products.",
            healthImpact: "Considered safe with minimal irritation risk.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Lactobacillus": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Lactobacillus",
            aka: "Probiotic Ferment",
            description: "A probiotic ferment used for its conditioning properties.",
            usage: "Found in skincare products for hydration and skin health.",
            healthImpact: "Generally safe and beneficial for skin.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Hydrolyzed Silk": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Hydrolyzed Silk",
            aka: "Silk Protein",
            description: "A silk-derived protein that adds smoothness and shine.",
            usage: "Used in hair and skin products for hydration and texture.",
            healthImpact: "Considered safe with low irritation risk.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Vegetable Glycerin": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Vegetable Glycerin",
            aka: "Glycerol",
            description: "A humectant that attracts moisture to the skin.",
            usage: "Used in moisturizers, cleansers, and masks.",
            healthImpact: "Safe and beneficial for skin hydration.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Gluconolactone": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Gluconolactone",
            aka: "PHA",
            description: "A mild exfoliant and humectant.",
            usage: "Used in skincare for gentle exfoliation and moisture retention.",
            healthImpact: "Considered safe for most skin types.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),
                
        "Cera Alba": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Cera Alba",
            aka: "Beeswax",
            description: "A natural wax used for its emulsifying and thickening properties.",
            usage: "Found in creams, lip balms, and lotions.",
            healthImpact: "Safe and non-irritating.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Cocos Nucifera Oil": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Cocos Nucifera Oil",
            aka: "Coconut Oil",
            description: "A natural oil with moisturizing and antimicrobial properties.",
            usage: "Used in creams, hair products, and body lotions.",
            healthImpact: "Safe, though may clog pores in some individuals.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        ),

        "Olea Europaea Oil": IngredientDescription(
            image: imageForRiskLevel("Low"),
            name: "Olea Europaea Oil",
            aka: "Olive Oil",
            description: "A natural oil rich in antioxidants and moisturizing compounds.",
            usage: "Common in creams, lotions, and hair products.",
            healthImpact: "Safe and beneficial for skin health.",
            sourceLink: ["https://cosmeticsinfo.org", "https://fda.gov"],
            riskLevel: "Low"
        )
        
    ]
    
    private static func imageForRiskLevel(_ riskLevel: String) -> UIImage? {
        switch riskLevel {
        case "High", "Medium":
            return UIImage(systemName: "exclamationmark.triangle.fill")
        case "Low":
            return UIImage(systemName: "checkmark.seal.fill")
        default:
            return UIImage(systemName: "questionmark.circle.fill") // Default
        }
    }
    
   
    static func description(for ingredient: IngredientDataModel) -> IngredientDescription? {
        return descriptions[ingredient.name]
    }
}
