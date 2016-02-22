# This imports all the layers for "DropTicket_ticket_detail" into dropticket_ticket_detailLayers
dropticket_ticket_detailLayers = Framer.Importer.load "imported/DropTicket_ticket_detail"
Framer.Device.contentScale = 1.5
# Background, Import, Position and Animation Defaults –––––––––––––––––––
document.body.style.background = "#339bcb"

# This imports all the layers for "DigiPen_shop.psd" into digipen_shopPsdLayers
psdLayers = Framer.Importer.load "imported/DropTicket_ticket_detail.psd"

#psdLayers.root.center() #uncomment for browser centering
psdLayers.root.shadowY = 3
psdLayers.root.shadowBlur = 15
psdLayers.root.shadowColor = "rgba(0, 0, 0, 0.6)"
psdLayers.root.clip = true

Framer.Defaults.Animation =
	curve: "spring(200,20,0)"
	time: 0.25

bus_icon = psdLayers["bus_icon"]
bus_text = ['Corsa semplice', 'Start Romagna', 'Durata: 1 ora 30 minuti']
parking_icon = psdLayers["parking_icon"]
parking_text = ["Sosta breve", "AMT Catania", "Durata: 1 ora"]
metro_icon = psdLayers["metro_icon"]
metro_text = ["Corsa singola", "ATM Milano", "Durata: 90 minuti"]
bike_icon = psdLayers["bike_icon"]
bike_text = ["Corsa media", "GoBike", "Durata: 3 ore"]

