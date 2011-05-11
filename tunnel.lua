Tunnel = {}

TUNNEL_PROBABILITY = 4
tunnel_start_back = love.graphics.newQuad(0,0,58,100,512,512)
tunnel_end = love.graphics.newQuad(58,0,133,100,512,512)

function Tunnel.create()
	local self = {}
	self.x = WIDTH+58
	self.alive = true
	return self
end

function Tunnel.update(self,dt)
	if self.alive == false then
		return
	end

	self.x = self.x - global_speed * dt * TRACK_SPEED

	if self.x < -150 then
		self.alive = false
	end
end

function Tunnel.drawBack(self)
	if self.alive == true then
		love.graphics.drawq(imgTerrain,tunnel_start_back,self.x-58,0)
	end
end

function Tunnel.drawFront(self)
	if self.alive == true then
		love.graphics.drawq(imgTerrain,tunnel_end,self.x,0)
	end
end
