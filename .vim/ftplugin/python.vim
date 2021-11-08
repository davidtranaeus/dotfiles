" Set autopep8 for formatting
let b:ale_fixers = ["autopep8", "black", "isort"]

" Set flake8 for linting
let b:ale_linters = ["flake8"]

" if executable("autopep8")
" 	setlocal formatprg=autopep8\ -
" 	setlocal formatexpr=
" endif

" if executable("black")
" 	setlocal formatprg=black -q -"
" 	setlocal formatexpr=
" endif
