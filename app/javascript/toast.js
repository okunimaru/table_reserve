document.addEventListener("turbo:load", () => {
  setTimeout(() => {
    document.querySelectorAll(".toast").forEach((t) => {
      const toast = bootstrap.Toast.getOrCreateInstance(t);
      toast.hide();
    });
  }, 3000);
});