import tkinter as tk

# Create the main window
root = tk.Tk()
root.title("Tkinter")  # Title of the window
root.geometry("600x400")    # Size of the window (width x height)

root.attributes("-topmost", True)

# Add a label widget
label = tk.Label(root, text="GUI Window is Working!", font=("Arial", 12))
label.pack(pady=20)  # Pack places the widget with padding

# Add a button to close the window
button = tk.Button(root, text="Close", command=root.destroy)
button.pack(pady=500)
button.pack(padx=500)

button.place(relx=0.5, rely=0.5, anchor="center")

# Start the event loop
root.mainloop()
