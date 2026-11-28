Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795865168;
	b=K4QBAvMnAC/4Ay+ml6obniHP0rMRPFjiXzPVdG43tKrZkuKeYkQHbFirZ7nfBn38fKLt
	 wGJFjvNUXrMMuSPy0zlTIbnYIMLOLBO4YUJ2N2o1pWl+u5jfImZb+5yt9Q9YQbvDpn6bL
	 pBpzb5aByN2XIfon62M6/HlTxq8X6o/XpODtAM012qM0/P3y/zeOOARFJCcoEe2EL99TQ
	 MaFL/2xIcysDhvJlS6heRQtlQSTzyFUnrE2ajfyaL28lZZN4QJhdPOV6nWXN1hdyjkdpr
	 xMo+Yu7IVkFZzkBuGViH/zloaNYDGJaZHssgvNDEM2LJHR8Hyp4zSow65znV8MFai1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795865168;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7/IzRSVqpBXh3OwZH68IFnTpCTODTiydWIbXaZLP4uQ=;
	b=JM9GA2osRQIzX52roS1yIQ7boS2pdT7poNc5v2pM28Zit6vmQk9rqzuXfuDaJnXqXk0Z
	 BcZg403m8XfVDTyhcdMq9nVgkMVQGzZhEKLUfdIIXGp3xWIbD30uy8FMHne1tKxejGXZX
	 FLm9a3QRqbUn6532rzIArSNT37DbpiwZDMfWCp+hRgMQdxX7a8oRM5v+eNgLZPFBR8mWD
	 HXE6ntxNO1h8FjXSa3O04vIR7JfYyfXcXxSSUxadbrchBG34Za/H/v9dqA/yK+qSVjeqM
	 zXb0/X5E4BZRJ01vLdPpyodNeDd+VTouEFNFr5R1XlmWlFK9jF53fhJ7IhYwDJ4blLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PfUySNCQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA56C606A696;
	Sat, 28 Nov 2026 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PfUySNCQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884951F00924;
	Sat, 28 Nov 2026 11:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795865168;
	bh=7/IzRSVqpBXh3OwZH68IFnTpCTODTiydWIbXaZLP4uQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PfUySNCQbfW9hUezQhOJgNXZP4RKbhL/zg+42ZAw5i+SUKdCN/KdlO08kn5GrfvL4
	 MpuE37YOlGXu04eO+q2cTQsRE1JKdtK45I/rRMWgkRJC++yBu2sNe1DQYwezpZvk1k
	 1Y+0MWP7JYwZuRUJFqTel7QA6ep6ENoanISmr//Zrg6444rUyfmGOZo4zWFOR8l4Jg
	 YYwlu4Pb9UtYe+Eb62y/qZX5uDaOWbBgvdiTv2l5rDxYAGOCo+nsrf7jW4BKxQbqaz
	 upO/0uIlAPpmZ64Htx6nRTXp+UP8RX4FKnyMLN0PtZoWwRWdTLs/UXkTYZOlTneBun
	 yiTA7pS7YNNbA==
Subject:
 Re: [PATCH net-next v10 7/8] net: bcmgenet: allow the MTU to be changed
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 pierremarinleclercq88@gmail.com, dave.stevenson@raspberrypi.com,
 justin.chen@broadcom.com
Date: Sat, 28 Nov 2026 11:26:07 +0000
Message-ID: <179586516710.3135.10478962975495152164@kernel.org>
In-Reply-To: <20261127-nb-genet-mtu-nn-v2-v10-7-749c7cc45d97@tipi-net.de>
References: <20261127-nb-genet-mtu-nn-v2-v10-7-749c7cc45d97@tipi-net.de>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In bcmgenet_change_mtu(), if the DMA engine will not halt, the
  driver frees RX buffers and page pools that the hardware descriptors…

--

net: bcmgenet: allow the MTU to be changed

This commit sets dev->max_mtu on GENET v5 from the packet ready threshold
and adds bcmgenet_change_mtu(). On a running interface it stops the
datapath, reprograms the MTU registers and restarts DMA while the PHY
keeps running. When the new MTU maps to the same rx_buf_len, the existing
rings are reused.

