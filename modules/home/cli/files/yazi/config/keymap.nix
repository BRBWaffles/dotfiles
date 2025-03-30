{
  keymap.manager.prepend_keymap = [
    {
      on = [
        "Q"
      ];
      run = "quit";
    }
    {
      on = [
        "q"
      ];
      run = "quit --no-cwd-file";
    }
  ];
}
