Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504775;
	b=Y5tb33E/5y2RNDXJf9G+dx9afARvOkSJeD/91ah6RHMtkxWFVNdGalyXB9H9MIsvGfte
	 uJuFy7l1pNUSG1oyOWCz4ziqmkyubqXX1mAmvEglhlQ+EHvH36R+Wz60Wrqbycoksk+FL
	 mX8MTG+Y086PKRB1onu6aipfs8jGai+KgNzLK2xqPDJAv757Rp2qWiUVoTsnrNdqYWFIR
	 O7WAvlHklI9BkAyggbDU8lLg9V3OoND9Ce28rJRNXPelpbLSy1vSh2Z//4KcQKQbX0/Pe
	 Y8bAbGC05EiIjEuBcRuN31PF83JHfw4JDIQd1sfxTCyp7qAJYBLrup5HqfwgpfxgmMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504775;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OMmNyxeJFUui1oxMfhrX6P3fAh2O7YAXYST9WFe6/2E=;
	b=oBQGa3rcJKqJjouAKQtkYgI3v9YVErRAPHvLjjDpRiyGqdfy3frqddD7nRzMXsOU1DJm
	 XKbj20NVCujCX+oMdb0PT3SY/9i64GEax6cbkdfF3Ia4QudTun31YOpg9RlBu5vSRzxMr
	 tK9D8DT65BDsMKMxs891ehikL3OJzTda87YGucndJ6Ul08VFG+N06gp4JqejRJ2za0OzY
	 S1Yd7B8VucxBZHN4R75P5LC0pWHt33CkKC/MvgEL3WVGBCkhaRgEr1wODJVX9URZ5iSzO
	 zGRMAUQFNcpDGOIxfpVa67l6o7VABFzUYrF3xhzgULMCWFK3Dv6zrUmi2QPkW5V+9Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=Tw9MNJ7t;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=O1IS5YQF;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D1E606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0D1E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=Tw9MNJ7t;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=O1IS5YQF
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7E19C7A0533
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:19:34 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 24 Nov 2026 02:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1795504773; x=1795591173; bh=OMmNyxeJFU
	ui1oxMfhrX6P3fAh2O7YAXYST9WFe6/2E=; b=Tw9MNJ7tlQ2XCDoxs5DEYcVbzD
	gtINA+ld6io/RD9QyemsDG2UeX2Ubp0okulbAqr8j/mLub9VzuDroZJcSBit6a+1
	Er8z7STWD2oDjzlGnhAS/UkMEyVOdn5YDuN216NNxehhlzGI3x0c87MBvQDxTy0x
	zuFVaeFd8EqTB6gUpO7sjQm8EHOWnEQ2WIY7dLTynp1/QjBSp+8HONscl62JZ2aK
	QhepqJP7CIjhHu15sXuvskwUEsnvfwT7uU7KtO2HkpuMgygpCZxGzl993sdROAm4
	ugP1ei58D02svioEBNLm5ZimNDhFrDpKPHdhT0APB/CdgLaGFZhQjSq5UHOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795504773; x=1795591173; bh=OMmNyxeJFUui1oxMfhrX6P3fAh2O7YAXYST
	9WFe6/2E=; b=O1IS5YQFBwTXLQ7EopsJthearMbw0xtugtXSVcw10TCyzCBHqWm
	AfppiM6nd8FHRN4tdGeCmex9MezfsSSvOwiJXMwYcfD64nkFpWBUHWzx65TpFtvj
	D0rmJ4ebpKwMMlc2L2Vy8eNTSC2pCp88IMAR5ikGDZoabDUMMojfpessxPFkdDvM
	cwa74nUKppSsxUJoo+162LsPhDfljFVnVLTEKR7AnA5ccd/tatWhO8p6NH8FxBO2
	4ywUNW6tXxI4tD3SxpDM80IEWoYqv6NzaKZVA19s3MGY/RhR/q5JAOHj/Zpq47Fx
	kpU6kX9FT0slQXvpqrYnA4CJH/9owaMwq2w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795504773; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:EuEN1e0DGCG5/cI3JmRx9ipjB+3WKjTjsNu6dm99AyEEYG2
	FvNpTd1az23hmw+m7HC6BqKHiN4EKfhXRMRm8ERspBxd0KpK0WQes1EYpJCi0fK8
	yQ5GurW2UF9gG96mNKyEfKWApDWkaREnWQpgfavKH56IhJ/HdyXeB/gX68jIHttd
	+G7YxQZoC7FKT+ZA/oNE+to5qEQTW9kTZuaHNoWttx2vPd2cpDTk2gqKy/KygrCu
	gFO7M8m9N9WuYPU34OVEquMI0LtscOToT/lO+KQO+qahJWquc04IhxM9Lmgtqueh
	P9fQ6RAYVE1Dfc2MIpIuq7j9XIXKGJ8QNS2Fp/w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XsS1p2JKQLpauJ3wax7PB/9DlxU8w9/1JkG9AooD41I=:hWbt8nnHPaO5Zs8R9pbecgdpQF4A4fGBa+yk2OOuKxI=;
X-ME-Sender: <xms:hToFa4qwS7jdMVeix2Dvdn_gCXhOovIUqiSxR1dDf4ty6EaacpMe3g>
    <xme:hToFa203gKYgZIIZZ9R31dmqLTHm4lQzz9a5LAd3voH1DbhIRhhWBR7QJ6ovYebfX
    r67wSzLaTLyBxGXjoayn46AMVEsCs6vckhWl_mejNy7gBImlIQ>
