Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423712;
	b=5i0fvqUFz4HFIpXmo4ZUwmgRYPcW+WXE9y4gTB/6sHKShIWmdz0+gfbWBDkVp6zfD5MZ
	 /uWeyL1hjWHaPR68JkIeRwXHHZ6w0lWUxyRpMN228kDNLnGnhr2QGZbgVAeCjr/Q3nsvq
	 82PrZOxR95H0dmVG6zKDvXBDF57rtMc1euri7hhCuo/+G8rSBnbv87PkbpIuSZvaxAA0O
	 N3eRkWD19K248eujPHr8HJFNMks89oiaZFASPTMsWdgocqBwAcTbFlUc9cfd8fZG9bpub
	 1ui40ziEUTv7jEkKqNeJ6kOzGN8GihRVbSdH7ZfXwa4UISbiPJedxuIB4GVEBnszBxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423712;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HKEc2ujnGONdbBpiSX+CR3F26Xkku4g4ywftJjsvoHk=;
	b=exJZSeA1I46O4eZ67UrySul2BB9i5yhlrtpZ573gqDbhNIaU1gC4KJNffdRJtGieyKI/
	 UfteC9GT88fB5d2ao+y6Ti/eWoOOtha1HPzVBQL1aas3j1CSwVwtlTKzmjypSZblf2xyU
	 A4TSXJ2Leas8E0peSAKLOYGveDjb7Y+KMMI+xu2TOxgYRDZitQCby1gYxShPqFbj8GlvR
	 csl7S261HooBRvdZbmtgkEaUNVU+EVzoCmq/wX94PFKzpqcUGypHggCW0Bf2eLXWPeJr+
	 ZYr5//jtKEzyv1bBFctvRjayH+YjtnXiTIhcnIM1qjy2C2QH82C+TA5EL93dNu6ilAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=BarvRpcp;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TNbZnejV;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B160606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B160606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=BarvRpcp;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TNbZnejV
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 63E911D005D8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:48:30 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 23 Nov 2026 03:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1795423709; x=
	1795510109; bh=HKEc2ujnGONdbBpiSX+CR3F26Xkku4g4ywftJjsvoHk=; b=B
	arvRpcpYAqX5uCvew/PRo8PXwAODrCnVk4iEgbdCVF+WR5JqhvT/edioNHzOhjn0
	KvP6LlPmPwkuKurjIHwYAhAhMMjNDxMwXT3CAbLhoCvjewKnjiwnt8Tf5q8oZ7Dn
	ksK4DAiNc/OyXRda1QtXZNO47WQL18Oy+s/9hdKCLa5h2/WHXlpUDCSsCSWLURzE
	VicV8pXbX9AIonOZgXPE2uAbecwkL3ZvCTxqBCnsX+f4m7/pBiTrYUEeNoOymhUO
	27FcotdC3gU5xP0LNW8DYiMCoz2116WBEkytLXrnpKKzFOu5pNX45zjE9tT+pP1L
	eZKM9SEAIGb76bcpaCC3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795423709; x=1795510109; bh=HKEc2ujnGONdbBpiSX+CR3F26Xkku4g4ywf
	tJjsvoHk=; b=TNbZnejVRtT0BIMRyyOQniAlvOEMUoZ6TKNbixzNXfZVNoWzVp8
	rJcKLsB95g3K5ynuHoPzrTQNrZZvYYZjxNJJH1FbRwpc0Fr8zzmJUQUWcyRoYlCy
	OKL+yuIwAoX1bSfsHS/wm+Ofa0ACjRpDWRgjZPHVytwxmnWFju8F8O8G6+vWZfd6
	HshaiBJXNGpZ544T2txNem6PdLAkRntN07qk8qoBsPxPFRPqFROSVxALayE/52Z3
	CMqrHeoOH0IYoeYpj968cyy4GiXVslixqNaTtjvYalGZetI6XVRSu8HiskXba0bS
	9GTjMjK1GQj9RYpBGJh7/HzJa9w7hLwjM7Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795423709; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:FWIicNovNcVnxbI963DlFw7eKooKLKgAyXYJ9ElE1xDViw3
	2cH9cnpXzD3RWex+EEnDAxTRfGLh2KeU+UIilnwqDxUVpUIgQK3kCucSvukz0PMU
	COtK7gWHTqee+GSoGsxYgrGKzeGVlfm7EnXzQCB2UGuav926beAMWJ0/9iHrN7/m
	tCMRE76Y3+iujwxA8ZNIk7PwU7UcCZtQIu0HEpYGqiBBxKQ7Q9YTEszYOFEReHMF
	BBN893FntgRMYJpwRfiJdQg8C/iqKB2zhiPcEBwr86s6yLP2N3Wuo4XqVuJD892y
	v6TB8Y89f7+/0zJohhv5bA4bQhAzD+WtIEvQ1tA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:5eJMSjKN5d1Y0b4uxCvXnPBSjAtxcQ++lTN+tjqXu+U=:drSNYYKWasxHXJh4awRic84yBA9yjPsK7iYrROXsIwo=;
