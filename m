Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475410;
	b=1ooUGxh2Fx2GSidUj5bJbQNWeccMOTdcOg8uB4oPeR9NT6vyuYKuMwN0Z+VpX5V4QWLS
	 SD5X8iE2XujSFJWt1yzBc88MzirJnyJd+GF+3/BCbv5wU3IoTVNNnTGQvERhT6SQis9Wd
	 bSHb9CjmjuOu79up8FhmJerRRHvsEqz5EInFETfqXRbDuBxgsAeE69P2wQD2aP9Hm1hsV
	 bRUuAWIOgiXQqc/at/IRf4EhRWySCHeruC9g0Ek5nSAXPcKFK7fvlM9bLR56zjUZPej0G
	 3ChgLLnSUNAoS9TNhU3RBRxdni9N1zTtx30RhAAgchFNfpqSlNBSJkXywFhv9sMbKvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=07V7ZQy5TQefvaDTPvsZaO025LiJXKlvb9dqDNfJ8YI=;
	b=vLVupPZGFHHy82BQhCAThRthc6OJVDPOTks8YziZZLckSwXYG/XzLkwds5iqVe2/IRSq
	 yMJ5mQGliWf4AJm5T70NYjmPdBxk/fSlglWG18gJQHhYgHcJqT5mv6tvf4ZUwiCdDHezV
	 +J4cbsI2xpvOjdWDSR6KpdNHLj9tojs8eVevHc/mq0chuvjchfgW/huYBPfIKwtYqlAmQ
	 AiEbv+TIuvGpoWYHO+AK4EuVuKpOeN439cQXsOVL8gRnNHtpcdEOWCVJokxsLQ+G4rIsM
	 EGaAu31WRj1D5O1y0aCKCA/E7FcF7y8nFyyGirqMnShdqy9YOVTD/gjqeXnIryuT9qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YxBEwfH6;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A10606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A10606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YxBEwfH6
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f04f61282dso15020765ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795475409; x=1796080209; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07V7ZQy5TQefvaDTPvsZaO025LiJXKlvb9dqDNfJ8YI=;
        b=YxBEwfH6aJwBoS/MAjoc1wWhGI6bDdr5EVmt7tv9RBylFV7K+wtTxDOkF0NTDW1xLx
         tsMepLIey4LfgTpqKV7ZdoV+s8logqvxFVd8fDKaPxIuevdPb/5YexRnb7+JTbOy3uFB
         vGpTnCOsxf5F+VOzjhdqcrLb1dJ/RPgmXOPhhMIZH3KSWH0wDoriHXooLoxKSPlZuNVt
         wrwq3cdP4hdCknvefETdCTTrindEVP0xZYh5narZJPzmMEZyRZTtrQzG+KHJkneXdHMH
         U6X0aGWsycMbVh/7DNYYtq36oZ8D5cYcc7j1v2+hh2Nhsl2EamaXbx5xWw9EJfIWp2R6
         zd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475409; x=1796080209;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=07V7ZQy5TQefvaDTPvsZaO025LiJXKlvb9dqDNfJ8YI=;
        b=z4vVHgpYpkKHpvSUa+kA5BlJ849nn3PByichvNv0yRNj7rLf+Q6aGgk9ZIacVqt1R9
         AlETJuVze/wRl8Qjw4mhAyaVyinmPdIJNXal8emqpFLYguqjEBe1yKGhoo6hnuqkZlly
         7VNhWqEgmNH+rQUNcM1pomYCLludQi2V1srN9V5vpyA6OYj1z6PUiHCiRHluRxk3Nqrp
         l58eKii9qrh3QiF/X7x/a7T4rVhOYGT7/Qjsc1ry/Upr+bLk86J1kFoAdqx+40TBcCdb
         xdR4DdIuuYIzrGEEuKGzQJxDZlsWsz43eitwxAYCeoEcUxlxtVL2xOV5qRuBexzcB97e
         /s8Q==
