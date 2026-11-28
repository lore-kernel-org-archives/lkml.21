Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795871090;
	b=0V8rpvRuotCUidkXTwcXYFcSBuUzub4iz0i+Dj57IZJJR88Sn8TIckhDx7R3MmGk9tgN
	 Rsk6Mwtx1VIAKf6O90lm775+WSISUokoyNkb5Iz4Kt19VDZOgQsjefW+6blx2V+/MUhmL
	 YqmwCUCMph8CFsk/LNIo7ufwOA+5vMetuCncEQzXcdyXGHDLUvtW/+z3og7HuhynGFBrI
	 Z2m2elY1QaEyF6nLdPxCIJOBSb8S8P+UulF/Jns2jU2MmIp83rciFJe55Lhu2a1mPcEmx
	 hybpH2qdrRe0Uj8uuKGzagMidsMkpTJl3DQRSQx+OsezjQzEpVBZwfnw3e54uINqTvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795871090;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=/4xlmphKPEuTkxuDlUvccGIF9AmRB/5/CxZIbSABtO0=;
	b=VHQcyMMNQGlSLhnU87KWdvNGsqltltzk+Z2ZfLHrf1J2gl3yZtkEPdZ7DMMA4HoF49FJ
	 gecBxwWM8lWhAk2E4TmzubU2nvV60wGajzDfZT02cNKbM1NztIXww0NaxojzllmizsdA7
	 fL0RPxVHABPOK8dvmFu3TZKOP4G0DoKrWSyya48BTqTTxSv9w0E6TqLwdCZXYuk5/NyPb
	 KX0RU5bPtD1dBl0Y0iUlxW3ZT++4b3JJ1mJJHUHntbH88+8WWoJlb67bKPthUqW1w60t1
	 j2c9dDp/WnCjspUXA3U0Cf9vNK3J9Jmu0ArkbIxNTDP+JSHGOgDY1cx/RAoExAUPyHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b="sRb/z7OB";
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B03606A31C;
	Sat, 28 Nov 2026 13:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=sRb/z7OB
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16FD7A0044;
	Sat, 28 Nov 2026 14:04:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795871087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/4xlmphKPEuTkxuDlUvccGIF9AmRB/5/CxZIbSABtO0=;
	b=sRb/z7OBhLtzcVoFXxtIsvtI0LpnWM99UHKIgh2BhE80zfaK5XkuH71okRp2MddjApbeOR
	XXHlhKekyuLjXIYWLx9dN2/mNY+tqy0BhJ91n73pT0lF9cEEXLhZOrJ8KOpNMeAQETHjBl
	F9FvOku1MAV7k8vHuUSB+Bqyv30VBuoL2J+NBgE7I9672uOvw//PpkjtekzSLcbC2izqBy
	iwSCVK5dRmxSaKIYyjCrCSyJIAGHExXyWKCIcQDTIRZU5nNopkFkKJHKrzwaRkgE1bsAPH
	NfAQ9/Q2whzz1CpgmQ/ZTr66+4Gyrd/eMVhwPbgnDytcgXOHb9A9cl05OQwdrQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 28 Nov 2026 14:04:45 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: netdev-bot+sashiko@kernel.org, florian.fainelli@broadcom.com
Cc: opendmb@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, f.fainelli@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 pierremarinleclercq88@gmail.com, dave.stevenson@raspberrypi.com,
 justin.chen@broadcom.com
Subject: Re: [PATCH net-next v10 5/8] net: bcmgenet: split frames that end
 just past the transmit threshold
In-Reply-To: <179586516579.3135.9485431888259061826@kernel.org>
References: <20261127-nb-genet-mtu-nn-v2-v10-5-749c7cc45d97@tipi-net.de>
 <179586516579.3135.9485431888259061826@kernel.org>
Message-ID: <62ca72824c5079c2266be2545337e55c@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 28.11.2026 12:26, netdev-bot+sashiko@kernel.org wrote:

> [...]

> [Severity: Medium]
> bcmgenet_probe() computes the window for every part as:
> 
>     priv->tx_thld_window = priv->dma_max_burst_length * 
> ENET_BURST_UNIT;
> 
> The 8 bytes per count comes from a single bcm2711 measurement at burst
> 0x08. The commit message says the bcm2711 sends nothing at 0x10, so the
> 0x10 case (16 * 8 = 128 bytes) was never measured.
> 
> The 46 byte result shows the unit is at least about 5.75 bytes per 
> count.
> Does it show that the unit is exactly 8, or that the window grows 
> linearly
> with the burst count?
> 
> v5_plat_data and bcm7712_plat_data both use DMA_MAX_BURST_LENGTH 
> (0x10).
> Their real window could be wider than 128 bytes, for example because of 
> a
> wider bus. In that case bcmgenet_xmit() would send a frame with
> 
>     tx_thld_len + tx_thld_window <= skb->len < real window end
> 
> without splitting it. If a shorter frame follows, wouldn't that bring 
> back
> the Tx DMA stall where every later bcmgenet_init_dma() fails?
> 
> Later in the series, "net: bcmgenet: allow the MTU to be changed" 
> raises
> max_mtu for every GENET_IS_V5() part, so this becomes reachable on 
> those
> 0x10 parts. Has the window been verified on any part that programs 
> 0x10?

No. 46 bytes is what I measured on a bcm2711, which programs 0x08. The
8 bytes per count is a fit based on that point, rounded up to 64 for
margin.

Florian: Do you know (or can check the RTL) if the window is related to 
DMA_SCB_BURST_SIZE at all?

> [...]

Nicolai
