Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795865167;
	b=N3y4g8GqUlNvXxCklEOkEAwiWpJV7F9G9x9AcOTPChDwiftPJ2h2bgNRZjLxbhD8pYeU
	 insuenTkUbtMKt+ThgTwCtJDDiOtfdQW1HGwEx9M2cZOUmBRTkVSwLp7Nhw1FY/8A/XTB
	 +yvPo9n5nRScfnfnRvLdgBw0TLyTHIcQYqioSaWO/0pdV0CDoHr7bGoY2E2jtwiCtJey8
	 kqd5g38HtxRYdhfbRWB4LMQun+b+gprNqO79SR87piXTjVqdV7MMSqfn7yEY+KtyCqTVu
	 Qb9tJGJ9QsTA9EaUnuQDvRc8ktEm+nXmKbEenhS+4A2iiSZWFsKfSUP+wAv9RJTCZkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795865167;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7nWpsNkQ/FECtBOaFJYN/WmsU4Xm7G8h2gwo8mdaPx0=;
	b=Vo/3e+I1enqoxegEdAfHHyl9hQc/uwuGmuHJKiV7ty6XVMFF1ehcKzJimujpSz76WmHY
	 diSfcUih2qTgiNUKrj1cmV6yQTxXWUUx/kESssSu+eLXiLooKxbjm9rQp93o/KWOGjMHk
	 aOUa+g7lS+47biBOIACRrOhXibsqTAUWs/A969Ca4QiMhbShChasLW3wW8otm7Fng7lc/
	 ybLReNpgOyGuizRVBp9eF4q+Z10RBJSQlr86cqVK07xmQDGqRgCUVxJCQJXEKaIHtBXgb
	 TVV1vV2tP7v5AY4kWcKU1iNb3IY4Y0K7b2hBgE9QekUzSc/95tyyDw8FztJb1+wTEwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cyAYUJn9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BDB606A338;
	Sat, 28 Nov 2026 11:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cyAYUJn9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334AC1F00893;
	Sat, 28 Nov 2026 11:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795865166;
	bh=7nWpsNkQ/FECtBOaFJYN/WmsU4Xm7G8h2gwo8mdaPx0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cyAYUJn9KyAsA9092cmqMqazRCEseT1SigdUFsSKovBQSRKAnblmQkCaXE4Tx1qW5
	 A22IZwI6v6D31cTjUBi97nusrwO8sOZcG3F8iNgQJZ99E0rjI5ZxzVx8iF/vYlNb2I
	 GvITHdum/AOzqqGxdE+tAT1Q1s81fyMjvW513umRvLPGII7fi8AEdoGAQsAWHywY/H
	 z9OAJyNs6uyT4uDdleSkoRUq8zFuih/4iIFSFZvzCg9KqOzCtJiw0pLlWv0ySlbD+V
	 K2hoOQ/7PvU1PU1D+/E7sM5+mJgyG+a5dqtbCm8DrK3l/Pd3Yw5OcbuJqDrn7kyQTo
	 3qNgGilFaA3dg==
Subject: Re: [PATCH net-next v10 5/8] net: bcmgenet: split frames that end
 just past the transmit threshold
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 pierremarinleclercq88@gmail.com, dave.stevenson@raspberrypi.com,
 justin.chen@broadcom.com
Date: Sat, 28 Nov 2026 11:26:05 +0000
Message-ID: <179586516579.3135.9485431888259061826@kernel.org>
In-Reply-To: <20261127-nb-genet-mtu-nn-v2-v10-5-749c7cc45d97@tipi-net.de>
References: <20261127-nb-genet-mtu-nn-v2-v10-5-749c7cc45d97@tipi-net.de>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The transmit stall window is extrapolated, not measured, on
  every GENET that programs a DMA burst of 0x10.
- [Low] bcmgenet_xmit() now calls skb_checksum_help() for any
  CHECKSUM_PARTIAL frame with skb->len > priv->tx_thld_len, and it does…
- [Low] (Baseline decision: not a functional bug; kept because
  requires_validation=true.) bcmgenet_set_mtu_regs() now writes…
- [Low] (Baseline decision: not a bug; kept because
  requires_validation=true.) bcmgenet_set_mtu_regs() sets…

--

net: bcmgenet: split frames that end just past the transmit threshold

Transmit frames that end just past the TBUF packet ready threshold are now
split over two descriptors that share one DMA mapping. This avoids a
transmitter stall after which Tx DMA refuses to halt. The patch also
programs TBUF_PKT_RDY_THLD based on the MTU, and frames longer than the
threshold fall back to a software checksum.

Link: https://github.com/raspberrypi/linux/pull/7617#issuecomment-6201096155

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index 15b7c8a525201..5ad38b4eccd1e 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> @@ -65,6 +65,13 @@
>  #define ENET_THLD_DEFAULT	0x80
>  #define ENET_THLD_MAX		0xf0
>  
> +/* A frame that ends within one DMA transfer past the transmit threshold
> + * stops the transmitter once a shorter frame follows. The burst register
> + * has no documented unit, 8 bytes per count matches the 46 bytes measured
> + * on a bcm2711, which programs 0x08.
> + */
> +#define ENET_BURST_UNIT		8

[Severity: Medium]
bcmgenet_probe() computes the window for every part as:

    priv->tx_thld_window = priv->dma_max_burst_length * ENET_BURST_UNIT;