X-Forwarded-Encrypted: i=1; AL+hErEgFpSnIjcwEJi3LAz4M7bdPtrX/rn3xT8n8LVAMGZ/rLT/b00o2wGO66PWg7s5/Dkt3DsTag0CF7wos8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/opK/RUKXeu0NGNdd9nu3jfPlWT0Muvr/mLI/pYKrbnQtZMn7L
	RZeVra8EJiPtk9kPd9/PVJP/IMxdSGUYodphv0BsLK58LWPtD3fao6125r+Y53+tyc4=
X-Gm-Gg: AZFdTZfFToGdsk56UxQxT483mVuK9fMv81RPVo5Xfy/rGTvodr4XMvnbR+gQhMvNpKR
	PVkFLMGf/YWpjsCWn48QvapAblZieXO6mdKBF4xGtq605jS9TD6wW8J8AuzpgMLyhyJJ0uDgHT8
	FJe5VJNRFMkRefN4bXWHXXIGKzhNfzMCpiBL3ks715NUBio3/eWcQ5C8jG7unECtW5mQGjj2W6u
	WnRL6dmHgWPEcmOxvSaIFo6nrOKDx/wN07QlIb/qu37d/2C6sPLyt0jkZT4kXNFtUzhnhQGegp6
	sd99P8QMu+oRCtOrwItVAeDLlJwjNdlYr6xke8olefjcFuv31NmIIfDPkpzqgWQ7xD0lPbXXGrK
	SL3wJ0oAXGBLW12WwcUC0f3wFklJXWAcEzFZ36AmcarrOjgt3gD2n5+moVe8bN5kVUoBrWnUGUw
	DBdE2YqwvbH62Ev9rRiL5onuaRE+Dv3bILJH1AyOPwr+41Zrm7eTMbHUJUBtnyvmmRx+ZlzjnVN
	Tno53Ue7/j8Wd0Q/1j63fdxlywju0dXinGwpGyKD7R6sxx2quOZQugDnO+hPDxEw/geY6sc624t
	2SQO2bnKxeolRfVn+l1H5dky+kq6D8pZcTo+Z9iaUeQ=
X-Received: by 2002:a17:90b:2688:b0:3b3:b71e:b2e7 with SMTP id 98e67ed59e1d1-3b41c92a209mr10661945a91.36.1795475409368;
        Mon, 23 Nov 2026 15:10:09 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:72::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm19717040a91.4.2026.11.23.15.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:10:07 -0800 (PST)
Date: Mon, 23 Nov 2026 15:10:06 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v6 4/5] bnxt_en: refuse to open a device with stopped
 DMA
Message-ID: <awTHzto2KqruYx78@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sashiko@kernel.org,
	netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
References: <20261120152830.699712-5-joe@dama.to>
 <179545866233.3135.17505837220604349272@kernel.org>
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
In-Reply-To: <179545866233.3135.17505837220604349272@kernel.org>

