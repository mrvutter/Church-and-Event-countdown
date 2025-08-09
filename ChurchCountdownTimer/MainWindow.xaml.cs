using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Threading;

namespace ChurchCountdownTimer
{
    public partial class MainWindow : Window
    {
        private DispatcherTimer? timer;
        private int totalSeconds;
        private bool isRunning = false;
        private SolidColorBrush timerColor = new SolidColorBrush(Colors.White);
        private SolidColorBrush backgroundColor = new SolidColorBrush(Colors.Black);
        private DispatcherTimer? fadeTimer;

        public MainWindow()
        {
            InitializeComponent();
            InitializeTimer();
            
            // Initialize totalSeconds to match the default 5-minute display
            totalSeconds = 300; // 5 minutes = 300 seconds
        }

        private void InitializeTimer()
        {
            timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += Timer_Tick;
        }

        private void TimeInput_TextChanged(object sender, TextChangedEventArgs e)
        {
            var textBox = sender as TextBox;
            if (textBox != null && string.IsNullOrWhiteSpace(textBox.Text))
            {
                textBox.Text = "0";
                textBox.SelectionStart = textBox.Text.Length;
            }
            UpdateTimerDisplay();
        }

        private void UpdateTimerDisplay()
        {
            UpdateTimerDisplay(false);
        }

        private void UpdateTimerDisplay(bool updateInputFields)
        {
            if (HoursInput == null || MinutesInput == null || SecondsInput == null ||
                TimerDisplay == null || StartTimerButton == null)
                return;

            try
            {
                string hoursText = string.IsNullOrWhiteSpace(HoursInput.Text) ? "0" : HoursInput.Text.Trim();
                string minutesText = string.IsNullOrWhiteSpace(MinutesInput.Text) ? "0" : MinutesInput.Text.Trim();
                string secondsText = string.IsNullOrWhiteSpace(SecondsInput.Text) ? "0" : SecondsInput.Text.Trim();

                if (int.TryParse(hoursText, out int hours) && 
                    int.TryParse(minutesText, out int minutes) && 
                    int.TryParse(secondsText, out int seconds))
                {
                    totalSeconds = (hours * 3600) + (minutes * 60) + seconds;
                    
                    if (updateInputFields)
                    {
                        hours = totalSeconds / 3600;
                        minutes = (totalSeconds % 3600) / 60;
                        seconds = totalSeconds % 60;

                        HoursInput.Text = hours.ToString();
                        MinutesInput.Text = minutes.ToString();
                        SecondsInput.Text = seconds.ToString();
                    }

                    // Show MM:SS format when no hours, HH:MM:SS when hours exist
                    if (hours > 0)
                    {
                        TimerDisplay.Text = string.Format("{0:D2}:{1:D2}:{2:D2}", hours, minutes, seconds);
                    }
                    else
                    {
                        TimerDisplay.Text = string.Format("{0:D2}:{1:D2}", minutes, seconds);
                    }
                    
                    TimerDisplay.Foreground = new SolidColorBrush(Colors.Black);
                    StartTimerButton.IsEnabled = totalSeconds > 0;
                }
                else
                {
                    TimerDisplay.Text = "00:00";
                    StartTimerButton.IsEnabled = false;
                }
            }
            catch
            {
                TimerDisplay.Text = "00:00";
                StartTimerButton.IsEnabled = false;
            }
        }

        private void Preset5_Click(object sender, RoutedEventArgs e)
        {
            SetTimeFromSeconds(300); // 5 minutes
        }

        private void Preset10_Click(object sender, RoutedEventArgs e)
        {
            SetTimeFromSeconds(600); // 10 minutes
        }

        private void Preset15_Click(object sender, RoutedEventArgs e)
        {
            SetTimeFromSeconds(900); // 15 minutes
        }

        private void Preset30_Click(object sender, RoutedEventArgs e)
        {
            SetTimeFromSeconds(1800); // 30 minutes
        }

