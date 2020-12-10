# Set up Miniconda on Aguirre or Stultz Lab machine 

Here are instructions for a user of an Aguirre or Stultz Lab machine to set up Miniconda.

Please *do not* install Miniconda or Anaconda in your home directory. Doing so is redundant, consumes unncessary storage, and prevents other users from accessing your environments (which we often share, e.g. multiple collaborators using the same Conda environment and project repo).

Miniconda is already installed in the administrator account (and kept fastidiously up to date). You should use this installation, and can modify it and install packages.

For Aguirre Lab, the administrator account name is `aguirrelab`. For Stultz Lab, the account name is `stultzlab`.

In the below examples I will use `aguirrelab` in paths, referring to an Aguirre Lab machine. If you are using a Stultz Lab machine, use `stultzlab` in the paths instead.

Activate:

```zsh
$ source /home/aguirrelab/miniconda3/bin/activate
```

Your console prompt should now be prepended by `(base)`.

Create an environment from your `environment.yml` config file. My `dotfiles` repo contains an example [`environment.yml`](https://github.com/erikr/dotfiles/blob/master/environment.yml) named `er`. It contains Python 3.8, Numpy, Pandas, h5py, Jupyter Lab, and other packages I use across projects. You are free to copy and use it as helpful.

Project repos may contain an `environment.yml`, or you can [create an environment with commands](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-with-commands).

```zsh
$ conda env create -f environment.yml
$ conda activate er
```

Your prompt should now be prepended by the environment name; if you use my `environment.yml`, the prompt is now prepended by `(er)`.

Update your `zsh` shell config `.zshrc` so new shell instances have the path to Conda:

```zsh
(er) $ conda init zsh
```

Check to ensure your path has the miniconda environment version of Python, and that the version is correct:

```zsh
(er) $ which python
/home/aguirrelab/miniconda3/envs/er/bin/python
  
(er) $ python --version
Python 3.8.5
```