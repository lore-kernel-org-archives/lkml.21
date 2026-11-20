Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795150129;
	b=mGKv3xjpMHFC5crRsueR/YWzsTj26FNKaQV7muDHz21wdPgCsU2xOdHpTRsI3Y5YTndP
	 PoTR+w6deurIhPGTGIXXtM90RPq+leoXqZrsnmPpbNT2Voj+8dfW11+Tj6XYLT90AGxVN
	 Bvwx8spdwDN+B6eQClkQ0NJ9J4Fuf3HaR9JnRRVEkSEB7+Glyso1w4JF7eks9q83iuell
	 lbCevhYxVfyu7q+b0jzsRjxNLxi8Ce420JJQ1VBSCTIXYm8KQ/4FXvXdt2f6Cwy2xLiuO
	 pJjMHO3QNtR+nrwhgz7Z9GL5tczFCREusA7GNEP/nut8yw09oeovCui/8cGL+BcrMgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795150129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=DRQ8FJYGIZUkw4F+I+/Zgmh7s38pPQn6pzLuYXKpMfs=;
	b=H37VgdDFsYWZw0ppwmGSZAye4/ETyCOQJWXETIrCYn8lDBKNONzQd+TWF47NyaXeZumk
	 ypd1m5Zmn+m0pikY0QCkkbK5xPeoss76c2sTC6VfyEmxURQJPDZlDl4ysslQyJcFmG1tR
	 hQkybLsQ2k+8hs2T+fA/jGx5WKtCyAFRTkO0SfoiAl9l8Ys7tYOT5CvccT8O08MBOO20Y
	 xJThwCpCK6NtIpqEqJ/xAdAFLu1V1IrC9yCPGUjy5dBHpqSasfahxkk5ztHIkR3w/ZnCI
	 bdIyRFdjoTGcVyKcXr1b/D3RzUq2zutynWjqnHmUTxvR/ic50qu9rbtvqkgOJsDPJnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1eR9bRU;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E050606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E050606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1eR9bRU
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so830236c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795150127; x=1795754927; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRQ8FJYGIZUkw4F+I+/Zgmh7s38pPQn6pzLuYXKpMfs=;
        b=a1eR9bRUgrHLFXzjPI0/J37qkzhcDJ6vQhaX0eYOSoBcAofQNz4LAWcL8koUKFBSCA
         UKTOHCsl/jFThHWhR3uOouyLaagiyrV1R5Bs5QJga2dYScelfvrHq+4nP6W2mxm+2yWa
         Ps3HEVjMpahzvtZgUrjHsbWVDck8ZN67Oxc+nxFd+x0pEze3L3Q0kTbQb9OepwZSt+4m
         rKmnPD+jt8yNoQ96ZzHSAix/ySc3o/gGPyQ/uMnkEdc+8/aYVXUAZFS1odFd7XEiCYUM
         4Vy2XVVghXdcJ9xjPNN0zNZfh+6bYi5XM/cOXqWYOOj4fWmmELmkos0okFeD0gJW8ZuV
         LMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795150127; x=1795754927;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DRQ8FJYGIZUkw4F+I+/Zgmh7s38pPQn6pzLuYXKpMfs=;
        b=22jDBvyFrpt3S+scxbqG6OAsdGVbMVfJe2sHvr3PSLcAtFP0nfhoNlTAoUkmI+5vYm
         OmVYAuh5kCC0yh4z7U59lEreXaVO4z7kzqTGmqLpy71jOzW5MH2Z6ZxUIXdG93PeLTD0
         ghJJF43p65aX3QBN2SDgfj420nec4VxdatjWVN9f6m0/RoNE0fTLncawILTivXotYUuX
         ZNuOYca1hlPi/PPnS4StEMwa9RzzToKxl1riO11EA5QwAqbAt5F+rU2Ix0Z7+ZSKr1PT
         n1fmgeySVKNO6PIdvBQQ8MZF7SQ/z1JvAt1/INLgCMDmx5uyFR6LrVLVxRYqeGSwuKaw
         a3vg==
X-Forwarded-Encrypted: i=1; AL+hErHH4qhttaHRVG6Q0rGLL+MH7Cj8ZqXHMtrBerAb+DIhqyY1Zrd1BfiFvHJvoiw3UwQjDihrsjF/dIt/tsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OqNsz+ZSA9Bfqodj/3niHyHCm+8pgiXmOMKhjQ8cdCdjm0laU
	RN8u/UQciig8lJ+wF1OkM8empQ6t0CXeve8OTtyLtlJX5HQfxpm7TD22
