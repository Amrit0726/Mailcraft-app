// Template Data Models
class TemplateItem {
  final String id;
  final String title;
  final String description;
  final TemplateVersions versions;
  final bool isFavorite;

  TemplateItem({
    required this.id,
    required this.title,
    required this.description,
    required this.versions,
    this.isFavorite = false,
  });
}

class TemplateVersions {
  final TemplateVersion formal;
  final TemplateVersion polite;
  final TemplateVersion short;

  TemplateVersions({
    required this.formal,
    required this.polite,
    required this.short,
  });
}

class TemplateVersion {
  final String subject;
  final String message;

  TemplateVersion({
    required this.subject,
    required this.message,
  });
}

// ========================================
// EMAIL TEMPLATES DATA
// ========================================

class EmailTemplatesData {
  static List<TemplateItem> getTemplates() {
    return [
      TemplateItem(
        id: 'email_1',
        title: 'Job Application Email',
        description: 'Professional email for job applications with resume attachment',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Application for [Job Title] Position - [Your Name]',
            message: '''Dear Hiring Manager,

I am writing to formally express my interest in the [Job Title] position at [Company Name], as advertised on [Platform/Reference]. With [X] years of experience in [Your Field] and a proven track record in [Key Achievement/Skill], I am confident in my ability to contribute effectively to your esteemed organization.

My professional background includes:
• [Key Qualification 1]
• [Key Qualification 2]
• [Key Qualification 3]

[Paragraph about why you're interested in the company and role]

I have attached my resume for your review. I would welcome the opportunity to discuss how my skills and experience align with your needs.

Thank you for your consideration. I look forward to hearing from you.

Respectfully,
[Your Name]
[Your Email] | [Your Phone]''',
          ),
          polite: TemplateVersion(
            subject: 'Application for [Job Title] Position',
            message: '''Dear Hiring Manager,

I hope this email finds you well. I am writing to express my strong interest in the [Job Title] position at [Company Name]. With my background in [Your Field] and [X] years of experience, I believe I would be a valuable addition to your team.

[Highlight 2-3 key qualifications or achievements that match the job requirements]

I have attached my resume for your review. I would welcome the opportunity to discuss how my skills and experience align with your needs.

Thank you for considering my application. I look forward to the possibility of speaking with you.

Best regards,
[Your Name]
[Your Contact Information]''',
          ),
          short: TemplateVersion(
            subject: 'Applying for [Job Title]',
            message: '''Hi,

I'm interested in the [Job Title] position at [Company]. I have [X] years of experience in [Your Field] and believe I'd be a great fit.

Resume attached. Happy to discuss further.

Thanks,
[Your Name]
[Your Email] | [Your Phone]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'email_2',
        title: 'Meeting Request',
        description: 'Request a professional meeting with clear agenda',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Request for Meeting - [Topic]',
            message: '''Dear [Name],

I hope this message finds you well. I am writing to request a meeting to discuss [specific topic/purpose]. I believe this discussion would be mutually beneficial and would greatly appreciate your time and insights.

Proposed Agenda:
• [Agenda Item 1]
• [Agenda Item 2]
• [Agenda Item 3]

I estimate this meeting would require approximately [duration] minutes. Would you be available for a meeting on [proposed date] at [time]? I am happy to accommodate your schedule and can meet at your convenience.

Please let me know your availability, and I will send a calendar invitation accordingly.

Thank you for your consideration.

Best regards,
[Your Name]''',
          ),
          polite: TemplateVersion(
            subject: 'Meeting Request - [Topic]',
            message: '''Dear [Name],

I hope you're doing well. I would like to schedule a meeting to discuss [topic/purpose].

Proposed agenda:
• [Point 1]
• [Point 2]
• [Point 3]

Would you be available for a [duration] meeting on [proposed date/time]? I'm happy to work around your schedule.

Looking forward to hearing from you.

Best regards,
[Your Name]''',
          ),
          short: TemplateVersion(
            subject: 'Quick meeting?',
            message: '''Hi [Name],

Can we schedule a quick meeting about [topic]?

[Duration] on [proposed date/time] work for you?

Thanks,
[Your Name]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'email_3',
        title: 'Follow-up After Interview',
        description: 'Thank you email after job interview',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Thank You - [Position Name] Interview',
            message: '''Dear [Interviewer Name],

I would like to extend my sincere gratitude for taking the time to meet with me on [date] to discuss the [Position Name] role at [Company Name]. It was a pleasure learning more about the position, the team, and the exciting initiatives at your organization.

Our conversation has further reinforced my enthusiasm for this opportunity. I am particularly excited about [specific aspect discussed during interview], and I am confident that my experience in [relevant skill/area] would enable me to contribute meaningfully to your team's objectives.

Please do not hesitate to contact me if you require any additional information or clarification regarding my qualifications.

Thank you once again for your time and consideration. I look forward to the possibility of working with your team.

Respectfully,
[Your Name]
[Your Contact Information]''',
          ),
          polite: TemplateVersion(
            subject: 'Thank You - [Position Name] Interview',
            message: '''Dear [Interviewer Name],

Thank you for taking the time to meet with me today to discuss the [Position Name] role. I enjoyed learning more about the team and the exciting projects at [Company Name].

Our conversation reinforced my enthusiasm for this opportunity. I am particularly excited about [specific aspect discussed].

Please don't hesitate to reach out if you need any additional information from me.

Thank you again for your consideration.

Best regards,
[Your Name]''',
          ),
          short: TemplateVersion(
            subject: 'Thanks for the interview!',
            message: '''Hi [Interviewer Name],

Thanks for meeting with me today! Really enjoyed learning about the role and team.

Looking forward to next steps.

Best,
[Your Name]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'email_4',
        title: 'Professional Introduction',
        description: 'Introduce yourself to a new contact or colleague',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Professional Introduction - [Your Name]',
            message: '''Dear [Name],

I hope this message finds you well. Allow me to introduce myself: I am [Your Name], currently serving as [Your Position] at [Your Company/Organization].

[Explain the context of your outreach and any mutual connection]

I am reaching out because [reason for contact - shared interest, potential collaboration, etc.]. I have been following your work in [their field/area of expertise] with great interest and would value the opportunity to connect and learn from your experience.

Would you be amenable to a brief introductory call or meeting at your convenience? I am confident that our discussion could be mutually beneficial.

Thank you for considering my request. I look forward to the possibility of connecting with you.

Respectfully,
[Your Name]
[Your Contact Information]''',
          ),
          polite: TemplateVersion(
            subject: 'Introduction - [Your Name]',
            message: '''Dear [Name],

I hope this email finds you well. My name is [Your Name], and I am [your role/position] at [Company/Organization].

[Brief explanation of why you're reaching out and any common connection/interest]

I would love to connect and learn more about your work in [their field/area]. Would you be open to a brief call or coffee chat?

Looking forward to connecting.

Best regards,
[Your Name]
[Your Contact Information]''',
          ),
          short: TemplateVersion(
            subject: 'Quick intro',
            message: '''Hi [Name],

I'm [Your Name], [your role] at [Company]. [Mutual connection] suggested I reach out.

Would love to connect about [topic/interest].

Coffee sometime?

Best,
[Your Name]''',
          ),
        ),
      ),
    ];
  }
}

// ========================================
// LINKEDIN MESSAGES DATA
// ========================================

class LinkedInMessagesData {
  static List<TemplateItem> getTemplates() {
    return [
      TemplateItem(
        id: 'linkedin_1',
        title: 'Connection Request',
        description: 'Professional connection request message',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: '',
            message: '''Dear [Name],

I hope this message finds you well. I recently came across your profile and was impressed by your extensive experience in [their field/expertise]. As someone who is actively engaged in [your field/industry], I believe we share common professional interests.

I would be honored to connect with you and learn from your insights and experience in [specific area].

Thank you for considering my connection request.

Best regards,
[Your Name]''',
          ),
          polite: TemplateVersion(
            subject: '',
            message: '''Hi [Name],

I came across your profile and was impressed by your work in [their field/expertise]. I'm currently [your role/situation] and would love to connect and learn from your experience.

Looking forward to connecting!

Best,
[Your Name]''',
          ),
          short: TemplateVersion(
            subject: '',
            message: '''Hi [Name],

Great profile! Would love to connect and learn from your experience in [field].

Best,
[Your Name]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'linkedin_2',
        title: 'Informational Interview Request',
        description: 'Request an informational interview',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: '',
            message: '''Dear [Name],

I hope this message finds you well. I am currently exploring career opportunities in [field/industry] and was particularly impressed by your career trajectory at [Company].

I would be extremely grateful if you could spare 15-20 minutes for an informational interview to share insights about your experience and any advice you might offer to someone entering this field.

I understand your time is valuable and would be happy to work around your schedule.

Thank you for considering my request.

Respectfully,
[Your Name]''',
          ),
          polite: TemplateVersion(
            subject: '',
            message: '''Hi [Name],

I hope this message finds you well. I'm currently exploring opportunities in [field/industry] and was impressed by your career path at [Company].

Would you be open to a brief 15-20 minute call to share insights about your experience? I'd greatly appreciate any advice you could offer.

Thank you for considering my request!

Best regards,
[Your Name]''',
          ),
          short: TemplateVersion(
            subject: '',
            message: '''Hi [Name],

Exploring [field/industry] and would love to learn from your experience at [Company].

Quick 15-min call possible?

Thanks,
[Your Name]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'linkedin_3',
        title: 'Thank You After Networking',
        description: 'Follow-up message after meeting someone',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: '',
            message: '''Dear [Name],

Thank you for taking the time to speak with me at [event/occasion]. I found our conversation about [topic discussed] to be incredibly insightful and valuable.

I would be delighted to maintain our professional connection and continue our discussion on [relevant topic]. Please do not hesitate to reach out if there is any way I can be of assistance to you.

I look forward to staying in touch.

Best regards,
[Your Name]''',
          ),
          polite: TemplateVersion(
            subject: '',
            message: '''Hi [Name],

It was great meeting you at [event/occasion]! I really enjoyed our conversation about [topic discussed].

I'd love to stay connected and continue the conversation. Please feel free to reach out if there's anything I can help you with.

Looking forward to staying in touch!

Best,
[Your Name]''',
          ),
          short: TemplateVersion(
            subject: '',
            message: '''Hi [Name],

Great meeting you at [event]! Really enjoyed chatting about [topic].

Let's stay connected!

[Your Name]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'linkedin_4',
        title: 'Job Opportunity Inquiry',
        description: 'Reach out about a job opportunity',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: '',
            message: '''Dear [Name],

I hope this message finds you well. I recently noticed the [Position Name] opening at [Company] and was excited to see how well it aligns with my professional background and expertise in [your field].

Given your position at [Company], I would be grateful for the opportunity to learn more about the role and the team. Would you be available for a brief conversation to discuss this opportunity?

I have attached my resume for your reference and would be happy to provide any additional information you may require.

Thank you for your time and consideration.

Best regards,
[Your Name]''',
          ),
          polite: TemplateVersion(
            subject: '',
            message: '''Hi [Name],

I hope you're doing well. I noticed the [Position Name] opening at [Company] and was excited to see how well it aligns with my background in [your expertise].

I'd love to learn more about the role and the team. Would you be open to a brief conversation about this opportunity?

Thank you for your time!

Best regards,
[Your Name]''',
          ),
          short: TemplateVersion(
            subject: '',
            message: '''Hi [Name],

Saw the [Position] opening at [Company]. My background in [field] seems like a great fit.

Quick chat about it?

Thanks,
[Your Name]''',
          ),
        ),
      ),
    ];
  }
}