        private void SetTimeFromSeconds(int seconds)
        {
            totalSeconds = seconds;
            int hours = seconds / 3600;
            int minutes = (seconds % 3600) / 60;
            int secs = seconds % 60;

            if (HoursInput != null) HoursInput.Text = hours.ToString();
            if (MinutesInput != null) MinutesInput.Text = minutes.ToString();
            if (SecondsInput != null) SecondsInput.Text = secs.ToString();

            UpdateTimerDisplay();
        }

        private void TimerColorButton_Click(object sender, RoutedEventArgs e)
        {
            // Cycle through preset colors
            var colors = new Color[] { Colors.White, Colors.Yellow, Colors.Green, Colors.Blue, Colors.Orange };
            var currentColor = timerColor.Color;
            int currentIndex = Array.IndexOf(colors, currentColor);
            int nextIndex = (currentIndex + 1) % colors.Length;
            
            timerColor = new SolidColorBrush(colors[nextIndex]);
        }

        private void BackgroundColorButton_Click(object sender, RoutedEventArgs e)
        {
            // Cycle through preset colors
            var colors = new Color[] { Colors.Black, Colors.DarkBlue, Colors.DarkGreen, Colors.DarkRed, Colors.Purple };
            var currentColor = backgroundColor.Color;
            int currentIndex = Array.IndexOf(colors, currentColor);
            int nextIndex = (currentIndex + 1) % colors.Length;
            
            backgroundColor = new SolidColorBrush(colors[nextIndex]);
        }

        private void StartTimer_Click(object sender, RoutedEventArgs e)
        {
            if (totalSeconds <= 0) return;

            isRunning = true;
            timer?.Start();

            // Enable true fullscreen - hide taskbar and window chrome
            this.WindowState = WindowState.Maximized;
            this.WindowStyle = WindowStyle.None;
            this.Topmost = true;
            this.ResizeMode = ResizeMode.NoResize;

            // Switch to fullscreen timer
            if (SetupScreen != null) SetupScreen.Visibility = Visibility.Collapsed;
            if (TimerScreen != null) TimerScreen.Visibility = Visibility.Visible;
            
            // Apply selected colors
            var timerTextBrush = this.FindResource("TimerTextBrush") as SolidColorBrush;
            var timerBackgroundBrush = this.FindResource("TimerBackgroundBrush") as SolidColorBrush;
            
            if (timerTextBrush != null)
                timerTextBrush.Color = timerColor.Color;
            if (timerBackgroundBrush != null)
                timerBackgroundBrush.Color = backgroundColor.Color;

            UpdateTimerDisplayRunning();


            


            // Show controls initially and start fade timer


            ShowControlsTemporarily();


            }

        private void TimerScreen_MouseMove(object sender, MouseEventArgs e)
        {
            ShowControlsTemporarily();
        }

        private void ShowControlsTemporarily()
        {
            if (TimerControls != null)
            {
                // Fade in the controls smoothly
                var fadeInStoryboard = this.FindResource("FadeInAnimation") as Storyboard;
                if (fadeInStoryboard != null)
                {
                    Storyboard.SetTarget(fadeInStoryboard, TimerControls);
                    fadeInStoryboard.Begin();
                }

                fadeTimer?.Stop();
                fadeTimer = new DispatcherTimer();
                fadeTimer.Interval = TimeSpan.FromSeconds(2); // Fade out after 2 seconds
                fadeTimer.Tick += (s, e) =>
                {
                    if (TimerControls != null)
                    {
                        // Fade out the controls smoothly
                        var fadeOutStoryboard = this.FindResource("FadeOutAnimation") as Storyboard;
                        if (fadeOutStoryboard != null)
                        {
                            Storyboard.SetTarget(fadeOutStoryboard, TimerControls);
                            fadeOutStoryboard.Begin();
                        }
                    }
                    fadeTimer?.Stop();
                };
                fadeTimer.Start();
            }
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            if (totalSeconds > 0)
            {
                totalSeconds--;
                UpdateTimerDisplayRunning();

                if (totalSeconds == 0)
                {
                    TimerFinished();
                }
            }
        }

