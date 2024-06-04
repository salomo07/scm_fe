part of 'login_v.dart';


class RegistrationForm extends GetView<LoginController> {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Obx(() => Padding(
          padding: EdgeInsets.only(
              right: 30,
              left: isMobile(Get.width) ? 30 : 0),
          child: Stack(
            children: [
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
                  Text(
                    "Create an account, join with us",style: poppinsTextFont.copyWith(fontWeight: FontWeight.w200, fontSize: 14,color: greyColor),
                  ),
                  const Gap(15),
                  Column(
                    children: [
                      CustomTextFormField(
                        width: double.infinity,
                        maxLength: 100,
                        controller: controller.txtPassword.value,
                        label: "Fullname",
                        hint: "Insert your Fullname",
                        textStyle: poppinsTextFont,
                        suffixIcon: IconButton(onPressed: () {
                          
                        }, 
                        icon: Icon(Icons.text_fields,color: defaultColor,)),
                      ),
                      const Gap(15),
                      CustomTextFormField(
                        onTap: () {
                          controller.callDatePicker((datetime) {
                            controller.txtBirthDate.value.text=DateFormat('dd-MM-yyyy').format(datetime).toString();
                          },);
                        },
                        controller: controller.txtBirthDate.value,
                        label: "BirthDate",
                        hint: "Insert your BirthDate",
                        textStyle: poppinsTextFont,
                        width: double.infinity,
                        suffixIcon: IconButton(
                          onPressed: () {
                            
                          },
                          icon: Icon(Icons.cake,color: defaultColor,),
                        ),
                      ),                      
                      const Gap(15),
                      CustomTextFormField(
                        maxLength: 50,
                        controller: controller.txtPassword.value,
                        validator: ValidationBuilder().minLength(5).required().build(),
                        label: "Username",
                        hint: "Insert your Username",
                        textStyle: poppinsTextFont,
                        width: double.infinity,
                        suffixIcon: IconButton(
                          onPressed: () {
                            
                          },
                          icon:FaIcon(FontAwesomeIcons.user,color: defaultColor),
                        ),
                      ), 
                      const Gap(15),
                      CustomTextFormField(
                        maxLength: 50,
                        controller: controller.txtPassword.value,
                        validator: ValidationBuilder().email("Email format is not valid").build(),
                        label: "Email",
                        hint: "Insert your Email",
                        textStyle: poppinsTextFont,
                        width: double.infinity,
                        suffixIcon: IconButton(
                          onPressed: () {
                            
                          },
                          icon: Icon(Icons.mail,color: defaultColor,),
                        ),
                      ),
                      const Gap(15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            
                          },
                          child: Text("Clear Form",style: poppinsTextFont.copyWith(color: defaultColor),)
                        ),
                      ),
                    ],
                  ),
                  const Gap(15),
                  CustomButton(
                    icon:Icon(Icons.login,color: whiteColor) ,
                    width: double.infinity,
                    text: "Register",
                    textStyle: poppinsTextFont.copyWith(color: whiteColor),
                    onPressed: () {},
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
                      const Text("Have an account?"),
                      const Gap(10),
                      InkWell(
                        onTap: () {
                          controller.selectedForm.value =Paths.loginform;
                        },
                        child: Text("Sign In",style: poppinsTextFont.copyWith(color: defaultColor),
                        )
                      )
                    ],
                  ),
                  const Gap(50),
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