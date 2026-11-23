Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475001;
	b=fEytmDQR3e5oIm17mzHniC+zbrcuW9aDWY2cG0fae0EjZQmJ1ry/ImjiWWTbMofH2XKz
	 Qyk0DACphDRA5HM+KJ5qyucd9J95HMUZCSl24gflMJVuPlWlCbXZf7spaBny0UxzaOZFE
	 2utfYDfdHcfmaiBXombN4QlmKXyzylM2atX5DHzaDrYNcOf3omU9AiiiLbn8FsdRP/46d
	 CPskZEu0ajShnLeNE3oBdrs6bP67PSpWKNlqKPviaquX9LEq8lYy0saqhNfdjHOcjFYrJ
	 CcO9gTPPc9Wptb8NeSan0rch9FtxkmNX1QOM0/g8UzTdyac/tiSEtuMS304uEcWtgcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Pl/nnqshC7ITDcQxwKlm6p7+uFyXAvJeDOeOZABWmTs=;
	b=kIINAau2l5kXKJtpSt/fV/BdtE++naBYIOwlcR+WbCKFb5V4iZddgvIzkOlTj7884nQ+
	 P5O4rzPx4yuGrZKL75gIzxo0bV5Yy/v5+LMViC6qcuMjvOOvbo9pJeOH6bai4R20eRxqi
	 GPkd5oKHVKEQiPxlRI20oO70EvgYbBLTBJ2F6hprMNrDMkph82SoeGFREQLS7vrtFt8BV
	 rXDYwG66Duw17t6fqwpmChLLreEvHNP3TMQYif6Bg+4nsw0pfsZGP4sP+pO/GE7AnTAGq
	 R63Xfw+EL6AZExsil4tiKgn98ZX0YmloJWpU/jk7c5KrukvMqnRRpQVwEwSXaL4vVWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o5kAH9NX;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5883D606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5883D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o5kAH9NX
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cde827b7b95so785389a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795475000; x=1796079800; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pl/nnqshC7ITDcQxwKlm6p7+uFyXAvJeDOeOZABWmTs=;
        b=o5kAH9NXYsSWs+aPMwx7sCrVXVnUKkvXWFhfyMo+oFvkzAhqiZPj78wgcoNurIV50V
         GKPzAO3mryJsYmebRIb/ihNBUoyHysdangh35dRvjf0Sloew+q6Q+FNtqWq0/XK4xqMz
         6AscGJ9+8A83qo3EbB1voUiFhzo2QcikV3Egcj1h0DKKJQBVixay65jikykdjJ7W4v6y
         M4ffC26DZcFJenF2Oi6H01WLz+K7fYVp8LT6wtJYnwnTzYdeqvhA2Hdy9j6YJNz3uOLD
         KCknCt21CIrTUa0mDHNF6z4UvjFNbIpIpkR+Q5S138T2mIGPAgFU+Fy3f5DbNgaFRdqU
         PMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475000; x=1796079800;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pl/nnqshC7ITDcQxwKlm6p7+uFyXAvJeDOeOZABWmTs=;
        b=o4U5f7XRP9wGnNhHjYpMC1W1z6c6GQflcQ2UOViqo7PaglkPmX1ygnMHq5G6SdJVpN
         6Z8mQCsPW7XzJG38/qrEe6ISDOQ1jl8QUoxu+j732QQYhPrsNf+KrYP4DuOQT0V3LFyg
         ZxBhV+Ov0mq6oPp3EovUnX1Z8rc075t4bzANAk1o1EZX0HP/mi5gCRbZ0PfzI8ZFDX1r
         CKim9fDpEj+nuW5OLreeBCfAQWRqb+12Gy1Kg3Ku2kofJ2+KzcloYxj48yHG2meY71WN
         dfRXhZEPGMXAqm+1hLPs1RrBncMAeFO/E64xh30ZIZ+ygm9035wUXkhk0XWZahN1Kt1I
         okqA==
X-Forwarded-Encrypted: i=1; AL+hErHY8+5dqoVfQCIuZ8/YOcnhO+8a7Thu/IXEOD+u5auVpadxP4yc9cVoavyQ+T4RnpJl9/5vdM+JRoTJLGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gfaPi7AZbsGZdLRYv2B8l6nrKOGmj8GqA9LRiUfZ1iCW3WQ+t
	/mOpgjOm3c8jrbGYAfvQtDp9WS7sZCQ2FoSv9jjDTVQgQSUr/kod76CY34W/xQESbYs=