// ========================================
// WORKPLACE MESSAGES DATA
// ========================================

class WorkplaceMessagesData {
  static List<TemplateItem> getTemplates() {
    return [
      TemplateItem(
        id: 'workplace_1',
        title: 'Project Update',
        description: 'Update team on project progress',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: '[Project Name] - Progress Report',
            message: '''Dear Team,

I am writing to provide a comprehensive update on the status of [Project Name].

Completed Tasks:
• [Task 1]
• [Task 2]

Current Progress:
• [Task 3] - [percentage]% complete
• [Task 4] - In progress

Outstanding Issues:
• [Any blockers or concerns]

Upcoming Milestones:
• [Next milestone] - [Date]
• [Deliverable] - [Date]

Please do not hesitate to reach out if you have any questions or require additional clarification.

Best regards,
[Your Name]''',
          ),
          polite: TemplateVersion(
            subject: '[Project Name] - Weekly Update',
            message: '''Hi Team,

Here's a quick update on [Project Name]:

✅ Completed:
• [Task 1]
• [Task 2]

🔄 In Progress:
• [Task 3]
• [Task 4]

⚠️ Blockers:
• [Any issues or concerns]

Next Steps:
• [Upcoming tasks]

Let me know if you have any questions!

Best,
[Your Name]''',
          ),
          short: TemplateVersion(
            subject: '[Project] Update',
            message: '''Team,

Quick update:
✅ Done: [Task 1], [Task 2]
🔄 WIP: [Task 3]
⚠️ Blocked: [Issue]
Next: [Task 4]

Questions? Let me know.

[Your Name]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'workplace_2',
        title: 'Request for Feedback',
        description: 'Ask for feedback on work or project',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Feedback Request - [Project/Work]',
            message: '''Dear [Name],

I hope this message finds you well. I have recently completed [work/project] and would greatly value your professional feedback and insights.

Specifically, I would appreciate your thoughts on:
• [Aspect 1]
• [Aspect 2]
• [Aspect 3]

Would it be possible for you to review this by [date]? I am happy to provide any additional context or documentation you may require.

Thank you in advance for your time and expertise.

Best regards,
[Your Name]''',
          ),
          polite: TemplateVersion(
            subject: 'Feedback Request - [Project/Work]',
            message: '''Hi [Name],

I hope you're doing well. I've completed [work/project] and would greatly appreciate your feedback.

Specifically, I'd love your thoughts on:
• [Aspect 1]
• [Aspect 2]

Could you review this by [date]? Let me know if you need any additional context.

Thanks in advance!

Best,
[Your Name]''',
          ),
          short: TemplateVersion(
            subject: 'Quick feedback needed',
            message: '''Hi [Name],

Finished [project]. Can you review and share feedback by [date]?

Specifically looking for input on [aspect].

Thanks,
[Your Name]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'workplace_3',
        title: 'Out of Office Notification',
        description: 'Professional OOO message for email',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Out of Office - [Your Name]',
            message: '''Thank you for your email.

I am currently out of the office from [start date] to [end date] with limited access to email. I will respond to your message as soon as possible upon my return on [return date].

For urgent matters, please contact:
[Colleague Name]
[Email Address]
[Phone Number]

Thank you for your patience and understanding.

Best regards,
[Your Name]''',
          ),
          polite: TemplateVersion(
            subject: 'Out of Office - [Your Name]',
            message: '''Thank you for your email. I am currently out of the office from [start date] to [end date] with limited access to email.

If you need immediate assistance, please contact [colleague name] at [email address].

I will respond to your message as soon as possible upon my return.

Best regards,
[Your Name]''',
          ),
          short: TemplateVersion(
            subject: 'OOO: [Your Name]',
            message: '''Out of office [start date] - [end date].

For urgent matters: [colleague name] at [email]

Back [return date].

[Your Name]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'workplace_4',
        title: 'Team Collaboration Request',
        description: 'Request collaboration from colleagues',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Collaboration Opportunity - [Project/Initiative]',
            message: '''Dear [Name],

I hope this message finds you well. I am currently leading [project/initiative] and believe that your expertise in [their skill/area] would be invaluable to the success of this endeavor.

Project Overview:
• [Brief description]
• [Key objectives]
• [Timeline]

Estimated Time Commitment: [hours/week for duration]

Would you be interested in collaborating on this project? I would be happy to discuss this opportunity further at your convenience.

Thank you for considering this request.

Best regards,
[Your Name]''',
          ),
          polite: TemplateVersion(
            subject: 'Collaboration Opportunity - [Project/Initiative]',
            message: '''Hi [Name],

I hope this message finds you well. I'm currently working on [project/initiative] and believe your expertise in [their skill/area] would be invaluable.

Would you be interested in collaborating on this? I estimate it would require approximately [time commitment].

Let me know if you'd like to discuss this further!

Best,
[Your Name]''',
          ),
          short: TemplateVersion(
            subject: 'Collaboration on [Project]?',
            message: '''Hi [Name],

Working on [project] - could use your expertise in [skill].

About [time] commitment. Interested?

[Your Name]''',
          ),
        ),
      ),
    ];
  }
}

// ========================================
// STUDENT EMAILS DATA
// ========================================

class StudentEmailsData {
  static List<TemplateItem> getTemplates() {
    return [
      TemplateItem(
        id: 'student_1',
        title: 'Leave Application to Professor',
        description: 'Request leave from college/university',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Leave Application - [Your Name] - [Course/Class]',
            message: '''Dear Professor [Name],

I am writing to formally request leave from [start date] to [end date] due to [reason - keep brief and appropriate].

I understand that this absence coincides with [mention if during important classes/exams], and I wish to assure you of my commitment to my academic responsibilities. I will ensure to:
• Complete all pending assignments prior to my departure
• Coordinate with classmates to obtain notes and materials from missed sessions
• Submit any required work by the specified deadlines

I would be grateful if you could approve this leave application at your earliest convenience.

Thank you for your understanding and consideration.

Respectfully,
[Your Name]
[Student ID]
[Course/Year]''',
          ),
          polite: TemplateVersion(
            subject: 'Leave Application - [Your Name]',
            message: '''Dear Professor [Name],

I am writing to request leave from [start date] to [end date] due to [reason].

I understand this is during [mention if important], and I will ensure to:
• Catch up on all missed material
• Complete assignments on time
• Coordinate with classmates for notes

I would be grateful if you could approve this request.

Thank you for your understanding.

Respectfully,
[Your Name]
[Student ID]''',
          ),
          short: TemplateVersion(
            subject: 'Leave Request',
            message: '''Dear Professor [Name],

Requesting leave [start date] to [end date] due to [reason].

Will catch up on all work.

Thanks,
[Your Name]
[Student ID]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'student_2',
        title: 'Medical Leave Request',
        description: "Request medical leave with doctor's note",
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Medical Leave Request - [Your Name] - [Student ID]',
            message: '''Dear Professor [Name],

I am writing to formally inform you that I require medical leave from [date] to [date] due to [brief medical reason - if comfortable sharing].

I have attached the medical certificate from my attending physician for your reference and records.

During my absence, I will make every effort to:
• Complete all pending assignments remotely, if possible
• Coordinate with classmates to obtain notes and course materials
• Submit any required work by the specified deadlines

I will keep you informed of my recovery progress and expected return date.

Thank you for your understanding and consideration during this time.

Respectfully,
[Your Name]
[Student ID]
[Contact Information]''',
          ),
          polite: TemplateVersion(
            subject: 'Medical Leave Request - [Your Name]',
            message: '''Dear Professor [Name],

I am writing to inform you that I need to take medical leave from [date] to [date] due to [brief medical reason].

I have attached the medical certificate from my doctor for your reference.

I will make arrangements to:
• Complete all pending assignments
• Catch up on missed lectures
• Submit any required work by [date]

Thank you for your consideration and understanding.

Respectfully,
[Your Name]
[Student ID]
[Contact Information]''',
          ),
          short: TemplateVersion(
            subject: 'Medical Leave - [Your Name]',
            message: '''Dear Professor [Name],

Medical leave needed [date] to [date]. Doctor's note attached.

Will catch up on all work.

Thanks,
[Your Name]
[Student ID]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'student_3',
        title: 'Attendance Shortage Explanation',
        description: 'Explain attendance shortage to authorities',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Explanation for Attendance Shortage - [Your Name] - [Student ID]',
            message: '''Dear [Dean/Professor/Authority Name],

I am writing to address my current attendance shortage in [Course Name/Semester]. I currently have [X]% attendance, which falls below the required [Y]% threshold, due to [brief explanation of circumstances].

The circumstances leading to this situation were [detailed but concise explanation - illness/family emergency/other valid reason]. I understand the critical importance of regular class attendance and sincerely apologize for falling short of the requirement.

Moving forward, I am committed to:
• Achieving 100% attendance for all remaining classes
• Completing all coursework and assignments on schedule
• Making up for missed classes through additional study sessions
• Meeting with professors to clarify any missed material

I respectfully request your consideration of my situation and would be grateful for any guidance on how I can remediate this matter.

Thank you for your time and understanding.

Respectfully,
[Your Name]
[Student ID]
[Course/Year]
[Contact Information]''',
          ),
          polite: TemplateVersion(
            subject: 'Attendance Shortage Explanation - [Your Name]',
            message: '''Dear [Dean/Professor],

I am writing to address my attendance shortage in [Course Name]. I currently have [X]% attendance due to [brief explanation of circumstances].

I understand the importance of regular attendance and sincerely apologize for falling short. The circumstances were [brief explanation - illness/family emergency/other valid reason].

I am committed to:
• Improving my attendance immediately
• Completing all coursework and assignments
• Making up for missed classes through self-study

I request your consideration of my situation.

Thank you for your understanding.

Respectfully,
[Your Name]
[Student ID]''',
          ),
          short: TemplateVersion(
            subject: 'Attendance Shortage - [Your Name]',
            message: '''Dear [Authority],

My attendance is [X]% due to [reason]. Apologize for the shortage.

Will ensure 100% attendance moving forward and catch up on all work.

Thanks,
[Your Name]
[Student ID]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'student_4',
        title: 'Research Internship Request',
        description: 'Request research internship opportunity',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Research Internship Inquiry - [Your Name]',
            message: '''Dear Professor [Name],

I hope this email finds you well. I am [Your Name], a [year] year student pursuing [Program] at [University]. I am writing to express my strong interest in pursuing a research internship under your esteemed guidance.

I have been following your research work with great interest, particularly your recent publications on [specific research area/paper]. My academic background includes:
• [Relevant coursework]
• [Relevant skills/experience]
• [Academic achievements]

I am particularly interested in contributing to research in [specific area] and believe that working with you would provide invaluable learning opportunities.

I have attached my resume and academic transcript for your review. I would be honored to discuss potential opportunities for a [summer/semester/duration] internship at your convenience.

Thank you for considering my request. I look forward to the possibility of contributing to your research.

Respectfully,
[Your Name]
[Student ID]
[Contact Information]''',
          ),
          polite: TemplateVersion(
            subject: 'Research Internship Inquiry - [Your Name]',
            message: '''Dear Professor [Name],

I am [Your Name], a [year] year student in [Program] at [University]. I am writing to express my interest in pursuing a research internship under your guidance.

I am particularly interested in your work on [specific research area]. My background includes [relevant coursework/skills/experience].

I would be honored to contribute to your research and would love to discuss potential opportunities for a [summer/semester] internship.

Would you be available for a brief meeting to discuss this further?

Thank you for considering my request.

Respectfully,
[Your Name]
[Student ID]
[Contact Information]''',
          ),
          short: TemplateVersion(
            subject: 'Research Internship Interest',
            message: '''Dear Professor [Name],

I'm a [year] year [Program] student interested in a research internship in [area].

Background: [brief relevant experience]

Can we discuss opportunities?

Thanks,
[Your Name]
[Student ID]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'student_5',
        title: 'Fellowship Program Inquiry',
        description: 'Inquire about fellowship or scholarship',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Inquiry Regarding [Fellowship/Scholarship Program Name]',
            message: '''Dear [Coordinator/Committee],

I hope this email finds you well. I am writing to inquire about the [Fellowship/Scholarship Program Name] for the [academic year/semester].

I am currently a [year] year student pursuing a [degree] in [field of study] at [University]. My academic interests and career goals align strongly with the program's focus on [program focus area].

I would be grateful if you could provide information regarding:
• Application requirements and necessary documentation
• Application deadlines and selection timeline
• Selection criteria and evaluation process
• Program duration, benefits, and expectations

I have attached my curriculum vitae for your reference and would appreciate any guidance you can provide regarding the application process.

Thank you for your time and assistance. I look forward to learning more about this opportunity.

Respectfully,
[Your Name]
[Student ID]
[Contact Information]''',
          ),
          polite: TemplateVersion(
            subject: 'Fellowship Program Inquiry - [Program Name]',
            message: '''Dear [Coordinator/Committee],

I am writing to inquire about the [Fellowship/Scholarship Program Name] for [academic year/semester].

I am currently a [year] year student pursuing [degree] in [field] at [University]. My academic interests align with the program's focus on [area].

Could you please provide information about:
• Application requirements and deadlines
• Selection criteria
• Program benefits

I have attached my CV and would appreciate any guidance.

Thank you for your assistance.

Respectfully,
[Your Name]
[Student ID]''',
          ),
          short: TemplateVersion(
            subject: 'Fellowship Info Request',
            message: '''Dear [Coordinator],

Interested in [Fellowship Program] for [year].

Currently [year] year [degree] student in [field].

Application info and deadlines?

Thanks,
[Your Name]
[Student ID]''',
          ),
        ),
      ),
      
      TemplateItem(
        id: 'student_6',
        title: 'Hackathon Participation Request',
        description: 'Request permission to participate in hackathon',
        versions: TemplateVersions(
          formal: TemplateVersion(
            subject: 'Request for Permission - [Hackathon Name] Participation',
            message: '''Dear [Professor/Dean],

I hope this email finds you well. I am writing to request permission to participate in the [Hackathon Name], scheduled to take place from [dates] at [location/virtual].

This hackathon focuses on [theme/technology], which directly relates to my coursework in [course names] and aligns with my academic and career interests in [field].

Participating in this event will enable me to:
• Apply theoretical knowledge from coursework to real-world problems
• Develop practical skills in [relevant technologies/skills]
• Collaborate with peers and industry professionals
• Network with potential mentors and employers

I assure you that I will:
• Fulfill all my academic commitments and submit pending work before the event
• Make arrangements to cover any classes I might miss
• Share learnings from the hackathon with my peers

I would be grateful for your approval to participate in this valuable learning opportunity.

Thank you for your consideration.

Respectfully,
[Your Name]
[Student ID]
[Course/Year]''',
          ),
          polite: TemplateVersion(
            subject: 'Hackathon Participation Request - [Your Name]',
            message: '''Dear [Professor],

I am writing to request permission to participate in the [Hackathon Name] scheduled from [dates].

This hackathon focuses on [theme/technology] which relates to my coursework in [courses]. Participating will help me:
• Apply classroom knowledge to real problems
• Develop teamwork and technical skills
• Network with industry professionals

I will ensure all academic commitments are fulfilled and submit pending work before the event.

I would be grateful for your approval.

Thank you for considering my request.

Respectfully,
[Your Name]
[Student ID]''',
          ),
          short: TemplateVersion(
            subject: 'Hackathon Permission Request',
            message: '''Dear [Professor],

Requesting permission for [Hackathon Name] on [dates].

Relates to [course/field]. Will complete all pending work beforehand.

Thanks,
[Your Name]
[Student ID]''',
          ),
        ),
      ),
    ];
  }
}