Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795871579;
	b=EQHoE6Po4iurBZNHGxDPLGSGNMSZR0y+xfOYWoUbSdCNU5XXWQu/67i3zNpjb43axRWF
	 0XK7xlA9DS6ZHAcgiuJvddKB6P8Om0YbK4wzdVZ2K8vCSFIlpvRj4x1RjkFKUuePhs9a7
	 y4ZfC5kisn8JuKBnucHVdVrlFvwdvYJBTrdmLfcmHiIiHkN5CXM3cLf6ofQ/FxMu5l7c1
	 edN3JnLrOb90g+5H+PYgac9EukGQn6oln44akEBJPxVuViYj3yNGplEtWjl4gBT1TssrS
	 mlm7EA6EdfOSYkXEW88XWtBIXcXXXfXHojV0pHOwkO4vDSQQmxNaxiMXYJ+sCObmeoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795871579;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=EuMmfwPrhg01/gGUn2eAx6rQThSCE6USbgpUdrv/CUc=;
	b=4pg4VhnX/mHaXZLlsHMWy2+/vPPAsv2TWkZ9GPixZYErtvbY7OTI8KdRtS57kY8RUpuW
	 Camh7xoyjpvc2ONo8qClniBXFQDzNQsuOyp7wC20sg768DT/EcKe3Ub2Yy+qIz8zlZlrX
	 ijGIUJp1/cvTSW88arWvqK4OA/iYYInKqqLSOdM6x1zRygwm25HdnxWVn5sudah8mmxxQ
	 cM5I/pxHMi7oi/qV/w75vpF/taUAb00SuvZvH0R8GsebffljD0n0cPNAUJt4dN256znr9
	 y9bRV0iWkmHOLJRm+N/m88mOYFPFZcxXYbZStpXHtsAC8tlqifeQ+BzTHATYKeoKbnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=wPqG32Ev;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E303A606A31C;
	Sat, 28 Nov 2026 13:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E303A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=wPqG32Ev
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0029AA0044;
	Sat, 28 Nov 2026 14:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795871576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EuMmfwPrhg01/gGUn2eAx6rQThSCE6USbgpUdrv/CUc=;
	b=wPqG32EvSmlmKqZJq5N3fXtscHorVnet32RKI63WltddAunV9EDy3TrUgQWse2NYKRlR+a
	35q+5RLWQO5cNQ5HY630fE1KAsByBeGfLUvyFjv0yo9IwZkakkQmmfryksAtxWEkXFNpXC
	/nnLwygJqfrRo2c9GHDnpPe6wtSEgxxP+6s/7328JwmnSHVgaS8tTT4rP9wBuActWhucXf
	oqf5X/XoZODAeQkuKQNNNpZMwKRecDuveA5N66yIQOAatacV+lzxCFQizP0vggfOU6G87J
	Hd6ZyF6gDzdHSpFzOC+GVCBHG6ul3jZdoWyR/5O6rC6pFS87NEAUdjarML1tlA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 28 Nov 2026 14:12:54 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: netdev-bot+sashiko@kernel.org
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierremarinleclercq88@gmail.com,
 dave.stevenson@raspberrypi.com, justin.chen@broadcom.com
Subject: Re: [PATCH net-next v10 8/8] net: bcmgenet: reassemble jumbo frames
 from status block fragments
In-Reply-To: <179586516852.3135.10254038893964145277@kernel.org>
References: <20261127-nb-genet-mtu-nn-v2-v10-8-749c7cc45d97@tipi-net.de>
 <179586516852.3135.10254038893964145277@kernel.org>
Message-ID: <c79e49d9dfe3e90603025a6d014cd224@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 28.11.2026 12:26, netdev-bot+sashiko@kernel.org wrote:

> [...]

> [Severity: Medium]
> Can a split frame end with a descriptor that holds only its status
> block plus DMA_EOP, with no payload?

Not on a bcm2711. I tested both boundaries reachable with MTU 9000, 3582
and 7166, 200 frames each. All bytes were delivered and I observed no 
errors.
EOP landed on the last descriptor that had data.

> [...]

> [Severity: Medium]
> For a reassembled frame, dma_flag at the deliver label holds the status
> word of the final EOP descriptor. The stats code in bcmgenet_desc_rx()
> then does:
> 
> 	if (dma_flag & DMA_RX_MULT)
> 		u64_stats_inc(&stats->multicast);
> 	else if (dma_flag & DMA_RX_BRDCAST)
> 		u64_stats_inc(&stats->broadcast);
> 
> The commit message says the status blocks of a split frame differ
> ("Only the last block holds the checksum of the whole frame"). It
> doesn't say which block carries the DMA_RX_MULT and DMA_RX_BRDCAST
> classification. The MAC already has that from the destination address
> when it writes the SOP block.
> 
> If these flags are set only in the SOP status block, would jumbo
> multicast and broadcast frames go uncounted in stats->multicast and
> stats->broadcast?

They do, but the SOP block has no flags either.

The MAC just stops setting DMA_RX_BRDCAST and DMA_RX_MULT above 1518 
bytes,
same boundary at MTU 1500 as at 9000. So a full size VLAN tagged 
broadcast
frame is already miscounted today.

I'd make this a separate fix for net, using skb->pkt_type instead.

> Could the SOP descriptor's flags be saved when frag_head is set up and
> used here instead?
> 
>> 
>>  		/* Build SKB from the page - data starts at hard_start,
>>  		 * frame begins after RSB(64) + pad(2) = 66 bytes.
>>  		 */
> 
> [ ... ]