X-Gm-Gg: AZFdTZcae40VKzsfvqQzu7atbAqdStv4m8AoWLo/+IaWVAVhPd6H1tt0EXQKHpMwNh3
	Fleh0I5wYqF1H1+Gnm7yxNo0hTL+SVTPLMwZ3/AMAmQMPRoF+aywj9g4SAdiKJWrkUqc0xwJte8
	S7uyErr2gTWiH1scNEsp0dI1ehgRGUPB2rK0b+J90yiX7hmf+XFSAQd1TGAzzOTikh1JCfNNQK6
	d3tiyXYe/lvP2OWGgyid5ifbKG+ucbwmVMQoZ8+LoXjdIHCdzrrWpwTo9oWn/QOu51fdpTE2Mak
	5nswcqLPBizBn/DlmZE0E/jVnBs749aP0CskBK7prf14vOM0EuE5AC6yXynqnlkGgtQ+agMj93s
	nood3lFpALSGGh45qQCpcOvzIocNh2EVFfv7QtopfjWFFXWH7YX1FU7wa87DIxhgN55+xhsY0pl
	fo0teBLERzN0KWLURCVoOFuZUbewolpNCAkJMfqR3olXIGfLLuANZnWgxrVGWMX4bOjuMR+LyUG
	9cVRjEXS6uGWMO0OEP1Td2mMBV9tQhDR8iv3LnZLRRP2QpqP//xvtqHgwoeyDrjoEN9M431MKp3
	21x88QixO4me1+YUwVa4HYXrhPGPzfrOfNf/DxppK1ahuO7rW/8DGzCq8qPe8frm
X-Received: by 2002:a17:90b:2fcd:b0:3b4:a90:7f47 with SMTP id 98e67ed59e1d1-3b41c94296bmr11537104a91.34.1795474999426;
        Mon, 23 Nov 2026 15:03:19 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4a::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm22439341a91.4.2026.11.23.15.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:03:18 -0800 (PST)
Date: Mon, 23 Nov 2026 15:03:18 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v6 3/5] bnxt_en: stop DMA before releasing rings the
 firmware did not free
Message-ID: <awTGNkcXipBuXEkO@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sashiko@kernel.org,
	netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
References: <20261120152830.699712-4-joe@dama.to>
 <179545866090.3135.4815761130655709444@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179545866090.3135.4815761130655709444@kernel.org>

