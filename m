Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795865166;
	b=nU0hN3imaEToGPRqT/4jYYzPPHGXw0h0uALc0IrkYLMJOY9ioKsrqA67XVJ4lJxFsmPS
	 gRsGJhv3ZB6BsIAvzJV8tTv+/zqkLO2L9hMfVQmYxSWdpe6yuFUIK5VVTkfbeR6JpcvXV
	 EtlAjwwp7RVaQeNC9SNLKUmAKxHvID7JVlYrULdjrs4d0CIVltwk2/d6vdZzxQG1fY1RS
	 TIECXLdPQwogIMny5nRXUylN4uOYSYzxw0KGbxQCmJ0R5vQeuS62sstiu+e95iKWOPMTA
	 6tAWDR111UrlFvdsqoBUpDabbcY4MtypufbD9BRSSEcT8QLDsGCCX+uiSbHUMnKV3Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795865166;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1DFYlrDF3uE1lFPUw88GuZ1Rh3mCYC0EoZqEahQW3+M=;
	b=RcqXkUyHi9OPOloE/vgCXwsiN6VCbghLd2j+ctEW1AXpDO3cOP76WZfDrZ1pvwzufYdM
	 dZK72YUWMAkuYet7RM8sZqbYVcIZsQpUncgRcHxdgHkhjYYAPDzm7FcDPKqvPzufXLb4q
	 0UGp5zOBJcQabflUEHpc/cEMlOkYqd6xsTrfircRSkPh7K4BiZ0kVebdt8Na9YBQ1j5b5
	 VKNahh76QaYQdErQQbLxgrm8CsNaNcn8zM/SAgcgRhUtOmO/QcZ+jMl8xWn2wY669pFWi
	 XkShFqP6SEEI1CjIGGu5FEKxPRljZ9hDL17PikAMhU6aHGdpF/TdVicCW64FPFxYNFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0bNoOAZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E987E606A32F;
	Sat, 28 Nov 2026 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0bNoOAZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB87A1F00893;
	Sat, 28 Nov 2026 11:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795865165;
	bh=1DFYlrDF3uE1lFPUw88GuZ1Rh3mCYC0EoZqEahQW3+M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=U0bNoOAZCYl9lpxXDqw2aRNoB1/iPwcgpq1m//3FgkSOrkL9k3+Qaz2+UbngKEhk3
	 p/nb8c22NW3T+UFSqQMQozoDSR94kH2iids0cUrbPNsl2v33VeL1KZt7oRjqZwTCto
	 fCPKadzrzH9VxxTD04wy2t8aY9juM2B9ofY2fIpJYuA/0D+V/zgwlwcjhIxiP/mHr4
	 0VLF0DgwevSCscB9s3zyKRAAGi/E6Dlxmb+l48TbdWnAEk2SPdxiTUv3IlnsS+Dtkr
	 OoevmMZ32NDO/z+6FPBOuL/78R8g7VyaNUTrvSTnCEnhR9f1zoemUponsYy+oD99UJ
	 V701opvNlUfWg==
Subject: Re: [PATCH net-next v10 4/8] net: bcmgenet: derive the receive buffer
 length from the MTU
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 pierremarinleclercq88@gmail.com, dave.stevenson@raspberrypi.com,
 justin.chen@broadcom.com
Date: Sat, 28 Nov 2026 11:26:04 +0000
Message-ID: <179586516438.3135.112504100191824754@kernel.org>
In-Reply-To: <20261127-nb-genet-mtu-nn-v2-v10-4-749c7cc45d97@tipi-net.de>
References: <20261127-nb-genet-mtu-nn-v2-v10-4-749c7cc45d97@tipi-net.de>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In drivers/net/ethernet/broadcom/genet/bcmgenet.c,
  bcmgenet_set_mtu_regs() now writes RBUF_PKT_RDY_THLD (RBUF + 0x08)…

--

net: bcmgenet: derive the receive buffer length from the MTU

This patch drops the fixed 2048 byte receive buffer length. The length is
now derived from an MTU-based packet ready threshold, which the patch also
programs into RBUF_PKT_RDY_THLD. UMAC_MAX_FRAME_LEN and the TDMA flow
period are also derived from the MTU, with a floor at ETH_DATA_LEN.

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index 5c050331da690..15b7c8a525201 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c

[ ... ]

