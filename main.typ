#import "template.typ": vantage, styled-link, term, icon
#let configuration = yaml("configuration.yaml")

#let job(position, company, companyLink, dates, content, progression: ()) = {
  let link = styled-link(companyLink, text(weight: "bold", company))
  let progression = text(size: 9pt)[_#progression.join(" \u{2192} ")_]
  [
   === #position #h(1fr) #{text(weight: "light", size: 9pt, [#icon("calendar", boxed: false, shift: 2.5pt) #dates])}\
   #link #h(1fr) #progression\
  // #link #h(1fr)  #icon("calendar") #dates

  #content
  ]
}


#vantage(
  name: configuration.contacts.name,
  links: (
    (icon: "envelope", link: "mailto:"+ configuration.contacts.email),
    (icon: "globe", link: configuration.contacts.website.url, display: configuration.contacts.website.displayText),
    (icon: "github", link: configuration.contacts.github.url, display: configuration.contacts.github.displayText),
    (icon: "linkedin-in", link: configuration.contacts.linkedin.url, display: configuration.contacts.linkedin.displayText),
    (icon: "location-pin", link: "", display: configuration.contacts.address)
  ),
  tagline: [
    Backend Software Engineer with experience in building and scaling distributed systems, and in deploying
    and securing platform infrastructure. Domain experience in financial services, cybersecurity, and crypto.
    ],
    topSide:[
    ],
    bottomSide: [
    == Projects

    #for project in configuration.projects [
      === #link(project.link)[#project.name]

#raw(project.technologies)

      #project.description
    ],
    ],
  [

    == Experience

    #job(
        [Senior Backend Engineer],
        [Monzo Bank],
        "https://monzo.com",
        [11/'23 --- today],
        progression: ("Engineer III (Security)",  "Senior Engineer (Payments)"),
        )[
      - Worked both on Payments as building products for retail customers, and in Security in an SRE-heavy role with wide scope.
      - Owned secret-management, public-key infrastructure, and preventive and detective security controls (eg. around intrusion, exfiltration, DDoS, etc).
      - Maintained critical zero-downtime infrastructure such as Kubernetes, cloud networking, and sensitive key material management.
    ]

    #job(
        [Senior Backend Engineer],
        [Blockchain.com],
        "https://blockchain.com",
        [06/'20 --- 11/'23],
        progression: ("part-time",  "Engineer", "Senior Engineer"),
        )[
      - Owned several JVM (mainly Kotlin) real-time financial services critical for business operation and central to user experience and transaction auditing; like ledger-keeping/accounting and indicative pricing.
      - Designed and scaled up stateful distributed systems with an event-driven architecture.
      - Reviewed systems' architecture designs and software development methods to cultivate sustainable engineering practices and achieve operational excellence within the wider company.
    ]

    #job(
        [Software Engineer Intern],
        [Emit],
        "aa",
        [06/'19 --- 10/'19],
        )[
      - Four-person startup with its own smartwatch aiming to provide time-analytics to institutional customers.
      - Provided real-time insights on customer data by developing data processing pipelines and libraries in Kotlin and Python on top of serverless tech on AWS (Lambda, DynamoDB, ElasticSearch).
    ]

  ],
  [

    == Technologies

    *Proficient in* Go, Kotlin, Nix + NixOS, Gradle

    *Experience with* Java, Python, C, Haskell, Typescript, Elixir

    Nomad, Kubernetes, Consul, Vault, Terraform

    AWS (EKS, EC2, S3, WAF + Shield, DynamoDB, IAM)

    gRPC + protobufs, Kafka, Akka, PostgreSQL, Redis, Cassandra, APM, Docker, React

    == Education

        #let edu(name, diploma, nameUrl, honours) = {
          let link = styled-link(nameUrl, text(weight: "bold", name))
          [
            === #link\
            #diploma \
            #emph(honours)
          ]
        }

        #edu(
            "Imperial College London",
            "Computer Science Integrated MEng",
            "https://www.imperial.ac.uk/",
            "First Class Honours",
        )

        #edu(
            "French Lycée of Madrid",
            "S-SI Engineering Sciences Baccalaureate",
            "https://www.lfmadrid.net/es/",
            "Highest Honours",
        )

    == Actual Languages

    - English - bilingual
    - Spanish - native
    - French - bilingual
    - Portuguese - advanced level

  ]
)