On Mon, Nov 23, 2026 at 06:31:00PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 2 · Medium: 5 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The fix leaves the per-queue restart paths uncovered.
> - [High] bnxt_stop_dma() skips pci_clear_master() whenever
>   BNXT_STATE_IN_FW_RESET or BNXT_STATE_FW_FATAL_COND is set.
> - [Medium] bnxt_hwrm_ring_free() counts only TX, RX and AGG RING_FREE
>   failures in 'stuck'.
> - [Medium] bnxt_stop_dma() clears Bus Master Enable for the whole PCI
>   function from ordinary L2 close paths, but the users that share the…
> - [Medium] bnxt_hwrm_ring_free() marks a ring as stuck only when the
>   helper returns exactly -EBUSY.
> - [Medium] The patch presents driver rebind as the recovery ("The device
>   stays unusable until the driver is rebound"), but rebind is not safe…
> - [Medium] -EBUSY from hwrm_ring_free_send_msg() does not always mean the
>   firmware never answered and may still own the ring.
> 
> --
> 
> bnxt_en: stop DMA before releasing rings the firmware did not free
> 
> This patch makes bnxt_hwrm_ring_free() count the TX, RX and AGG rings whose
> HWRM_RING_FREE returned -EBUSY, and report an error to its callers. In that
> case __bnxt_close_nic(), bnxt_half_close_nic() and the bnxt_init_chip()
> error path call the new bnxt_stop_dma(). It clears bus mastering unless a
> firmware reset or a fatal firmware error is in progress.
> 
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > index c3413354e7582..600a8c866f3c3 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > @@ -7774,21 +7774,31 @@ static void bnxt_clear_one_cp_ring(struct bnxt *bp, struct bnxt_cp_ring_info *cp
> >  			memset(cpr->cp_desc_ring[i], 0, size);
> >  }
> >  
> > -static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
> > +static int bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
> >  {
> > +	int stuck = 0;
> >  	u32 type;
> >  	int i;
> >  
> >  	if (!bp->bnapi)
> > -		return;
> > +		return 0;
> >  
> > +	/* -EBUSY means the firmware never answered, so it may still own
> > +	 * the ring.
> > +	 */
> 
> [Severity: Medium]
> Does -EBUSY always mean the firmware never answered?
> 
> __hwrm_send() starts with rc = -EBUSY. It returns that value when
> hwrm_wait_must_abort() finds the firmware health register in a not-healthy
> state, for example while the firmware is resetting:
> 
> drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c:hwrm_wait_must_abort() {
>     ...
> 	*fw_status = bnxt_fw_health_readl(bp, BNXT_FW_HEALTH_REG);
> 	return *fw_status && !BNXT_FW_IS_HEALTHY(*fw_status);
> }
> 
> bnxt_stop_dma() only checks the driver bits BNXT_STATE_IN_FW_RESET and
> BNXT_STATE_FW_FATAL_COND. During __bnxt_close_nic() those bits can lag
> behind the hardware:
> 
> - BNXT_STATE_OPEN is already cleared, so bnxt_sp_task() and
>   bnxt_fw_reset() return early and never set IN_FW_RESET.
> - A non-fatal RESET_NOTIFY only sets FW_NON_FATAL_COND.
> 
> Say a firmware reset overlaps an ifdown, started either by another
> function or by devlink fw_activate. The aborted RING_FREEs are counted as
> stuck and bus mastering is cleared. Later in the series this also sets
> BNXT_STATE_DMA_STOPPED, which is never cleared.
> 
> The chip reset would have discarded the ring state anyway. Normally the
> next open recovers through the hot reset handling in
> bnxt_hwrm_if_change(), but bnxt_check_dma_stopped() now refuses that open,
> and HWRMs fail fast.
> 
> Can this turn a recoverable firmware reset into an outage that needs a
> rebind?

This is intentional. The third system in the cover letter logged:

  Abandoning msg {0x51 0x3e35} len: 0 due to firmware status: 0x408100

and the DMAR write faults came after that. The health register can't
tell a firmware that is resetting apart from one that is unhealthy and
still doing DMA, so an abandoned RING_FREE is treated as stuck.

> >  	for (i = 0; i < bp->tx_nr_rings; i++)
> > -		bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i], close_path);
> > +		if (bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i],
> > +					   close_path) == -EBUSY)
> > +			stuck++;
> 
> [Severity: Medium]
> Should this check be limited to -EBUSY? Other errors from
> hwrm_ring_free_send_msg() can also leave the ring live in the firmware.

Limiting it to -EBUSY was a deliberate change in this version, discussed
on the v5 thread. An error reply means the firmware is alive and
answering, and every TX/RX/AGG failure in the production logs was a
no-response. I covered the -ENOMEM case in my reply to patch 1.

> hwrm_ring_free_send_msg() passes rc from hwrm_req_init() and
> hwrm_req_send() through unchanged. __hwrm_req_init() returns -ENOMEM when
> dma_pool_alloc() fails. __hwrm_send() returns -ENOMEM when
> __hwrm_acquire_token() fails:
> 
> drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c:__hwrm_send() {
>     ...
> 	token = __hwrm_acquire_token(bp, dst);
> 	if (!token) {
> 		rc = -ENOMEM;
> 		goto exit;
> 	}
>     ...
> }
> 
> Both of these fail before the request reaches the firmware, so the ring is
> certainly still active. A firmware error reply is either mapped through
> __hwrm_to_stderr() or returned as -EIO when error_code is non-zero. That
> can also mean the ring was not freed.
> 
> In each of these cases the helper still clears fw_ring_id and stuck stays
> at zero. bnxt_stop_dma() is skipped, and __bnxt_close_nic(),
> bnxt_half_close_nic() or bnxt_init_chip() go on to bnxt_free_skbs() and
> bnxt_free_mem() with bus mastering still enabled.
> 
> Would it be safer to count any non-zero return here, and in the RX and AGG
> checks below?
> 
> >  
> >  	bnxt_cancel_dim(bp);
> >  	for (i = 0; i < bp->rx_nr_rings; i++) {
> > -		bnxt_hwrm_rx_ring_free(bp, &bp->rx_ring[i], close_path);
> > -		bnxt_hwrm_rx_agg_ring_free(bp, &bp->rx_ring[i], close_path);
> > +		struct bnxt_rx_ring_info *rxr = &bp->rx_ring[i];
> > +
> > +		if (bnxt_hwrm_rx_ring_free(bp, rxr, close_path) == -EBUSY)
> > +			stuck++;
> > +		if (bnxt_hwrm_rx_agg_ring_free(bp, rxr, close_path) == -EBUSY)
> > +			stuck++;
> >  	}
> 
> [Severity: High]
> The per-queue restart paths call the same helpers but still ignore what
> they return. Can they free memory the firmware is still using?

