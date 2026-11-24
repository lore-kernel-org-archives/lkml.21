Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551218;
	b=hkTAIxLAbziwg2S0MYK921KXAXIYFVIJEeiwc+jsp7fOTCMVhCf1BpIK73iuaqXIIwTJ
	 1fTRquTYd8sJWOKYUyKxGIJVfro9CdsY9jWhE0rw0+zxerW0tefTqasvufXgkVbSLQFed
	 SN2auP5UQ2J2KewIK3WHJscJndvAC4WNEnFC2h/+ez1c9Su2ZP6dIlJK92uC5724QC667
	 6b/8wCLcASKW85nY5LkrgSEPS/+oqLSFDGR8qDOKGK9TOCi6VJ2v+7cUlJdza2Gqe8p6N
	 VS3T2Aca47hXDDbcUAVp/8HD+5pW3OvIVjgbKjOJ5MtMONTvmFxgSxHephsasBt1Bnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551218;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=t37btjtuYVqm7Wn4q7QKh/abPX/yviKnKeRqyTCpvJQ=;
	b=JDZG8+/9jkx/vnssweHkRg0psUcpZP8y93ay4Rv1JHhRs6jNwO/k4xr0ZvJOBJj40Jkl
	 xHFTO5eGuHTwcuZk+ktiJQWt2ya9G1gAljr8VXnTYUCqSb/OwOEClsbnL0Jgmq3tA/HQv
	 +teilC0ARwp0L7tRnM6ZZflNqNUgJpO9GcVnC2Orb7A+SkHrzmMojdZHgiwIj6L1d3kpb
	 HxcbHX1dBG1LtKnovZmtWDFXOzZEheJclNUv1cY75bbVvxK5HBanntUAjvDbdJlJ0f1Xv
	 kJTSWxZCB7wakHTGeQW+1FT26ahfqYJJiW//MnjbaGAUByeCNdDarvNutTrXBnlhVuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VLAQDHWk;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77172606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77172606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VLAQDHWk
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so2437356a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551218; x=1796156018;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t37btjtuYVqm7Wn4q7QKh/abPX/yviKnKeRqyTCpvJQ=;
        b=WqXrj5eo3Laa0/hbPq8bJ9g25n54EzU2oEK0N+ruJG7fKmTT5gb5RaR693/w0thwEV
         bl4TN56M4Bp91xyyFXg/RdDF3NINkR3WA9ARG79e/JOWM8BlCEMGVDGTo5hfNEHkpWZb
         +hTNxWYn8EZ+o9ysXFix2P1vcmLCT+0XGFaR7uR2JTYYjQK1y+KVSWwp4Eft/ofd/6XT
         GukOKWAhgzLP2NE9ZoDVAwsp1cJ/9/fBcW9XKC+4XuVvzoXYymeZyZqQ0XUVx/We8tkK
         +v1V+qHqxtt2YRW9xLYoxs3dbuurexQEJIO2csa1ZXIElpStK5AsG7D8OXmgwIAMptUq
         iLPg==
X-Forwarded-Encrypted: i=1; AL+hErGPAZJqJjVQ4/ST/YIgMmclIy9Zy0tLu5E42WXY04SBDbJg95vWwW/cDeZh1jxqBNv69MQAoI57I18t55k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MRNUumQNuRUgP2Tkhf0ofNLBJTL8XPTo3LTxqAmNZQ5PdgYt5
	uyqRPyGLq8TaxeC01H6y9PXyoeGf2q+IRj6Ljcknv9arC9qWHr+eQvq/sn4oYnPoO3J1UKPOWAP
	0GfKj/M45X5YVhVVizktGsdUC3IKWgZ1eLj4dyXSKVxk2n6ai5H5UzVcMWQIkJNZmpUeXABc/GK
	rmEqkCTr2Wzz/QM69NKwcQdDBNP/jiAd1A06OkEmxjkfYRZVl0MX6uCE/eAz2S7uCjc1EcWomWo
	A2atpg0k04fQlrxT0nmFUU=
