#import "template.typ": vantage, styled-link, term, icon

#let job(position, company, companyLink, dates, content, progression: ()) = {
  let link = styled-link(companyLink, text(weight: "bold", company))
  let progression = text(size: 9pt)[_#progression.join(" \u{2192} ")_]
  [
    === #position #h(1fr) #{
      text(
        weight: "light", size: 9pt, [#icon("calendar", boxed: false, shift: 2.5pt) #dates],
      )
    }\
    #link #h(1fr) #progression\

    #content
  ]
}

#let project(name, link, technologies, description) = {
  [
    === #styled-link(link)[#name]

    #raw(technologies)

    #description
  ]
}

#vantage(
  name: "Nico D'Cotta", links: (
    (icon: "at", link: "mailto:nico@dcotta.com"), (
      icon: "earth-europe", link: "https://nico.dcotta.com", display: "nico.dcotta.com",
    ), (
      icon: "github", link: "https://github/cottand", display: "github/cottand",
    ), (
      icon: "linkedin-in", link: "https://linkedin.com/in/nicodcotta", display: "linkedin/nicodcotta",
    ), (icon: "location-dot", link: "", display: "London, UK"),
  ), tagline: [
    Backend Software Engineer with experience in building and scaling distributed
    systems, as well as in deploying and securing platform infrastructure. Domain
    experience in financial services, cybersecurity, and custodial
    crypto-currencies.
  ], topSide: [
  ], bottomSide: [
    == Projects

    #grid(
      columns: 2, gutter: 1em, project(
        "Self-hosted infrastructure", "https://nico.dcotta.com/projects/selfhosted-homelab", "Nomad, Nix, NixOS, Go", "A HA self-hosted cluster with all the features you can expect from an enterprise-grade platform, including container orchestration, service discovery, a service mesh, a distributed filesystem, etc.",
      ), project(
        "DJStreamr, collaborative streaming service for DJs", "https://djstreamr.com", "AWS (Lambda, DynamoDB, EC2), Kotlin, VueJS", "Music synchronisation protocol implemented as a webapp with an event-driven platform architecture which leverages serverless technology.",
      ), project(
        "Multi-Paxos implementation", "https://github.com/cottand/multi-paxos", "Elixir, Paxos", "Implementation of a variation of the Paxos consensus algorithm (comparable to Raft), as specified in the paper Paxos Made Moderately Complex.",
      ), project(
        "WACC, multiplatform compiler", "https://github.com/cottand/WACC", "Kotlin, JVM bytecode, ARM11 assembly", "Multiplatform compiler for WACC (a toy language) to JVM bytecode and ARM11 64-byte assembly that supports basic constructs like stack-allocated primitives, and heap-allocated arrays and pairs.",
      ),
    )

  ], [

    == Experience

    #job(
      [Senior Backend Engineer], [Monzo Bank], "https://monzo.com", [11/'23 --- today], progression: ("Engineer III (Security)", "Senior Engineer (Payments)"),
    )[
      - Worked both on Payments as building products for retail customers, and in
        Security in an SRE-heavy role with wide scope.
      - Owned secret-management, public-key infrastructure, and preventive and detective
        security controls (eg. around intrusion, exfiltration, DDoS, etc).
      - Maintained critical zero-downtime infrastructure such as Kubernetes, cloud
        networking, and sensitive key material management.
    ]

    #job(
      [Senior Backend Engineer], [Blockchain.com], "https://blockchain.com", [06/'20 --- 11/'23], progression: ("part-time", "Engineer", "Senior Engineer"),
    )[
      - Owned several JVM (mainly Kotlin) real-time financial services critical for
        business operation and central to user experience and transaction auditing; like
        ledger-keeping/accounting and indicative pricing.
      - Designed and scaled up stateful distributed systems with an event-driven
        architecture.
      - Reviewed systems' architecture designs and software development methods to
        cultivate sustainable engineering practices and achieve operational excellence
        within the wider company.
    ]

    #job(
      [Software Engineer Intern], [Emit], "aa", [06/'19 --- 10/'19],
    )[
      - Four-person startup with its own smartwatch aiming to provide time-analytics to
        institutional customers.
      - Provided real-time insights on customer data by developing data processing
        pipelines and libraries in Kotlin and Python on top of serverless tech on AWS
        (Lambda, DynamoDB, ElasticSearch).
    ]

  ], [

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
      "Imperial College London", "Computer Science Integrated MEng", "https://www.imperial.ac.uk/", "First Class Honours",
    )

    #edu(
      "French Lycée of Madrid", "S-SI Engineering Sciences Baccalaureate", "https://www.lfmadrid.net/es/", "Highest Honours",
    )

    == Actual Languages

    #grid(
      columns: 2, gutter: 1em, [- English:], [bilingual], [- Spanish:], [native], [- French:], [bilingual], [- Portuguese:], [advanced level],
      //[- Turkish:], [getting there],
    )

  ],
)
