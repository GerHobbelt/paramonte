

<div align="center">
<a href="https://www.cdslab.org/paramonte" target="_blank">
    <img src="https://github.com/cdslaborg/paramonte/blob/main/img/paramonte.png" alt="ParaMonte: Parallel Monte Carlo and Machine Learning Library" style="width:500px;height:500px;" />
</a>
<br>
<a href="https://github.com/cdslaborg/paramonte/releases" target="_blank"><img src="https://img.shields.io/github/release-date/cdslaborg/paramonte?color=orange&style=flat-square" alt="GitHub Release Date" /></a>
<a href="https://github.com/cdslaborg/paramonte/releases" target="_blank"><img src="https://img.shields.io/github/v/release/cdslaborg/paramonte?color=purple&label=release%20version&style=flat-square" alt="GitHub release (latest by date)" /></a>
<a href="https://pypi.org/project/paramonte/" target="_blank"><img src="https://img.shields.io/pypi/v/paramonte?color=orange&label=pypi%20release&style=flat-square" alt="PyPI - release version" /></a>
<a href="https://github.com/cdslaborg/paramonte/releases" target="_blank"><img src="https://img.shields.io/pypi/status/paramonte?style=flat-square" alt="PyPI - Status" /></a>
<a href="https://www.cdslab.org/paramonte/codecov/fortran/2/serial/" target="_blank"><img src="https://img.shields.io/badge/Fortran%20code%20coverage-serial%20:%2077.0%25-brightgreen?style=flat-square" alt="Fortran code coverage - serial" /></a>
<a href="https://github.com/cdslaborg/paramonte/issues" target="_blank"><img src="https://img.shields.io/github/issues/cdslaborg/paramonte?style=flat-square" alt="GitHub issues" /></a>
<a href="https://github.com/cdslaborg/paramonte/tree/main/src" target="_blank"><img src="https://img.shields.io/badge/available%20in-C%20%2F%20C%2B%2B%20%2F%20Fortran%20%2F%20MATLAB%20%2F%20Python-brightgreen?style=flat-square" alt="supported languages" /></a>
<a href="https://www.openhub.net/p/paramonte" target="_blank"><img src="https://img.shields.io/badge/Open%20Hub-stats?color=brightgreen&label=stats&message=Open%20Hub&style=flat-square" alt="stats - Open Hub" /></a>
<a href="https://github.com/cdslaborg/paramonte/graphs/traffic" target="_blank"><img src="https://img.shields.io/github/downloads/cdslaborg/paramonte/total?color=brightgreen&label=GitHub%20downloads&style=flat-square" alt="GitHub All Releases" /></a>
<a href="https://libraries.io/pypi/paramonte" target="_blank"><img src="https://img.shields.io/pypi/dm/paramonte?color=brightgreen&label=PyPI%20downloads&style=flat-square" alt="PyPI - Downloads" /></a>
<a href="https://pypistats.org/packages/paramonte" target="_blank"><img src="https://img.shields.io/badge/stats-green?style=flat-square&label=PyPI&labelColor=grey&color=brightgreen" alt="PyPI stats" /></a>
<a href="https://www.mathworks.com/matlabcentral/fileexchange/78946-paramonte" target="_blank"><img src="https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg" alt="View ParaMonte on File Exchange" /></a>
<a href="https://github.com/cdslaborg/paramonte/" target="_blank"><img src="https://img.shields.io/github/repo-size/cdslaborg/paramonte?style=flat-square" alt="GitHub repo size" /></a>
<a href="https://github.com/cdslaborg/paramonte/tree/main/src" target="_blank"><img src="https://img.shields.io/github/languages/count/cdslaborg/paramonte?style=flat-square" alt="GitHub language count" /></a>
<a href="https://github.com/cdslaborg/paramonte/graphs/contributors" target="_blank"><img src="https://img.shields.io/github/commit-activity/y/cdslaborg/paramonte?style=flat-square" alt="GitHub commit activity" /></a>
<a href="https://github.com/cdslaborg/paramonte/commits/main" target="_blank"><img src="https://img.shields.io/github/last-commit/cdslaborg/paramonte?color=blue&style=flat-square" alt="GitHub last commit" /></a>
<a href="https://zenodo.org/record/4076479#.X4Stte17ng4" target="_blank"><img src="https://zenodo.org/badge/DOI/10.5281/zenodo.4076479.svg" alt="citations and references" /></a>
<a href="https://www.cdslab.org/paramonte/generic/latest/overview/preface/#how-to-acknowledge-the-use-of-the-paramonte-library-in-your-work" target="_blank"><img src="https://img.shields.io/badge/reference-%20%09arXiv%3A1209.4647-blueviolet?style=flat-square" alt="citations and references" /></a>
<a href="https://ascl.net/2008.016" target="_blank"><img src="https://img.shields.io/badge/ascl-2008.016-blue.svg?colorB=262255" alt="ascl:2008.016" /></a>
<a style="border-width:0" href="https://doi.org/10.21105/joss.02741"><img src="https://joss.theoj.org/papers/10.21105/joss.02741/status.svg?style=flat-square" alt="DOI badge" ></a>
<br><br>
<a href="https://twitter.com/intent/tweet?text=ParaMonte%20-%20Plain%20Powerfull%20Parallel%20Monte%20Carlo%20Library:&url=https%3A%2F%2Fgithub.com%2Fcdslaborg%2Fparamonte" target="_blank"><img src="https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Fgithub.com%2Fcdslaborg%2Fparamonte" alt="Twitter" /></a>
<br><br>
<a href="#paramonte-plain-powerful-parallel-monte-carlo-library">Overview</a> |
<a href="#installation">Installation</a> |
<a href="#dependencies">Dependencies</a> |
<a href="#parallelism">Parallelism</a> |
<a href="#example-usage-instructions">Examples</a> |
<a href="#citing-paramonte">Acknowledgments</a> |
<a href="#license">License</a> |
<a href="#authors-and-contributors">Authors</a>
</div>

