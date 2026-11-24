Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537832;
	b=4nTYwGxwFyt+x07MG2cHpG22zXawfKkJisavMotGrD2sURlM2I4Ojiif7iLZEQcglrV0
	 7LqnZCBmTtNF5gu8irOpKblUbV8X8Ip2m7c5lmILkvxaGKJ5KRUdM77GxEoYs3U71quex
	 b14oy4HyrMGo2XWXuk2TA8g9d8X9vCagUBmcSWAH+7iGgmXvyVxgRzKh4nmo11nmyvmpP
	 xpK57mX+51C32Jppet7c3xvTylJLlEGMZ1i7pWWVAbi8Dx/U5Hh1KZHZ38YsUF7gf7hy5
	 pQcdrkbMveQZ15R/+n4P6ZWYESz5MaeEmk/C4fRXxCGf4is81EtdkBhTfaoJHMXxLZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537832;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=CTbz0+BpeE85Uf+P9q0EUbXcqUPW14MouI7LDRHs9Gc=;
	b=o/XhICSfUeRSNqsNrOla1CRdddIFevS8LjuFNkVaK79kulb0mkastVbV5H3Op5zaLH4y
	 JiwBTA+xOCgdaKSL7MWHNYv72WxfmU8ewy9V69RRdKAeF3hgnwhy8+85sekZMfaQR+7/i
	 wzVgwfUkIIkH1jAT0jfCFxYgbBmDtTDNzijR7fjV50uJoHBRJCdAzAB47USDptkN5F8Kj
	 93NLiafx19iIs95w8fPqztgEua2ABdpD3NGFBBqT1l6PX5XRyrZFyz0fNp2qVfm0g+T9s
	 qJQhEPpUx83W/sN929OIlm50sk9iN82WSjFw607mt/uDkXhG0stF9KIC0Baz7rrDWtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=KIfB01Wb;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gz9YzrZN;
	arc=none smtp.remote-ip=103.168.172.155
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C20606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C20606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=KIfB01Wb;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gz9YzrZN
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 51A6A14002F2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:30:31 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 24 Nov 2026 11:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795537822;
	 x=1795624222; bh=CTbz0+BpeE85Uf+P9q0EUbXcqUPW14MouI7LDRHs9Gc=; b=
	KIfB01WbbT60QouGgqoyFMo0Dm0qwHukr3dP4zcXigfjqZgWbd1DKTJKgRuYAlUb
	FDwJmQIXcEjJYHCjCFAufhUYCkzz7R/rQEeQf1qAKyHUYTHAsPPFTIzcbkEnJ7Eo
	Fxed4Gq2a9TL+ZGD8HIbQIag3u6sM2YmaLN+Pt0XvLlJexhOh3ALXqiqgSpCRiiL
	qGXt6Vvja2zUGf3Qsy7zqJei6WMA/G7V6Vpav27dI42Jl1E4tuxs5VHr5tIQrtWy
	T2Gu0+c+GDw22RzdTHVwDfgPCJL1eR/nFuF8vVQI5YJRssVIOs43MtymzpksgB5M
	xJEcqU9CCnrkMjFyHurNkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795537822; x=
	1795624222; bh=CTbz0+BpeE85Uf+P9q0EUbXcqUPW14MouI7LDRHs9Gc=; b=g
	z9YzrZNNVpmUMo/p2AHRytByCoSNgNktBxJxVzSNCDLwFhR1QczCELoRbMvcQnZp
	+/cPxVwXmFf17ip6K9oYyc176gZ2bjKgYbnyzcLgNTpnvXxiW6umKS2K75/toKGg
	N5jt/LGmAMnB9tHIiZAptvis3blCGrLbhtBAqKVfJF9rFme1hV5VaCq6RaXeV4E2
	MllBvYqxZLoAWioRdV9imMZyHOmGMEkhkqtAg2zCD4YDPdD1ZB0/BAfNcpWyFdcE
	F8tQHF3bFeK/vZs+ogcyvNHxCjaeQPTO+Bjtz/+1h1Zcgl3XsEt0h9EckTiO1mRo
	k8u+Rvbmilmwao9EmgSKw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795537822; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Io1nixeY76YnNeGb4kZkFSkJK+XyYpVjR5zA7pJTbqCyCmI
	urxpSsmIu0cHpnLEk5fFa/w1ptPljzQH1DXMrc9cTqv+Eq/tMuQklXhOLTBV27ql
	qtcTborc5nnMWFsWH952cwQgvXPHyB9dsdaMzLtsKd8pyX7rFw8IPHNM+pnv3rj6
	xITu2la3pl9OaNZm5dD0qbF51wj0cx7OB69CHoB7/3Yd2JudIaSPhA9bWXTxXU2H
	zvqHnfJ1MHFayDUYjY1RtgDlVfbi3FKMMOjwx8aXVSXPXqt39xNuE9bczSsYTZf/
	glzBOCecSkWAGxSbHdfA+GppluvrNbwEe0Bn9Xw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:980aYwIJKINX/gz4l3IUqsZXhOnrDZYIdrLIPyVIuzU=:rSduc7uGIjYvoyk/9XoJLPSt+QxsoryMmuCdSICNC+8=;
