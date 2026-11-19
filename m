Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112673;
	b=5k0fRo74ZSO6KSINcnFQXNbNO2dfXBux9z77LkOSgBjAugYVhs4PrcmDB5pG1Omn4zy8
	 Z9r9HmaWNPxjvs/O5egGhMJ6z3qbX1QAQgf8bdAVjij8hSSFJHcqPGiDu1FK1D7dR/r7T
	 5yLSu8VqlszwwY6HMxxnNafNOBnQanlaqN3UALuo4b2KZjMyggR70bFuvfti9XK5dnxij
	 2j5upqlz6E1pA8XBAs3Qa7YnZHRbELQvZ0/G6Ad8EsauyVX0xxJNfyWHjJQWvO3vdGcoc
	 DBKPVE8SSYi97w1MOSWfb19ldbmlzmGyGFjKnb6eRXnAwKGhObSaMKkLqgVdATgPp4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112673;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=BVtlJrW6SfWj3MgeJmU+/wXrSNvyKW+qgTu53Z3Ivps=;
	b=YLjMkjlLWeFIM/OG+Srr/CxLAzvhvfNqgVzTH4zm1A3WTlzkUTgYzg/h5sg6ETpnYXyC
	 nmd+M1w0jALn/57IFjHowPoOBb/blM5Osgpv7oq3IG2dhe0eqrj7I7KHZ8lL3aln8yoH2
	 9B425qykOujgoNJ++i4e2ignJanbmeGhcpz1j0KxpXy4oUyUOH7UOXbBxXauF8x3X/fFA
	 I+6VA9ObXiJgLrLwxVtaVmFFBIPWpoGNSiRoCSB5WUeG5FqCU8PS/Atu+hl/T9mT45YRD
	 AZdFh/AAd4a/REwHXKLjltmlXizBGDrXCpB9uWLCawOiit7tWDX8AjyHYl/HIZcUKIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IIisD5hN;
	arc=none smtp.remote-ip=91.218.175.118