> @@ -2653,6 +2677,41 @@ static void bcmgenet_link_intr_enable(struct bcmgenet_priv *priv)
>  	bcmgenet_intrl2_0_writel(priv, int0_enable, INTRL2_CPU_MASK_CLEAR);
>  }
>  
> +/* Receive threshold in register units. Covers the alignment bytes and the
> + * frame, but not the status block, which the hardware adds on top.
> + */
> +static unsigned int bcmgenet_pkt_rdy_thld(unsigned int mtu)
> +{
> +	unsigned int len = GENET_RBUF_ALIGN + mtu + ETH_HLEN + VLAN_HLEN;
> +
> +	len = round_up(len, ENET_THLD_BURST) / ENET_THLD_UNIT;
> +
> +	/* Keep the reset default for the common MTUs */
> +	return clamp_t(unsigned int, len, ENET_THLD_DEFAULT,
> +		       ENET_THLD_MAX_LEN / ENET_THLD_UNIT);
> +}

[ ... ]

> +/* Call with the MAC disabled */
> +static void bcmgenet_set_mtu_regs(struct bcmgenet_priv *priv, unsigned int mtu)
> +{
> +	u32 thld = bcmgenet_pkt_rdy_thld(mtu);
> +
> +	bcmgenet_umac_writel(priv, ENET_MAC_FRAME_LEN(mtu), UMAC_MAX_FRAME_LEN);
> +
> +	/* GENET v1 maps other registers at these offsets */
> +	if (GENET_IS_V1(priv))
> +		return;
> +
> +	bcmgenet_rbuf_writel(priv, thld, RBUF_PKT_RDY_THLD);

[Severity: Low]
The commit message treats this write as a no-op:

  "so the threshold comes out at 0x80, the value a v5 holds out of reset"

Before this patch the driver never wrote RBUF_PKT_RDY_THLD. Now every
open and resume on v2, v3, v4 and v5 writes it, via
init_umac()->bcmgenet_set_mtu_regs().

Is it known that v2-v4 match v5 here? That covers the reset value, the
RBUF + 0x08 offset, the 8 bit field in 16 byte units and the 256 byte
burst rule.

The driver's own register map already shows that the RBUF block differs
between revisions:

  #define RBUF_OVFL_CNT_V2		0x80
  #define RBUF_OVFL_CNT_V3PLUS		0x94
  ...
  #define RBUF_ERR_CNT_V2			0x84
  #define RBUF_ERR_CNT_V3PLUS		0x98

Also, init_umac() writes RBUF_TBUF_SIZE_CTRL only on v3 and later.

If something else lives at RBUF + 0x08 on v2, or the units differ, could
RX frames end up split across descriptors? At this commit,
bcmgenet_desc_rx() drops those:

	if (unlikely(!(dma_flag & DMA_EOP) || !(dma_flag & DMA_SOP))) {
		netif_err(priv, rx_status, dev,
			  "dropping fragmented packet!\n");

v1 skips the write, but bcmgenet_probe() still sizes rx_buf_len from the
threshold formula on every revision:

	priv->rx_buf_len = bcmgenet_rx_buf_len(dev->mtu);

So on v1, the rule "A buffer has to hold everything the threshold lets
the hardware deliver" depends on a threshold that is never programmed.

The later patch "net: bcmgenet: split frames that end just past the
transmit threshold" adds an unconditional TBUF_PKT_RDY_THLD write on the
same revisions, with the same v5-only reasoning.

Could the commit message state that the v2-v4 reset values and register
semantics match v5? Alternatively, the write could be limited to
revisions where it is known to change nothing.

> +}
> +
>  static void init_umac(struct bcmgenet_priv *priv)

[ ... ]

> @@ -4156,6 +4216,7 @@ static int bcmgenet_probe(struct platform_device *pdev)
>  	/* Mii wait queue */
>  	init_waitqueue_head(&priv->wq);
>  	bcmgenet_hfb_init(priv);
> +	priv->rx_buf_len = bcmgenet_rx_buf_len(dev->mtu);
>  	INIT_WORK(&priv->bcmgenet_irq_work, bcmgenet_irq_task);

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.h b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
> index afaccb7699336..b40e56872132c 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.h
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.h

[ ... ]

> @@ -218,6 +226,8 @@ struct bcmgenet_rx_stats64 {
>  #define  RBUF_ALIGN_2B			(1 << 1)
>  #define  RBUF_BAD_DIS			(1 << 2)
>  
> +#define RBUF_PKT_RDY_THLD		0x08
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-nb-genet-mtu-nn-v2-v10-0-749c7cc45d97%40tipi-net.de
