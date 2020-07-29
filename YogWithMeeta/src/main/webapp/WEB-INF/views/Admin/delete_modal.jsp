<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Confirm your action</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">x</span>
				</button>
			</div>
			<div class="modal-body">
				Are you sure you want to delete this record?				
			</div>
			<div class="modal-footer">				
				<button class="btn btn-danger" ng-click="delete(id)">Delete</button>
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>