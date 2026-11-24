Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537104;
	b=jNdgVYTTpAJOJ8wqUPPXlKm2uTsZkRJwYEpFTNcgER2YIOv/aVyKzhDbhJ2odG1Ctjea
	 9Go2PoI9bB6Ty3Fv09+z/eeR9wrSKhDz2cwjCCWVVEBm4Ft5PeI5rE1rYN7mt481L2V/R
	 RtkflISuZ1vdB75pizdgyw4qA0a7x2HRdDo9Hfm4IjUPn2sJzmPE0SCcW9ehVj1XSvO+w
	 bEGZdk7OP+R1tx1RoGIXoUlM4jbcZY7bHoLbcINIq6jHaIQK/vn6+/erKz5WkkBkGRHtX
	 AwuqK0vqm8xc/fg2Mhedb6/LXoCQ63WyPgYg0LOBCwNh3jjEgviC2GxFAjw4lQzQqwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537104;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=aKujtusrB6LzjVyUaPpb06mvTUym2bW2N3pWpSZYSks=;
	b=uMFQubeiBPEd0IYyAiUmsnYHodaclsjcIZoEk71OLWz6hNK/SahghdcXbU9YP8UuaCgn
	 fdXLarNdFDuRTlidiXdug69/QiekOH9qGCvGfbPzZRCG9R7D+crzHfqT675j0rYlQteEs
	 XKYBvsyxTYxHwO08fvQYDlNG0skMbvBYRaMqUqQ7oW/LgT1mxSTkcGbHWMQ3y/IaH1M/X
	 HRrZ6CpQgpP8nUSpbA8qLcYMuwPCsG8NngyhrlRRUG5cjy61O66qqA54+7OCABQ3boVvJ
	 BQdtg8I+nC0mjJR1nuC43AqdGtbSDTiwcPzeaF+lRWELoOJCmR+beXX7LDmWWMns4WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=howett.net;
	spf=pass smtp.mailfrom=howett.net;
	dkim=pass header.d=howett.net header.i=@howett.net header.a=rsa-sha256 header.s=fm3 header.b=f8dxeYFr;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=s0AC6Vcu;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16514606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16514606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=howett.net header.i=@howett.net header.a=rsa-sha256 header.s=fm3 header.b=f8dxeYFr;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=s0AC6Vcu
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6E8997A055F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:18:23 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-03.internal (MEProxy); Tue, 24 Nov 2026 11:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=howett.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795537102;
	 x=1795623502; bh=aKujtusrB6LzjVyUaPpb06mvTUym2bW2N3pWpSZYSks=; b=
	f8dxeYFrDuBK+y5p1a5v0yR28F533zCn+Nh1zgXMWze3Oy3rnPpvLE0j1OIyUMV8
	aK5TTh2mlDAV5j7tCk4nwq8mUY4jlXNCAH4EouiIv6VcTZC4HUW4rwy80Yzj6FEN
	X+8rYpmsWkhAibVCWgwuSuhRkDBCtY/J3LQi8R/LCU/bB4G3pgbblsZWK5iTfpcu
	nLQMcUp9CeggznMYAMXomCVYX7RI7xovXUH0dBp9zgg/eTk3PLMgp6mLBACdjYD7
	0PAhNTDBz8tBxVaZUIGvAhetunzPs350+X3dFliGzUh06UHv5uTlBdisREHkLEU/
	PNYJ3Ijm/wbDI6078hRDtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795537102; x=
	1795623502; bh=aKujtusrB6LzjVyUaPpb06mvTUym2bW2N3pWpSZYSks=; b=s
	0AC6Vcu+vqLBVYKJNfocOw9BIzjC4qDFpmnrRBiElxbTwonlDuTzCBcGWArvSrm4
	wEoGvNOv2LY2W0OZ/1XG0znngOKMl0YIDN36N339fTUac0lxBKpeNtJwTG1DJl1C
	FE9MF9/E//tnlhvXycb4A8Kk0fQcbs0jdhx9OjC4dW+zRtiUiNTdd/cbfAzFbxYA
	9uO79TFm/ZHcvh+SisUOTVPfx82PinyZ5/rqYd9FXGMGqw8uYlQ21gvTKCzLuEx1
	k/2LFrLlt3/lol71bwgTpUlHViXMvepbHaepdURjSIaygTSW6aRvhQH5whXXdSPh
	rMwX8GWI9GfTl3IWmf+Sg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=howett.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795537102; d=howett.net;
	mf=PGR1c3RpbkBob3dldHQubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:igSizJk8cv7SjnWMeR/rFEVQM5R4A4JWzF8zboTn5o12FSh
	vBpEDF4FSL1M4IYTLsoJvj/Vnv3dC7yLMpjSs2HLuRsXjq8g7zQMkagEujHH2kcX
	MkYEUl4r7cUSz5LwPWwndKbyEd6kZc+Qp8DaUuYLyiUFVa9kanZ1pMyNGXskKp4Y
	DXtgSb4qAM487nc5ilP9DRcmfZev9GBfs/l1BqNn9qYxiyxqVwX+BfarV2Rir0fU
	FtrMoPbqSd1x88BBZliPFs1LtMPbNb+XKE1FMuzuirIfLOmfaieYw1XUAXn3Bb4m
	0dMES9XsbJFVPOQmPbMS/sX41lKZLmSZbszahXQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hmeEYVbfR0R4szuu4GrWSrce0j6br6om3Dk7NG9ijvg=:aKujtusrB6LzjVyUaPpb06mvTUym2bW2N3pWpSZYSks=;