X-ME-Received: <xmr:hToFa4xJWj4mFflX6PLr2nZGKJsYxJ4ddP4rIDovBONfsrXqYKEMGg9MHDnyDsx6fMH7yPSF0W8EGYwNuVp4GSleVz2JV2EceFmQthgO7yI>
X-ME-Proxy-Cause: dmFkZTGzsDXJ9z3EYyMv8re+RLPHGzoi6MiJhvjAaRUSzBeE74Wxd5Hh4tWNxeI6JnxDi6
    PKfvSg+UeR5tGlSNuRZSUWXw2mxvmL0A7+uxknOHPOOLfZDFmBiVcZpa1dWhNZlV3ye0Qw
    mGZDGgDzRakZT0AKYDCFOVvmzDikwREEdqOf1x7EMshCVTmScPG8PfV9VlPU9Jh3PGixvM
    tzdCvY6nQWJQT7098SFSgvVLxpCGU1BKnH4Y1LoGqt0wmieWJMdM78SGtTwjBrAmA6r7wC
    s6FyB5tb0392Zr/NW4Xpax/EjSN1/8YF0ySSXp7dzTnq2nWJxqzFhb4+s30aSaPMdQqHhd
    lJBfscicMDeKUVp4CmUvrTQ3zPaPHouyTwodtjOT/eJorpJCiSTZnhiQRzYdGQGGiW01i1
    SN7mpqYtA4pST6g+cM8JLAWivUQImaLMk5a296q75Kva23033DzH0pfzNa1W3pYGY+/Mn+
    /xeeQtpCvD6wSQI1Jw6idKcl7MkUB/Z7+1YcGbRIYB4kG3ryg/vIW+yH16faf08WzRio0h
    ggeo/5F7SF9j8EKJhcDsGhwQlO9pNUMF4ailiZoOSmtTjiAWU0/jt1ulTOZwV9CjetONnM
    bJ3lA4Gj1ZdTgtAZm9M9gwj+WRBvav59nN9I9D4fnh6JLyWH5HsQAD0gt1cg
X-ME-Proxy: <xmx:hToFa6ieDUIR_LbpJcS7MFOCRKf8USkJnFUKSeJ22bhUKylNY9a2Ow>
    <xmx:hToFazrBhUZr-7wqUp0Mq3wOQaFpX-c8Ro2PbCYMu-lsxGJYTfDmMQ>
    <xmx:hToFa5g06paLg950PWu1qgo4jdvzccufhHDLJhlkbw0p7XMt6fNVIQ>
    <xmx:hToFa9MP5MiT7MTTbgxNkrb7Dg4iNUhl6EathQDYUaBvHkZxstsk3g>
    <xmx:hToFaw1eshj9nOwQsLfDoVm4UyS9okJ6PkbEkjxrDeIFLSFhfMfSz7iE>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 02:19:32 -0500 (EST)
Date: Tue, 24 Nov 2026 08:19:30 +0100
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Priyanka Mani <priyankamani2100@gmail.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <2026112422-bubbly-threaten-b4a0@gregkh>
References: <awRdGojPVH1LpICe@sirena.org.uk>
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
In-Reply-To: <awRdGojPVH1LpICe@sirena.org.uk>

On Mon, Nov 23, 2026 at 03:34:50PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/gadget/function/uvc_configfs.c
> 
> between commit:
> 
>   8709574b03899 ("usb: gadget: uvc: fix dwFrameInterval array leak on frame removal")
> 
> from the usb.current tree and commit:
> 
>   01ad61c08da9f ("usb: Constify struct configfs_attribute pointers")
> 
> from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/usb/gadget/function/uvc_configfs.c
> index a8717c95e5edf,3387060bab55a..0000000000000
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@@ -2143,27 -2027,15 +2028,27 @@@ static const struct configfs_attribute 
>   	NULL,
>   };
>   
>  +static void uvcg_frame_release(struct config_item *item)
>  +{
>  +	struct uvcg_frame *frm = to_uvcg_frame(item);
>  +
>  +	kfree(frm->dw_frame_interval);
>  +	kfree(frm);
>  +}
>  +
>  +static const struct configfs_item_operations uvcg_frame_item_ops = {
>  +	.release	= uvcg_frame_release,
>  +};
>  +
>   static const struct config_item_type uvcg_frame_type1 = {
>  -	.ct_item_ops	= &uvcg_config_item_ops,
>  +	.ct_item_ops	= &uvcg_frame_item_ops,
> - 	.ct_attrs	= uvcg_frame_attrs1,
> + 	.ct_attrs_const	= uvcg_frame_attrs1,
>   	.ct_owner	= THIS_MODULE,
>   };
>   
>   static const struct config_item_type uvcg_frame_type2 = {
>  -	.ct_item_ops    = &uvcg_config_item_ops,
>  +	.ct_item_ops    = &uvcg_frame_item_ops,
> - 	.ct_attrs       = uvcg_frame_attrs2,
> + 	.ct_attrs_const       = uvcg_frame_attrs2,
>   	.ct_owner       = THIS_MODULE,
>   };
>   

Looks good, thanks!

greg k-h
