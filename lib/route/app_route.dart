import 'package:bp_treat/module/account/view/health_detail_view.dart';
import 'package:bp_treat/module/contact/binding/chat_binding.dart';
import 'package:bp_treat/module/contact/view/contact_view.dart';
import 'package:bp_treat/module/dashboard/binding/dashboard_bindings.dart';
import 'package:bp_treat/module/doctor/binding/doctor_binding.dart';
import 'package:bp_treat/module/doctor/view/doctor_selection_screen.dart';
import 'package:get/get.dart';
import 'package:bp_treat/module/account/binding/account_binding.dart';
import 'package:bp_treat/module/account/view/account_page.dart';
import 'package:bp_treat/module/account/view/basic_detail_page.dart';
import 'package:bp_treat/module/account/view/help_details.dart';
import 'package:bp_treat/module/auth/binding/forgotpassword_binding.dart';
import 'package:bp_treat/module/auth/binding/login_binding.dart';
import 'package:bp_treat/module/auth/binding/register_binding.dart';
import 'package:bp_treat/module/auth/view/forgot_password_view.dart';
import 'package:bp_treat/module/auth/view/login_screen.dart';
import 'package:bp_treat/module/auth/view/register_screen.dart';
import 'package:bp_treat/module/consult/binding/consent_binding.dart';
import 'package:bp_treat/module/consult/view/doctor_consultation.dart';
import 'package:bp_treat/module/dashboard/binding/root_binding.dart';
import 'package:bp_treat/module/dashboard/view/add_bp_view.dart';
import 'package:bp_treat/module/dashboard/view/dashboard_view.dart';
import 'package:bp_treat/module/dashboard/view/landing_page.dart';
import 'package:bp_treat/module/dashboard/view/view_all_record.dart';
import 'package:bp_treat/module/welcome/views/welcom_screen.dart';

class AppRoute {
  AppRoute._();
  static final routes = [
    GetPage(
      name: "/welcome",
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: "/register",
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: "/landing",
      page: () => const LandingPage(),
      binding: RootBindings(),
    ),
    GetPage(
      name: "/account",
      page: () => const AccountPage(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: "/consent",
      page: () => const DoctorConsultationConsent(),
      binding: ConsentBinding(),
    ),
    GetPage(
      name: "/faq",
      page: () => const HelpView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: "/edit-basic-detail",
      page: () => const EditBasicDetails(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: "/add-bp",
      page: () => const AddBPView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: "/dashboard",
      page: () => DashBoardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: "/view-all",
      page: () => const ViewAllRecord(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: "/forgot-password",
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: "/health-detail",
      page: () => const HealthDetailView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: "/doctor-selection",
      page: () => const DoctorSelectionScreen(),
      binding: DoctorBinding(),
    ),
    GetPage(
      name: "/contact-page",
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
  ];
}