X-ME-Sender: <xms:3f0Da2NiQwwkLNrKCWyjAUf8_QebqyUtKa66CeesWjZdzr7wleuE8w>
    <xme:3f0Da2cA-9WfWFZrlLR3p5m0lqF9RNNiSjtLYmUYoyzWFg1iW13xDZP-8LrP2bu36
    13QJ1RL4XsmUuTzp_5AxjLumIk9rslyiE2pA4lZUcFyLEL7-usso_pL>
X-ME-Received: <xmr:3f0Da9VyRYQs-srHmw-3evtc1h87KhtdF9POttr961dOnV-Sat76oazBbGw56oeBgPd9qztD2V--_7tun3PWLLJAR7eeVw>
X-ME-Proxy-Cause: dmFkZTEJcXYigk1z0SPxmmkTF2JeRuGy5ziyTie4DAg1zBgTVSSuiejqJg/0ng5cx6S9M6
    g7Jr4SGJLLyB0GmTrtA4H2OeWiTQsb/tdZg+i5tWpXV+v+GuAa8UOcG+/QPOpw7A9t4t8j
    iMy/HGINZcVl2gB19eiudrhiX1z/XTL94C7zWOKhj63J989/SuEWAxHc1EXc92e3fL0qog
    vMLGZyK34MTBt/Iu6lmPy8TYsetNlb+JrJPCKegPrifHIIDTf+NQ99h0JZJ7YmDhOc9qrV
    kTpbm+JDUEN7xcSXKN1GRXwWWK8DEE4Xl0Ti9wnsAxKvtbRnyKKVtZODdI3z6QDac4G0sc
    ba5Z++M0nWry8gTbiYLYHQI5COALE8DS8NzBQMeltRP02auFGRRXv4UnRdB0ndZAnPKHzU
    IBEiXJhyZ8v1pFmOdKYtlPcl1TOZLnOxPvtOGzRIrnRF7G+gWJ6B+mzg9wXqk3jdmLjeSy
    HcR87Is1pUuGqdX/dTusG8pHom2fyoqvHbPGwGDXwHqG0d9hZHxYgXGtSEfi+DJTjrxmkG
    txsdH0jdzQDhOxI9vDEUit9hzXPjljZoM/Ekg+QHVeQYqviZk4kvEcC7l7KpC1oJMckLKW
    j/2/e9sNNtEKI7PfC0IEV2B1trxXXCa5h6VDxv11uN/q5lacoDW9JmHUQwsg
X-ME-Proxy: <xmx:3f0Da2icFU3IjSzs98U4dSXIEvn2XsitOU322QytjWYyzJCryCVb3A>
    <xmx:3f0Da09Q0vIXEV40Dzslg29eDfcTWD1II_gyxIy4Xg--Hj34s7kXTQ>
    <xmx:3f0DawZt-Nm7IFulh9eFNkbYz18roqdkkYPn6Mezi1koK7xh1oT-rA>
    <xmx:3f0Daz0qBf-812dOFIvlJ58EVh0Wb4VM_1oVbdWwXnU2gjtmLoLj1g>
    <xmx:3f0Da-OoBvb5P9ODGOk_hst0psUfwkwSCx0dd4p4x1Mku6_Mt75OsMmj>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 03:48:27 -0500 (EST)
Date: Mon, 23 Nov 2026 17:48:25 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: shyckless@gmail.com
Cc: tiwai@suse.com, linux-sound@vger.kernel.org, perex@perex.cz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ALSA: firewire: Abort transactions on a bus reset
Message-ID: <20261123084825.GA543768@sakamocchi.jp>
Mail-Followup-To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	shyckless@gmail.com, tiwai@suse.com, linux-sound@vger.kernel.org,
	perex@perex.cz, linux-kernel@vger.kernel.org
References: <20261122-firewire-busreset-v2-0-e104d785c8a1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-firewire-busreset-v2-0-e104d785c8a1@gmail.com>

Hi,

On Sun, Nov 22, 2026 at 01:46:28PM +0000, Suyuan Wang via B4 Relay wrote:
> fcp_avc_transaction() and snd_efw_transaction_run() resend their
> command after a bus reset but never move the transaction back to
> STATE_PENDING, so both loops keep resending without a retry limit
> until sending fails.
> 
> As Takashi suggested, v2 no longer resends: on a bus reset the
> transaction is ended and -EAGAIN is returned, following the AV/C
> general specification, which says that a target discards any
> transaction in progress on a bus reset.
> 
> Found with a static analysis tool and checked by hand. Compile tested
> only (x86_64, W=1); I don't have FireWire audio hardware.
> 
> Changes in v2:
> - Abort the transaction and return -EAGAIN on a bus reset instead of
>   rearming it and resending (Takashi).
> - Drop ERROR_DELAY_MS (and <linux/delay.h> in fcp.c), now unused.
> 
> v1: https://lore.kernel.org/all/20261120-firewire-busreset-v1-0-8bb9079a2984@gmail.com/
> ---
> Suyuan Wang (2):
>       ALSA: firewire-lib: Abort the FCP transaction on a bus reset
>       ALSA: fireworks: Abort the transaction on a bus reset
> 
>  sound/firewire/fcp.c                             | 5 ++---
>  sound/firewire/fireworks/fireworks_transaction.c | 4 ++--
>  2 files changed, 4 insertions(+), 5 deletions(-)

Looks good to me.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