Ticket = (type, ticketId) ->
	icons = [bus_icon, parking_icon, metro_icon, bike_icon]
	texts = [bus_text, parking_text, metro_text, bike_text]
	gradients = ["linear-gradient(#ffb642, #e69b23)", "linear-gradient(#3492f2, #1a78d8)", "linear-gradient(#ff5c5f, #d93639)", "linear-gradient(#56d51a, #3cbb00)"]
	textSizes = ["36px", "28px", "24px"]
	textStyles = ["bold", "normal", "italic"]
	textColors = ["#000", "#888", "#888"]
	textWeights = [500, 400, 400]
	
	ticket = new Layer
		superLayer: psdLayers["BG"],
		x: 0, y: 0, width: 688, height: 176,
		backgroundColor: "#ffffff", borderRadius: "4px",
		shadowY: 4, shadowBlur: 0, shadowColor: "rgba(0, 0, 0, 0.15)"
	ticket.open = false
	ticket.ticketId = ticketId
	ticket.centerX()
	ticket.colorbox = new Layer
		superLayer: ticket,
		x: 8, y: 8, width: 160, height: 160, borderRadius: "4px",
	ticket.colorbox.style = background: gradients[type]
	ticket.colorbox.states.add
		maximized: {width: 672}
	ticket.icon = new Layer
		superLayer: ticket.colorbox,
		midX: ticket.colorbox.width * 0.5, midY: ticket.colorbox.height * 0.5,
		width: icons[type].width, height: icons[type].height
		image: icons[type].image
	ticket.button = new Layer
		superLayer: ticket,
		backgroundColor: "rgba(0, 0, 0, 0.15)", borderRadius: "4px",
		maxX: ticket.width-24, midY: ticket.height*0.5, width: 113, height: 49,
		shadowY: 2, shadowBlur: 1, shadowColor: "rgba(0, 0, 0, 0.3)"
	ticket.button.html = "Valida"
	ticket.whiteButton = new Layer
		superLayer: ticket, opacity: 0,
		backgroundColor: "rgba(255, 255, 255, 1)", borderRadius: "4px",
		maxX: ticket.width-24, midY: ticket.height*0.5, width: 113, height: 49,
		shadowY: 2, shadowBlur: 1, shadowColor: "rgba(0, 0, 0, 0.3)"
	ticket.whiteButton.html = "Valida"
	buttonStyle = 
			fontFamily: "Roboto", lineHeight: '52px', textAlign: "center"
			fontSize: textSizes[i], fontStyle: textStyles[i],
			fontWeight: textWeights[i], color: '#000',
	ticket.button.style = ticket.whiteButton.style = buttonStyle
	ticket.texts = for textValue, i in texts[type]
		text = new Layer
			backgroundColor: "transparent"
			superLayer: ticket,
			x: 184, y: i*44,	width: 360, height: 88,
		text.html = textValue
		text.style = 
			fontFamily: "Roboto", lineHeight: '88px',
			fontSize: textSizes[i], fontStyle: textStyles[i],
			fontWeight: textWeights[i], color: textColors[i],
		text
	ticket.whiteTexts = for textValue, i in texts[type]
		text = new Layer
			backgroundColor: "transparent"
			superLayer: ticket, opacity: 0,
			x: 184, y: i*44,	width: 360, height: 88,
		text.html = textValue
		text.style = 
			fontFamily: "Roboto", lineHeight: '88px',
			fontSize: textSizes[i], fontStyle: textStyles[i],
			fontWeight: textWeights[i], color: 'white',
		text
		
	ticket.qrCode = new Layer
		superLayer: ticket
		x:0, y:176, width:264, height:264,
		image: "https://chart.googleapis.com/chart?chs=264x264&cht=qr&chl=DropTicket&choe=UTF-8&chld=H"
	
	ticket.QRtexts = for lbl, i in ["ID", "Data di acquisto"]
		rowText = new Layer
			superLayer: ticket
			x: 256, y:176 + i*88 + 44, width: 408, height: 88,
			backgroundColor: "transparent"
		rowText.html = lbl
		rowText.style = 
			fontFamily: "Roboto", lineHeight: '88px',
			fontSize: "28px", fontStyle: "normal",
			fontWeight: 500, color: '#000', textAlign: "left"
		rowText
		
	ticket.QRtexts = for lbl, i in ["PotEjjrbxfPr7ya0o", "28 ago 17:28"]
		rowText = new Layer
			superLayer: ticket
			x: 256, y:176 + i*88 + 44, width: 408, height: 88,
			backgroundColor: "transparent"
		rowText.html = lbl
		rowText.style = 
			fontFamily: "Roboto", lineHeight: '88px',
			fontSize: "28px", fontStyle: "normal",
			fontWeight: 500, color: '#000', textAlign: "right"
		rowText
		
	ticket.textsDown = for lbl, i in ["Linea", "Check-in"]
		rowText = new Layer
			superLayer: ticket
			x: 32, y:440 + i*88, width: 408, height: 88,
			backgroundColor: "transparent"
		rowText.html = lbl
		rowText.style = 
			fontFamily: "Roboto", lineHeight: '88px',
			fontSize: "36px", fontStyle: "normal",
			fontWeight: 500, color: '#000', textAlign: "left"
		rowText
		
	ticket.textsDown = for lbl, i in ["A", "29 ago 12:24"]
		rowText = new Layer
			superLayer: ticket
			x: 32, y:440 + i*88, width: 632, height: 88,
			backgroundColor: "transparent"
		rowText.html = lbl
		rowText.style = 
			fontFamily: "Roboto", lineHeight: '88px',
			fontSize: "36px", fontStyle: "normal",
			fontWeight: 500, color: '#000', textAlign: "right"
		rowText
		
	ticket.ticketMaximize = () ->
		this.open = true
		this.states.switch "maximized"
		this.colorbox.states.switch "maximized"
		this.button.animate properties: opacity: 0
		this.whiteButton.animate properties: opacity: 1
		for i in this.texts
			i.animate properties: opacity: 0
		for i in this.whiteTexts
			i.animate properties: opacity: 1
	
	ticket.ticketMinimize = () ->
		this.open = false
		this.states.switch "minimized"
		this.colorbox.states.switch "default"
		this.button.animate properties: opacity: 1
		this.whiteButton.animate properties: opacity: 0
		for i in this.texts
			i.animate properties: opacity: 1
		for i in this.whiteTexts
			i.animate properties: opacity: 0
			
	ticket.ticketMinimizeOffset = () ->
		this.open = false
		this.states.switch "minimizedOffset"
		this.colorbox.states.switch "default"
		this.button.animate properties: opacity: 1
		this.whiteButton.animate properties: opacity: 0
		for i in this.texts
			i.animate properties: opacity: 1
		for i in this.whiteTexts
			i.animate properties: opacity: 0
			
	ticket.closeAll = (ticketId) ->
		for i in this.siblingLayers
			if ticketId is -1 or i.ticketId < ticketId
				i.ticketMinimize()
			else
				i.ticketMinimizeOffset()
	
	ticket.on Events.Click, ->
		
		if this.open is false
			this.closeAll(this.ticketId)
			this.superLayer.animate
				properties:
					scrollY: (this.ticketId-1) * (ticketClosedHeight + 16) - 8
			this.ticketMaximize()
			
		else
			this.closeAll(-1)
			this.ticketMinimize()

	ticket	#return value

#––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

tickets = []

ticketClosedHeight = 176
ticketOpenHeight = ticketClosedHeight + 5 * 88
numberOfTickets = 8
for i in [0..numberOfTickets-1]
	type = Math.floor(Math.random() * 4)
	tickets[i] = new Ticket(i%4, i)
	if i==0
		tickets[i].states.add
			minimized: {y: 8; height: 176}
			maximized: {y: 8; height: ticketOpenHeight}
	if i>0
		do (i) ->
			tickets[i].states.add
				minimized: {
					y: (ticketClosedHeight + 16) * i;
					height: ticketClosedHeight;
				}
				maximized: {
					y: (ticketClosedHeight + 16) * i;
					height: ticketOpenHeight
				}
				minimizedOffset: {
					y: (ticketClosedHeight + 16) * (i-1) + ticketOpenHeight + 16;
					height: ticketClosedHeight
				}
	tickets[i].states.switch "minimized"

psdLayers["BG"].scroll = true