The 8 bytes per count comes from a single bcm2711 measurement at burst
0x08. The commit message says the bcm2711 sends nothing at 0x10, so the
0x10 case (16 * 8 = 128 bytes) was never measured.

The 46 byte result shows the unit is at least about 5.75 bytes per count.
Does it show that the unit is exactly 8, or that the window grows linearly
with the burst count?

v5_plat_data and bcm7712_plat_data both use DMA_MAX_BURST_LENGTH (0x10).
Their real window could be wider than 128 bytes, for example because of a
wider bus. In that case bcmgenet_xmit() would send a frame with

    tx_thld_len + tx_thld_window <= skb->len < real window end

without splitting it. If a shorter frame follows, wouldn't that bring back
the Tx DMA stall where every later bcmgenet_init_dma() fails?

Later in the series, "net: bcmgenet: allow the MTU to be changed" raises
max_mtu for every GENET_IS_V5() part, so this becomes reachable on those
0x10 parts. Has the window been verified on any part that programs 0x10?

[ ... ]

> @@ -2185,7 +2207,7 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
>  	}
>  
>  	spin_lock(&ring->lock);
> -	if (ring->free_bds <= (nr_frags + 1)) {
> +	if (ring->free_bds <= (nr_frags + 1 + split)) {
>  		if (!netif_tx_queue_stopped(txq))
>  			netif_tx_stop_queue(txq);
>  		ret = NETDEV_TX_BUSY;

[ ... ]

> @@ -2202,6 +2224,20 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
>  		goto out;
>  	}
>  
> +	/* The MAC inserts a checksum only into a frame it holds in full and
> +	 * silently drops a longer one, so fall back to software.
> +	 */
> +	if (unlikely(skb->len > priv->tx_thld_len) &&
> +	    skb->ip_summed == CHECKSUM_PARTIAL) {
> +		if (skb_checksum_help(skb)) {

[Severity: Low]
This calls skb_checksum_help() with ring->lock held. For a jumbo frame it
checksums the whole payload, and it may also linearize the skb or expand
its head. Meanwhile bcmgenet_tx_poll() and bcmgenet_tx_reclaim() spin on
the same ring->lock.

The checksum depends only on the skb, which xmit already owns. Could it run
outside the critical section? One option is to clear NETIF_F_CSUM_MASK in
an ndo_features_check callback when skb->len > tx_thld_len, so that
validate_xmit_skb() does the fallback before the driver is entered.

At this commit the path is dormant because the MTU is capped at
ETH_DATA_LEN. Once the larger MTU is allowed, it applies to every
CHECKSUM_PARTIAL frame above the threshold.

[ ... ]

> @@ -2691,6 +2772,17 @@ static unsigned int bcmgenet_pkt_rdy_thld(unsigned int mtu)
>  		       ENET_THLD_MAX_LEN / ENET_THLD_UNIT);
>  }
>  
> +/* The transmit threshold in register units. Keep the reset value while the
> + * MTU has no use for more, the hardware never reaches it below ETH_DATA_LEN.
> + */
> +static unsigned int bcmgenet_tx_pkt_rdy_thld(unsigned int mtu)
> +{
> +	if (mtu <= ETH_DATA_LEN)
> +		return ENET_THLD_DEFAULT;
> +
> +	return ENET_THLD_MAX;
> +}

[Severity: Low]
This isn't a functional bug, but the comment says the reset value is kept.
The function actually returns a fixed ENET_THLD_DEFAULT (0x80), and the
commit message only confirms 0x80 as the reset value on v5.

bcmgenet_set_mtu_regs() now writes this value on v2-v4 too, and their
reset value isn't documented in the tree. At MTU <= ETH_DATA_LEN no frame
reaches 2048 bytes, so behaviour on those parts shouldn't change.

Could the comment say that a fixed value is written?

> @@ -2701,8 +2793,10 @@ static unsigned int bcmgenet_rx_buf_len(unsigned int mtu)
>  /* Call with the MAC disabled */
>  static void bcmgenet_set_mtu_regs(struct bcmgenet_priv *priv, unsigned int mtu)
>  {
> +	u32 tx_thld = bcmgenet_tx_pkt_rdy_thld(mtu);
>  	u32 thld = bcmgenet_pkt_rdy_thld(mtu);
>  
> +	priv->tx_thld_len = tx_thld * ENET_THLD_UNIT;
>  	bcmgenet_umac_writel(priv, ENET_MAC_FRAME_LEN(mtu), UMAC_MAX_FRAME_LEN);
>  
>  	/* GENET v1 maps other registers at these offsets */
> @@ -2710,6 +2804,8 @@ static void bcmgenet_set_mtu_regs(struct bcmgenet_priv *priv, unsigned int mtu)
>  		return;
>  
>  	bcmgenet_rbuf_writel(priv, thld, RBUF_PKT_RDY_THLD);
> +	bcmgenet_writel(tx_thld, priv->base + priv->hw_params->tbuf_offset +
> +			TBUF_PKT_RDY_THLD);
>  }

[Severity: Low]
This isn't a bug, but priv->tx_thld_len is set before the GENET_IS_V1()
early return. On v1 the cached value is never written to
TBUF_PKT_RDY_THLD, yet bcmgenet_xmit() still uses it for the split and
software checksum decisions.

v1 never gets an MTU above ETH_DATA_LEN in this series, so tx_thld_len
stays at 2048 and neither path can run.

Would a short comment noting that the value has no effect on v1 help
future readers?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-nb-genet-mtu-nn-v2-v10-0-749c7cc45d97%40tipi-net.de
