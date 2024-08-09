clean: ## Cleans the environment
	rm -rf pubspec.lock
	flutter clean

flutter_clean_cache: ## Cleans the environment
	flutter pub cache clean

format: ## Formats the code
	dart format .

lint: ## Lints the code
	dart analyze .

flutter_analyze: ## analyze entails linting
	flutter analyze --no-fatal-infos --no-fatal-warnings

flutter_generate: # execute code generation
	flutter packages pub run build_runner build --verbose --delete-conflicting-outputs

flutter_build_runner: # get packages and generate code generation
	flutter packages get && \
    flutter packages pub run build_runner build --delete-conflicting-outputs

flutter_test:  ## Runs unit tests
	flutter test test

run_mobile: ## Runs the mobile application in dev
	flutter run

flutter_cov_report: # Run test and see code coverage
	flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html
	open coverage/html/index.html