X-ME-Sender: <xms:zrgFa7T2dAsCMwnlL5If4bMWV0WHFN570zIXRskgewhCc_NBbVyduQ>
    <xme:zrgFa3mW8VfjW9uzVUZbYLlcGB90_4iZruXkQtYz1X54X4SmmnJLLTYT-D1hPZ2UH
    IDEsX7UJ3ogiJsP_7rHLtZ0llfD5jJd0gUMKACSlPpYsW1agUbtdhxW>
X-ME-Proxy-Cause: dmFkZTEo2b6ZfN44Yjq87LvtOfWKBBrvsdf2ZOnuTN6UJz8zQwHQibE7E0BEY0RCrVRl/K
    wp1X5/LJkVTyssAgXWVjP0gv3X2C9+9tJkcjEDcRurhah/vNaaUHH475goieaZ75533HGk
    0wtM+mN6fetzaknjiu02GH0lP136Axek/pYD8nGZLRa8zxQOH4jvWPo7o/40CF7UzNK5Iy
    hStCbbdLW66VJyZuHcfl4/r9KgD8GC2OB2+dxs7pnEmAsqUtXIsJBbyb3AJMoEyaTKx8O9
    s+bksGvRwllzTnqsyBacAoa8EK8tgWsQb0PzXfoxNem7uNKf/5RBm7XIQQusseKHIxC9lh
    U2lnZJpT249eLdxgInfgEiqHqRTDDb760Y7Oy9qJCDCZQq1UkQpsL54q/B/eWauxL8zkOz
    G5fqkkqqQJ/EZFrxatDlXlrK+InNrLBYAe55ZWmMnm5yhojFqupfwdnuQUIdgrJAZYDe6u
    3g5w4goO1u5x0sjljWPZ1tnPAnFIV/UDrkoRv/9Kst6Bet/1ESoWsQofcQf5nSBRsM9ad9
    j5UqwWK0tckwmTSLM/tugUKaqk3uiu1RmwPES0SsEkj00BtxM+c385VMXVaYSx32JQhbnR
    yd4vsHD7MPKOmwZn7I4EsAZphI9G7mio62GxPJOXVd1nwrBQzHB4bEM6tWDg
X-ME-Proxy: <xmx:zrgFa2eZyz4nLq8T83L8Cy_8n2z1LjT0UyCw-uDft6vR3CI9R6SYxA>
    <xmx:zrgFa5I0c2nmWIfVusb01UQjdRDtRPbQcaxVmzv8nEkl8sbZ0XtEuw>
    <xmx:zrgFazHWGdCayByCLWXckinu8nHloXmVBLy0IAVzRANR0NmZDI-Tpw>
    <xmx:zrgFa0B6DbynqDl7prYWBNvolKe2gVw57VyO79P6s802tODFcr3x4w>
    <xmx:zrgFa-CeV5DR3Wkey1oY3ydFGvyezOCLVS1e2UNnFMVOMaAGAQEEnK92>
Feedback-ID: i32264b73:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5DC58216008A; Tue, 24 Nov 2026 11:18:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 10:18:01 -0600
From: "Dustin Howett" <dustin@howett.net>
To: "Andi Shyti" <andi.shyti@kernel.org>
Cc: Whinis <whinis@whinis.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Till Harbaum" <till@harbaum.org>
Message-Id: <c3be081c-4b86-4587-938c-512681a22ac0@app.fastmail.com>
In-Reply-To: <20261027-i2c-oops-electronics-v2-1-0601f2ebf579@howett.net>
References: <20261027-i2c-oops-electronics-v2-1-0601f2ebf579@howett.net>
Subject: Re: [PATCH v2] i2c-tiny-usb: add support for the Oops Electronics SFP Media
 Buddy
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 27, 2026, at 9:35 AM, Dustin L. Howett wrote:
...

> Changes in v2:
> - Matching on interface class as well (thank you Andi)

Hey Andi,
Any further concerns with this patch? No huge rush, just trying to clear off my
"needs attention" list.

Thanks,
d
