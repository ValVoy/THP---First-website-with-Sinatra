# 🗣️ The Gossip Project (Sinatra Edition)

Welcome to this project created as part of **The Hacking Project (THP)** bootcamp.
The goal is to transition from terminal-based Ruby programs to a real web application using the **Sinatra** framework. This project implements a fully functional MVC architecture without the "magic" of Rails, forcing a deep understanding of HTTP requests, routing, and data management.

## Prerequisites

* Ruby (version 3.0 or higher recommended)
* Bundler
* Gems: `sinatra`, `puma`, `csv`, `rerun` (optional but recommended for dev)


## File Structure


```
├── 📁 db
│   ├── 📄 comment.csv
│   └── 📄 gossip.csv
├── 📁 lib
│   ├── 📁 views
│   │   ├── 📄 edit.erb
│   │   ├── 📄 index.erb
│   │   ├── 📄 new_gossip.erb
│   │   └── 📄 show.erb
│   ├── 💎 comment.rb
│   ├── 💎 controller.rb
│   └── 💎 gossip.rb
├── 📄 Gemfile
├── 📝 README.md
└── 📄 config.ru
```

## Installation

1.  **Clone the repository**:
    ```bash
    git clone <your-github-link>
    cd the_gossip_project_sinatra
    ```

2.  **Install the gems**:
    ```bash
    bundle install
    ```
    *This project uses `puma` as the web server and `csv` to persist data.*

---

## Usage

To start the local server, run the following command in your terminal:

```bash
bundle exec rackup -p 4567
```

Or if you installed rerun for live reloading: 
```bash 
bundle exec rerun 'rackup -p 4567'
```

Then, open your browser and navigate to:
👉 **http://localhost:4567/**

---

## Project Progression & Features

This project was built step-by-step, starting from a simple "Hello World" to a complete social platform with data relationships.

### 1. MVC Architecture & Basic Routing
The project is structured following the **Model-View-Controller** pattern to ensure clean code organization.
* **Technique:**
    * **Controller:** `lib/controller.rb` handles HTTP requests (GET/POST).
    * **Views:** Uses `.erb` files to mix HTML with Ruby logic.
    * **Models:** Ruby classes interacting with CSV files instead of a classic SQL database.

### 2. Full CRUD (Create, Read, Update)
I implemented the complete lifecycle of a Gossip.
* **Create:** Users can submit new gossips via a form. Data is captured using `params` and saved to `db/gossip.csv`.
* **Read:**
    * **Index:** Displays all gossips on the homepage using a loop.
    * **Show:** Dynamic URLs (e.g., `/gossips/2/`) allow users to view a specific gossip page based on its index.
* **Update:** A specific "Edit" feature allows users to modify the author or content of an existing gossip. This involved rewriting the specific line in the CSV file logic.

### 3. The "Boss Level": Comments & Relations (Bonus)
I went further by implementing a commenting system, creating a **One-to-Many relationship** manually.
* **Technique:**
    * Created a `Comment` class and a `db/comment.csv` file.
    * **Foreign Key Logic:** Comments are stored with the `gossip_id` they belong to.
    * **Display:** When opening a Gossip page, the app filters the CSV to display only the relevant comments associated with that specific Gossip ID.

---

## Core Web Concepts Learned

* **Routing:** Mastering `get` for display and `post` for data submission.
* **Params:** Using the `params` hash to retrieve form data and dynamic URL IDs.
* **Database Logic:** Manipulating CSV files to act as a persistent database (Append mode for creation, Write mode for updates).
* **Associations:** Manually linking two data models (Gossips and Comments) via IDs.

## Author

*Valentin Chéron*

*The Hacking Project 2026*