Link: https://github.com/raspberrypi/linux/issues/5561

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index fc8b8400fcbb5..1307faf135bd4 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c

[ ... ]

> @@ -3997,6 +4023,97 @@ static int bcmgenet_change_carrier(struct net_device *dev, bool new_carrier)
>  	return 0;
>  }
>  
> +static int bcmgenet_change_mtu(struct net_device *dev, int new_mtu)
> +{

[ ... ]

> +	/* The threshold is quantised, so a band of MTUs shares one buffer
> +	 * length and the running rings can serve the new MTU as they are.
> +	 */
> +	reuse = buf_len == priv->rx_buf_len;
> +	if (!reuse) {
> +		ret = bcmgenet_alloc_dma(priv, buf_len, &set);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* The watchdog trips on an idle queue once the rings are gone */
> +	netif_device_detach(dev);
> +
> +	/* The PHY stays up, hold its lock. A link event would otherwise take
> +	 * the MAC out of reset and enable it mid rewrite.
> +	 */
> +	mutex_lock(&dev->phydev->lock);
> +	bcmgenet_netif_stop(dev, false, reuse ? &set : NULL);
> +
> +	WRITE_ONCE(dev->mtu, new_mtu);
> +	priv->rx_buf_len = buf_len;
> +	bcmgenet_set_mtu_regs(priv, new_mtu);
> +
> +	ret = bcmgenet_init_dma(priv, true, &set);
> +	if (ret) {

[Severity: Medium]
What happens to the RX buffers here if the DMA engine does not halt?

bcmgenet_netif_stop() ignores the return value of bcmgenet_dma_teardown():

bcmgenet_netif_stop() {
    ...
	bcmgenet_dma_teardown(priv);
    ...
	bcmgenet_tx_reclaim_all(dev);
	bcmgenet_fini_dma(priv, keep);
}

On the reuse path, bcmgenet_fini_dma() moves the live rx_cbs, tx_cbs and
page pools into set. The RDMA descriptors still hold the DMA addresses of
those pages.

bcmgenet_init_dma() then checks the halt again with
bcmgenet_tdma_disable() and bcmgenet_rdma_disable(). On a timeout it
jumps to err before it rewrites any descriptor:

err:
	bcmgenet_free_dma_set(priv, set);

bcmgenet_free_dma_set() is documented as:

/* Hand back a set that was never installed */

Here the set is the one the hardware is armed with. The helper returns
every page to its pool and calls page_pool_destroy(), which unmaps the
pages and hands them back to the page allocator.

After that, netif_close() runs bcmgenet_close(). Because tx_cbs is NULL,
bcmgenet_close() skips bcmgenet_netif_stop(), and nothing resets RDMA,
UMAC or RBUF. Can an RX engine that never reported halted then write into
pages that have been freed and reused?

The non-reuse path looks similar. bcmgenet_fini_dma(priv, NULL) frees the
old, still-armed rings regardless of what bcmgenet_dma_teardown()
returned. bcmgenet_close() and the resume path already have the same
"teardown failed, free anyway" pattern, but this patch makes it reachable
at runtime through an MTU change on a running v5 interface.

The commit message only says:

    Only a DMA that refuses to halt still takes the interface down, because
    nothing is left to run on.

It does not cover the hardware still referencing the freed buffers.

On a halt failure, would it be safer to WARN and leak the set rather than
free it? Another option is to reset the block before releasing the
buffers.

As far as I can tell, the later patch "net: bcmgenet: reassemble jumbo
frames from status block fragments" does not change this error path in
bcmgenet_init_dma() or bcmgenet_change_mtu(), so the issue remains at the
end of the series.

> +		/* The datapath is gone, do not leave the interface up */
> +		netdev_err(dev, "failed to initialize DMA, closing\n");
> +		WRITE_ONCE(dev->mtu, old_mtu);
> +		priv->rx_buf_len = bcmgenet_rx_buf_len(old_mtu);
> +		mutex_unlock(&dev->phydev->lock);
> +		/* bcmgenet_close() attaches the device again */
> +		netif_close(dev);
> +		return ret;
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-nb-genet-mtu-nn-v2-v10-0-749c7cc45d97%40tipi-net.de