Answered in the reply to patch 1; this is in the "leaving out" section
of the cover letter.

[...]

> 
> [Severity: Medium]
> Only TX, RX and AGG failures are counted in stuck. What happens if one of
> the other teardown commands times out?

Also in the "leaving out" section of the cover letter. The commit message
explains why only TX/RX/AGG are counted.

> Three other teardown commands ignore their results and invalidate the
> firmware IDs anyway:
> 
> - the completion ring frees through bnxt_hwrm_cp_ring_free(), which
>   returns void
> - the NQ/L2_CMPL free in the bnapi loop above
> - bnxt_hwrm_stat_ctx_free():
> 
> drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_hwrm_stat_ctx_free() {
>     ...
> 			hwrm_req_send(bp, req);
> 
> 			cpr->hw_stats_ctx_id = INVALID_STATS_CTX_ID;
>     ...
> }
> 
> On the close path, the TX/RX/AGG responses come back on the completion
> ring. The CP/NQ/STAT_CTX frees use the default response channel, so they
> can fail independently.
> 
> If only those later commands time out, stuck is zero and
> bnxt_hwrm_resource_free() returns 0. __bnxt_close_nic()->bnxt_free_mem()
> then frees:
> 
> - the completion and NQ descriptor pages, through bnxt_free_cp_rings()
>   and bnxt_free_all_cp_arrays()
> - with irq_re_init, the hw_stats buffers, through bnxt_free_ring_stats()
> 
> The firmware keeps DMAing stats into those buffers until STAT_CTX_FREE
> succeeds.
> 
> The commit message limits the scope to TX, RX and AGG rings. Should these
> failures also lead to bnxt_stop_dma()?
> 
> > +
> > +	netdev_err(bp->dev, "Firmware did not free %d ring(s)\n", stuck);
> > +	return -EIO;
> > +}
> > +
> > +static void bnxt_stop_dma(struct bnxt *bp)
> > +{
> > +	/* A firmware reset resets the device, and the fatal error path
> > +	 * already disables it.
> > +	 */
> > +	if (test_bit(BNXT_STATE_IN_FW_RESET, &bp->state) ||
> > +	    test_bit(BNXT_STATE_FW_FATAL_COND, &bp->state))
> > +		return;
> 
> [Severity: High]
> Does either of these bits guarantee that DMA has stopped before
> __bnxt_close_nic() frees memory?
> 
> For a non-fatal firmware reset, bnxt_fw_reset() and bnxt_force_fw_reset()
> set IN_FW_RESET and call bnxt_fw_reset_close():
> 
> drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_fw_reset_close() {
>     ...
> 	__bnxt_close_nic(bp, true, false);
> 	bnxt_vf_reps_free(bp);
> 	bnxt_clear_int_mode(bp);
> 	bnxt_hwrm_func_drv_unrgtr(bp);
> 	if (pci_is_enabled(bp->pdev))
> 		pci_disable_device(bp->pdev);
>     ...
> }
> 
> In the non-fatal case, __bnxt_close_nic() runs while the firmware is still
> reachable (BNXT_NO_FW_ACCESS does not include IN_FW_RESET) and bus
> mastering is still on. pci_disable_device() only comes after
> bnxt_hwrm_func_drv_unrgtr(), which can itself wait out the HWRM timeout.
> The chip reset comes later still, from the reset task.
> 
> A RING_FREE that returns -EBUSY in this window is counted as stuck. This
> early return then lets bnxt_free_skbs() and bnxt_free_mem() release the
> rings and RX buffers while the device can still DMA.
> 
> For FW_FATAL_COND: NAPI is still enabled while the TX/RX/AGG RING_FREEs
> are sent. bnxt_async_event_process() can set the bit at any time on a
> fatal RESET_NOTIFY. __hwrm_send() then aborts the in-flight RING_FREE:

In the fatal case bnxt_fw_reset_close() calls bnxt_fw_fatal_close() before
__bnxt_close_nic(), so DMA is already off when memory is freed.

In the non-fatal case the firmware is healthy during the close and
is expected to answer RING_FREE. The ordering there is the same as before
this series.

The check exists so that a coordinated firmware reset does not end in a
forced rebind. The remaining case is a fatal event arriving in the middle
of an ifdown. That is narrow, I haven't seen it, and it behaves the same
as before the series.

> drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c:__hwrm_send() {
>     ...
> 			if (test_bit(BNXT_STATE_FW_FATAL_COND, &bp->state))
> 				goto exit;
>     ...
> }
> 
> rc is still -EBUSY at that point, so stuck is incremented and this
> function returns early.
> 
> bnxt_fw_fatal_close(), which disables bus mastering, never runs.
> bnxt_sp_task(), bnxt_fw_reset() and bnxt_force_fw_reset() all return early
> once BNXT_STATE_OPEN is cleared, and __bnxt_close_nic() clears it first.
> 
> The comment in bnxt_fw_reset_close() says the fatal case needs bus master
> disabled "to prevent any potential bad DMAs before freeing kernel memory".
> Does this early return leave that window open in both cases?
> 
> > +
> > +	netdev_err(bp->dev,
> > +		   "Disabling DMA before releasing ring memory, the driver must be rebound to recover\n");
> 
> [Severity: Medium]
> Is a rebind safe with the state this leaves behind?

Probably not completely? I think there's a window between pci_set_master() in
probe and HWRM_FUNC_RESET.

That said: before this series the memory was freed with DMA on and no window
at all, so this is still a big improvement, IMHO.

[...]

> 
> [Severity: Medium]
> This clears bus mastering for the whole PCI function, which is shared with
> the bnxt_re RDMA auxiliary device. Should the ULP be stopped first?
>
> At this commit no state bit is recorded either, so later open and HWRM
> paths keep waiting for DMA'd responses that can never arrive.
> 
> Later patches in the series fix part of this:
> 
> - "bnxt_en: refuse to open a device with stopped DMA" adds
>   BNXT_STATE_DMA_STOPPED, gates bnxt_open(), bnxt_open_nic() and
>   bnxt_half_open_nic() on it, and adds the bit to BNXT_NO_FW_ACCESS so
>   HWRMs fail fast.
> - "bnxt_en: stop the ULP around the reset task" stops the ULP, but only
>   in bnxt_reset().
> 
> At the end of the series, these paths can still reach bnxt_stop_dma()
> without bnxt_ulp_stop():
> 
>   bnxt_close()->bnxt_close_nic()->__bnxt_close_nic()
>   bnxt_self_test()->bnxt_half_close_nic(), followed directly by
>     bnxt_open_nic()
>   bnxt_close_nic() from the channels/rings/MTU/XDP reconfiguration paths
>   the bnxt_init_chip() err_out unwind
> 
> In those cases bnxt_re stays bound with live QPs/CQs and RCFW CMDQ/CREQ
> rings in host memory, and its DMA stops without any notification. The
> other paths that disable the device (bnxt_fw_reset(),
> bnxt_fw_exception(), AER, suspend) notify the ULP first.

The state bit comes in patch 4.

Patch 5 stops the ULP in bnxt_reset(), which is the path seen in production
(TX timeout).

The other close paths need a way for bnxt_re to detach after DMA has stopped,
which needs the RDMA maintainers and probably a separate series.

> Separately, the log message says the driver must be rebound to recover.
> However, bnxt_resume() and the ENABLE_DEV state of bnxt_fw_reset_task()
> both call pci_set_master() again, without a rebind and without resetting
> the stale ring state:
> 
> drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_fw_reset_task() {
>     ...
> 		pci_set_master(bp->pdev);
> 		bp->fw_reset_state = BNXT_FW_RESET_STATE_POLL_FW;
>     ...
> }
> 
> Is re-enabling bus mastering on those paths intended?

This is part of the "leaving out" section of the cover letter.
