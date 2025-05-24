const Judgments = {
    ['street']: {
        label: 'Traffic offenses',
        options: [
            { name: 'speed', label: 'Speeding', jail: 2, fine: 1000 },
            { name: 'drunkDriving', label: 'Drunk Driving', jail: 5, fine: 3000 },
            { name: 'illegalParking', label: 'Illegal Parking', jail: 1, fine: 500 }
        ]
    },
    ['heists']: {
        label: 'Robberies',
        options: [
            { name: 'shopRobbery', label: 'Shop Robbery', jail: 5, fine: 2000 },
            { name: 'bankRobbery', label: 'Fleeca Bank Robbery', jail: 30, fine: 5000 },
            { name: 'pacificBankRobbery', label: 'Pacific Standard Bank Robbery', jail: 60, fine: 10000 },
            { name: 'humaneLabsRobbery', label: 'Humane Labs Bank Robbery', jail: 60, fine: 10000 },
            { name: 'trainRobbery', label: 'Train Robbery', jail: 60, fine: 10000 },
        ]
    },
    ['violence']: {
        label: 'Violent Crimes',
        options: [
            { name: 'assault', label: 'Assault', jail: 10, fine: 2500 },
            { name: 'attemptedMurder', label: 'Attempted Murder', jail: 25, fine: 7500 },
            { name: 'murder', label: 'Murder', jail: 50, fine: 15000 }
        ]
    },
    ['publicOrder']: {
        label: 'Public Order Offenses',
        options: [
            { name: 'publicDrinking', label: 'Drinking in Public', jail: 1, fine: 500 },
            { name: 'disturbingPeace', label: 'Disturbing the Peace', jail: 2, fine: 1000 },
            { name: 'vandalism', label: 'Vandalism', jail: 5, fine: 2000 }
        ]
    },
    ['drugs']: {
        label: 'Drug Offenses',
        options: [
            { name: 'possessionSmall', label: 'Possession of Small Amounts of Drugs', jail: 5, fine: 3000 },
            { name: 'possessionLarge', label: 'Possession of Large Amounts of Drugs', jail: 15, fine: 10000 },
            { name: 'drugDistribution', label: 'Drug Distribution', jail: 20, fine: 20000 },
            { name: 'drugProduction', label: 'Drug Production', jail: 25, fine: 25000 },
            { name: 'drugTrafficking', label: 'Drug Trafficking', jail: 30, fine: 50000 }
        ]
    },
    ['cybercrime']: {
        label: 'Cybercrimes',
        options: [
            { name: 'hacking', label: 'Hacking into Systems', jail: 10, fine: 15000 },
            { name: 'identityTheft', label: 'Identity Theft', jail: 15, fine: 20000 },
            { name: 'phishing', label: 'Phishing Attacks', jail: 5, fine: 10000 },
            { name: 'ddosAttack', label: 'DDoS Attack', jail: 20, fine: 30000 },
            { name: 'cyberExtortion', label: 'Cyber Extortion', jail: 25, fine: 40000 }
        ]
    },
    ['propertyCrime']: {
        label: 'Property Crimes',
        options: [
            { name: 'arson', label: 'Arson', jail: 20, fine: 10000 },
            { name: 'burglary', label: 'Burglary', jail: 15, fine: 7000 },
            { name: 'trespassing', label: 'Trespassing', jail: 5, fine: 2000 },
            { name: 'carTheft', label: 'Car Theft', jail: 10, fine: 5000 },
            { name: 'breakingAndEntering', label: 'Breaking and Entering', jail: 15, fine: 8000 }
        ]
    },
    ['organizedCrime']: {
        label: 'Organized Crime',
        options: [
            { name: 'moneyLaundering', label: 'Money Laundering', jail: 25, fine: 50000 },
            { name: 'humanTrafficking', label: 'Human Trafficking', jail: 40, fine: 75000 },
            { name: 'illegalWeapons', label: 'Illegal Weapons Trade', jail: 30, fine: 60000 },
            { name: 'smuggling', label: 'Smuggling', jail: 20, fine: 30000 },
            { name: 'racketeering', label: 'Racketeering', jail: 35, fine: 70000 }
        ]
    },
    ['environmentalCrimes']: {
        label: 'Environmental Crimes',
        options: [
            { name: 'illegalFishing', label: 'Illegal Fishing', jail: 5, fine: 10000 },
            { name: 'illegalHunting', label: 'Illegal Hunting', jail: 10, fine: 15000 },
            { name: 'toxicDumping', label: 'Toxic Waste Dumping', jail: 20, fine: 50000 },
            { name: 'deforestation', label: 'Deforestation', jail: 15, fine: 40000 },
            { name: 'oilSpillNegligence', label: 'Oil Spill Negligence', jail: 25, fine: 70000 }
        ]
    },
    ['financialCrimes']: {
        label: 'Financial Crimes',
        options: [
            { name: 'taxEvasion', label: 'Tax Evasion', jail: 10, fine: 30000 },
            { name: 'fraud', label: 'Fraud', jail: 15, fine: 40000 },
            { name: 'embezzlement', label: 'Embezzlement', jail: 20, fine: 50000 },
            { name: 'insiderTrading', label: 'Insider Trading', jail: 25, fine: 75000 },
            { name: 'counterfeiting', label: 'Counterfeiting', jail: 30, fine: 100000 }
        ]
    },
    ['weaponsCrimes']: {
        label: 'Weapons Crimes',
        options: [
            { name: 'illegalPossession', label: 'Illegal Possession of Weapons', jail: 10, fine: 15000 },
            { name: 'armsTrafficking', label: 'Arms Trafficking', jail: 25, fine: 50000 },
            { name: 'unauthorizedUse', label: 'Unauthorized Use of Weapons', jail: 15, fine: 30000 },
            { name: 'explosivePossession', label: 'Possession of Explosives', jail: 20, fine: 60000 },
            { name: 'weaponBrandishing', label: 'Weapon Brandishing in Public', jail: 5, fine: 20000 }
        ]
    }
};
