# Django + Vite Fullstack Template Generator

This PowerShell script automates the setup of a fullstack project using Django for the backend and Vite for the frontend.

## Usage

```powershell
.\start-fullstack.ps1 -Template react-swc-ts
```

If no template is provided, the Vite CLI will launch in interactive mode.

## Requirements

-   Python 3.x
-   Django (`pip install django`)
-   Node.js and npm
-   PowerShell (Windows or cross-platform)

## What it does

-   Creates a Django project in `backend/core`
-   Applies initial migrations
-   Creates a Vite project in `frontend`
-   Installs frontend dependencies

## Template support

You can optionally pass a template name to skip Vite's interactive setup:

Examples:

-   `react-ts`
-   `react-swc-ts`
-   `vue-ts`
-   `svelte-ts`

If no template is provided, the Vite CLI will launch in interactive mode.

## License

MIT License
