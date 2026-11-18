Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024136;
	b=Bysq80Q58JL9QKqEPHMvmmJ+AJ+dxZ6KtHIAaAUMrb9u7EbJ+kxYPa1XoFouly/G79Y4
	 qTYPOmtWCCzUkiSe6yrqwxOZcnrLLnUJxOIMvDtZyPiQDdKTrswz5uYsZtJV4X7g+djZo
	 10EdbFmGGAHVVAUL/QFI+qogCgILbR6PuOU/W+ESJJwxpiXa98VzvGyBUJ0fgTW2TSXFu
	 SVsf82s83LazYFIC8WX5m+r+XIZohdse5LcxR67vIP3ZfWY6mQkFNYTJdyIsAq4YpdJ5x
	 icPvzl/HaUpmLogcCW5rG373Q9UmDhEQ+cNOb9NoNFd0LC8aN+arRNV2Cjlln8lA5IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024136;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Xe34NVh4uImufUbgHXCx8/fUlWIVbmzeb8dPhwk8FrM=;
	b=CbWvqxSE+YKuaHX5XRgSuazTh1RDDpee/2msSMq1Mb4OeNzrxIit8hztkrXwTdFoH7TO
	 MkoBOiFmHI0rMMAUwx0azI5xVV27gRGl9lbN+uYMLmNt6BY2bGS+K7I/+gCS2YAQDNMfW
	 EkwZN8ts7Qq2MOVh9BdOOhaFf6l4I4r/SVzDrqUmAjsgOVIXFtZYu7gJU319yhcNG6Gpb
	 x/adwJwO0Wex19+/NCj4NHZFww9D2W2Rmlpm7xWBQ9k8gAnJi/O9NfrIbCgxJYMVPfamV
	 R82CRsC+vRLCXU5tLJ6aDAd6X00vQqQCS6CG+wDmeQqbMKrCRBp4kvrFsZHlHB60D7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=PxpLeegD;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nF8PDmAS;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7489F606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7489F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=PxpLeegD;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nF8PDmAS
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 52A241400171
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:48:54 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 18 Nov 2026 12:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795024128;
	 x=1795110528; bh=Xe34NVh4uImufUbgHXCx8/fUlWIVbmzeb8dPhwk8FrM=; b=
	PxpLeegDq7ueh+SbwNlWIGg7KK+oi+QHt4y+G2QiRbyGO6tvT5FIieSLwgnAJYZI
	NyAnfxJa8QpXPkKoYWYDpPhVhFQleqbkJk04ksg59rYKohbMkboPz8Zf7pYNGFJs
	rlUsjSbzF1opG/gYNbDLtnw/jbUUkMzNXIbCJ5epO5GIWthEwPHTwczt6QRGa7v+
	2MR/gKdeLAbUY1F5dNZH/EDFU+/62wo4nn/zhdGfUxiiY5Y2BquOm5fXPmlBWwBa
	DZcBKUnz17ly4CpZdPLawSS0ku9hN84v92ncfwKneUJ5s0xFRPlc/afeO/wfxZ8Q
	tbzbhCxZjxk14ARt/Hrobw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795024128; x=
	1795110528; bh=Xe34NVh4uImufUbgHXCx8/fUlWIVbmzeb8dPhwk8FrM=; b=n
	F8PDmASlCZKyg+vgOjwtW9ewyRj2uRI1XVxA4XcTQjnFa1JiEOuec0LUXyggWYkH
	vzJmi1A/jS9HSVoMRW4mvZzrF7tHhagBLmmxCcEvFhp4OVMd9IUhI/VJade76vLY
	6EkxmnIQO4zu5mmolNtr4MXgtoLRGKN5qSBGAyTWn3Ul+pd6dzjZNn0gL6OrZ8Qo
	gbPXb2kpWHXD/qc+Z7BJDca7iDxdJOkQGr5EjdTUmuQvP68a3T6IIQ8O+rlHFmn/
	g62A4l51uo1h4AJhGyQYNkm7/c7bOF5Gdd6nd7ijp0Y6PVwWDqEqufIylsU6ItIA
	Q+kSq3tkNJNoPkYlwWRqg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795024128; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Ow2s46g3Z9C/GzmbHInZ0U892sTmRNYbDpP7+/YXz6agDbR
	d5mVNAnqz91QDCHaMO61YWUy0PAgREShsodXkzXxOGEW8jcHIaYNclDJ2QjjXLcI
	3QIy6mJr/N+2L+mZjdcQKt61POhaETYw2PS/hw6DNEkX3ixW4M+sc0ybMSKhgPTx
	tGsPv3GHqNtzCIymFZuzfr3NgTBjBFWAoJGMde1565VF7MmVCYgLgJDKvCIJQPjQ
	Ii1fWYeiY9Am1s+B36wyUJjgb8WdQb+AT/3sDMLZlHyKQTZ79IdtuyDiaF8zeDxD
	sViy6vrgbJoClFpWkkIRS3aOvG7zE8kLZT7E/KA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:MrbhrLRD+vSMU3pSvuhJ9BFSqhL1fdcwBJ1j/B/fMAw=:Xe34NVh4uImufUbgHXCx8/fUlWIVbmzeb8dPhwk8FrM=;
