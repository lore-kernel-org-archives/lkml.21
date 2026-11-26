Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653676;
	b=A72T88bI1lP2ARKhGIR+ywY96q6bXlbGZu8i7Vwv3mQfj17rbOcdQ8v0BBoH1BpSpv2z
	 BkAK0yJVeGlufhkTfRMx9UyCY3ELMKx92vl81jpCxWLbjjQzDkVvJbKl16SyEKgFhtWd3
	 ywtuTCsuvKt3XoUGkkEyGddy1u9oyJBsJTftHQZgMh8I021UqhNmnCEtlSl2IPIWIJUnp
	 8oof8unkORtIjUvK3/i1Br4Kyb0NiT8hMwj1jyzfzEQupqkoluMD4lVNoMX9V8lNo0VZS
	 HNWs3KQbCppLeIb5IybmhZEz3TMLo87Xa++2n3YCJmWpPwTrGyGb2DuES9EHr0s1mZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=etNvWZKM5KKoioqypEOUDZ9ml0pWkNpMWbqmez34aEM=;
	b=LPjORa+yYxxugmb1oqZh9cRM1B/IcwiWTJ6itJ19KGueQDTtYz7K3UZ2SpGFDYSTR37z
	 pXMhHDWBuq+SZgPKXt4RhtK4tFgQCPRbRVFA2l+5FBWQzVucKpf7XPFuxbKwtib+rkNoU
	 DPyxe/6hIYjUMbEqRc2edczXgNzjXaSXveKF3bJuiRRMAzdNKPcUksAZCWxTzZdskn1v2
	 zdejV06JofRZPJ5SgIJOO4S2VTglk6oRHcX0TJ5YMCLyqghywYQEHVXgbCD2YpTO/OcFo
	 mQ2Wd0KINsUcZf7xP3QLYKEksvJ2+l6II1fS4ujv5evh0w0/eGXR/FQgCusPtH+s0PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ah+Rqc8E;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34685606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34685606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ah+Rqc8E
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so3026186a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795653675; x=1796258475; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etNvWZKM5KKoioqypEOUDZ9ml0pWkNpMWbqmez34aEM=;
        b=ah+Rqc8EWu94j3V9pFzbEJY+coJXJrYrXZVJiL8EzUFi1Tl1VdiJWULTrFSywypAh9
         qzMriDb7rrXY5U5XW6JGfz1j9GkY6itN/tghy96cDMFZAWtkU5N3qbJyJmNKOn62Id2J
         NrBJqnS9OfJ8jsIefr2cf4iQ04c1bw81tE2G28t0a/5TlYQYxbi8beC4i1WU2Ym91Bkk
         YGaQVSUgrO3K5Be7OSPwde1m4W8tyC2yKCpJedcg/4mqDs4/XGAZlvoBLp1W7UUxM6yR
         VIqMZ8V73UuKJcSB2Nd96kr51mZF4bZq5f16ENzZTuXx5LqB1ghywqHsmU3TO9GV1JiQ
         95Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653675; x=1796258475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=etNvWZKM5KKoioqypEOUDZ9ml0pWkNpMWbqmez34aEM=;
        b=hSLJcnAt+YBpcvkyNUqwcP4y4Pq+kS876aKLDGS7FNbfWZ2B8myibokMqQ1LMgDfVy
         C9xO1I86Tkq/rgjTHPDIwX3CaLmpC2omYE3ES3tu3CusbAe9dBJyAEPgBhIzDlveLrA2
         LpmqRNDv0l17KT/U/2Vsr1OKRS+G7+vOOgCabzaGti77Q0Pci2MnOHsx+mH5dZs+1RAc
         ON0Hg2ly95nwHUMnc3Iua9nQ4/cj8arSm4creM9Gk3IumVgTlXUzEeGyCfzSNKWkIafM
         lNVXGPMk9CYBP9ohZAFNpflL57cl9UscmCfQMqTpRogDR5xVnFWS/uUxS4IHZo5PVu/w
         HdfQ==
