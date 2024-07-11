import tkinter as tk

import Consultas
import Consultas_CRUD

# Definir colores
color_barra_superior = "#1f2329"
color_menu_lateral = "#2a3138"
color_fondo_principal = "#f1faff"
color_menu_cursor_encima = "#a2f88c5"


# Crear ventana principal
ventana_principal = tk.Tk()
ventana_principal.title("My Tree")
ventana_principal.minsize(width=300, height=400)
ventana_principal.configure(bg=color_fondo_principal)
ventana_principal.state("zoomed")

# Marco de consultas
consultas_frame = tk.Frame(ventana_principal)
consultas_label = tk.Label(consultas_frame, text="Consultas Frame")
consultas_label.pack()

# Marco lateral
aside_frame = tk.Frame(ventana_principal)
aside_label = tk.Label(aside_frame, text="Aside Content")
aside_frame.configure(bg=color_menu_lateral, borderwidth=2, relief="groove", padx=10, pady=10)

def show_consultas_frame():
    consultas_frame.grid()
    crud_frame.grid_remove()

def show_crud_frame():
    # Implement this function when you have the CRUD module
    consultas_frame.grid_remove()  # Hide consultas frame (if needed)
    crud_frame.grid()  # Show CRUD frame
    pass

consultas_button = tk.Button(aside_frame, text="Consultas", command=show_consultas_frame)
crud_button = tk.Button(aside_frame, text="CRUD", command=show_crud_frame)

consultas_button.pack()
crud_button.pack()

# Configurar ventana principal con cuadrícula
ventana_principal.grid_rowconfigure(0, weight=1)

# Colocar marcos en la cuadrícula
consultas_frame.grid(row=0, column=1, sticky="nsew")
aside_frame.grid(row=0, column=0, sticky="nsew")

# Ajustar pesos de las columnas
ventana_principal.grid_columnconfigure(0, weight=3)
ventana_principal.grid_columnconfigure(1, weight=7)

# Create frame for buttons
frame_botones = tk.Frame(consultas_frame)
frame_botones.pack(fill=tk.BOTH, expand=True)

# Create frame for results
frame_resultados = tk.Frame(consultas_frame)
frame_resultados.pack(fill=tk.BOTH, expand=True)

# Create CRUD frame
crud_frame = tk.Frame(ventana_principal)
crud_frame.configure(bg=color_menu_lateral, borderwidth=2, relief="groove", padx=10, pady=10)
crud_frame.grid(row=0, column=1, sticky="nsew")  # Same position as consultas_frame

# Frame for buttons and messages
crud_content_frame = tk.Frame(crud_frame)
crud_content_frame.pack(fill=tk.BOTH, expand=True)

# Frame for messages
message_frame = tk.Frame(crud_content_frame)
message_frame.pack(fill=tk.X, expand=True)

# Text area for messages
message_text = tk.Text(message_frame, wrap=tk.WORD, state=tk.DISABLED)
message_text.pack(fill=tk.BOTH, expand=True)

# Frame for buttons
button_frame = tk.Frame(crud_content_frame)
button_frame.pack(fill=tk.X, expand=True)

crud_frame.grid_remove()



#############################

# Get a list of function names from the Consultas module
function_names = [func for func in dir(Consultas) if not func.startswith("__")]

# Create a button for each function
for function_name in function_names:
    if not function_name.startswith("consultar_"):
        continue  # Skip functions that don't start with "consultar_"

    button = tk.Button(frame_botones, text=function_name[8:], command=lambda f=function_name: execute_query_and_display(f))
    button.pack(side=tk.LEFT, fill=tk.X, expand=True)

###############################

def execute_query_and_display(function_name):
    # Clear the previous results
    clear_results()

    # Get the function object using getattr
    function = getattr(Consultas, function_name)

    # Execute the query and get the results
    results = function()

    # Display the results in the results frame
    for result in results:
        result_text = tk.Text(frame_resultados, wrap=tk.WORD)
        result_text.insert(tk.END, str(result))
        result_text.pack(fill=tk.BOTH, expand=True)

##############################

def clear_results():
    for child in frame_resultados.winfo_children():
        child.destroy()

#############################
#############################

# CRUD

#############################

# Create buttons for each CRUD function
crud_functions = [Consultas_CRUD.add_person, Consultas_CRUD.delete_person, Consultas_CRUD.update_person, Consultas_CRUD.delete_relationship]
for function in crud_functions:
    function_name = function.__name__[5:]  # Remove "add_", "delete_", etc.
    button = tk.Button(button_frame, text=function_name, command=lambda f=function: execute_crud_operation(f))
    button.pack(side=tk.LEFT, fill=tk.X, expand=True)


################################

def execute_crud_operation(function):
    # Clear previous message
    message_text.delete(1.0, tk.END)

    try:
        # Execute the CRUD function
        result = function(driver, **kwargs)  # Assuming you pass necessary arguments

        # Display success message
        message_text.insert(tk.END, f"Operación exitosa: {result}")
        message_text["state"] = tk.NORMAL  # Enable text editing
        message_text.update()  # Update text area
        message_text["state"] = tk.DISABLED  # Disable editing again

    except Exception as e:
        # Display error message
        message_text.insert(tk.END, f"Error: {e}")
        message_text["state"] = tk.NORMAL
        message_text.update()
        message_text["state"] = tk.DISABLED

################################





# Bucle principal
ventana_principal.mainloop()
