import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final headingStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.teal[800],
    );

    final paragraphStyle = TextStyle(
      fontSize: 16,
      height: 1.6,
      color: Colors.grey[900],
    );

    final captionStyle = TextStyle(
      fontSize: 14,
      fontStyle: FontStyle.italic,
      color: Colors.grey[700],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Overview'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Introduction
            Text('Introduction', style: headingStyle),
            const SizedBox(height: 10),
            Text(
              'The Handyman App is a human-centered digital solution developed to bridge the gap between homeowners and private contractors in the home renovation and improvement space. '
              'Many homeowners struggle with finding reliable contractors, often relying on generic listing sites or personal referrals that don’t offer transparency, skill verification, or detailed pricing. '
              'Meanwhile, independent contractors frequently face challenges managing multiple projects, coordinating client communication, and tracking job progress due to the lack of centralized tools. '
              'This app was inspired by real-world observations of inefficiencies in the industry and a personal connection to the contractor workflow. '
              'It was designed with a clear goal: to create a trustworthy, intuitive, and accessible platform that benefits both clients and contractors by improving job discovery, communication, scheduling, and task tracking.',
              style: paragraphStyle,
            ),

            const SizedBox(height: 24.0),

            // Section 2: Core Goals and Functionality
            Text('Core Goals and Functionality', style: headingStyle),
            const SizedBox(height: 10),
            Text(
              'This project focuses on three core features. First, an advanced search and filter system helps clients discover contractors based on skillset, pricing, location, and past reviews. '
              'Second, contractors have access to a personalized dashboard where they can manage ongoing projects, track materials and labor, and communicate with clients in real time. '
              'Third, the app offers live messaging and visual status updates that minimize miscommunication, allowing both parties to stay informed about project progress and scheduling changes. '
              'User research through interviews and contextual inquiry revealed several critical insights: clients prioritize transparency and trust, while contractors value workflow organization and simplified task reporting. '
              'Both groups emphasized the importance of ease of use, especially for elderly or non-tech-savvy users.',
              style: paragraphStyle,
            ),

            const SizedBox(height: 24.0),

            // Section 3: Research and User Needs
            Text('Research and User Needs', style: headingStyle),
            const SizedBox(height: 10),
            Text(
              'Extensive user research—including contextual inquiries, interviews, and competitive analysis—revealed core needs and frustrations from both clients and contractors. '
              'Homeowners emphasized the need for verified credentials and pricing transparency, while contractors expressed a strong demand for better tools to manage and update jobs. '
              'Issues like scheduling conflicts, inconsistent work quality, and overbooking were common pain points. In response, the app integrates calendar-based availability tracking, simplified onboarding for elderly and non-tech-savvy users, and clear visual timelines to represent project stages.',
              style: paragraphStyle,
            ),

            const SizedBox(height: 24.0),

            // Section 4: User Personas
            Text('User Personas', style: headingStyle),
            const SizedBox(height: 10),
            Text(
              'Our primary personas are based on research insights and reflect two core user groups. The first is Maria, a 57-year-old retired school teacher and homeowner who has limited experience with home repairs and technology. '
              'Maria values clear communication, trustworthy reviews, and an easy-to-use interface that doesn’t overwhelm her. She wants to hire reliable professionals for remodeling her kitchen and prefers platforms that allow her to compare credentials and stay informed on project status without constant phone calls.\n\n'
              'The second persona is David, a 38-year-old independent contractor who manages multiple client jobs each week. Without a formal admin team, David needs tools that help him track job materials, labor timelines, and respond quickly to client questions. '
              'He prefers mobile-friendly dashboards that let him send updates on the go, along with features that minimize client miscommunication. David values platforms that make his work appear professional and that help him attract repeat business through positive client feedback.',
              style: paragraphStyle,
            ),

            const SizedBox(height: 24.0),

            // Section 5: Design Philosophy
            Text('Design Philosophy', style: headingStyle),
            const SizedBox(height: 10),
            Text(
              'From a design perspective, the app follows a user-centered and inclusive approach. Accessibility features such as screen reader compatibility, clear font hierarchies, and minimal UI complexity were emphasized from the beginning. '
              'Language support and budget-friendly filtering tools were also incorporated to serve diverse users. '
              'Unlike platforms that focus on one-time job bidding, this app promotes relationship building and recurring business by allowing contractors to maintain detailed portfolios and receive structured client feedback. '
              'Ultimately, the project’s success hinges on continuous usability testing and iterative development based on real user feedback. '
              'Through storyboards, task flows, and high-fidelity prototypes, the team has created a product experience designed to reduce friction and build trust in a space often marked by uncertainty.',
              style: paragraphStyle,
            ),

            const SizedBox(height: 30.0),

            // Section 6: Storyboard
            Text('Storyboard', style: headingStyle),
            const SizedBox(height: 10),
            Image.asset(
              'images/Storyboard.png',
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              'Figure: A storyboard visualizing how users navigate contractor discovery, manage job progress, and handle scheduling conflicts within the app interface.',
              style: captionStyle,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}