Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795865169;
	b=Y4me62kzFFXJuf/X9fhIL3ijWMyeEZXvI/CR4gIe83niU50iqXzNygad1casy2kRn+nI
	 wn8Csn49jmDs52eeR0N6hERfe144l9jjsHdxkH34tigmsX3zsiwuyDxQhlc6cmI4CfPOL
	 SNEDSzRTdc+ffMKQJBTDvg251mXlZDj3Sod0z0IWPnWOmXG6vU3JXvSXUBQXunJA62ouO
	 mpDKhm90XeKOZbgTD5EKLvupxDJ4dhUmW3i7c08Gd6juCbviplpBvD0sAUA4qcYcsdFkC
	 370KnK74TqdyXFO2FkSD+rMxsA/zrIqM5gw/btrYs7lI+ypiEdUejZjYPA2+juabXYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795865169;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=M3vPYBJiPxyLP36lahQYU95y0TVImom/Y+A7y5gQtDU=;
	b=CRWlHDq02iI1yYJYVxvqxmzJ3jIbBjxkQT8ywV9qHRyTlEoFT7UZiPnImoSmfOZghULo
	 E0m91xSRpcb4kXjoVf5OUXTLctc91yC37Mew0f1NaiBom+G5BvF8lInmnrlNjPwfaTEUb
	 ltqtBg0PaEILysccCAeF/MdsjVTo0oQtUsVZKKQF1CfWxYyApKtGWhCS9efWRS1EOQHQk
	 8ERjdbWk7S9gVsAoRlsrNFWi9+J2XaLUPE1oJzTz7huHFiFN6V7xDSX//PWkAGVl6jsDB
	 RGM7B66ARQKuxu0dxyQa5SuLtc2fWVsCDHltX/UiGCv/tTh7IN9QR5YDCxf2opqNQVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C8LVZOEh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF323606A683;
	Sat, 28 Nov 2026 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C8LVZOEh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E503F1F008A0;
	Sat, 28 Nov 2026 11:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795865169;
	bh=M3vPYBJiPxyLP36lahQYU95y0TVImom/Y+A7y5gQtDU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=C8LVZOEhan5kZMS4R5XTDV7ZZuytAZCD4Z4CPxh/AJTnIGx9yPW0g8RfjqMfVPMke
	 EoBxCxKEzs6afbuS6hVZ1B6vqVkKLi+kXJd7NPL+CBLt3RMfaCblySQ5Z82p4w9uxF
	 DbIhaUw2hwua5zbrhId1lNKnEnmmfwepjKIn0mmejeixGjZ1Jc3sTnliiEOzZogGrG
	 eNfZTNFtshOO1+4wIxu5WluvDzm6q2GYflSM/R6+mEF5i+bPUjpVPP+EvgfsYlS2R3
	 VlLIHiOsPuQZR08n8ghQY2Ra4wlFRl3Q0UfDzwyk9OPsRSiJn1hSsVquISOTC5auhH
	 ZbvYNBLTM1tgw==
Subject: Re: [PATCH net-next v10 8/8] net: bcmgenet: reassemble jumbo frames
 from status block fragments
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 pierremarinleclercq88@gmail.com, dave.stevenson@raspberrypi.com,
 justin.chen@broadcom.com
Date: Sat, 28 Nov 2026 11:26:08 +0000
Message-ID: <179586516852.3135.10254038893964145277@kernel.org>
In-Reply-To: <20261127-nb-genet-mtu-nn-v2-v10-8-749c7cc45d97@tipi-net.de>
References: <20261127-nb-genet-mtu-nn-v2-v10-8-749c7cc45d97@tipi-net.de>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In bcmgenet_desc_rx()
  (drivers/net/ethernet/broadcom/genet/bcmgenet.c), the patch raises the…
- [Medium] For a frame reassembled from several descriptors,
  bcmgenet_desc_rx() jumps from the bcmgenet_add_frag() path to…

--

net: bcmgenet: reassemble jumbo frames from status block fragments

GENET splits frames longer than the RX packet ready threshold across
several descriptors, each with its own status block. This patch removes
those status blocks and reassembles the fragments into one skb, which
lifts the MTU cap. The maximum MTU is now 16347, based on the 14-bit
UMAC_MAX_FRAME_LEN.

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index 1307faf135bd4..ec196a71a7347 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c

[ ... ]

