

<div class="modal fade" id="addBatch" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add New Batch</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">x</span>
				</button>
			</div>
			<div class="modal-body">
				

<form class="" ng-submit="addBatch()">

    <div class="form-group row">

        <div class="col-lg-6 col-md-4 col-sm-12 col-xs-12">
            <label> Batch Name <span class="errormsg">*</span></label> 
            <input class="form-control" placeholder=" Batch Name " type="text" ng-change="setflag()" id="BatchName" ng-model="BatchName">
            <p class="errormsg" ng-show="batchNameError == 1">{{batchNameMsg}}</p>
        </div>

        <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
        <label> Batch Start Time <span class="errormsg">*</span></label> 
        <div class="input-group clockpicker">
            <input type="text" class="form-control" ng-change="setflag()" id="BatchStartTime" ng-model="BatchStartTime">
            <span style="border-radius: 0px 4px 4px 0px;" class="input-group-addon"> 
                <i class="fa fa-clock-o"></i>
            </span>
        </div>
        <p class="errormsg" ng-show="startTimeError == 1">{{startTimeMsg}}</p>
        </div>

        <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
        <label> Batch End Time <span class="errormsg">*</span></label> 
        <div class="input-group clockpicker">
            <input type="text" class="form-control" ng-change="setflag()" id="BatchEndTime" ng-model="BatchEndTime">
            <span style="border-radius: 0px 4px 4px 0px;" class="input-group-addon"> 
                <i class="fa fa-clock-o"></i>
            </span>
        </div>
        <p class="errormsg" ng-show="endTimeError == 1">{{endTimeMsg}}</p>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <label> Description </label>
            <textarea cols="80" id="editor2" name="editor2" rows="10" data-sample-short>
                Description
            </textarea>
        </div>
    </div>

    <hr>

    <div class="form-group row">

        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
        </div>

    </div>
	
			</div>
			<div class="modal-footer">				
				<button type="submit" ng-disable="batchSpin == 1" class="btn btn-md btn-success btn-block">
                Add Batch <i ng-show="batchSpin == 1" class="fa fa-spinner fa-pulse"></i></button>
                </form>	
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>


<script>
    $('.clockpicker').clockpicker({
    placement: 'bottom',
    align: 'left',
    donetext: 'Done',
    autoclose: true,
    	afterDone: function() {
            console.log("after done");
        }
    });
</script>


