part of 'login_v.dart';
class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    var maxValRandom = 530;
    // return Text("FormLogin");
    return LayoutBuilder(
      builder: (context, constraints) {
        return Obx(() => Padding(
          padding: EdgeInsets.only(
              // top: 20,
              // bottom: 15,
              right: 30,
              left: isMobile(Get.width) ? 30 : 0),
          child: Stack(
            children: [
              Positioned(
                left: random.nextInt(maxValRandom).toDouble(),
                bottom: random.nextInt(maxValRandom).toDouble(),
                child: const CircleWidget(radius: 100),
              ),
              Positioned(
                top: random.nextInt(maxValRandom).toDouble(),
                right: random.nextInt(maxValRandom).toDouble(),
                left: random.nextInt(maxValRandom).toDouble(),
                bottom: random.nextInt(maxValRandom).toDouble(),
                child: const CircleWidget(radius: 200),
              ),
              Positioned(
                top: random.nextInt(maxValRandom).toDouble(),
                right: random.nextInt(maxValRandom).toDouble(),
                child: const CircleWidget(radius: 300),
              ),
              Positioned(
                top: random.nextInt(maxValRandom).toDouble(),
                right: random.nextInt(maxValRandom).toDouble(),
                child: const CircleWidget(radius: 400),
              ),
              Positioned(
                left: random.nextInt(maxValRandom).toDouble(),
                bottom: random.nextInt(maxValRandom).toDouble(),
                child: const CircleWidget(radius: 500),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: !isMobile(Get.width)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Text(
                    appName,
                    style: poppinsTextFont.copyWith(
                        fontWeight: FontWeight.w800, fontSize: 24),
                  ),
                  const Gap(10),
                  Text("Sign in to stay connected.",style: poppinsTextFont.copyWith(fontWeight: FontWeight.w200, fontSize: 14,color: greyColor)),
                  const Gap(35),
                  Column(
                    children: [
                      CustomTextFormField(
                        controller: controller.txtUsername.value,
                        label: "Username or Email",
                        hint: "Insert your Username",
                        textStyle: poppinsTextFont,
                        width: double.infinity,
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.txtUsername.value.clear();
                            },
                            icon: Icon(
                              Icons.perm_identity,
                              color: controller.errUsername.value != ""
                                  ? Colors.red
                                  : defaultColor,
                            )),
                      ),
                      const Gap(35),
                      CustomTextFormField(
                        controller: controller.txtPassword.value,
                        label: "Password",
                        hint: "Insert your Password",
                        textStyle: poppinsTextFont,
                        secureText: !controller.isVisible.value,
                        width: double.infinity,
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.isVisible.toggle();
                            },
                            icon: Icon(
                              !controller.isVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: controller.errPassword.value != ""
                                  ? Colors.red
                                  : defaultColor,
                            )),
                      ),
                      const Gap(25),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: controller.isRememberMe.value,
                                    onChanged: (value) {
                                      controller.isRememberMe.toggle();
                                    },
                                  ),
                                  Text("Remember Me",style: poppins12_300())
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Forgot Password?",
                                style: poppinsTextFont,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(35),
                  CustomButton(
                    icon:Icon(Icons.login,color: whiteColor) ,
                    width: double.infinity,
                    text: "Log In",
                    
                    textStyle: poppinsTextFont.copyWith(color: whiteColor),
                    onPressed: () {
                      controller.login();
                    },
                  ),
                  const Gap(25),
                  CustomButton(
                    width: double.infinity,
                    colorButton: whiteColor,
                    colorBorder: Colors.grey,
                    icon: const Icon(Icons.golf_course_outlined, color: Colors.black),
                    text: "Sign in with Google",
                    textStyle:
                        poppinsTextFont.copyWith(color: Colors.black),
                    onPressed: () {},
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account?"),
                      const Gap(10),
                      InkWell(
                        onTap: () {
                          controller.selectedForm.value =Paths.registerform;
                        },
                        child: Text("Sign up",style: poppinsTextFont.copyWith(color: defaultColor),
                        )
                      )
                    ],
                  ),
                  const Gap(40),
                  Center(
                    child: Text("Copyright $copyRight",style: poppinsTextFont.copyWith(color: greyColor)),
                  )
                ],
              ),
            ],
          ),
        ));
      },
    );
  }
}
