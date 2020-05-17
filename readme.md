**Installation guide and test running**

1- Verify if python is installed

```python --version```

If python is not installed go to https://www.python.org/downloads/release/python-381/

2- Install Robot Framework

```pip install robotframework```

3 - Install selenium libraries and drivers for different browsers

- Selenium library ```pip install --upgrade robotframework-selenium2library```
- Chrome driver ```brew cask install chromedriver```

4 - To run all tests open a command window on the root folder and run:

```robot -d results Tests```

* To run all tests from a particular tag:

```robot -d results -i contact Tests```
or
```robot -d results -i cart Tests```