X-Gm-Gg: AYBFou0bGinf3WAxwoYstIHlABOnyOAikhEKrUzZdpSkX4F6WknJki+S7xhC7+uRIDG
	m5kSOfJzS7LJ/iU+O+0chfqWmHpXiqzzmTQXmXTe0gFX1i0MG+9lyhTiJsC/rCGy9BRHfUzTRk0
	Dzm2x0XD3Mn3i7P7zqDyyVoPZkCzmgS6yQ9SvV0HCUt9Mr9GEa358LnacTQJ2Vc3/F/HZRAS+2W
	yS5KvJU/c0jL4S4eMs9Pjo6UqVmbg4tGVpPd/Zr7PFWoTGCxnkf2b1NT3xdgAAoEFfvJ02vKAXD
	PjtylnjFzpr1hI58JpaGCm82CULMq7nH9gaH/CWZVfLPKmaEsW/txzKe31JigmXJ5jRz+bw2k2H
	m7rAPDR/EXYxIwAvNwIruaIzPEAsRngVp31dwsEHLLm0zggZP57qFETSQjucOQyH4A8goRLHxFX
	/3keSk3XQUbg+rb35QT5Qp2xnUmOryQ4ihC6UNrohIPaZIPXW/P9U2YtjskyqkU8NzroBrVYFLa
	p9yzDqukNbhPSCHUpVrpVezhIdDVy09esVgpMaNlPu6ynMNgtsUMWweTnwtcnj7pPYdddi7UF+R
	HEC8dFKsSAaUGf69TPWSwE8mnz4kXA==
X-Received: by 2002:a05:701b:2901:b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1b5567b315cmr1736664c88.4.1795150126565;
        Thu, 19 Nov 2026 20:48:46 -0800 (PST)
Received: from gmail.com ([2a03:2880:9ff:64::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm3953343c88.13.2026.11.19.20.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:48:46 -0800 (PST)
Date: Thu, 19 Nov 2026 20:48:03 -0800
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: narcisav.kernel@gmail.com, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] eth: bnxt: report TX HW GSO queue stats
Message-ID: <av/RAwaDfiQnPmbF@gmail.com>
References: <20261116204313.23023-1-narcisav.kernel@gmail.com>
 <179499144094.3136.198428718668517773@kernel.org>
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
In-Reply-To: <179499144094.3136.198428718668517773@kernel.org>

On Wed, Nov 18, 2026 at 08:44:00AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 1 · Low: 1
> 
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > index 6846a27bfef4c..1a7a93bf684ac 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > @@ -869,6 +869,11 @@ static bool __bnxt_tx_int(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
> >  		cons = NEXT_TX(cons);
> >  		tx_pkts++;
> >  		tx_bytes += skb->len;
> > +		if (skb_is_gso(skb) && !tx_buf->is_sw_gso) {
> > +			txr->tx_hw_gso_packets++;
> > +			txr->tx_hw_gso_wire_packets +=
> > +				skb_shinfo(skb)->gso_segs;
> > +		}
> >  		tx_buf->skb = NULL;
> >  		tx_buf->is_ts_pkt = 0;
> 
> [Severity: Medium]
> Can this over-count wire packets for GSO skbs that were sent through the
> TX push path?
> 
> This block runs before the is_push early-out. It treats every completed
> skb with skb_is_gso() && !is_sw_gso as segmented by the hardware.
> However, the push path gate in bnxt_start_xmit() does not exclude GSO
> skbs:
> 
> 	if (free_size == bp->tx_ring_size && length <= bp->tx_push_thresh &&
> 	    skb_frags_readable(skb) && !lflags) {
> 
> The push BDs never set TX_BD_FLAGS_LSO or tx_bd_mss, so the NIC sends
> the skb as a single frame.
> 
> Take an idle ring with tx_push_thresh at 164 and a GSO skb of 164 bytes
> or less. Two examples are TCP with a peer-advertised MSS of 48 and 96
> bytes of payload, or UDP_SEGMENT with gso_size=8 and 80 bytes of
> payload. Either skb would be counted as 1 hw_gso_packet plus gso_segs
> hw_gso_wire_packets, even though only one frame went on the wire.
> 
> tso.py reads these counters, so could this give misleading results
> there? Fixing the push path issue described below would also fix this.
> 

This couldn't give misleading results there, since no GSO skb in tso.py
can be 164 bytes or less, so none can take the push path.

> [Severity: High]
> This is a pre-existing issue and was not introduced by this patch, but
> should bnxt_start_xmit() keep GSO skbs out of the push path?
>

This patch doesn't introduce the push path issue (the high severity one).
The medium severity issue is a symptom of this pre-existing high one.
Both need a GSO skb of 164 bytes or less sent on an idle TX ring to manifest.
If the preexisting push path bug is ever hit, the stats added by this patch
would cause hw_gso_wire_packets to be over-reported by gso_segs - 1 for the
skbs which take the push path.

I think this patch can be merged as is.
If it's worth fixing, the push path issue can be addressed independently
with a one line change in bnxt_start_xmit(). With that fix in place, the
stats would also report correctly, with no other change needed.

> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116204313.23023-1-narcisav.kernel%40gmail.com
