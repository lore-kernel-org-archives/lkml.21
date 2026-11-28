Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795871273;
	b=cF69G0pKQuL4gjR0gdxO7wmZb6fFhTDt+FQPJJOJXjq7Cbqq6HAeP5ZNqzl94zP6xDxI
	 8W4gXQP5W+9x7fGDyZEe6lJ9WyYlfboElJl2alJc/mwMhPIwmHqz9qZZMMDlTPJ1ec0jS
	 G/b+bE2h/mD8b3h4598HVuMXzLp5UdHjLk+3/l7piydpy08zir9t0yetSr4i5YAJNUIz4
	 /aAS+JIS+ra4D6ZY48m3/dk6iRBlGHdf2SA5HjyTyk0WH2o5F+pt5SCPh7qmB5iSZ3tQx
	 Wj8NCJ/AFKsOSGllRH1DZ1iIunUWebTRLyXphaCCt80h2niCVmgIUmujSxby5u5L4jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795871273;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=MgMdCErDAl9lNyx3ZArtb3lI+zucIqO5QOch/2GPlbY=;
	b=VJBRV0/28pqVrrrpQ1T066unodhuvsnyy6BdFvGaQN9ygRfWMsOYQXfBJoXks5nUDi+9
	 OTuhtrSbzX7d/n+iK3j27Pp0ZK0294H8QDwQ89BDxaCfhRmojCs+kFkm3IRUF19sEp4CV
	 as0zSA6uNR1ofdMND198T0+lRzopIHWVwM1TAiTTmWT9H8LmuafsABCBj+IrEGCvQ2u1C
	 T0Ref0rihpApYJnVM70L+o3f+sJ+nNf35+0hLRhKVRas5zCZKUT6FamQEXFzos+Zswne3
	 JhSAWbnRtrymbostGGB1dEM0I0c1EGECFJr+LACQ0F2POu+4Ve0Q63BmgnyKbUxs8gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b="1I477tZ/";
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B1606A31C;
	Sat, 28 Nov 2026 13:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=1I477tZ/
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D963A0E36;
	Sat, 28 Nov 2026 14:07:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795871271; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MgMdCErDAl9lNyx3ZArtb3lI+zucIqO5QOch/2GPlbY=;
	b=1I477tZ/fI/TN4Z3BClLIGq3rOVIHBtCPd9i+MNTLHouDQov+ESneeStBQozBji8MCFrMm
	exPAIoql1I9XsDJaA+RAJ+PpIJpKm0lHbI8Zr9XuzicAv4BqZxb94WYRLiOL899wkAcxfU
	Rdw8JixW9WVNGPFoidm/6g6An96wP1SLerwhHQg7ayqkgZHiudd08yLrCUqHC5kxUD5IMl
	H5b8K57Z4D30KX0afbUGdYCih69FCAcQWvR7KaO1UWYVD0ZzbG4WT+X2Ak+tE6gOjRi260
	HEatwyW7U7Il3ouUzps0Yf3H41kHVLaBSegmyV+L1aFMaW1od0f3PxfIY36wDg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 28 Nov 2026 14:07:50 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: netdev-bot+sashiko@kernel.org
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierremarinleclercq88@gmail.com,
 dave.stevenson@raspberrypi.com, justin.chen@broadcom.com
Subject: Re: [PATCH net-next v10 7/8] net: bcmgenet: allow the MTU to be
 changed
In-Reply-To: <179586516710.3135.10478962975495152164@kernel.org>
References: <20261127-nb-genet-mtu-nn-v2-v10-7-749c7cc45d97@tipi-net.de>
 <179586516710.3135.10478962975495152164@kernel.org>
Message-ID: <7f4cf6c6e06c33c57bfa75042c98b96d@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 28.11.2026 12:26, netdev-bot+sashiko@kernel.org wrote:

> [...]

> [Severity: Medium]
> What happens to the RX buffers here if the DMA engine does not halt?

They get freed while the hardware may still write into them. But this is
not new, close, suspend and resume all ignore the teardown result too.
I'm not aware of any bug reports in the field regarding this.

I can fix this in a fllow up series.

> [...]
