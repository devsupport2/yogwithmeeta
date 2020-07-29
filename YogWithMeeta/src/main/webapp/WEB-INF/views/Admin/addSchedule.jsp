

<div class="modal fade" id="addSchedule" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add New Schedule</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">x</span>
				</button>
			</div>
			<div class="modal-body">
				

                <form class="" ng-submit="addSchedule()" ng-init="intializeDays()">
                    <div class="form-group row">

                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <label> Schedule Name <span class="errormsg">*</span></label> 
                            <input class="form-control" placeholder=" Schedule Name " type="text" ng-model="scheduleName" id="scheduleName">
                            <p class="errormsg" ng-show="scheduleNameError == 1">{{scheduleNameMsg}}</p>
                        </div>
                        <div id="example"
                            class="col-lg-3 col-md-6 col-sm-12 col-xs-12 demo-section k-content">
                            <label> Start Date <span class="errormsg">*</span></label>
                            <input class="KendoDate" id="fromdatetimepicker" title="fromdatetimepicker" ng-model="fromdatetimepicker" style="width: 100%;" />
                            <p class="errormsg" ng-show="startDateError == 1">{{startDateMsg}}</p>
                        </div>
                        <div id="example"
                            class="col-lg-3 col-md-6 col-sm-12 col-xs-12 demo-section k-content">
                            <label> End Date <span class="errormsg">*</span></label> 
                            <input class="KendoDate" id="todatetimepicker" title="todatetimepicker" ng-model="todatetimepicker" style="width: 100%;" />
                            <p class="errormsg" ng-show="endDateError == 1">{{endDateMsg}}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12 team-members">
                            <label> Select Schedule Days </label>
                            <div class="form-group input-group">
                                <select id="demo1" ng-model="days" ng-options="obj.value as obj.name for obj in daysList" id="days" ng-change="setDays(days)" multiple>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label> Select Batch <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control" ng-model="BatchID" id="BatchID" ng-change="getBatchTimingsById(BatchID)">
									<option value="">Select Batch</option>
									<option ng-repeat="item in getBatchNameList" value="{{item.batchId}}">{{item.batchName}}</option>
								</select> <span class="input-group-btn">
									<button style="border-radius: 0px 4px 4px 0px;" title="Add new Batch" data-toggle="modal" data-target="#addBatch" class="btn btn-primary" type="button">
										<i class="fa fa-plus"></i>
									</button>
								</span>

							</div>
							<p class="errormsg" ng-show="batchIDError == 1">{{batchIDMsg}}</p>
						</div>


                        <div class="col-lg-2 col-md-12 col-sm-12 col-xs-12">
                            <label> Batch Start Time </label>

                            <div class="form-group input-group">
                                <input disabled type="text" placeholder="00:00" ng-model="batchTimings.batchStartTime" class="form-control"> 
                                <span style="border-radius: 0px 4px 4px 0px;" class="input-group-addon"> 
                                    <i class="fa fa-clock-o"></i>
                                </span>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-12 col-sm-12 col-xs-12">
                            <label> Batch End Time </label>

                            <div class="form-group input-group">
                                <input disabled type="text" placeholder="00:00" ng-model="batchTimings.batchEndTime" class="form-control"> 
                                <span style="border-radius: 0px 4px 4px 0px;" class="input-group-addon"> 
                                    <i class="fa fa-clock-o"></i>
                                </span>
                            </div>
                        </div>
                    </div>
	
			</div>
			<div class="modal-footer">				
				<button type="submit" class="btn btn-md btn-success btn-block"> Add Schedule </button>
                </form>	
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>
<%@include file="addBatch.jsp" %>

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


