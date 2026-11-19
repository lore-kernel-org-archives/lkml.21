Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073750;
	b=1T5lWN6DUrt/52KFFWmDYRf+95SyDFhotYUsojomPhF3dchC5nQ9jJrVqBDrQP0Y9m6j
	 Re6jhZ84N9iKfwxLjUuBzgFNDfTeezsgKJgeJCHHRkqQQdVEnzJNvQVHYr9MyPt/iJWgF
	 EmvFsuEeHuk66wXDnIFAcF0WRP737CACCbI64fQUrQ5Uqv3fde1a4bY88GIIIqMLQr8lJ
	 scjKMBdligHUYTeaxrT0lc8eus9XfKSMWk7OaS5w7TBlEOLJGvvNl9dUDV+K3SvmBKosv
	 Rqg/LKHk/pAyOR6K9nx68IRCUeA2PhrkpKA+vW1HNWLK52A2aAcl8eWJNmtzGSc8lSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073750;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=ltmNxGzVMsUWBf9xabFvoUkFECbWVALmb0cBNU7b33U=;
	b=TZKQ/FQkF1yd+UqFsYG/GT+t3bDwkkyRvpuI0OmySiIjwmA1uARY0gJneCMitFoPMSu/
	 WIHc05HnmPswuCyf+GCycXsTBIQ7ATUfWIAnqR7VvVjP/5BS0eA0KtDFwsq0ctUViyfti
	 1uFr7BS1bbNGWK0rY75aR23b9JW+3BUfM3cO5OsRix6T9KHgj+slv6Dxx4Yv/78e8W7jG
	 sNoiWRORFiYkK7vgnURBE1YmNBTHtA1GZ6ddrY59hT4jpmuWT44Mkb2/29A0LJhsM6U9f
	 QLRty0xIDgQ4SlizuC3HPyCcLNofIhqGud+4tNpbOgkVhueONVQh6+CHW1bzv/oqqiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=jFbeXVtE;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mfFhQIcb;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B67A606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B67A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=jFbeXVtE;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mfFhQIcb
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 95D057A015D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:35:48 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 19 Nov 2026 02:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795073745;
	 x=1795160145; bh=ltmNxGzVMsUWBf9xabFvoUkFECbWVALmb0cBNU7b33U=; b=
	jFbeXVtE28RXyVKhBuRRzk3qfqOJqYhNwgBNaf9EHILXNdacMpQSdmzAglTT0Cd+
	izgQuSnE35pLmv6X30DAppduasnsXV8eDyx6mHngoZE1YtZexUi3wNB5JEx4M1aW
	JjgJZdIVokvCqP8iBxKMckwlmr+nDnqXeIOV58SJqhAqIYPw0CESH54ktZ8A0vIm
	SJ+pjWXcLdPgL7BU6BhlmbztgkQUen1aGbMrOOGLR3p4sXO5pqdA07sbAZUG6Orz
	UMmwBhSuJgmOx3TONsY2erx43Rujt25Qc+eVgr1tcMFePBMuZbv+KVPXRLiYH9Gd
	cMqiqemx4Yfv28Ulbhg5FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795073745; x=
	1795160145; bh=ltmNxGzVMsUWBf9xabFvoUkFECbWVALmb0cBNU7b33U=; b=m
	fFhQIcb+xt2lQcps1c+1SmQ7yYiV60zkIp1DkrA+qhdloUgF1wF63TecfNg+pMtH
	pUGRCWtTSV/yyWaYgqkkizq+wutbXLtwwqOBdhuYf18uDkWA/RBXUecBg/Xt7bch
	3GnlDbpHRvaj+c9NMwx0S+Rqf788Row5GcNhZI+qNiDzDddvV+jFGROU0k6vvdAU
	SXoiQKi/1Bksuic2wNbXpNmI/XqWTOMWI9q1tjfkLTqo497TXwDq/f5rxR/5/Jpj
	MBOTAKGACqr6uL2RQ7wP1TxZ+CseM732Q+sRjKyIXL6B0ReKooI419Kp7GQOTebG
	ZilU2hQd7CRCgyrjuPPLA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795073745; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Y9JKVyGMAQL68Nn3CdbfaC2vaI4lVWmei0/0jB1K3QgfKCl
	vFHqn4NJ5U9uOpgdEtQn3+UII3iCN7UUO6gZ6+73+/lgT7qK8YTew4+vsv3zxjC+
	jbROuNt4HQfjgTJNstvKlxudmoezIJ3fzNuOrq8xkj2b512LUwTGRIAHws12SLa9
	jsOaEpTx+mQ7l0poVVmsbxyq8tyGRtnYqerGBJmzRPBXVo1Xble9JhptOQZScvvs
	TNpKVgx3Pht8QL9WSqgPM/h5f9Wxcub1Nmj7IZlDfvj5zCE7uApWcPvK3PUL4xVa
	6qHPb1v6T04kmLshgcAnIZwWovcCzTWVmdwcvrQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:kAnI3mhAJfu1iumxHnIfzhyuAZcd2dqmo0RuRGje7zg=:4TCtQq5w+UpIzVI4fky94aIGs1grY3Zu86iqwbUrhFM=;
