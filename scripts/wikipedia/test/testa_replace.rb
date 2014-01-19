html = <<html
Stack Overflow is a website, the flagship site of the Stack Exchange Network,[2][3] created in 2008 by Jeff Atwood and Joel Spolsky,[4][5] as a more open alternative to earlier Q&A sites such as Experts Exchange. The name for the website was chosen by voting in April 2008 by readers of Coding Horror, Atwood's popular programming blog.[6]
It features questions and answers on a wide range of topics in computer programming.[7][8][9] The website serves as a platform for users to ask and answer questions, and, through membership and active participation, to vote questions and answers up or down and edit questions and answers in a fashion similar to a wiki or digg.[10] Users of Stack Overflow can earn reputation points and "badges"; for example, a person is awarded 10 reputation points for receiving an "up" vote on an answer given to a question, and can receive badges for their valued contributions,[11] which represents a kind of gamification of the traditional Q&A site or forum. All user-generated content is licensed under a Creative Commons Attribute-ShareAlike license.[12]
As of August 2013[update], Stack Overflow has over 1,900,000 registered users and more than 5,500,000 questions.[13][14] Based on the type of tags assigned to questions, the top eight most discussed topics on the site are: C#, Java, PHP, JavaScript, Android, jQuery, C++ and Python.[15]
History[edit]
The website was created by Jeff Atwood and Joel Spolsky in 2008.[4]  On 31 July 2008, Jeff Atwood sent out invitations encouraging his subscribers to take part in the private beta of the new website, limiting its use to those willing to test out the new software.  On 15 September 2008 it was announced the public beta version was in session and that the general public was now able to use it to seek assistance on programming related issues. The design of the Stack Overflow logo was decided by a voting process.[16]
On 3 May 2010 it was announced that Stack Overflow had raised $6 million in venture capital from a group of investors led by Union Square Ventures.[17][18]
Technology[edit]
Stack Overflow is written in ASP.NET 4 [19] using the ASP.NET MVC (Model-View-Controller) framework, and SQL Server 2008 for the database.[20] Unregistered users have access to most of the site's functionality, while users that sign in (for example, by using the OpenID service) can gain access to more functionality, such as establishing a profile and being able to earn reputation to allow functionality like re-tagging questions or voting to close a question.

Sister sites[edit]
Main article: Stack Exchange Network
Server Fault[edit]
In April 2009, the owners of Stack Overflow began a private beta for Server Fault, a sister site. The site deals exclusively with questions and answers related to the field of system administration.

Super User[edit]
Super User, a sister site dedicated to questions from all computer "power users",[21] rather than just programmers or system administrators, entered a "semi-private beta" in July 2009[22] and was launched publicly on 18 August 2009.[23]
Meta Stack Overflow[edit]
Meta Stack Overflow became the site for questions about the sister sites themselves and various other meta-level discussions.[24] Most support, feature-request and bug report entries were moved from UserVoice-hosted stackoverflow.uservoice.com in July 2009.[25]
Area 51[edit]
Area 51 is a "New Site Staging Zone".[26] This is intended for anybody to create their own Q&A site on any topic, using similar software.

Careers[edit]
Stack Overflow offers a careers site, Stack Overflow Careers 2.0.[27] The careers site is targeted toward  companies that are seeking top quality programmers.  Careers allows Stack Overflow members to link their Stack Overflow profile with their online resume (created on the site, or imported via LinkedIn), allowing employers to browse member contribution history to Stack Overflow.  Initially job-seekers had to pay a fee in order to file their resume, i.e. the resume will be searchable by employers, but now it is free for job-seekers.

Stack Apps[edit]
The Stack Overflow team has recently begun the creation of an API for accessing the data contained on the other sites. Discussion on Stack Apps centers around the API, although users are encouraged to list apps and libraries developed for the API.

User reputation[edit]
Over the course of a user's experience on Stack Overflow they can earn Reputation.  Reputation can be earned from asking questions, providing answers, suggesting edits (capped to a maximum amount of 2000 Rep).  The more reputation a user obtains the more trusted they are on the site, and the more privileges they are given. 

If the reputation owner needs an answer to difficult question, he can pay by the owned reputation points to other users, as reward (called a "bounty" on the site). The owners loses the earned rights as the reputation decreases. The reputation is also lost if other users "vote down" one's question or answer, but the voter himself is also penalized (though less so). This makes the frequent voting down less attractive.

User suspension[edit]
In April, 2009 Stack Exchange implemented a policy of "timed suspension",[28] in order to curtail users who either show "No effort to learn (the community rules) and improve over time" or engage in "disruptive behavior" and become a nuisance. The suspension is accompanied by temporarily setting the user's reputation score at '1' and a notation on the user's profile page indicating the suspension and remaining duration.

See also[edit]
 Askbot (free engine)

 Hashcode.ru (Russian community)

 OSQA

 Shapado

 Stack Exchange Network
html


puts html.gsub(/\[.*?\]/, '').gsub(/\n$/, '')
