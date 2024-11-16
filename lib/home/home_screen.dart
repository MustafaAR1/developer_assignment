import 'package:developer_assignment/components/UIScaffold.dart';
import 'package:developer_assignment/components/UISpacer.dart';
import 'package:developer_assignment/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homecontroller = Get.find<HomeController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // if(homecontroller.homeData.value == null) {
      await homecontroller.getHomeData();
      // }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UiScaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 100,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D',
                ),
              ),
            ),
          ],
          automaticallyImplyLeading: false,
          title: const Text(
            'Good Morning,\nJane',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
        body: Obx(
          () => homecontroller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : homecontroller.error.value != null
                  ? Center(
                      child: Text(homecontroller.error.value!),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          StoriesSection(),
                          UISpacer.spacerH20(),
                           AppointmentCard(),
                          UISpacer.spacerH20(),
                          const CategorySection(),
                          UISpacer.spacerH20(),
                          const FrequentlyUsedSection(),
                          UISpacer.spacerH20(),
                          const FinancialServicesSection(),
                        ],
                      ),
                    ),
        ));
  }
}

class StoriesSection extends StatelessWidget {
  StoriesSection({super.key});
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homecontroller.homeData.value?.stories.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        homecontroller
                                .homeData.value?.stories[index].imageUrl ??
                            'https://placeholder.com/user',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  homecontroller.homeData.value?.stories[index].name ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Appointment Card
class AppointmentCard extends StatelessWidget {
   AppointmentCard({super.key});
    final homecontroller = Get.find<HomeController>();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(
                  homecontroller.homeData.value?.appointment.doctor.imageUrl ?? 'https://placeholder.com/user',
                ),
              ),              UISpacer.spacerW16(),
              if(homecontroller.homeData.value?.appointment.doctor.name != null)
              Text(homecontroller.homeData.value!.appointment.doctor.name),
            ],
          ),
              UISpacer.spacerH10(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sunday, 12 June'),
              Text('11:00 - 12:00 AM'),
            ],
          ),
        ],
      ),
    );
  }
}

// Category Section
class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryIcon(label: 'Meeting', color: Colors.orange),
        CategoryIcon(label: 'Hangout', color: Colors.pink),
        CategoryIcon(label: 'Cooking', color: Colors.red),
        CategoryIcon(label: 'Weekend', color: Colors.green),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String label;
  final Color color;

  const CategoryIcon({Key? key, required this.label, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: color,
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}

// Frequently Used Section
class FrequentlyUsedSection extends StatelessWidget {
  const FrequentlyUsedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Frequently Used',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return FrequentlyUsedIcon(index: index);
          },
        ),
      ],
    );
  }
}

class FrequentlyUsedIcon extends StatelessWidget {
  final int index;

  const FrequentlyUsedIcon({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blue[50],
          child: const Icon(Icons.widgets, color: Colors.blue),
        ),
        const SizedBox(height: 5),
        Text('Item $index', style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Financial Services Section
class FinancialServicesSection extends StatelessWidget {
  const FinancialServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Financial Services',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return FinancialServiceIcon(index: index);
          },
        ),
      ],
    );
  }
}

class FinancialServiceIcon extends StatelessWidget {
  final int index;

  const FinancialServiceIcon({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.purple[50],
          child: const Icon(Icons.money, color: Colors.purple),
        ),
        const SizedBox(height: 5),
        Text('Service $index', style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