X-ME-Sender: <xms:zqb-au9lGxYyT30Z36FZEz3dacwvy5_FyM-KgdkoKXSVKPjvfVxeBQ>
    <xme:zqb-apj0IR0g2c5wyxbod2MImG2Xubpp-9zuCjE_CxBZQILiqIkp_dS26z2mfExtf
    rXbMWamNgAyO3-FRGHA75-sv2P14XfSd6lyEUIfXhAbjuv2PmoFGnUN>
X-ME-Proxy-Cause: dmFkZTGbh2pWZ28YvSxw+0dcP4+tgoGjk0S895Ir+rX+p0A8ACFpBlozKOi5WmYMn6ibMC
    JQd+oztesAeL7AekbC3/u+rAQ9JbUfAopVvAn0RVC3+T/nZtZDfD4VWHEl+WOqsYgOgOY9
    hXZDdMpU/CCj2wFrjgL0YIjyWS1DCo3vR9qU4x5DkqUBwXlSjqGqFx1doOb8wIUgaunC+n
    Fr6NDu1VClMxS3B9afkohaNRdDASHrWCwNOR1AYe0gAJ956trAV6pw1YYPjXx/v70ph0tr
    sq/Lv/iM+6tvyZKAx2wlYaoKkMlkKNyl3GG9ko9dyzCoP40jWrQIcC+glmEF0PTfWIPKmB
    TJ9uIWgw5wm+32U8a86GWqGR/z0TYs0R+5tZ+38cPpVgn8x7+dc79X1T2DzrsqxCJN2zbH
    RWco12bnUs6s2WALm/yid/B/7gNJrcCA3MxSZx8MRWOau0+sqNIb41SOuxhmOq+WeHSQ/8
    +JWkwwr5+Jtjdwj+MDy/UVC/3sASj/D6E7YwMKNmdx/s4daD+LzXo8P+Oq+bgoiR6B3WgO
    zyLyaYbBVASRPQXRF96AWuPmhd+NDWdNCnqzQJaprBI4WZvgPpWGf95oaYc0EbGow+XXrA
    88xpaPD7X/khXq+j4zDcyNGCm6S5vrR8fVYHbTuzPwFGtP87omcYE7VbHH8A
X-ME-Proxy: <xmx:z6b-atIylWZ6lvEsjp97LRGVUf9esd8715ymIJK35w0n4Ut1zKom-w>
    <xmx:z6b-aiGpw7J1YW-VVkbgk4nw2jpcrUlnAoC3S7Xp3dnvSWJdSjhrKA>
    <xmx:z6b-ahTx58W2vYmG6zzzqi_bR5oDu5cOOPcTI1cs5Li7fHLLGaOtqg>
    <xmx:z6b-aufeOjTgjCwJspunV8hhttaY0XjqG9n8FeSjLr4tMnr_Vx7N7w>
    <xmx:0ab-apg544xyzacPwjCi5IAiWvNwxH6SIvLdH6e4TVyzQHBNjY_7cyg6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4F6EA32A0099; Thu, 19 Nov 2026 02:35:42 -0500 (EST)
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
X-ThreadId: AaT7K6j_YIN-
Date: Thu, 19 Nov 2026 08:35:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Message-Id: <9572fc39-00e0-4ad7-b5b5-d83df573a589@app.fastmail.com>
In-Reply-To: <20261119055958.1621709-1-vgupta@kernel.org>
References: <20261119055958.1621709-1-vgupta@kernel.org>
Subject: Re: [PATCH 0/4] Remove libgcc dependency for ARC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 19, 2026, at 06:59, Vineet Gupta wrote:
> Hi,
>
> Arnd pestered me to do this.
>
> Most of the generic emulation routines were present in lib/ flready.
> Thanks to Dinh Nguyen and Simon Schuster for filling in the rest.
>
> Vineet Gupta (4):
>   ARC: math emul: elide 64/64 divide and floating point routines
>   ARC: math emul: use existing lib versions of libgcc routines
>   Revert "ARC: Strip libgcc debug information when generating BTF"
>   ARC: stop linking libgcc

Thanks, I've merged this and the openrisc patch I sent into
the asm-generic tree now, on top of the merge of the nios2
branch.

     Arnd