ParaMonte: Parallel Monte Carlo and Machine Learning  
====================================================  

ParaMonte is a serial/parallel library of Monte Carlo routines for sampling mathematical density functions of arbitrary dimensions and 
Machine Learning (ML) algorithms for scientific inference, with the design goal of unifying **automation** (of simulations and tasks), 
**user-friendliness** (of algorithms), **accessibility** (from any platform or programming environment), 
**high-performance** (at runtime), and **scalability** (across many parallel processors).  

For more information on the installation, usage, and examples, visit https://www.cdslab.org/paramonte  

ParaMonte Design Goals  
======================  

ParaMonte has been developed while bearing the following design goals in mind:  

-   **Full automation** of Monte Carlo and Machine Learning simulations as much as possible to ensure user-friendliness 
    of the library and minimal time investment requirements for building, running, and post-processing simulation models. 

-   **Interoperability** of the core library with as many programming languages as currently possible, 
    including C, C++, Fortran, MATLAB, and Python, with ongoing efforts to support other popular programming languages.  

-   **High-Performance** meticulously-low-level library implementation to ensure the fastest-possible inferences.  

-   **Parallelizability** of all simulations via shared-memory OpenMP threads and two-sided and one-sided 
    MPI/Coarray distributed communications while requiring zero-parallel-coding efforts by the user.  

-   **Zero-dependence** on external libraries to ensure hassle-free ParaMonte library builds and ParaMonte simulation runs.  

-   **Fully-deterministic reproducibility** and automatically-enabled restart functionality 
    for all simulations with arbitrary digits of precision as requested by the user.  

-   **Comprehensive reporting and post-processing** of simulations and ML tasks, as well as their automatic storage in 
    external files to ensure the simulation results will be understandable and reproducible at any time in the foreseeable future.  


Quick Start
===========

