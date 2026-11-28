Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795870372;
	b=5fGHye1tjgUyjGMKANR38YVGpqOwVumM3nVaxUsz3ZXm8kXJ31k+TzgBeO0cRlpp7D33
	 ftJ703L5NCE0wyMaT78hNDN2ESjnD/BIpcqr//mm6C398E0czBcydIhBy7ftvl9JmctFz
	 qIS7CAWdyROKZ1A5RtQ5amqfVgOHRPBXYOHjxUigxSzUFhZmy2RHazHlYMAnBS6Mldu/I
	 P/nYjgN5jIHvpIQzpOZ0oY2Y+LctpG1VlQNOXVNdVO4Vk6H52NEoArwfAWl/BPx+3nPSP
	 ZTP50xEF4zbdgRt56trhFG3/H+GT6H5l5w7uaz1j+6LPoBPj7w0LvE+5WN6Mniy8LQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870372;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=yLW/dyD8I6PEk1YDdZv/3axmWhb2lbqGvW4A3W54gqw=;
	b=HTyibniGB79tXAJta54CbbsbtF4cj0TOB5gmsRfR3riDcMSex86PaCpdaCimKZNdYon9
	 RN5zgLXH/dY2ikSs9axxIGVylwPwKMpsXTN9klqlOnhyD3OCjCkJZ/haUftTvXHOT5f/x
	 xbQQD8l7IK4Df4Kx4Sg2EFAXxaQpPIcxaK8+rODKvIM4KEyonZXHN+VA3Ar+93OgdgreP
	 cIkAVk75HEGppht4jyhfVC8ZMkLfFzuMWuMGPal4wNTsC5bfWpVZJep2UOEyizI73BmyC
	 1Gq1sM5KOPrIWAVmM2gwv91KH+WC7ghxs2GlfRwK8Y2Hf+mwQtVNNRRjbiC7EL4JzcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=r55aQfUH;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA7F606A31F;
	Sat, 28 Nov 2026 12:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA7F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=r55aQfUH
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48118A0011;
	Sat, 28 Nov 2026 13:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795870369; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yLW/dyD8I6PEk1YDdZv/3axmWhb2lbqGvW4A3W54gqw=;
	b=r55aQfUHJMuYaaZACVD3ZWVg+sKHEcw2eZYaXIxordLm6MDWKTzov+zDXenxXz+8FieGb8
	+TqY8Zwgbw/2Fg6Iu/jmI/bQRN059J5C5BCu+lm46zh9L5O+WZcV2djEMNk1d9WjqdzPit
	/ecXS0I3P0Ma35TVV5LwDpHS3wSpcyMJmdzo6085yRrTC0dUel05hfLEe+nWOfWUrT1ogQ
	yC9NVybRT/x/2sD0pYHLAq62IlD22Q+xcGKp7+0SASHA2l+3Cpm8tZruMK+x23y1yjO5QL
	PzjKRFB9JqS1USGsO1r3oHvYP1adMJ9a50OfEoRYtGjqHtcDmK+AqEjOBkdYfA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 28 Nov 2026 13:52:49 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Valerio
 <pvalerio@redhat.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Vineeth Karumanchi
 <vineeth.karumanchi@amd.com>
Subject: Re: [PATCH net-next v9 2/3] net: macb: implement
 ethtool_ops.get|set_channels()
In-Reply-To: <20261127-macb-set-channels-v9-2-0b3addec7886@bootlin.com>
References: <20261127-macb-set-channels-v9-0-0b3addec7886@bootlin.com>
 <20261127-macb-set-channels-v9-2-0b3addec7886@bootlin.com>
Message-ID: <a541c74979251cfff2494537f8d42ece@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Théo

> [...]

> @@ -3405,16 +3427,28 @@ static void macb_context_swap_end(struct macb 
> *bp,
> 
>  	lockdep_assert_held(&bp->mac_cfg_lock);
> 
> -	/* Swap contexts & give buffer pointers to HW. */
> +	/* Swap contexts & give buffer pointers to HW.
> +	 * !new_ctx means that the swap failed and we keep the old context.
> +	 */
> 
> -	old_ctx = bp->ctx;
> -	WRITE_ONCE(bp->ctx, new_ctx);
> -	wmb(); /* ensure IRQ enabled below read the new context */
> -	macb_init_buffers(bp);
> +	if (new_ctx) {
> +		old_ctx = bp->ctx;
> +		WRITE_ONCE(bp->ctx, new_ctx);
> +		wmb(); /* ensure IRQ enabled below read the new context */
> +
> +		macb_init_buffers(bp);
> +
> +		/* Clear DQL (only on successful context swap). */
> +		for (q = 0; q < bp->max_num_queues; ++q)
> +			netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev,
> +								  q));
> +	} else {
> +		gem_shuffle_tx_rings(bp);
> +	}

Under load the frame at txq->tail can already be sent, so index 0
has TX_USED after the shuffle. Doesn't Tx stall there?

Maybe reclaim completed frames before the shuffle?

> [...]

Thanks,
Nicolai
