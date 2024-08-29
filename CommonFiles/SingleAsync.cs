namespace SingleAsyncComponent
{
	public class SingleAsync
	{
		private AsyncAction CurrentAction;

		//Helps to avoid executing a method multiple times in a defined lapse
		public void RequestExecution(int milisecondsDelay, Action action)
		{
			if (CurrentAction != null)
				CurrentAction.IsCancelled = true;
			CurrentAction = new AsyncAction();
			CurrentAction.Action += async (AsyncAction) =>
			{
				await Task.Delay(milisecondsDelay);
				if (!AsyncAction.IsCancelled)
					action();
			};
			CurrentAction.Run();
		}

		public void RequestCancel() => CurrentAction.IsCancelled = true;

		private class AsyncAction
		{
			public event Action<AsyncAction> Action;
			public bool IsCancelled { get; set; } = false;
			public void Run() => Action(this);
		}
	}
}