Received: from mta0.migadu.com (out-118.mta0.migadu.com [91.218.175.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BB1606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2BB1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IIisD5hN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FZmy8SvC6H21CaZiYu3i+kKcuo8X17YSJfigaWqJ4Uw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795112669; v=1; x=1795717469;
 b=IIisD5hNht8lVD4c8S0Z92QpydZVr5w0W9EJY1tP6VJNWDGAhcUWwKxzb5Hs3kz4ZLtD/iSG
 w6fKd2VJLTIJhdh/KpLqDv1CmpU7R9klM3y18chQ43jKyEQ2infTa2YKn3AHNeXGemJSAibeC5X
 Wl2s9zr7eU9i0t96nhEkMzEE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ad9efce9e0bc6326;
	Thu, 19 Nov 2026 18:24:29 +0000
X-Mizu-Trace-ID: ad9efce9e0bc6326
X-Migadu-Flow: FLOW_OUT
Message-ID: <ad6883e5-c103-4f82-8040-e5463477ca10@linux.dev>
Date: Thu, 19 Nov 2026 18:24:24 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/4] ptp: ocp: prevent timestamp rearming during
 detach
To: Ahmad Byagowi <ahmadexp@gmail.com>, netdev@vger.kernel.org,
 richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com
References: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
 <20261118-timecard-common-301f823ddd-1-ahmadexp@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261118-timecard-common-301f823ddd-1-ahmadexp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2026 20:05, Ahmad Byagowi wrote:
> Detach disables timestamp interrupts before unregistering the PTP clock.
> Until the POSIX clock is unregistered, an ioctl can rearm a channel
> after that disable. The clock can then be released while the timestamp
> IRQ is still registered. The core cleanup does not necessarily disable
> the channel: EXTTS requests do not require a PTP_PF_EXTTS pin
> assignment.
> 
> Serialize timestamp enables and disables with a mutex. Mark timestampers
> as stopping under that mutex before the detach disable loop, so an
> enable already in progress finishes first and later enables fail with
> -ENODEV. Keep disables available for the PTP core cleanup. The existing
> MMIO readback and synchronize_irq() then drain events before
> ptp_clock_unregister() can release the clock.
> 
> Reported by the netdev Sashiko AI review, then checked against the
> current PTP and POSIX-clock paths. A source-derived userspace harness
> forces an enable after detach's disable and reproduces the rearm with
> the old source. With this fix it rejects that enable, waits for an
> enable already in progress, and waits for a mocked active IRQ. Both
> timestamp and combined PPS/EXTTS paths pass with ASan/UBSan. This
> validates ordering with stubbed MMIO/IRQ operations, not an in-kernel
> use-after-free reproduction. No physical card was tested.
> 
> Codex prepared the fix, tests and changelog from the review and upstream
> source, at the request to separate common-driver fixes from WiWi support
> and validate removal ordering.
> 
> Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")
> 
> Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
> 
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
> ---
>   drivers/ptp/ptp_ocp.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 625a85b2dc..478f7012b2 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -367,6 +367,9 @@ struct ptp_ocp {
>   	struct pci_dev		*pdev;
>   	struct device		dev;
>   	spinlock_t		lock;
> +	/* Serializes timestamp arming and teardown. */
> +	struct mutex		ts_lock;
> +	bool			ts_stopping;
>   	struct ocp_reg __iomem	*reg;
>   	struct tod_reg __iomem	*tod;
>   	struct pps_reg __iomem	*pps_to_ext;
> @@ -2550,6 +2553,13 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
>   	struct ptp_ocp_ext_src *ext = priv;
>   	struct ts_reg __iomem *reg = ext->mem;
>   	struct ptp_ocp *bp = ext->bp;
> +	int err = 0;
> +
> +	mutex_lock(&bp->ts_lock);
> +	if (enable && bp->ts_stopping) {
> +		err = -ENODEV;
> +		goto out;
> +	}

ts_stopping is changed only in device detach callback, there is actually
no need to cover whole ptp_ocp_ts_enable() with mutex, I believe
existing spinlock can be used to serialize this access, no?

>   
>   	if (ext == bp->pps) {
>   		u32 old_map = bp->pps_req_map;
> @@ -2561,7 +2571,7 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
>   
>   		/* if no state change, just return */
>   		if ((!!old_map ^ !!bp->pps_req_map) == 0)
> -			return 0;
> +			goto out;
>   	}
>   
>   	if (enable) {
> @@ -2578,7 +2588,9 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
>   			synchronize_irq(irq_vec);
>   	}
>   
> -	return 0;
> +out:
> +	mutex_unlock(&bp->ts_lock);
> +	return err;
>   }
>   
>   static void
> @@ -5613,6 +5625,7 @@ ptp_ocp_device_init(struct ptp_ocp *bp, struct pci_dev *pdev)
>   
>   	bp->ptp_info = ptp_ocp_clock_info;
>   	spin_lock_init(&bp->lock);
> +	mutex_init(&bp->ts_lock);
>   
>   	for (i = 0; i < __PORT_COUNT; i++)
>   		bp->port[i].uport = NULL;
> @@ -5755,6 +5768,10 @@ ptp_ocp_detach(struct ptp_ocp *bp)
>   	ptp_ocp_detach_sysfs(bp);
>   	ptp_ocp_attr_group_del(bp);
>   	timer_delete_sync(&bp->watchdog);
> +	/* Drain in-flight enables and prevent rearming before unregister. */
> +	mutex_lock(&bp->ts_lock);
> +	bp->ts_stopping = true;
> +	mutex_unlock(&bp->ts_lock);
>   	/* Disable interrupts on all timestampers */
>   	if (bp->ts0)
>   		ptp_ocp_ts_enable(bp->ts0, 0, false);
> @@ -5789,6 +5806,7 @@ ptp_ocp_detach(struct ptp_ocp *bp)
>   	if (bp->n_irqs)
>   		pci_free_irq_vectors(bp->pdev);
>   	mutex_destroy(&bp->cpld_lock);
> +	mutex_destroy(&bp->ts_lock);
>   	device_unregister(&bp->dev);
>   }
>   

