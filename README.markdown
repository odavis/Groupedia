#Blocipedia

Blocipedia is a SaaS wiki collaboration tool where users can create public shareable wikis with live markdown preview. Users can also upgrade their membership to gain access to private wikis. Blocipedia utilizes [stripe](http://stripe.com) Stripe for subsciption payments and Devise/Omniauth to handle social login with support for Twitter and Facebook.

Blocipedia was built as part of [Bloc.io](https://www.bloc.io/?ref_token=OTU0MTQ) a web development apprenticeship.

##Purpose
Build an application that allows users to create public and private Markdown-based wikis.

##Use case
Wikis are a great way to collaborate on community-sourced content. Whether the wiki is for a hobby or work-related project, we'll build an app that lets users create their own wikis and share them publicly or privately with other collaborators.

##Requirements
* As a user, I should be able to sign up for a free account by providing a user name, password and email address.
* As a user, I want to be able to sign in and out of the Blocipedia.
* As a user, I want to be able to create wiki pages using Markdown syntax.
* As a user, I should see my Markdown syntax rendered in real-time, so that I can easily validate the format of my wiki.
* As a user with a free account, I want to be able to create public wikis that anyone may view.
* As an user I want to be able to upgrade my account from a free plan to a paid (premium) plan so that I can create private wikis.
binary colums => true or false
Table for: create a subscriptions/membership table that belongs to users
* As a user with a premium account, I want to be able to create private wikis that require a Blocipedia account and proper authorization to view.
* As a user with a premium account, I want to be able to add collaborators to my private wikis.
* As a user with a premium account, I should be able to add an unlimited number of collaborators to my wikis.
