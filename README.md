# Configuracion de nvim basada en lua

## Prerequisitos

### Programas necesarios

- Powershell
- Nodejs
- Ohmyposh!
- scoop

### Instalaciones con scoop

```
scoop install lua-lenguage-server
scoop install tree-sitter
scoop install ripgrep
scoop install gcc
```

### Instalaciones con npm

```
npm install -g typescript-language-server typescript
npm install -g @tailwindcss/language-server
npm install -g @fsouza/prettierd
```

### Plugins a utilizar

Recordemos que estamos usando packer como administrador de paquetes en nvim

```
use 'wbthomason/packer.nvim'
use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
}
use 'nvim-lualine/lualine.nvim' -- Statusline
use 'nvim-lua/plenary.nvim' -- Common utilities
use 'onsails/lspkind-nvim' -- vscode-like pictograms
use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
use 'hrsh7th/nvim-cmp' -- Completion
use 'neovim/nvim-lspconfig' -- LSP
use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'

use 'glepnir/lspsaga.nvim' -- LSP UIs
use 'L3MON4D3/LuaSnip'
use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
}
use 'kyazdani42/nvim-web-devicons' -- File icons
use 'nvim-telescope/telescope.nvim'
use 'nvim-telescope/telescope-file-browser.nvim'
use 'windwp/nvim-autopairs'
use 'windwp/nvim-ts-autotag'
use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
}
}
use 'norcalli/nvim-colorizer.lua'
use 'folke/zen-mode.nvim'
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})
use 'akinsho/nvim-bufferline.lua'
-- use 'github/copilot.vim'

use 'lewis6991/gitsigns.nvim'
use 'dinhhuy258/git.nvim' -- For git blame & browse
```

## Atajos de teclado

### Mapeo General

#### Modo Normal

- x -> borrar caracteres de derecha a izquierda
- `- -> Funciona para incrementar un número 1
- `- -> Funciona para decrementar un número 1
- dw -> Borra una palabra de derecha a izquierda
- Ctrl+a -> Seleccionamos todo el documento
- te -> Crea un nuevo tab
- ss -> Divide la pantalla horizontalmente
- sv -> Divide la pantalla verticalmente
- Barra Espaciadora -> nos ayuda a desplazarnos entre ventanas divididas
- sh -> nos ayuda a desplazarnos hacia la ventana de la izquierda
- sk -> nos ayuda a desplazarnos hacia la ventana de la arriba
- sj -> nos ayuda a desplazarnos hacia la ventana de la abajo
- sl -> nos ayuda a desplazarnos hacia la ventana de la derecha
- Ctrl-w + Izquierda -> Cambiamos el tamaño de la ventana hacia la izquierda
- Ctrl-w + Derecha -> Cambiamos el tamaño de la ventana hacia la derecha
- Ctrl-w + Arriba -> Cambiamos el tamaño de la ventana hacia arriba
- Ctrl-w + Abajo -> Cambiamos el tamaño de la ventana hacia abajo
- `<A-j`> -> Deplaza la linea una linea abajo
- `<A-k`> -> Deplaza la linea una linea arriba

#### Modo Insertar

- `<A-j`> -> Deplaza la linea una linea abajo
- `<A-k`> -> Deplaza la linea una linea arriba

#### Modo Visualizacion

- `<A-j`> -> Deplaza la linea una linea abajo
- `<A-k`> -> Deplaza la linea una linea arriba

### Atajo de teclado Plugins

#### Modo Normal

##### Bufferline

- Tab -> Switch entre pestañas hacia adelante
- Shift+Tab -> Switch entre pestañas hacia atras

##### cmp-buffer/cmp-nvim-lsp

- Ctrl+d/Ctrl+f -> desplazamiento de lista
- Ctrl+Space -> Completado
- Ctrl+e -> Cierre de lista desplegable
- Enter -> Confirmacion de seleccion

##### numToStr/Comment.nvim

- gcc -> Activa y desactiva los comentarios en una linea
- gbc -> Activa y desactiva los comentarios en una lina y les agrega llaves
- [count]gcc -> Activa o desactiva los comentarios en la cantidad de lineas indicadas. Ej: 15gcc -> aplica el comentario a 15 lineas
- [count]gbc -> Activa o desactiva los comentarios en la cantidad de lineas indicadas. Ej: 15gbc -> aplica el comentario a 15 lineas
- gcw -> Comenta la palabra sobre la que esta el cursor
- gc$ -> Comenta la linea completa a partir de la posicion del cursor
- gc} -> Comenta desde la posicion del cursor hasta el siguiente salto de linea
- gcip -> Comenta el parrafo en que nos encontremos
- gbaf -> Comenta funciones completas
- gbac -> Comenta clases completas

##### Git/Gitsigns

- **`<Leader`>**gb -> Open blame windows-Visualiza los cambios por usuario
- **`<Leader`>**go -> Abre el archivo o el explorador

##### Telescope

- ;f -> Busca archivos dentro del directorio en que abrimos el vim
- `\\\\ -> Busca archivos dentro del buffer osea los archivos que se han navegado recientemente
- ;t -> Busca tags dentro de los archivos de ayuda
- ;; -> Busca dentro de los archivos de ayuda
- ;e -> Muestra el diagnostigo de la herramienta
- sf -> Muestra el Explorador de archivos
- q -> Exit
- N -> Crea Folder/archivos
- D -> Borra Folder/Archivos

##### Lsp-config

- gD -> Nos lleva hasta donde se encuentre declarado el objeto
- gi -> Nos lleva donde hemos implementado el objeto

##### LspSaga

- Ctrl+j -> No lleva directamente donde se produce el error
- gl -> Muestra la linea del error actual
- K -> Muestra informacion adicional sobre el la parte del código donde estemos posicionados
- gd -> Busca dentro del proyecto todas la veces que hemos utilizado la parabra sobre la cual estamos posicionados
- gp -> Nos muestra la porción de código donde hemos realizado la definición del objeto o método
- gr -> Cambia la palabra en todo el documento en que nos encontremos
