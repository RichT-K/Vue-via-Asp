# Vue-via-Asp
A Vue experiment served with ASP 

Project Start: 3/28/2021
Proof of Concept:4/1/2021(no kidding)
Estimated Completion:

Define the Problem: How to integrate reusable a VUE components into a Classic ASP website?
In 2025 ASP may reach the end of its supported lifecycle:
https://docs.microsoft.com/en-US/troubleshoot/iis/asp-support-windows 
That has been the worry of business owners for decades. Yet, Microsoft continues to develop
product which extends the life of Classic ASP. And it's no wonder with so many web sites still in operation
that have been built on it.

Define the Scope: 
Keep it s simple as possible. 
The object of this project is to create a functional website hosted on an IIS server running
Classic ASP employing VUE presentation layers implementing Asynchrouous Components.

On the client, the goal is to introduce simple and complex components, less styling, Cookie and LocalStorage support.

On the server, 404 handling will provide dynamic routing through path identification. Routed pages can easily 
be adjusted wth ASP code to enhance SEO value and provide any supporting data necessary for the representation of the page. It is not the goal of this project to fully address controlling of Application State but will implement
Cookies and LocalStorage for State preservation.

The iterations of the project will include:
Setup, Definition, Explaination, Tests, and Review

- Setup : To instruct the developer on prerequisites
- Definition : To articulate the task goal
- Explaination : To reveal what is occurring
- Test : To ensure expected operations
- Review : To observe responses to changes

## Setup

- With IIS, create a website site pointing to this directory
- Optionally set default language to Javascript
- Add a virtual (server) directory for those reusable library utilities
- ASP does not include a native JSON parser, JSON5 to the rescue 
 Visit https://github.com/json5

- Add a virtual (dist) directory or a local directory to serve "vue.global.js"
 Visit https://v3.vuejs.org/ for static file instructions

- Add an optional host entry notepad(run as admin) windows/system32/drivers/etc/hosts
- 127.0.0.1 experiment.vue-asp.com 
- Browse to experiment.vue-asp.com or 127.0.0.1