        private void UpdateTimerDisplayRunning()
        {
            int hours = totalSeconds / 3600;
            int minutes = (totalSeconds % 3600) / 60;
            int seconds = totalSeconds % 60;

            // Show MM:SS format when no hours, HH:MM:SS when hours exist
            string timeText;
            if (hours > 0)
            {
                timeText = string.Format("{0:D2}:{1:D2}:{2:D2}", hours, minutes, seconds);
            }
            else
            {
                timeText = string.Format("{0:D2}:{1:D2}", minutes, seconds);
            }

            // Update both displays
            if (TimerDisplay != null)
                TimerDisplay.Text = timeText;
            if (FullscreenTimerDisplay != null)
                FullscreenTimerDisplay.Text = timeText;

            // Change color when time is running low (less than 1 minute)
            var timerTextBrush = this.FindResource("TimerTextBrush") as SolidColorBrush;
            if (totalSeconds <= 60 && FullscreenTimerDisplay != null && timerTextBrush != null)
            {
                timerTextBrush.Color = Colors.Red;
            }
            else if (timerTextBrush != null)
            {
                timerTextBrush.Color = timerColor.Color;
            }
        }

        private void TimerFinished()
        {
            timer?.Stop();
            isRunning = false;
            
            // Keep showing 00:00 instead of TIME'S UP!
            UpdateTimerDisplayRunning();
            
            var timerTextBrush = this.FindResource("TimerTextBrush") as SolidColorBrush;
            if (timerTextBrush != null)
                timerTextBrush.Color = Colors.Red;
        }

        private void ReturnButton_Click(object sender, RoutedEventArgs e)
        {
            ReturnToSetup();
        }

        private void AddTime_Click(object sender, RoutedEventArgs e)
        {
            totalSeconds += 300; // Add 5 minutes
            
            // If timer was at 0, restart it
            if (!isRunning && totalSeconds > 0)
            {
                isRunning = true;
                timer?.Start();
            }
            
            UpdateTimerDisplayRunning();
            ShowControlsTemporarily();
        }

        private void ReturnToSetup()
        {
            // Stop and reset timer completely
            timer?.Stop();
            isRunning = false;
            totalSeconds = 0;

            // Restore window from fullscreen
            this.WindowStyle = WindowStyle.SingleBorderWindow;
            this.WindowState = WindowState.Normal;
            this.Topmost = false;
            this.ResizeMode = ResizeMode.CanResize;

            // Switch back to setup screen
            if (TimerScreen != null) TimerScreen.Visibility = Visibility.Collapsed;
            if (SetupScreen != null) SetupScreen.Visibility = Visibility.Visible;

            // Reset input fields
            if (HoursInput != null) HoursInput.Text = "0";
            if (MinutesInput != null) MinutesInput.Text = "5";
            if (SecondsInput != null) SecondsInput.Text = "0";
            
            UpdateTimerDisplay();

            // Reset colors
            var timerTextBrush = this.FindResource("TimerTextBrush") as SolidColorBrush;
            if (timerTextBrush != null)
                timerTextBrush.Color = timerColor.Color;
        }

        protected override void OnKeyDown(KeyEventArgs e)
        {
            base.OnKeyDown(e);
            
            if (e.Key == Key.Space)
            {
                if (TimerScreen?.Visibility == Visibility.Visible)
                {
                    if (isRunning)
                    {
                        timer?.Stop();
                        isRunning = false;
                    }
                    else if (totalSeconds > 0)
                    {
                        timer?.Start();
                        isRunning = true;
                    }
                    ShowControlsTemporarily();
                }
                else if (totalSeconds > 0)
                {
                    StartTimer_Click(this, new RoutedEventArgs());
                }
                e.Handled = true;
            }
            else if (e.Key == Key.Escape)
            {
                ReturnToSetup();
                e.Handled = true;
            }
            else if (e.Key == Key.A && TimerScreen?.Visibility == Visibility.Visible)
            {
                AddTime_Click(this, new RoutedEventArgs());
                e.Handled = true;
            }
        }
    }
}