X-Forwarded-Encrypted: i=1; AL+hErHXR2VVqn24Qnn/k26PluGiZrUY5OtCHL2ml4z4K0oJz5/80MIQ92uyWfCom+xoqjjzZwVYYqJTHlHLELs=@vger.kernel.org
X-Gm-Message-State: APuU4Z98xdY5seYEVStXJl3Zk2cFOfODWC/LBVXdX2CufAIG/JJPnhcu
	7fmaHTB7r3cbKRl1I2bssXRyApDsyqihlkhwf8PkMmR2IQ4NHyD/26D7i9deOOCPDBw=
X-Gm-Gg: AZFdTZfajsPVkBYYpHO0AY7aSasuMTuxBgwRRbdspnONB7f6U0rQ4qidQ0z1cc3wIVd
	KMW8mJJMGdOuKS5/h4FwFY985/dO+rzpq7taAgXEZlI0F38ezQJAo95YK2O1/Zptr2QmXMqaWGb
	hdU4DRmac4sD6i4YiLGJD4CuGwgQRpIQXtkk6QEwSbocseqv2oWTI4NaBBydaSC/2qT4EeQiQ6r
	ObZlTWPbkqjzmw1KGkNIICg1LdocpOqs8DCcj4zdROI4L9BaFFW+OuPoyf/2fSI/RcaMpfwn/4Y
	2rF1BQ7Ts9h/aYJj8c6Ts20z1Ft0Newl2J5xVsipOwwL7VHgyJSQj+V6Kd3N8KIqILSrflg3ESk
	7pdtrOUmZZaoQa318kmfrawTpp7SlpDANvwWIBsG4aMN6CROreGWVmkIWvkfe3IPHg79Dp3ATO+
	3DqmUC7lUAI+xgQXRBdyGBNn/EDzSYbEpRkH0zqQd8AfgQUGchPhByq8JPvCcZXfRbZrXYe3DhB
	fNyxilfweI0VAMTpGiM3yqu9oB8TE4qvDG4GtoalQzwTLR0407I1qczNi2dzpa0ehtdZOtWjP6g
	WzDHfC68DAZvkbVu1cx5vN0K7pvB9+4QjIwyHaeHgwc=
X-Received: by 2002:a17:90b:5109:b0:3b4:1621:ba5d with SMTP id 98e67ed59e1d1-3b41c95afa2mr19198117a91.38.1795653675091;
        Wed, 25 Nov 2026 16:41:15 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:43::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm28823022a91.7.2026.11.25.16.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:41:14 -0800 (PST)
Date: Wed, 25 Nov 2026 16:41:13 -0800
From: Joe Damato <joe@dama.to>
To: willemb@google.com
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, prashant@broadcom.com,
	edumazet@google.com, horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v6 5/5] bnxt_en: stop the ULP around the reset task
Message-ID: <aweAKQ6cUk6df/L6@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, willemb@google.com,
	netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, prashant@broadcom.com,
	edumazet@google.com, horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
References: <20261120152830.699712-6-joe@dama.to>
 <179545866419.3135.14423996277439097165@kernel.org>
 <awTJWtBSMubj4qQ9@devvm20253.cco0.facebook.com>
 <willemb.1401f0f6ad765@google.com>
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
In-Reply-To: <willemb.1401f0f6ad765@google.com>

