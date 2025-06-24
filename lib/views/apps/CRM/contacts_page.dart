import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webkit/controller/apps/CRM/contacts_controller.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/utils/utils.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/images.dart';
import 'package:webkit/models/contacts.dart';
import 'package:webkit/views/layouts/layout.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late ContactsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ContactsController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Members",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Employee"),
                        MyBreadcrumbItem(name: "Members", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyFlex(
                  contentPadding: false,
                  children: [
                    MyFlexItem(
                     // sizes: "xxl-8 xl-8",
                      child: Column(
                        children: [
                          if (controller.data != null)
                            PaginatedDataTable(
                              header: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      maxLines: 1,
                                      style: MyTextStyle.bodyMedium(),
                                      decoration: InputDecoration(
                                          hintText: "search...",
                                          hintStyle: MyTextStyle.bodySmall(
                                              xMuted: true),
                                          border: outlineInputBorder,
                                          enabledBorder: outlineInputBorder,
                                          focusedBorder: focusedInputBorder,
                                          contentPadding: MySpacing.xy(16, 12),
                                          isCollapsed: true,
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never),
                                    ),
                                  ),
                                  MyButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: MySpacing.xy(12, 18),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: MyText.bodySmall(
                                      "Add Member",
                                      color: contentTheme.onPrimary,
                                    ),
                                  )
                                ],
                              ),
                              source: controller.data!,
                              columns: [
                                DataColumn(
                                    label: MyText.titleMedium(
                                  'Name',
                                  fontWeight: 600,
                                )),
                                DataColumn(
                                    label: MyText.titleMedium(
                                  'Email',
                                  fontWeight: 600,
                                )),
                                DataColumn(
                                    label: MyText.titleMedium(
                                  'Email',
                                  fontWeight: 600,
                                )),
                                DataColumn(
                                    label: MyText.titleMedium(
                                  'Role',
                                  fontWeight: 600,
                                )),
                                DataColumn(
                                    label: MyText.titleMedium(
                                  'Status',
                                  fontWeight: 600,
                                )),
                              ],
                              columnSpacing: 60,
                              horizontalMargin: 28,
                              rowsPerPage: 10,
                            ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xxl-4 xl-4",
                      child: MyCard(
                        shadow: MyShadow(elevation: 0.5),
                        paddingAll: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyContainer.roundBordered(
                                  alignment: Alignment.topLeft,
                                  paddingAll: 0,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  height: 60,
                                  child: Image.asset(
                                    Images.avatars[1],
                                    fit: BoxFit.cover,
                                    height: 60,
                                  ),
                                ),
                                MySpacing.width(16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.bodyMedium(
                                      "Gareth Ivanets",
                                      fontSize: 20,
                                    ),
                                    MyText.bodyMedium(
                                      "Branch Manager",
                                      muted: true,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            MySpacing.height(16),
                            MyContainer(
                              paddingAll: 8,
                              color: contentTheme.primary.withAlpha(30),
                              child: Row(
                                children: [
                                  Icon(
                                    LucideIcons.user,
                                    color: contentTheme.primary,
                                  ),
                                  MySpacing.width(12),
                                  Expanded(
                                    child: MyText.bodyMedium(
                                      "PERSONAL INFORMATION",
                                      fontSize: 16,
                                      color: contentTheme.primary,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: 600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            MySpacing.height(16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.titleMedium(
                                  "ABOUT ME:",
                                  fontWeight: 600,
                                ),
                                MySpacing.height(12),
                                MyText.bodyMedium(
                                  controller.dummyTexts[2],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  muted: true,
                                ),
                              ],
                            ),
                            MySpacing.height(16),
                            buildPersonalDetail(
                              "DATE OF BIRTH :",
                              "March 23, 1984 (34 Years)",
                            ),
                            MySpacing.height(16),
                            buildPersonalDetail(
                              "COMPANY :",
                              "Vine Corporation",
                            ),
                            MySpacing.height(16),
                            buildPersonalDetail(
                              "ADDED:",
                              "April 22, 2016",
                            ),
                            MySpacing.height(16),
                            buildPersonalDetail(
                              "UPDATED:",
                              "Dec 13, 2017",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildPersonalDetail(String title, String description) {
    return Row(
      children: [
        MyText.titleMedium(
          title,
          fontWeight: 600,
        ),
        MySpacing.width(8),
        Expanded(
          child: MyText.bodyMedium(
            description,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class ContactsData extends DataTableSource with UIMixin {
  List<Contacts> data = [];

  ContactsData(this.data);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        DataCell(MyText.titleMedium(
          data[index].name,
          fontWeight: 600,
        )),
        DataCell(MyText.bodyMedium("91+ ${data[index].phoneNumber}")),
        DataCell(MyText.bodyMedium(data[index].email)),
        DataCell(MyText.bodyMedium(data[index].company)),
        DataCell(
          MyText.bodyMedium(
            '${Utils.getDateStringFromDateTime(
              data[index].createdAt,
              showMonthShort: true,
            )}',
          ),
        ),
      ],
    );
  }
}