For a quick start with some Jupyter Notebook examples, visit [this ParaMonte documentation page](https://www.cdslab.org/paramonte/generic/latest/examples/python/jupyter/).
The corresponding example source files (the `*.ipynb` files) can be downloaded from the [paramontex GitHub repository](https://github.com/cdslaborg/paramontex/tree/main/Python/Jupyter),
which is a repository dedicated to the ParaMonte library examples.

The following example code samples a 4-dimensional MultiVariate Normal (MNV) distribution via the ParaDRAM sampler in serial mode,

```python
import numpy as np
import paramonte as pm
def getLogFunc(point): return -0.5 * np.dot(point, point)
sampler = pm.sampling.Paradram()
sampler.run ( getLogFunc = getLogFunc   # the objective function
            , ndim = 4 # assume 4-dimensional objective function
            )
```

To learn about the ParaMonte Python library's post-processing and visualization tools, visit [this documentation page](https://www.cdslab.org/paramonte/generic/latest/examples/python/jupyter/).


Installation  
============  

The latest release of ParaMonte can be installed from PyPI using `pip`:

    pip3 install --user --upgrade paramonte

or,

    pip install --user --upgrade paramonte

Alternatively, you can follow the guidelines in 
[this documentation page](https://www.cdslab.org/paramonte/generic/1/installation/python/) 
to either download the pre-built ParaMonte Python libraries for your platform or to build the library from the source code.  


Dependencies
============

Aside from an optional MPI runtime library for MPI-parallel simulations, 
the ParaMonte library core has **zero dependency** on external third-party libraries or packages.  

The Python interface of ParaMonte depends on very few third-party libraries. 
These include `numpy`, `scipy`, `pandas`, and `matplotlib`. 
The last two (plotting) libraries are only used for the post-processing of simulation 
results and are therefore not needed if you do not plan to use the post-processing 
features of the ParaMonte library. If you have a recent version of the 
[Anaconda Python ](https://www.anaconda.com/download) distribution 
installed on your system, then all the dependencies already 
exist and are automatically installed.  


Parallelism
===========

The ParaMonte library relies on three independent parallelism paradigms for parallel applications:  

1.  The Coarray parallelism (only available for select routines in the Fortran programming language).  
2.  The Message Passing Interface (MPI) standard for inter-processor distributed parallelism.  
    +   On **Windows** and **Linux** operating systems, we highly recommend downloading and 
        installing the [Intel MPI runtime libraries](https://software.intel.com/en-us/mpi-library), 
        which is available to the public free of charge.  
        The [ParaMonte auxil prerelease](https://github.com/cdslaborg/paramonte/releases/tag/auxil)
        exclusively contains the optional Intel MPI runtime libraries for users' convenience.  
        The Intel MPI requires the ParaMonte library to be (or have been prebuilt) using the Intel compilers.  
    +   On **macOS** (where Intel MPI is unavailable) and **Linux** operating systems, users can install
        either [Open-MPI](https://www.open-mpi.org/) or [MPICH](https://www.mpich.org/) MPI runtime 
        libraries depending on the prebuilt version of the ParaMonte library that you have 
        downloaded or the configuration with which you intend to build the library.  

**Optional Dependency Compatibility**  

| Dependency                        | Windows (amd64) | Linux (amd64) | macOS (amd64) | macOS (arm64) |  
|----------------------------------:|:---------------:|:-------------:|:-------------:|:-------------:|  
| Intel MPI (IMPI) >= 2021.8        | ✅              | ✅            | ✅             | ❌            |  
| MPICH MPI (MMPI) >= 3             | ❌              | ✅            | ✅             | ✅            |  
| OpenMPI (OMPI) >= 4               | ❌              | ✅            | ✅             | ✅            |  

Read the [`install.md` installation instruction notes](install.md) to 
learn more about the library's optional parallel build configurations.<br>

For more information, visit [https://www.cdslab.org/paramonte/](https://www.cdslab.org/paramonte/).


Example Usage Instructions
==========================

+   For complete clear organized, up-to-date instructions on the build process and the 
    installation of the ParaMonte library, visit the [ParaMonte Python examples guidelines](https://www.cdslab.org/paramonte/generic/latest/usage/examples/python/).  


Citing ParaMonte
================

The ParaMonte library is an honor-ware and its currency is acknowledgment and citations. 

If you use ParaMonte or any ideas from this software, please acknowledge it by citing the ParaMonte library's 
main publications as listed in [ACKNOWLEDGMENT.md](https://github.com/cdslaborg/paramonte/blob/main/ACKNOWLEDGMENT.md).  

Visit [the ParaMonte library homepage](https://www.cdslab.org/paramonte/generic/latest/overview/preface/#how-to-acknowledge-the-use-of-the-paramonte-library-in-your-work)
to access the PDF version of these files free of charge.  


License
=======

The majority of the ParaMonte library routines are distributed under the permissive 
[MIT License](LICENSE.md) plus acknowledgments that are detailed in [LICENSE.md](./LICENSE.md).  

However, there are occasionally modernized and extended routines from external projects, particularly within the ParaMonte Fortran library. 
These routines may have a license that does not fully overlap with the default ParaMonte library license [LICENSE.md](./LICENSE.md). 
In such cases, the documentation and source code of the specific routine explicitly list the original license information. 

This is free software, so help us keep it freely available to the public by acknowledging the usage and contributing to it. 
If you have questions or concerns about the license, please get in touch with the project's lead (shahmoradi@utexas.edu). 


Authors and Contributors
========================

+   [Fatemeh Bagheri](https://www.linkedin.com/in/fbagheri)
    +   PhD in Astronomy,
    +   PhD in Space Physics,
    +   Deep philosophical thinker,
    +   Currently at NASA Goddard Space Flight Center,
    +   Contact: [bagheri.fateme@gmail.com](mailto:"bagheri.fateme@gmail.com")

+   [Amir Shahmoradi](https://www.cdslab.org/people/#amir-shahmoradi)
    +   Astrophysicist/bioinformatician by training,
    +   Ph.D. in computational physics/bioinformatics, The University of Texas at Austin,
    +   Currently a faculty member of the Data Science and Physics programs at UT Arlington,
    +   Contact: [shahmoradi@utexas.edu](mailto:"shahmoradi@utexas.edu")

+   [Joshua Osborne](https://www.cdslab.org/people/#joshua-alexander-osborne)
    +   Physicist / computational data scientist by training,
    +   Currently a Physics PhD candidate at UT Arlington,
    +   Contact: [joshuaalexanderosborne@gmail.com](mailto:"joshuaalexanderosborne@gmail.com")


Contributing to ParaMonte
=========================

Please read the generic contribution guidelines listed in [CONTRIBUTING.md](./CONTRIBUTING.md).


**For more information**, visit [cdslab.org/pm](https://www.cdslab.org/paramonte) or contact Amir Shahmoradi: [shahmoradi@utexas.edu](mailto:"shahmoradi@utexas.edu")
