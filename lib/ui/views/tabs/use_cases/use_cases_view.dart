import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Switch;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:pokedex_scaffold/app/router.dart';
import 'package:pokedex_scaffold/bloc/use_cases/use_cases_cubit.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';
import 'package:pokedex_scaffold/constants/untranslated_strings.dart' as strings;
import 'package:pokedex_scaffold/core/base/base_view.dart';
import 'package:pokedex_scaffold/core/models/form/switch.dart';
import 'package:pokedex_scaffold/core/services/dialog_service.dart';
import 'package:pokedex_scaffold/core/services/modal_service.dart';
import 'package:pokedex_scaffold/core/services/toast_service.dart';
import 'package:pokedex_scaffold/ui/dialogs/example_dialog.dart';
import 'package:pokedex_scaffold/ui/modals/nested_navigation_modal.dart';
import 'package:pokedex_scaffold/ui/modals/with_indicator_modal.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/views/placeholder_example_view.dart';
import 'package:pokedex_scaffold/ui/views/placeholder_example_with_vavigation_view.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/error_container.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/use_case_button.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/use_case_dates_container.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/use_cases_section.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_switch.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_ws_bloc_container.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/datetime.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';
import 'package:pokedex_scaffold/utils/extensions/timezoned_datetime.dart';
import 'package:pokedex_scaffold/utils/no_effects_scroll_behavior.dart';
import 'package:pokedex_scaffold/utils/typedefs/timezoned_datetime.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class UseCasesView extends BaseStatelessView {
  UseCasesView({super.key})
      : super(
          baseViewData: BaseViewData(
            appBarConfiguration: AppBarData(
              titleBuilder: (context) => context.localization.useCases.capitalize(),
            ),
          ),
        );

  @override
  Widget body(BuildContext context) => PokedexScaffoldWsBlocContainer<UseCasesCubit, UseCasesState>(
        loadingChild: const _UseCasesLoading(),
        errorChildBuilder: (context, error) => ErrorContainer(
          message: context.localization
              .serviceError(context.localization.useCase(100), strings.italianDei),
          retryCallback: () {
            locator<UseCasesCubit>().getUseCasesData(language: context.locale.languageCode);
          },
        ),
        dataChildBuilder: (data, [_]) => _UseCasesDataFetched(
          data: data.$1,
          nativelyParsedDates: data.$2,
          customParsedDates: data.$3,
        ),
        initialLoadCallback: () {
          locator<UseCasesCubit>().getUseCasesData(language: context.locale.languageCode);
        },
      );
}

class _UseCasesLoading extends StatelessWidget {
  static final _kMockSwitchesData = [
    Switch(id: 0, value: BoneMock.name, enabled: false),
    Switch(id: 1, value: BoneMock.name, enabled: false),
    Switch(id: 2, value: BoneMock.name, enabled: false),
    Switch(id: 3, value: BoneMock.name, enabled: false),
  ];

  static final _kMockedNativelyParsedDates = [
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
  ];

  static final _kMockedCustomParsedDates = [
    (DateTime.now(), const Duration(seconds: 1)),
    (DateTime.now(), const Duration(seconds: 1)),
    (DateTime.now(), const Duration(seconds: 1)),
    (DateTime.now(), const Duration(seconds: 1)),
    (DateTime.now(), const Duration(seconds: 1)),
  ];

  const _UseCasesLoading();

  @override
  Widget build(BuildContext context) => Skeletonizer(
        ignorePointers: false,
        child: _UseCasesDataFetched(
          data: _kMockSwitchesData,
          nativelyParsedDates: _kMockedNativelyParsedDates,
          customParsedDates: _kMockedCustomParsedDates,
        ),
      );
}

class _UseCasesDataFetched extends StatelessWidget {
  final Logger _logger = Logger('_UseCasesDataFetched');

  final List<Switch> data;
  final List<DateTime> nativelyParsedDates;
  final List<TimezonedDateTime> customParsedDates;

