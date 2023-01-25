# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2022-01-24
### Added
- Added the following endpoints (which were previously in our Beta API/SDKs):
    - Data Privacy
    - All Tags endpoints, as well as the following related resource-specific endpoints:
      - Get Flow Tags
      - Get List Tags
      - Get Segment Tags

## [1.0.1] - 2022-12-06
### Changes
- Support for cursor pagination
    - Passing the `next` value from a paginated result to the following call via the `page_cursor` query string argument will now result in the cursor being parsed and set appropriately by the `ApiClient`.

## [1.0.0] - 2022-10-19
### Added
- Initial release

### Changes
- Naming changes:
    - Package name: klaviyo_sdk -> klaviyo-api-sdk
    - Module name: KlaviyoBeta -> KlaviyoAPI
    - Some functions have changed name
- New resources and endpoints: 
    - See API Changelog for full details
