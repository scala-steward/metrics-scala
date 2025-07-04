[![Scaladocs](https://www.javadoc.io/badge/nl.grons/metrics4-scala_2.12.svg?color=brightgreen&label=Scaladocs)](https://www.javadoc.io/page/nl.grons/metrics4-scala_2.12/latest/nl/grons/metrics4/scala/DefaultInstrumented.html)
![build status](https://github.com/erikvanoosten/metrics-scala/actions/workflows/ci.yml/badge.svg)
[![Scala Steward badge](https://img.shields.io/badge/Scala_Steward-helping-blue.svg?style=flat&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAQCAMAAAARSr4IAAAAVFBMVEUAAACHjojlOy5NWlrKzcYRKjGFjIbp293YycuLa3pYY2LSqql4f3pCUFTgSjNodYRmcXUsPD/NTTbjRS+2jomhgnzNc223cGvZS0HaSD0XLjbaSjElhIr+AAAAAXRSTlMAQObYZgAAAHlJREFUCNdNyosOwyAIhWHAQS1Vt7a77/3fcxxdmv0xwmckutAR1nkm4ggbyEcg/wWmlGLDAA3oL50xi6fk5ffZ3E2E3QfZDCcCN2YtbEWZt+Drc6u6rlqv7Uk0LdKqqr5rk2UCRXOk0vmQKGfc94nOJyQjouF9H/wCc9gECEYfONoAAAAASUVORK5CYII=)](https://scala-steward.org)

Metrics-Scala
=============

📈 *Capturing JVM- and application-level metrics. So you know what's going on.*

This is the Scala API for [Dropwizard's Metrics](https://github.com/dropwizard/metrics) library.

Our goal is to make it magically effortless to create Dropwizard metrics in Scala programs.

We strive for long term stability, correctness, an easy-to-use API and full documentation (in that order).

### Status of this project

Even though the main author is not using this library anymore (for many years now), and no new features
have been added for a long time, this project is still maintained and remains open for new contributions.

### Contents

* Usage
* [Manual](/docs/Manual.md)
* [Manual (version 3.x)](https://github.com/erikvanoosten/metrics-scala/blob/version-3.x-maintenance/docs/Manual.md)
* [Manual (version 2.x)](/docs/Manual_2x.md)
* Features
* Available artifacts
* Download
* Support
* Legal stuff

### Usage

Metrics-scala provides a way to create _metrics_ and _health checks_ in Scala. Creating
metrics and health checks is done by extending
[DefaultInstrumented](/metrics-scala/src/main/scala/nl/grons/metrics4/scala/DefaultInstrumented.scala) and using the
`metrics` and `healthCheck` builders:

```scala
class Example(db: Database) extends nl.grons.metrics4.scala.DefaultInstrumented {
  // Define a health check
  healthCheck("alive") { workerThreadIsActive() }

  // Define a timer metric
  private[this] val loading = metrics.timer("loading")

  // Use timer metric
  def loadStuff(): Seq[Row] = loading.time {
    db.fetchRows()
  }
}
```

For more detailed information see the [manual](/docs/Manual.md). For more information on Dropwizard-metrics 4.x, please
see the [documentation](http://metrics.dropwizard.io/4.0.0/).

See also the [change log](CHANGELOG.md) for improvements and API changes.

### Features

* Creation of all Dropwizard metrics types.
* Creation of Dropwizard health checks.
* Almost invisible syntax for using timers (see example above).
* Scala specific methods on metrics (e.g. `+=` on counters).
* Derives proper metrics names for Scala objects and closures.
* Push gauges with timeout.
* Pekko/Akka actor support.
* Future support.
* Testing support.
* [Hdrhistogram](http://hdrhistogram.org/) support.

## Available artifacts (abbreviated)

The following artifacts are available:

* *metrics4-scala*: adds a nice Scala API to Dropwizard Metrics
* *metrics4-pekko*: support for measuring Pekko actors
* *metrics4-akka_a{25,26}*: support for measuring Akka actors
* *metrics4-hdr*: adds support for [HdrHistogram](http://www.hdrhistogram.org/) to increase the accuracy of histograms 

The table shows the available artifacts of metrics-scala. For the full list, including those targeting older Scala and
Akka versions see [all available versions](/docs/AvailableVersions.md).

<table border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr>
      <td valign="top" rowspan="2">Artifact name</td>
      <td valign="top" rowspan="1" colspan="4">Scala version</td>
      <td valign="top" rowspan="1" colspan="2">Akka version</td>
      <td valign="top" rowspan="2">Build against</td>
    </tr>
    <tr>
      <td valign="top">3.3</td>
      <td valign="top">2.13</td>
      <td valign="top">2.12</td>
      <td valign="top">2.11</td>
      <td valign="top">2.6</td>
      <td valign="top">2.5</td>
    </tr>
    <tr>
      <td valign="top">metrics4-scala</td>
      <td valign="top">✓</td>
      <td valign="top">✓</td>
      <td valign="top">✓</td>
      <td valign="top">✓</td>
      <td valign="top"></td>
      <td valign="top"></td>
      <td valign="top">Dropwizard-metrics 4.2.32</td>
    </tr>
    <tr>
      <td valign="top">metrics4-pekko</td>
      <td valign="top">✓</td>
      <td valign="top">✓</td>
      <td valign="top">✓</td>
      <td valign="top"></td>
      <td valign="top"></td>
      <td valign="top"></td>
      <td valign="top">Pekko 1.1.4</td>
    </tr>
    <tr>
      <td valign="top">metrics4-akka_a26</td>
      <td valign="top">✓</td>
      <td valign="top">✓</td>
      <td valign="top">✓</td>
      <td valign="top"></td>
      <td valign="top">✓</td>
      <td valign="top"></td>
      <td valign="top">Akka 2.6.20</td>
    </tr>
    <tr>
      <td valign="top">metrics4-akka_a25</td>
      <td valign="top"></td>
      <td valign="top">✓</td>
      <td valign="top">✓</td>
      <td valign="top"></td>
      <td valign="top">✓</td>
      <td valign="top">✓</td>
      <td valign="top">Akka 2.5.31</td>
    </tr>
    <tr>
      <td valign="top">metrics4-scala-hdr</td>
      <td valign="top">✓</td>
      <td valign="top">✓</td>
      <td valign="top">✓</td>
      <td valign="top">✓</td>
      <td valign="top"></td>
      <td valign="top"></td>
      <td valign="top">Hdr 1.1.3/2.2.2 (**)</td>
    </tr>
  </tbody>
</table>

Most artifacts are build for Java 11, only builds for scala 2.11 and scala 2.12 still target Java 8.

(**) The first number is the version of `"org.mpierce.metrics.reservoir" % "hdrhistogram-metrics-reservoir"`,
the second the version of `"org.hdrhistogram" % "HdrHistogram"`.
See also [hdrhistogram manual page](/docs/Hdrhistogram.md).

Akka versions higher than 2.6 will not be supported. However, given Akka's past of excellent binary compatibility, the version for 2.6 probably just works fine for later versions as well.

## Migrating from 3.x to 4.x

Migrating from 3.x to 4.x is a matter of replacing the package from `nl.grons.metrics` to `nl.grons.metrics4`,
and recompiling the code.

Metrics-scala 3.x and metrics-scala 4.x can mostly be used at the same time on top of either
Dropwizard Metrics 3.x or 4.x (excluding Dropwizard metrics 4.0.0). Unfortunately HDR support
is not compatible over major Dropwizard versions.

## Download 4.x

<a href="CHANGELOG.md">Release notes for 4.3.5.</a>

SBT:
```
libraryDependencies ++= Seq(
  "nl.grons" %% "metrics4-scala" % "4.3.5",
  "nl.grons" %% "metrics4-pekko" % "4.3.5",
  "nl.grons" %% "metrics4-akka_a26" % "4.3.5",
  "nl.grons" %% "metrics4-scala-hdr" % "4.3.5"
)
```

Maven:
```
<properties>
    <scala.version>3.1.0</scala.version>
    <scala.compat.version>3</scala.compat.version>
    <metrics.scala.version>4.3.5</metrics.scala.version>
</properties>
<dependency>
    <groupId>nl.grons</groupId>
    <artifactId>metrics4-scala_${scala.compat.version}</artifactId>
    <version>${metrics.scala.version}</version>
</dependency>
<dependency>
    <groupId>nl.grons</groupId>
    <artifactId>metrics4-pekko_${scala.compat.version}</artifactId>
    <version>${metrics.scala.version}</version>
</dependency>
<dependency>
    <groupId>nl.grons</groupId>
    <artifactId>metrics4-akka_a26_${scala.compat.version}</artifactId>
    <version>${metrics.scala.version}</version>
</dependency>
<dependency>
    <groupId>nl.grons</groupId>
    <artifactId>metrics4-scala-hdr_${scala.compat.version}</artifactId>
    <version>${metrics.scala.version}</version>
</dependency>
```

## Download 3.x

The 3.x versions are no longer maintained. However, all information is still available in the
[README in the v3 maintenance branch](https://github.com/erikvanoosten/metrics-scala/tree/version-3.x-maintenance).

## Download 2.x

The 2.x versions are no longer maintained. Nevertheless, relevant information can be found in the
[README in the v2 maintenance branch](https://github.com/erikvanoosten/metrics-scala/tree/metrics-scala-v2.1.5-maintenance).

## Dropwizard 5.x

Dropwizard metrics 5.x development has been paused. Metrics-scala support for it can be
found in the `metrics5-dev` branch. Since the master branch has since evolved considerably,
the 5.x branch is not in a releasable state anymore.

## Support

If you find a bug, please open an [issue](https://github.com/erikvanoosten/metrics-scala/issues), better yet: send a
pull request. For questions, please sent an email to the
[metrics mailing list](http://groups.google.com/group/metrics-user).

### Legal stuff

Initially this project started out as a line for line copy of the Metrics-scala module, released for multiple
scala versions. Metrics dropped the scala module in version 3.0.0 and this project continued separately
with the help of [@scullxbones](https://github.com/scullxbones) and many other contributors.

Copyright (c) 2010-2012 Coda Hale, Yammer.com (before 3.0.0)

Copyright (c) 2013-2025 Erik van Oosten (3.0.0 and later)

Published under Apache Software License 2.0, see [LICENSE](LICENSE)
