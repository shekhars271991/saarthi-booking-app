# Cities and Languages Configuration

This configuration system allows you to easily manage which cities and languages are available in the application.

## Configuration File: `cities.ts`

The main configuration is located in `app/config/cities.ts`. This file controls:

- Available cities
- Available languages  
- City-to-language mappings
- Display names for cities and languages
- Default language

## How to Modify Available Cities and Languages

### To Add a New City:

1. Add the city code to `availableCities` array
2. Add the city display name to `cityDisplayNames`
3. Add the city-to-language mapping in `cityLanguageMapping`

Example:
```typescript
availableCities: ['bihar', 'mumbai'],
cityDisplayNames: {
  'bihar': 'Bihar',
  'mumbai': 'Mumbai',
},
cityLanguageMapping: {
  'bihar': 'hi',
  'mumbai': 'en',
},
```

### To Add a New Language:

1. Add the language code to `availableLanguages` array
2. Add the language display name to `languageDisplayNames`
3. Update the translations file (`app/translations/index.ts`) to include the new language
4. Update the Language type in the translations file

### To Remove a City or Language:

1. Remove from the respective arrays/objects
2. Update any related translations
3. Ensure the city/language is not referenced elsewhere in the code

## Current Configuration

- **Available Cities**: Bihar
- **Available Languages**: Hindi (hi), English (en)
- **Default Language**: Hindi (hi)
- **City Language Mapping**: Bihar → Hindi

## Environment-Based Configuration

To make this configuration environment-based, you can:

1. Create environment variables in `.env.local`:
```
NEXT_PUBLIC_AVAILABLE_CITIES=bihar,mumbai
NEXT_PUBLIC_AVAILABLE_LANGUAGES=hi,en,gu
NEXT_PUBLIC_DEFAULT_LANGUAGE=hi
```

2. Modify the config file to read from environment variables:
```typescript
export const cityConfig = {
  availableCities: process.env.NEXT_PUBLIC_AVAILABLE_CITIES?.split(',') || ['bihar'],
  availableLanguages: (process.env.NEXT_PUBLIC_AVAILABLE_LANGUAGES?.split(',') as AvailableLanguage[]) || ['hi', 'en'],
  defaultLanguage: (process.env.NEXT_PUBLIC_DEFAULT_LANGUAGE as AvailableLanguage) || 'hi',
  // ... rest of config
};
```

## Notes

- The configuration is currently hardcoded but can easily be made environment-based
- All language and city codes should match the keys used in the translations file
- The system automatically filters available options based on this configuration
- City-based language switching respects manual language preferences unless forced