On Mon, Nov 23, 2026 at 06:31:02PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 3 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] BNXT_STATE_DMA_STOPPED is set once in bnxt_stop_dma()
>   (bnxt.c:7850) and never cleared.
> - [Medium] The commit message says DMA_STOPPED is added to
>   BNXT_NO_FW_ACCESS() "so HWRM commands sent after DMA is stopped fail…
> - [Medium] BNXT_STATE_DMA_STOPPED records a specific hazard: firmware did
>   not free its rings, so the device may still hold DMA addresses of…
> 
> --
> 
> bnxt_en: refuse to open a device with stopped DMA
> 
> This patch adds BNXT_STATE_DMA_STOPPED. The bit is set in bnxt_stop_dma(),
> and bnxt_open(), bnxt_open_nic() and bnxt_half_open_nic() refuse to open
> the device while it is set. The bit is also added to BNXT_NO_FW_ACCESS()
> so that HWRM commands fail fast once DMA has been stopped.
> 
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > index 600a8c866f3c3..9daf053293a42 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > @@ -7847,9 +7847,20 @@ static void bnxt_stop_dma(struct bnxt *bp)
> >  
> >  	netdev_err(bp->dev,
> >  		   "Disabling DMA before releasing ring memory, the driver must be rebound to recover\n");
> > +	set_bit(BNXT_STATE_DMA_STOPPED, &bp->state);
> >  	pci_clear_master(bp->pdev);
> >  }
> 
> [Severity: Medium]
> Is BNXT_STATE_DMA_STOPPED ever cleared? This set_bit() and the test_bit()
> calls are the only places that touch it. Once set, it stays set even
> after the PCI function or slot has been reset and bus mastering has been
> turned back on.
> 
> The comment at the top of bnxt_stop_dma() says "A firmware reset resets
> the device". Even so, two recovery paths that reset the function now fail
> partway because the bit is stale.
> 
> In bnxt_resume():
> 
>     pci_set_master(bp->pdev);
>     ...
>     if (bnxt_hwrm_ver_get(bp)) {
>     ...
>     rc = bnxt_hwrm_func_reset(bp);
>     ...
>     rc = bnxt_hwrm_func_qcaps(bp);
>     if (rc)
>         goto resume_exit;
> 
> __hwrm_send() exempts VER_GET and FUNC_RESET, so both reach the firmware
> and the function is reset. BNXT_NO_FW_ACCESS() then skips
> bnxt_hwrm_func_qcaps(), which returns -EBUSY. Resume fails with bus
> mastering on, HWRM_FUNC_DRV_RGTR is never sent, and the netdev stays
> detached.
> 
> One way to reach this is through the suspend path, when
> bnxt_shutdown_nic() fails:
> 
> bnxt_suspend()->bnxt_close()->__bnxt_close_nic()->bnxt_stop_dma()
> 
> AER recovery has the same problem. bnxt_io_slot_reset() calls
> pci_set_master(), bnxt_try_recover_fw() and bnxt_hwrm_func_reset(), then
> returns PCI_ERS_RESULT_RECOVERED. bnxt_io_resume() then fails in one of
> two places:
> 
>     err = bnxt_hwrm_func_qcaps(bp);
>     if (!err) {
>         if (netif_running(netdev)) {
>             err = bnxt_open(netdev);
> 
> It fails either in bnxt_hwrm_func_qcaps() or in
> bnxt_open()->bnxt_check_dma_stopped(), so the device never reattaches.
> 
> Before this patch, with the earlier "stop DMA before releasing rings"
> change applied, both paths re-initialized the device. Also,
> bnxt_check_dma_stopped() would then print "DMA was disabled ..." even
> though bus mastering has been turned back on.
> 
> Should the bit be cleared once the function has actually been reset?

No, this is intentional. Recovery is rebind only. The device gets into
this state because the firmware stopped answering. I don't want resume
or AER recovery to turn the device back on without knowing the stale
ring state is gone.

Resume and AER only fail if a RING_FREE has already failed before them.
I haven't seen that. If it happens, the device stays down and has to be
rebound.

> [ ... ]
> 
> > @@ -13519,6 +13535,10 @@ static int bnxt_open(struct net_device *dev)
> >  	struct bnxt *bp = netdev_priv(dev);
> >  	int rc;
> >  
> > +	rc = bnxt_check_dma_stopped(bp);
> > +	if (rc)
> > +		return rc;
> > +
> 
> [Severity: Medium]
> The new bit is only checked in the three open functions. Can
> bnxt_resume() turn DMA back on while the device still holds stale ring
> addresses?
> 
> The bit is set because the firmware did not free its rings. Clearing bus
> mastering is the only thing that stops the device from writing into ring,
> RX buffer and stats memory after __bnxt_close_nic() frees it.
> bnxt_suspend() runs bnxt_close(), which may set the bit. bnxt_resume()
> then does this without looking at BNXT_STATE_DMA_STOPPED:
> 
>     pci_set_master(bp->pdev);
>     if (BNXT_VF(bp)) {
>         for (i = 0; i < BNXT_RESUME_MAX_RETRY; i++) {
>             rc = bnxt_hwrm_poll(bp);
>     ...
>     if (bnxt_hwrm_ver_get(bp)) {
>         rc = -ENODEV;
>         goto resume_exit;
>     }
>     rc = bnxt_hwrm_func_reset(bp);
>     if (rc) {
>         rc = -EBUSY;
>         goto resume_exit;
>     }
> 
> Suppose the function's firmware ring state survives suspend, for example
> with s2idle or D3hot with No_Soft_Reset. The device can then do
> bus-master DMA from pci_set_master() until FUNC_RESET completes. For a
> VF, that window also covers the bnxt_hwrm_poll() retries and their
> sleeps. Whether this happens depends on platform and firmware behavior.
> 
> VER_GET or FUNC_RESET may well fail here, since the firmware has already
> stopped answering RING_FREE. If they do, resume jumps to resume_exit with
> bus mastering still on and the stale rings still live. Because the flag
> is stale (see the comment above), resume then gives up anyway.
> 
> The rebind recovery that the commit message prescribes uses the same
> order. bnxt_init_board() calls pci_set_master() before
> bnxt_fw_init_one_p1() sends FUNC_RESET. In the kdump case,
> bnxt_init_one() calls bnxt_kdump_reset() (pcie_flr()) before probing, to
> avoid this kind of stale DMA.
> 
> Should bnxt_resume() check BNXT_STATE_DMA_STOPPED, or reset the function
> with something like an FLR, before it turns bus mastering back on?

This is in the "leaving out" section of the cover letter.

> [ ... ]
> 
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> > index 41d05efd6307a..50c024dd3c6c4 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> > @@ -2474,9 +2474,11 @@ struct bnxt {
> >  #define BNXT_STATE_FW_NON_FATAL_COND	13
> >  #define BNXT_STATE_FW_ACTIVATE_RESET	14
> >  #define BNXT_STATE_HALF_OPEN		15	/* For offline ethtool tests */
> > +#define BNXT_STATE_DMA_STOPPED		16
> >  
> >  #define BNXT_NO_FW_ACCESS(bp)					\
> >  	(test_bit(BNXT_STATE_FW_FATAL_COND, &(bp)->state) ||	\
> > +	 test_bit(BNXT_STATE_DMA_STOPPED, &(bp)->state) ||	\
> >  	 pci_channel_offline((bp)->pdev))
> 
> [Severity: Medium]
> The commit message says:
> 
>     Also add the bit to BNXT_NO_FW_ACCESS() so HWRM commands sent after
>     DMA is stopped fail right away instead of waiting for the timeout.
> 
> Does that hold for every command? __hwrm_send() still lets two request
> types through when BNXT_NO_FW_ACCESS() is true:
> 
>     if (BNXT_NO_FW_ACCESS(bp) &&
>         (req_type != HWRM_FUNC_RESET && req_type != HWRM_VER_GET)) {
> 
> The device writes HWRM responses into ctx->resp by DMA. With bus
> mastering cleared, HWRM_VER_GET and HWRM_FUNC_RESET cannot complete, so
> they still wait for the full timeout. The exemption list was written for
> fatal-error and channel-offline recovery, where bus mastering is or will
> be enabled again.
> 
> Devlink reload can reach this. The first reload fails in
> bnxt_dl_reload_down(): bnxt_hwrm_func_drv_unrgtr() clears
> BNXT_STATE_DRV_REGISTERED and then gets -EBUSY. On a second reload,
> unrgtr returns 0 and devlink calls bnxt_dl_reload_up():
> 
> bnxt_dl_reload_up()
>   bnxt_fw_init_one()
>     bnxt_fw_init_one_p1()
>       bnxt_hwrm_ver_get()       <- waits for the timeout, then msleep(100)
>       bnxt_try_recover_fw()
>         bnxt_hwrm_poll()        <- another VER_GET
>       bnxt_hwrm_ver_get()
>       bnxt_hwrm_func_reset()
> 
> Nothing on this path checks BNXT_STATE_DMA_STOPPED. Only bnxt_open_nic(),
> which runs later, does. Each exempt command sent along the way waits for
> the full HWRM timeout.
> 
> Should __hwrm_send() also refuse these two commands while
> BNXT_STATE_DMA_STOPPED is set, or should the commit message be reworded?

Yea the commit message could be reworded. I don't know if it's worth a respin
just for that. Like I said in response to an earlier patch (I think patch 1?)
if I need to send a v7, I'll include a commit message update.