X-ME-Sender: <xms:-uT9ap5pZ0wIccCG5rffyEWOyh1Yxdcelkf5rfJlXcGoZ-w7mVTJow>
    <xme:-uT9ahvAIq4UvWgwofKJlHvtEQHpsTR9ZXxiw4-HDqo0btoma-udzRzL46z1lO4eq
    fGAM40dXm_IIdHp2N2k3XOU3tnBIArXkiLZYzTTK_HAkYp4B9kTA0pybw>
X-ME-Proxy-Cause: dmFkZTGY5PzRg55vSBB2wm9bEnYiDKMCELFsZdptZBwj3zN4QAGU1tbItT12em3rih9gn1
    zh4bLFTVYYVcDSBREcJs2/GgQ5qUOAFUKTq4+zjyReiuKoriCotTV089oxlT5G+tg+Iog9
    tD63kS+ze3zzKwdXssE7a5h00SiN2Lu0ZE9UOe1Hbf1R7fKom3MdOdaCeGS5p7zYx8oCjY
    pm/LnIRc6wZz3VSTHEwYepOjsog/XK9hjR50qZKSN28iRfaNq3yTYynR3yBnw731eOVOJj
    iJFxU4JoHeSVdAPis+F2OyED2ZennUzlEVokTugmRdF0ss6BOALNWTXy8VAyqREPUAplAD
    m0bnuQVE4gh+oTyWOgZLUCRE1NtnCPzlBmnedjpDSws+ARlBdEk8CPLJSPqL/N/UynpILm
    HQuVJkRjXL/1PG4yY4MILZmSNw47sPrr5nCZSYp7yU2tzZbLXd7myJBr1uCbdbKbvWBzwM
    YemvLTHkZ7VHWGe0whdrWi9RrXT/5HwKQdPVO2EJt1ckc7PthvIj6Gye9smRzvvXcWEbqa
    UQMz5uHUN/sMZYMxfZhuCljonT+N8/9nvBY6lr5GJveO4URS8VY/dnP5VdhRoMTUL1w3H0
    KRpXglb9DPmhx43fTQBGue4Nl9NPmrCUgFMJ87fBr+HF+qDt6XeFoqg/U+Cw
X-ME-Proxy: <xmx:_OT9al1MyqAwwcM6kjsO1jutYsMszmcoVhwGTBng43umM0pEfqqRZg>
    <xmx:_OT9aieQ5JR0pysfClBLkM75oYTDu3DuzJ7moMop7_6EIZMTFlmSSQ>
    <xmx:_OT9aiKMuPGwM1ICsd7-tHrabymg1KsQ1RxZfYeTJ2kWGlNTrF6inA>
    <xmx:_OT9agrWP8pCYz1zqZnAf4Uy3V_kCyJJWKml_P2MS5aTiHOwhDF2kg>
    <xmx:AOX9avQCAQjgaTI0ss7r1l4V26zFmj91ge8rDTkkCisAdYxKvmqex8Wn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6632B32A0099; Wed, 18 Nov 2026 12:48:42 -0500 (EST)
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
X-ThreadId: AZUzpC_XL7AJ
Date: Wed, 18 Nov 2026 18:48:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Xia Yan" <yanxia@cmss.chinamobile.com>, Netdev <netdev@vger.kernel.org>
Cc: andrew+netdev@lunn.ch, "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, maheshb@google.com, kaber@trash.net,
 dskr99@gmail.com, linux-kernel@vger.kernel.org, yana06070@163.com
Message-Id: <f19edb7f-d301-4234-ae51-362620d5b61b@app.fastmail.com>
In-Reply-To: <20261112025619.563195-3-yanxia@cmss.chinamobile.com>
References: <20261112025619.563195-1-yanxia@cmss.chinamobile.com>
 <20261112025619.563195-3-yanxia@cmss.chinamobile.com>
Subject: Re: [PATCH net-next v2 2/2] macvlan: fix RX byte accounting for local
 broadcast and multicast
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 12, 2026, at 03:56, Xia Yan wrote:
> In bridge mode, broadcast and multicast packets sent by one macvlan
> are delivered to the other bridge ports by macvlan_broadcast(),
> called from macvlan_queue_xmit(). The skb still contains its
> Ethernet header there, so adding ETH_HLEN again in the rx_bytes
> accounting overcounts by 14 bytes per packet on every receiving
> macvlan.
>
> Packets flooded from the receive handler have had the Ethernet
> header pulled by eth_type_trans(), so they still need ETH_HLEN.
>
> Use the existing mode argument to skip the extra ETH_HLEN for the
> local bridge-mode path.
>
> Noticed in macvlan during review of the ipvlan fix, and confirmed
> on a 6.6 distribution kernel: five IPv4 UDP packets with 32-byte
> payloads increased rx_bytes by 440 instead of 370.
>
> Tested before and after the change with custom IPv4 and IPv6 UDP
> tests in UML. The corrected counters match the received Ethernet
> frame lengths. Local unicast and external RX counts are unchanged
> in these tests.
>
> Fixes: 618e1b7482f7 ("macvlan: implement bridge, VEPA and private mode")
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