X-Gm-Gg: AZFdTZe9TLp2kNI4qIMs4fO4a/3iIZC7MyeOb3fYxZET8ZvrA/IunVjCgfGGAWpOz/d
	VquIL4iWRkr/pomQxFJpsIJZKtyu+whN0cJ+lUpVfYkgUUrgvA4BFknFIxN1piVLffkT77hbFEy
	6/5E2dWzKYXHvge807K8U39ds8ToZmcPh895hWTEya/lZRHt3Uy8VoqI+VoAUJedPucwapM30uq
	kbWi6hh66VxNC86xCYtLjA41lTRso5mcSwWFQO5fEUVZQqGu+jSo/eG0xF7EzL+ooWtCVfmejAL
	GjOyaah//ALF1dd7R26gS26R55z+Rg+BDPG4Ys9VOrAZeVXYOKMEAA23Gk7AKbmobxcKKXxtv6S
	lsVwfxNWmY+iNzPi3S8LAuDzqD6br76pwHBNSMU8i+lVlOIj4KcKEn67/F2Lrv9C3gaxJmTYUTT
	8LQ+vQMCqyg7jkpLihsdJNtoRF7ms5n/XgO0l3H2A=
X-Received: by 2002:a17:90b:498c:b0:3ab:be66:ddbe with SMTP id 98e67ed59e1d1-3b41c902f3emr14035092a91.28.1795551217708;
        Tue, 24 Nov 2026 12:13:37 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b411775fa6sm12262115a91.1.2026.11.24.12.13.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:37 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5363b06bcb2so96809521cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551216; x=1796156016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t37btjtuYVqm7Wn4q7QKh/abPX/yviKnKeRqyTCpvJQ=;
        b=VLAQDHWktpzfOfscQ8PtAkXHGaDDQnkVfk43xA7HG0TYZlp2IPLSMpN9YV4FSlMIay
         ohrGl6c96Wj62wNdk9CAQ+wwgRJ0lAvs/Rly+LQ1nmBcdk+cq3xWNnaxtj7wanGiyqxG
         SoADUj2NVTTSNDpy3aBPzCfjRznSPzvy75CS0=
X-Forwarded-Encrypted: i=1; AL+hErGeN1PNw4NHxmvlmGZ3kWsrBuLPxN5fRFwyMCo4iUnXYCfAT+RMRjyW3Tade1UXDcESu5pxHW4nR/K9/dc=@vger.kernel.org
X-Received: by 2002:ac8:59cd:0:b0:533:3bd5:b6e0 with SMTP id d75a77b69052e-55d76b1dc4fmr292105391cf.59.1795551216080;
        Tue, 24 Nov 2026 12:13:36 -0800 (PST)
X-Received: by 2002:ac8:59cd:0:b0:533:3bd5:b6e0 with SMTP id d75a77b69052e-55d76b1dc4fmr292104831cf.59.1795551215467;
        Tue, 24 Nov 2026 12:13:35 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55db5bc2f31sm7518711cf.20.2026.11.24.12.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:34 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless v2] wifi: brcmfmac: keep ARP and ND offload off on Apple BCM4355 and BCM4364
Date: Tue, 24 Nov 2026 21:13:31 +0100
Message-ID: <20261124201331.3492571-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118123933.74517-1-dev@deq.rocks>
References: <20261118123933.74517-1-dev@deq.rocks>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 18 Nov 2026 13:39:33 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> brcmfmac enables the firmware's ARP and IPv6 ND offload (ndoe) whenever
> the interface is up and not promiscuous. On the Apple firmware for the
> BCM4355 and BCM4364, ndoe makes downloads collapse.

[...]

> Fixes: 52f22fb21764 ("brcmfmac: add neighbor discovery offload ip address table configuration")
> Cc: stable@vger.kernel.org
> Closes: https://github.com/t2linux/kernel/issues/34
> Closes: https://github.com/t2linux/T2-Debian-and-Ubuntu-Kernel/issues/227
> Link: https://github.com/t2linux/linux-t2-patches/pull/85
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Co-developed-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/core.c        | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)

[...]

> @@ -103,6 +120,16 @@ void brcmf_configure_arp_nd_offload(struct brcmf_if *ifp, bool enable)
>  		return;
>  	}
>  
> +	/* With ND offload on while awake, the Apple firmware for the BCM4355
> +	 * and BCM4364 makes IPv6 downloads drop to low rates. macOS runs ARP
> +	 * and ND offload only in sleep, keep both off on these chips.
> +	 */
> +	if (enable && brcmf_is_apple_nd_offload_broken(ifp->drvr)) {
> +		brcmf_dbg(TRACE, "Skip ARP/ND offload enable on Apple BCM%x\n",
> +			  ifp->drvr->bus_if->chip);
> +		enable = false;
> +	}
> +
>  	if (enable)
>  		mode = BRCMF_ARP_OL_AGENT | BRCMF_ARP_OL_PEER_AUTO_REPLY;
>  	else

The comment says IPv6 downloads drop, but according to the commit message
and Blaž's test report IPv4 downloads drop too on the BCM4355. Please
reword the comment to match.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
