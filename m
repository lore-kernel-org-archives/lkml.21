Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795865163;
	b=LNDlCxI8ajIqohWh6TlxUubUr+sQdbuGpUQFz+3fbIx0MwJ8018kwPo1Ah2aH846yYqZ
	 0kE4uzlOFEy4+mY90Pm2anq7kj+n+jxbazrUB9+gDn1v47/N6Q54J2lqjwds7sFSozXRo
	 L45svkwyO2lS5GwpJn5bNyg+dxXdJUqexoqVCmjFq0ZtHYgyqOk/b4VVkAMhs++EckUaN
	 w8G3whLuqRJk1dg4NsYNujLdD2S5x9A4FvtG1zCO05qaLSUhM+KgTjlg+PN3KsolQNjpl
	 7c0cEVTs1XzWL6fh0jYXDW4ZUuJ1hcO/9Uy8qrzhe8+MhmCpQ5+qW0SZVYE5jNZhFMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795865163;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=e0p66sCFiRDmHakXf0/+dm4/kpSJWzWCKHTUu/k0+tM=;
	b=vIXBFzkvjh3MlVVjqKZeYTSUTnBnd4LR3oGHrHx17C8zyCU9hUkk19vORRZpAbEuDzw7
	 OmE46scOTlUwcYXZLm4SKq8Gl6M0aw9LjrScwgjjJg5Kyay8kwoe5F00HQu90JFglcyWy
	 fc43L4xxHTYP69BelZrqq3X5FNpidqcBIIaj6MR+BdpW3rDYfj2h1CFP59VdgvXSAzwXg
	 ctn3RT0wh6yG5n2Clw3gdn0bUnUVyPi33JK119vSE5c6TeeKpp6ILPBt8/WJUFmCE1sVE
	 tV0aFCrE97JFK3VB97uACk9Qgd4hR6uNEyVWGFXsdq0C8H0HaDEm6im+KKlORNyrAxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4GFCA4M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4A9606A31C;
	Sat, 28 Nov 2026 11:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4GFCA4M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AD71F00893;
	Sat, 28 Nov 2026 11:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795865162;
	bh=e0p66sCFiRDmHakXf0/+dm4/kpSJWzWCKHTUu/k0+tM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b4GFCA4MeTbZN22JpuOcUiXAZm+p9v69s/mV5Km8yJR+HI98GoOX0fUiCpZ7ZtCIQ
	 l0lw5sH13VdNvlakzhv8KCncUdv/MA6z9KfCn0M8RhAFXcfRSCy2p194/D4sfP0ye3
	 Xt/3w1m0+dQp34K3ik8H/H0R9BQOABdaxKzEUqQlKtpqOaj6N9rYNZcUaF0dBTXNtz
	 zAXI1dVIqjvGPetPzUpt6o3eKF2aQ3MnlkbDUvwiXQA8Gl3dbSU8uiphxiVJ9VI19/
	 Cn+u1k7bnmMhbT95dkZgOhgyK0F36p6v7By5WFs7lJpmJpy7aL5NsAUGw6A/2onOny
	 efMPwTV5RuoBQ==
Subject: Re: [PATCH net-next v10 2/8] net: bcmgenet: allow a continuation
 descriptor without the alignment pad
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 pierremarinleclercq88@gmail.com, dave.stevenson@raspberrypi.com,
 justin.chen@broadcom.com
Date: Sat, 28 Nov 2026 11:26:01 +0000
Message-ID: <179586516149.3135.9738232664292864629@kernel.org>
In-Reply-To: <20261127-nb-genet-mtu-nn-v2-v10-2-749c7cc45d97@tipi-net.de>
References: <20261127-nb-genet-mtu-nn-v2-v10-2-749c7cc45d97@tipi-net.de>
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

- [Low] Concern: after this patch, the length check in bcmgenet_desc_rx()
  (drivers/net/ethernet/broadcom/genet/bcmgenet.c), commented "Reject…

--

net: bcmgenet: allow a continuation descriptor without the alignment pad

This patch changes the RX length check in bcmgenet_desc_rx(). Only
descriptors with DMA_SOP now need room for the 64 byte status block plus
the 2 byte alignment pad. Continuation descriptors only need room for the
64 byte status block. The patch prepares for a larger MTU.

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index 7e78db243442c..67296eb22a5c3 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c

[ ... ]

> @@ -2394,8 +2396,12 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
>  			  __func__, p_index, ring->c_index,
>  			  ring->read_ptr, dma_length_status);
>  
> +		/* Only the first descriptor carries the alignment pad */
> +		min_len = dma_flag & DMA_SOP ? GENET_RSB_PAD
> +					     : sizeof(struct status_64);
> +
>  		/* Reject lengths that would underflow the SKB build path. */
> -		if (unlikely(len > RX_BUF_LENGTH || len < GENET_RSB_PAD)) {
> +		if (unlikely(len > RX_BUF_LENGTH || len < min_len)) {

[Severity: Low]
The comment above this check still says it rejects lengths that would
underflow the SKB build path. For a non-SOP descriptor, though, it now
accepts len values of 64 and 65.

Further down in bcmgenet_desc_rx(), the build path always subtracts the
full 66 byte GENET_RSB_PAD:

	skb_reserve(skb, GENET_RSB_PAD);
	__skb_put(skb, len - GENET_RSB_PAD);

At this commit, only the fragmented drop that comes next keeps such a
descriptor away from that subtraction:

	if (unlikely(!(dma_flag & DMA_EOP) || !(dma_flag & DMA_SOP))) {

So nothing can be hit at runtime here. Still, is it intended that the
guard and the build path disagree at this point in the series?

Later in the series, "net: bcmgenet: reassemble jumbo frames from status
block fragments" sends non-SOP descriptors to bcmgenet_add_frag(), which
subtracts sizeof(struct status_64). That commit also raises the non-SOP
minimum to sizeof(struct status_64) + 1, which brings the guard and both
build paths back in line.

The commit message describes a continuation "holding a single byte", which
is a len of 65. A len of 64, with no data bytes, also passes this check.

Would it make sense to use sizeof(struct status_64) + 1 here already, or
to adjust the comment in this patch?

>  			netif_err(priv, rx_status, dev,
>  				  "invalid packet length %d\n", len);
>  			BCMGENET_STATS64_INC(stats, length_errors);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-nb-genet-mtu-nn-v2-v10-0-749c7cc45d97%40tipi-net.de