  _UseCasesDataFetched({
    required this.data,
    required this.nativelyParsedDates,
    required this.customParsedDates,
  });

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: NoEffectsScrollBehavior(),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: AppTheme.defaultTopPadding.add(AppTheme.bottomTabsPaddingWithSafeArea(context)),
          child: Column(
            children: [
              UseCasesSection(
                title: context.localization.mutableDataExample,
                description: context.localization.mutableDataExampleDescription,
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 200.h,
                      ),
                      child: Padding(
                        padding: AppTheme.sidePadding.add(AppTheme.defaultTopPadding),
                        child: Column(
                          children: [
                            for (var i = 0; i < data.length; ++i)
                              Row(
                                children: [
                                  Text(
                                    data[i].value,
                                    style: AppTheme.s16w400h20l120507dWhite(context),
                                  ),
                                  const Spacer(),
                                  PokedexScaffoldSwitch(
                                    value: data[i].enabled,
                                    onChanged: (value) {
                                      locator<UseCasesCubit>().changeSwitchValueAtIndex(value, i);
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: AppTheme.defaultTopPadding,
                child: UseCasesSection(
                  title: context.localization.routingExample,
                  description: context.localization.routingExampleDescription,
                  child: Padding(
                    padding: AppTheme.sidePadding,
                    child: Column(
                      children: [
                        UseCaseButton(
                          label: context.localization.rootNavigation,
                          onPressed: () {
                            AutoRouter.of(context).push(const RootRoutingExampleRoute());
                          },
                        ),
                        UseCaseButton(
                          label: context.localization.nestedNavigation,
                          onPressed: () {
                            AutoRouter.of(context).push(const NestedRoutingExampleRoute());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppTheme.defaultTopPadding,
                child: UseCasesSection(
                  title: context.localization.modalExample,
                  description: context.localization.modalExampleDescription,
                  child: Padding(
                    padding: AppTheme.sidePadding,
                    child: Column(
                      children: [
                        UseCaseButton(
                          label: context.localization.modalNavigation,
                          onPressed: () {
                            // WithIndicatorModal è un modale che non consente una navigazione al suo interno,
                            // ma che si auto ridimensiona in base al suo contenuto.
                            // Quando il suo contenuto supera in altezza la dimensione della view,
                            // diventa un modale a tutto schermo che ne consente lo scroll.
                            // Passando il parametro isScrollControlled a false,
                            // la sua altezza rimane fissa a metà schermo circa, ed attiva a prescindere lo scroll del suo contenuto.
                            // Provare ad aumentare la dimensione del contenuto con i parametri numberOfPlaceholders e placeholdersHeight della view

                            // WithIndicatorModal is a modal that does not allow navigation within it,
                            // but resizes itself according to its content.
                            // When its content exceeds the size of the view in height,
                            // it becomes a full-screen modal that allows scrolling.
                            // By passing the isScrollControlled parameter to false,
                            // its height remains fixed at about half screen size, and it scrolls its content regardless
                            // Try increasing the size of the content with the numberOfPlaceholders and placeholdersHeight parameters of the view
                            locator<ModalService>().showModalView(
                              context,
                              isScrollControlled: true,
                              modalBuilder: (context) => WithIndicatorModal(
                                view: PlaceholderExampleView(
                                  // Try to change parameters to see auto resize or a full size modal
                                  numberOfPlaceholders: 2,
                                  placeholdersHeight: 150.h,
                                ),
                              ),
                            );
                          },
                        ),
                        UseCaseButton(
                          label: context.localization.modalNavigationNestedNavigator,
                          onPressed: () {
                            // NestedNavigationModal è un modale ad altezza fissa,
                            // ma che consente una navigazione tra view al suo interno.
                            // Esso non si ridimensiona in base al suo contenuto della sua view
                            // che per essere scrollabile deve includere una ListView come widget di impaginazione verticale.
                            // Passando il parametro isScrollControlled a true,
                            // la dimensione del modal viene fissata all'intera altezza dello schermo.
                            // Provare ad aumentare la dimensione del contenuto con i parametri numberOfPlaceholders e placeholdersHeight della view

                            // NestedNavigationModal is a modal with a fixed height,
                            // but which allows navigation between views within it.
                            // It does not resize itself according to the content of its view
                            // which must include a ListView as a vertical layout widget in order to be scrollable.
                            // By passing the isScrollControlled parameter to true,
                            // the size of the modal is fixed to the full height of the screen.
                            // Try increasing the size of the content with the numberOfPlaceholders and placeholdersHeight parameters of the view
                            locator<ModalService>().showModalView(
                              context,
                              isScrollControlled: false,
                              modalBuilder: (context) => NestedNavigationModal(
                                view: PlaceholderExampleWithNavigationView(
                                  // Try to change parameters to see modal scroll and size behavior
                                  numberOfPlaceholders: 1,
                                  placeholdersHeight: 150.h,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppTheme.defaultTopPadding,
                child: UseCasesSection(
                  title: context.localization.toastExample,
                  description: context.localization.toastExampleDescription,
                  child: Padding(
                    padding: AppTheme.sidePadding,
                    child: UseCaseButton(
                      label: context.localization.showToast,
                      onPressed: () {
                        locator<ToastService>().showInfoToast(
                          context,
                          text: context.localization.exampleMessage,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppTheme.defaultTopPadding,
                child: UseCasesSection(
                  title: context.localization.dialogExample,
                  description: context.localization.dialogExampleDescription,
                  child: Padding(
                    padding: AppTheme.sidePadding,
                    child: UseCaseButton(
                      label: context.localization.showDialog,
                      onPressed: () async {
                        final returnedValue = await locator<DialogService>().showDialogWidget(
                          context,
                          dialogBuilder: (context) => ExampleDialog(
                            title: context.localization.dialogTitle,
                          ),
                        );

                        // Example of returning value from a dialog. Closing it with the close button
                        // a true value is returned. Null value is returned closing it tapping anywhere
                        // Same approach can be used on modals too
                        _logger.fine('Dialog returned value: $returnedValue');
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppTheme.defaultTopPadding,
                child: UseCasesSection(
                  title: context.localization.datesExampleTitle,
                  description: context.localization.datesExampleDescription,
                  child: Padding(
                    padding: AppTheme.sidePadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UseCasesDatesContainer(
                          title: context.localization.nativeParsedDates,
                          parsedDates: nativelyParsedDates
                              .map((date) =>
                                  '${date.ddMMMyyyyWithSpacesHHmmssWithColonSeparatedByHyphen(context.locale.languageCode)} ${date.timeZoneOffset.asDateTimeTimeZoneOffset}')
                              .toList(),
                        ),
                        UseCasesDatesContainer(
                          title: context.localization.customParsedDates,
                          parsedDates: customParsedDates
                              .map((date) =>
                                  '${date.datetime.ddMMMyyyyWithSpacesHHmmssWithColonSeparatedByHyphen(context.locale.languageCode)} ${date.timeZoneOffset.asDateTimeTimeZoneOffset}')
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