> @@ -2527,24 +2572,43 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
>  			  __func__, p_index, ring->c_index,
>  			  ring->read_ptr, dma_length_status);
>  
> -		/* Only the first descriptor carries the alignment pad */
> -		min_len = dma_flag & DMA_SOP ? GENET_RSB_PAD
> -					     : sizeof(struct status_64);
> +		/* Only the first descriptor carries the alignment pad. A head
> +		 * with more to come needs the Ethernet header in it, a
> +		 * continuation needs at least one payload byte.
> +		 */
> +		if (dma_flag & DMA_SOP) {
> +			min_len = GENET_RSB_PAD;
> +			if (!(dma_flag & DMA_EOP))
> +				min_len += ETH_HLEN;
> +		} else {
> +			min_len = sizeof(struct status_64) + 1;
> +		}
>  
>  		/* Reject lengths that would underflow the SKB build path. */
>  		if (unlikely(len > priv->rx_buf_len || len < min_len)) {
>  			netif_err(priv, rx_status, dev,
>  				  "invalid packet length %d\n", len);
>  			BCMGENET_STATS64_INC(stats, length_errors);
> +			if ((dma_flag & DMA_SOP) && ring->frag_head)
> +				BCMGENET_STATS64_INC(stats, fragmented_errors);
> +			bcmgenet_discard_frags(ring, dma_flag & DMA_EOP);

[Severity: Medium]
Can a split frame end with a descriptor that holds only its status
block plus DMA_EOP, with no payload?

The previous patch in this series ("net: bcmgenet: allow a continuation
descriptor without the alignment pad") set the non-SOP minimum to
sizeof(struct status_64). This patch raises it to
sizeof(struct status_64) + 1.

Suppose the hardware posts an EOP descriptor with
len == sizeof(struct status_64). It would then land in this branch.
The branch logs "invalid packet length" and bumps length_errors. Then
bcmgenet_discard_frags() frees ring->frag_head, which at that point
holds every payload byte of a complete, valid frame.

That can only happen when the alignment pad plus the frame length is an
exact multiple of the RX threshold. On 4K pages the threshold is 3584
bytes, so frames of 7166, 10750 and 14334 bytes would hit it (FCS
included when crc_fwd_en is set). MTU 9000 and MTU 16347 can both reach
these sizes.

The 16361 byte loopback test in the commit message doesn't fall on one
of these boundaries.

Would it make sense to accept len == sizeof(struct status_64) with
DMA_EOP as an empty terminator? bcmgenet_add_frag() would add no frag
and deliver frag_head with that descriptor's checksum. Or can Broadcom
confirm that the hardware never emits such a descriptor?

>  			page_pool_put_full_page(ring->page_pool, rx_page,
>  						true);
>  			goto next;
>  		}

[ ... ]

> @@ -2574,17 +2638,27 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
>  						DMA_RX_RXER)) == DMA_RX_RXER)
>  				u64_stats_inc(&stats->errors);
>  			u64_stats_update_end(&stats->syncp);
> +			bcmgenet_discard_frags(ring, dma_flag & DMA_EOP);
>  			page_pool_put_full_page(ring->page_pool, rx_page,
>  						true);
>  			goto next;
>  		} /* error packet */
>  
> +		if (!(dma_flag & DMA_SOP)) {
> +			skb = bcmgenet_add_frag(ring, rx_page, rx_offset,
> +						rx_size, dma_flag, len);
> +			if (!skb)
> +				goto next;
> +			goto deliver;
> +		}

[Severity: Medium]
For a reassembled frame, dma_flag at the deliver label holds the status
word of the final EOP descriptor. The stats code in bcmgenet_desc_rx()
then does:

	if (dma_flag & DMA_RX_MULT)
		u64_stats_inc(&stats->multicast);
	else if (dma_flag & DMA_RX_BRDCAST)
		u64_stats_inc(&stats->broadcast);

The commit message says the status blocks of a split frame differ
("Only the last block holds the checksum of the whole frame"). It
doesn't say which block carries the DMA_RX_MULT and DMA_RX_BRDCAST
classification. The MAC already has that from the destination address
when it writes the SOP block.

If these flags are set only in the SOP status block, would jumbo
multicast and broadcast frames go uncounted in stats->multicast and
stats->broadcast?

Could the SOP descriptor's flags be saved when frag_head is set up and
used here instead?

>  
>  		/* Build SKB from the page - data starts at hard_start,
>  		 * frame begins after RSB(64) + pad(2) = 66 bytes.
>  		 */

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-nb-genet-mtu-nn-v2-v10-0-749c7cc45d97%40tipi-net.de