X-ME-Sender: <xms:mLsFa0OZcgz8AQcROZxAwwF05_XyiwK3zgbMLTOaUHwSW3LN8NAMVw>
    <xme:mLsFa1xH0IFO2d1nIyeMXxlpxOsZOLv6L9Z59doZwdIqqVTYKhWUvgPwoxQ9vAAra
    Q2FssVPyr2IUzhSRtzDjokU2Brb2cRQMHngaXOZ84fFdV_z9QnZvdk>
X-ME-Proxy-Cause: dmFkZTFfM29LN9oi+uls4uA7bJ82R2voNMmneloS9Yl8C82woxnJ9InPeuZsT75rjx2f/c
    2S2JVkvyRmwb5Uqq+KHHSX28pU/OSqqhUU2HZPLL9FJxrEffux4ZOs4sbjeS0Gutr6dgSe
    9u91JVLr9ePCvPxHnG2Vx/y42SYkBfF0FRgHgzaDRgv0Hp5C9UgVUY3PEDzsq0RJd73yzl
    Fe9dojY9h/SLyOfS19e18yixMp4zKHwYHkc74bA9F7mD6D3D7YQasxuKXHnUiiKIe8otv7
    qq6Tp+f/OwC8NFGFQO2Uw5MAYlnkSZPdo7VcOnYh/JYMF9F8UXSmFcs318U95styRaVpWf
    2g9aVDRlXsY2lpadbqWJpAz95It6i/7IVu9SMgPfkHY1Geu9IjfXMOTptCgQZXXEL+f2cP
    nkzAfTc+8XfQnftNWBA8Wb+BRRpzWigPnbCkKxOfHJ9MTHIM3chUTU4L49QjqICWBh6a5j
    ngD/St/DVG5TP23SfwImEHI+5pDYsUmwZYPF3sxyNlg66ZcyYQGCLNftBS6FI3FlgcaAK5
    wy9e9Ig/1u3Kp55vZ0LPwPJbNVPanVj7huTxI1BetZ6M3LCsNh6mN/VD7Sqjd/4cnQFNAF
    u7mvZ+y4n1Hv/paIpEFyEItxD1oktJiEZiLqADw3BK/Cc+DxD8lLH6x3XAyg
X-ME-Proxy: <xmx:m7sFa8aFDhAs5k9zrApnb1of7AOg3oVh7WG6YTjexPO0GwFJ8RBHgA>
    <xmx:m7sFazWYKzK2u0jN4XLUbc6Ed8i-PV4g72xM5vZC48uZ8uDtcKiqMA>
    <xmx:m7sFa9EIDZHiNxMfx5-dzWOX7PCfpsJVeq2rxasJ6a8TILjXSGme4g>
    <xmx:m7sFa9BfyvlW6v2H8o8fb-Bx_u8eaZ4Z10q4cZq6NdK1V14gclr_0Q>
    <xmx:nrsFawCeCB3BEnLU8xQ4H3_Z1Dzvu3HuPYdvUauWcGwGdlhSrLMsaArt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 885AC32A0099; Tue, 24 Nov 2026 11:30:16 -0500 (EST)
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
X-ThreadId: Aq77c9iO0VUs
Date: Tue, 24 Nov 2026 17:29:56 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nikolay Borisov" <nik.borisov@suse.com>, x86@kernel.org
Cc: "Michal Hocko" <mhocko@suse.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Dan Williams" <dan.j.williams@intel.com>,
 "Kees Cook" <kees@kernel.org>, "Ingo Molnar" <mingo@kernel.org>,
 "Vishal Annapurve" <vannapurve@google.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Naveen N Rao" <naveen@kernel.org>
Message-Id: <c6ad8f8e-9dc8-4fdb-968e-107795e2e15f@app.fastmail.com>
In-Reply-To: <20261124160025.738362-2-nik.borisov@suse.com>
References: <20261124160025.738362-2-nik.borisov@suse.com>
Subject: Re: [RESEND PATCH] x86/devmem: Drop /dev/mem access for confidential guests
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2026, at 17:00, Nikolay Borisov wrote:
> From: Dan Williams <dan.j.williams@intel.com>
>
> Resending this with the hope of either getting it accepted or arriving 
> at a consensus
> what exactly is missing so that I can take it from there and eventually 
> get something
> merged. As previously mentioned this results in real problems for 
> confidential
> guests both on TDX as well as SEV-SNP.

I do think we should go further than this, but the patch solves
a real problem and it doesn't stop us from doing more later, so

Acked-by: Arnd Bergmann <arnd@arndb.de>
