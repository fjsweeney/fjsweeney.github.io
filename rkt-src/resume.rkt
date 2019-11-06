#lang racket


(require "common.rkt")

(define (project name place start end desc)
  `(div (@ (class "resume-item"))
        (h4 (@ (class "project-name")) ,name)
        (h5 (@ (class "project-location")) ,place)
        (h6 (@ (class "project-timeframe")) ,(string-append start " - " end))
        (p (@ (class "project-desc")) ,desc)
        ))
        
(define (wrapper id . projects)
  `(div (@ (class "resume-section")
           (id ,id))
	(h3 (@ (class "resume-accordion accordion")) ,id)
        (div (@ (class "resume-panel accordion-panel")) ,@projects)
  ))

(define wwu "Western Washington University")
(define projects
  (wrapper "Projects"
   (project "Next-Generation Effective-Affective Technology Research" wwu "Sept 2018" "Present"
            "Used SQL, Python, and machine learning on 30 million datapoints to predict stress levels.")
   (project "Machine Learning Predictions" wwu "Jan 2019" "March 2019"
            "Ran Python with many different models to optimally solve different tasks.")
   (project "Versatile Order Form" "Premier Agendas" "Jan 2019" "Jan 2019"
            "Created pdfs with javascript to verify and implement business logic.")
   (project "Blitz Operating System" wwu "Dec 2018" "Dec 2018"
            "Added multithreading to an operating system running on emulated hardware.")
   (project "Chatroom Program" wwu "June 2018" "June 2018"
            "Wrote a client-server (using TCP) program in C as a pair-programming project.")
   (project "Multivariable Rootfinding Algorithm" wwu "June 2018" "June 2018"
            "A MATLAB assignment, which optimized the rootfinding through approximation (several methods).")
   (project "Microshell" wwu "Jan 2018" "March 2018"
            "Wrote a shell environment for Linux, purely in C.")
   (project "Stock Data Analysis" wwu "February 2018" "March 2018"
            "Simulated trading algorithm performance on 23.4 million points, using Java to fetch SQL data.")
   (project "Multithreaded Jacobi Iteration" wwu "March 2018" "March 2018"
            "Ported a single-threaded heat distribution simulation to multiple threads.")
   (project "City Simulation" wwu "Jan 2018" "March 2018"
            "Extended existing software using strict object-oriented best practices and patterns.")
   (project "Poetry Generator" "WWU Hackathon" "Feb 2018" "Feb 2018"
            "24-hour team project, written in Java.")
   (project "Nondefinite Finite Automata Parser" wwu "Dec 2017" "Dec 2017"
            "Crafted a backtracking algorithm in Racket to parse NFA's.")
   (project "Vignere Cipher Decoder" wwu "June 2017" "June 2017"
            "Created a code-breaker in Java for Vignere ciphers using statistical analysis of the encrypted text.")
   (project "3D Ray Tracing Graphics" wwu "June 2017" "June 2017"
            "Made a graphics engine and optimized it using quad-trees in Java.")
   (project "Customer Lookup" "Premier Agendas" "Oct 2017" "Oct 2017"
            "Updated an order form to lookup customer information given the customer's index.")
  ))

(define education
  (wrapper "Education"
   (project "Master's in Computer Science" wwu "Oct 2019" "June 2020"
            "In progress")
   (project "Honor's Bachelor's in Computer Science" wwu "June 2019" "June 2019"
            "GPA: 3.90")
   (project "Associates of Arts and Sciences" "Whatcom Community College" "December 2013" "December 2016"
            "Graduated with Honors.\nTransfer Degreee while working 40+ hours a week.")
  ))

(define experience
  (wrapper "Experience"
   (project "Email Campaign Marketing Editor" "Visitor Guide Publications" "Nov 2018" "Present"
            "Porting PDF flyers to email-safe/computer readable HTML.")
   (project "Web Support" "School Specialty Inc." "April 2015" "June 2019"
            "Script creation and testing, reference document creation, spreadsheet normalizing, Oracle DB, auditing, customer service")
   (project "Computer Science Lab Guide" wwu "Jan 2019" "Present"
            "Troubleshooting Java, some C, and assembly. 25 students each quarter.")
   ))

(define resume
  `(main (@ (class "resume"))
         ,contact
	 ;(h2 (@ (class "page-title")) "Resume")
         ,projects
         ,education
         ,experience))

(personal-template "../resume.html"
                   (string-append author " | Resume")
                   `(header (h1 ,author))
                   resume)