On Wed, Nov 25, 2026 at 07:21:31PM -0500, willemb@google.com wrote:
> Joe Damato wrote:
> > On Mon, Nov 23, 2026 at 06:31:04PM +0000, netdev-bot+sashiko@kernel.org
> > wrote:
> > > Thank you for your contribution! Sashiko AI review found 6 potential
> > > issue(s) to consider.
> > >
> > > Critical: 0 · High: 3 · Medium: 3 · Low: 0
> > >
> > > If you believe none of the issues are legitimate, please reply to each
> > > issue of Medium severity or higher and explain why the AI is wrong.
> > > If any of them are legitimate and you plan to respin, please let
> > patchwork
> > > know by including "pw-bot: cr" as a separate line at the end of your
> > reply
> > > (one such reply per series is enough).
> > >
> > > - [High] Possible deadlock.
> > > - [High] bnxt_reset() decides to call bnxt_ulp_start() only from !silent
> > >   && !BNXT_STATE_DMA_STOPPED, after dropping its locks.
> > > - [High] Incomplete fix.
> > > - [Medium] bnxt_reset_task() discards the return value of
> > >   bnxt_open_nic(), and bnxt_reset() calls bnxt_ulp_start() whenever…
> > > - [Medium] The new DMA_STOPPED check exists only at the bnxt_reset()
> > call
> > >   site.
> > > - [Medium] Every non-silent reset now unregisters and re-registers the
> > >   RoCE IB device, including the common case where DMA is never stopped,…
> > >
> > > --
> > >
> > > bnxt_en: stop the ULP around the reset task
> > >
> > > For non-silent resets, bnxt_reset() now calls bnxt_ulp_stop() before it
> > > takes rtnl and the netdev lock. Afterwards it calls bnxt_ulp_start()
> > unless
> > > BNXT_STATE_DMA_STOPPED was set. The goal is to keep the RDMA driver
> > off the
> > > device once the reset task has stopped DMA.
> > >
> > > > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > > > index 9daf053293a42..2abb721d87de8 100644
> > > > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > > > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > > > @@ -14710,10 +14710,14 @@ static void bnxt_tph_update(struct bnxt *bp)
> > > >  /* Only called from bnxt_sp_task() */
> > > >  static void bnxt_reset(struct bnxt *bp, bool silent)
> > > >  {
> > > > +	if (!silent)
> > > > +		bnxt_ulp_stop(bp);
> > > >  	bnxt_rtnl_lock_sp(bp);
> > >
> > > [Severity: High]
> > > Can this deadlock against bnxt_close()?
> > >
> > > bnxt_sp_task() sets BNXT_STATE_IN_SP_TASK before it calls bnxt_reset().
> > > bnxt_rtnl_lock_sp() clears that bit only after bnxt_ulp_stop() has
> > > returned, and bnxt_rtnl_unlock_sp() sets it again before
> > bnxt_ulp_start()
> > > runs. So both new ULP calls run with IN_SP_TASK set.
> > >
> > > Both ULP callbacks take rtnl_lock():
> > >
> > > bnxt_ulp_stop()
> > >   bnxt_re_suspend()
> > >     bnxt_re_update_en_info_rdev()
> > >       rtnl_lock()
> > >
> > > bnxt_ulp_start()
> > >   bnxt_re_resume()
> > >     bnxt_re_add_device()
> > >       bnxt_re_update_en_info_rdev()
> > >         rtnl_lock()
> > >
> > bnxt_re_ib_init()->ib_register_device()->...->enum_all_gids_of_dev_cb()
> > >         rtnl_lock()
> > >
> > > ndo_stop, meanwhile, holds rtnl and the netdev instance lock and waits
> > for
> > > IN_SP_TASK to clear, with no timeout:
> > >
> > > __bnxt_close_nic() {
> > > 	clear_bit(BNXT_STATE_OPEN, &bp->state);
> > > 	smp_mb__after_atomic();
> > > 	while (bnxt_drv_busy(bp))
> > > 		msleep(20);
> > > 	...
> > > }
> > >
> > > Suppose "ip link set dev X down" runs just after a TX timeout has
> > scheduled
> > > BNXT_RESET_TASK_SP_EVENT. sp_task can block on rtnl inside
> > bnxt_ulp_stop()
> > > (or bnxt_ulp_start()), while bnxt_close() spins on bnxt_drv_busy()
> > holding
> > > rtnl. The comment above bnxt_lock_sp() warns about this exact case.
> > >
> > > Before this patch, only the rare RESTART_ULP and firmware reset events
> > > called into the ULP with IN_SP_TASK set. The frequent reset path did
> > not.
> > >
> > > Should the ULP calls happen only while IN_SP_TASK is clear?
> 
> > Yea, I think this is real.
> 
> > Not sure if Michael or the other Broadcom folks have a suggestion here?
> > Maybe
> > the minimal fix is to clear IN_SP_TASK before bnxt_ulp_stop() and call
> > bnxt_ulp_start() only after unlock.
> 
> > The RDMA teardown on every TX timeout and restart races below would
> > still need
> > answers, though.
> 
> Are this and your questions in the main thread a reason for a v7?

I don't understand your question. The above is one of the questions in the
main thread.

I'm not sending a v7 until I get feedback from Broadcom.
