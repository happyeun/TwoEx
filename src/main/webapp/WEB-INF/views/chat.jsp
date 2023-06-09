<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>Hello WebSocket</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script charset="utf-8" src="/res/js/app.js"></script>
</head>
<body>
<noscript><h2 style="color: #ff0000">Seems your browser doesn't support Javascript! Websocket relies on Javascript being
    enabled. Please enable
    Javascript and reload this page!</h2></noscript>
<div id="main-content" class="container">
    <div class="row">
        <div class="col-md-6">
            <form class="form-inline">
                <div class="form-group">
                    <label for="connect">WebSocket connection:</label>
                    <button id="connect" class="btn btn-default" type="submit">Connect</button>
                    <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">Disconnect
                    </button>
                </div>
            </form>
        </div>
        
        <div class="col-md-6">
            <form class="form-inline">
                <div class="form-group">
                    <label for="name">What is your name?</label>
                    <input type="text" id="name" class="form-control" placeholder="Your name here...">
                </div>
            </form>
        </div>
    </div>
    
    <br>
    <br>
    
    <div class="row">
    	<div class="col-md-2">
     		<a href="#">spring</a>
    	</div>
    	<div class="col-md-2">
    		<a href="#">python</a>
    	</div>
    	<div class="col-md-2">
    		<a href="#">C</a>
    	</div>
    	<div class="col-md-2">
    		<a href="#">vue</a>
   		</div>
    	<div class="col-md-2">
    		<a href="#">ruby</a>
    	</div>
    </div>
    <br>
    <br>
    
    <div class="row">
        <div class="col-md-12">
            <table id="conversation" class="table table-striped">
                <thead>
                <tr>
                    <th colspan="2">Chat (room is : <span id="currentRoom"> </span>)</th>
                </tr>
				<tr>
					<th>
						<input type="text" id="content" class="form-control">
					</th>
					<th>
						<button id="send" type="button" class="form-control" >Send</button>
					</th>
				</tr>
                </thead>
                <tbody id="chats">
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>