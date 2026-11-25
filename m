Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592808;
	b=S/r/JQUCaHOhIcAhinH2TeKRI496odGHvUEQ3Qd8q4hCILAf0Da0A3byr1BkDm+KKXh6
	 W8uOy/kDMJPu7ZKvaX6oAAIpFAD10rId6AbBj7b8+HvLFYpQhQwFRwYwnPUFV8scFSHMV
	 Fl5+8l6QJFkrE31wD4pE9+1pVa5nSk2gV1HzY78JTSEGgDNerQuANSuGaCcY34jGccRZJ
	 AjFGEqsXn7dy5sxjWDA6Lo6KdD3JEoufD8HAVKIWw4bS+q3eJCs6+yT5sEt0x4QNOpHVV
	 jSvAFfeAmzzFkTx+/wIui0daSdiCJsB27Fw6dEV8E/oQeSlpTrifyL+hQmdXv7haRoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592808;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=/Fa3M3vnnHaT+PoaAOv/uZEYk0K7/wV2EEVJ6Q3DJtw=;
	b=KIAklQ5KTfthlKsI3krONqv/UMDl/cx5Xd8VU/GSKGejQhkV0aNwnpjMkypT487Y1tkq
	 POG9AOY92lwkQ+8UjijN5q+rMcqUqrH9PpErAE/swa+VHkUs9sY+C1GVl9JHcMxr8xJoX
	 /2EmStKG98fgTbIwOScp6cC4Dt/tjxD9Y3peiOecIqn6Bd7qFhXjnIjzrcr7503t9LnKi
	 9TL60M5SGd8RpmT5IYiPoaYmqZHRz67N/mXJQ6HoibWzKcqUkOv18i46sEQ/6jIRF9Lqm
	 9Qla8uNiXVIzHXi/2+rkzhPzQAEHhMJNK/H6qGG4z8Dd3qco3pdzMc/LIEy4pYlgGUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=fMcs1UMz;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=5DcRjJch;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93960606A6BE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93960606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=fMcs1UMz;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=5DcRjJch
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 86E27140041F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:46:46 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 02:46:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795592803;
	 x=1795679203; bh=/Fa3M3vnnHaT+PoaAOv/uZEYk0K7/wV2EEVJ6Q3DJtw=; b=
	fMcs1UMzhSn6F7HHhrNFXWz7OJZ9t3yMEb0+IfnIAuKROJ3mHThXf415w0D6XH8g
	EYLl6dW3nFQ+hnyyPBwr+qj2kaGnie5rEtKW2YL07+fIH17+Fl/TJZk9h+5FVLcG
	mQrZY1KtxAvvqjPBsJoK+3MgxSnnOElmMvLcU5c7bqluHlWwun3ODnIj5Fz6ZcG8
	GJwn/yuqHlJRJM+pdQ0X98Tlnm5nQbyLBz35iVeWH0NgP+hmerGQbMWDtrrBmhv5
	xuQPP5DWUaiMPNu1joCiovc1wwwWyV6bUQ8Rjeo3pGTkF3krJOk9gMAbKTGlWJWO
	E2hhVZ1zR2TgRTZU14lv5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795592803; x=
	1795679203; bh=/Fa3M3vnnHaT+PoaAOv/uZEYk0K7/wV2EEVJ6Q3DJtw=; b=5
	DcRjJchEVpZHEVYuHrFY99GrPe8T+wzV8ES0VCvVtPO8lrCVY/XmPVCA4SAqCjgf
	DEX7kWzOiPMuZuxFytOdWl04To+lFKljDHQ0kp9yabej2VUrclWNNzOH6zvxV1of
	S2TloX8xN/CRMzL4JrIAphdceXIpwwg5m1pSBG9Kx/XEm39gmyxSmFMmi0AClLYl
	IPZGicQbEwWQsMQDkVJCq6C/Zm7sRpcAIKBkQPoixn66Oa8sRJLqIqTXOWdPniSX
	l9fBqgJxQgVP0QODWjLKAxoeVNN3yLCXgcJkRJ++O6LcCbbScTYJvUiSmpL+GVzE
	CtBgosTtUPdu/hVE9oETg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795592803; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:SxvPn/+VZhVXbHyMZBA0CpqSUCMqURWFEW69BEqvX9MZbbw
	J3UMhuDqawe4ue4IicLGlQj/qAggs5dpUbR8164e7EC3HNmK64Fz3CHrIMdHoSqE
	92SOAJ2vmlwgQNQcMN7EIx9QhlPaj4QTHS0zBPgaeBVxLJURw6tlNYvxXBgy53Cq
	e2N0/+1VLfX50ajvowZM5Jdp+IQZPUGWNRWzvCipnkWcE8+brBsEUVt/lMRdyO5a
	ZzlRBZ4A+7UC3GRYFw6vOu2Iox6nktifYaJmS+vT9ohGUX5STEQYZins6ABwQPkR
	z/Sj/45nnK+XO5jvoUxgRA1OA35dl8sR06A9s+g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:vnpUfb/G7peRRbjeLfZHUeI7xrhjGC9JWCUrrfFhzUY=:pBU6EGqzsIoykPfTbVuCQ1+7dJaFGJbvpLet8/j6NQQ=;
X-ME-Sender: <xms:YJIGa0QrWD66QL2Q2k0GbjXsZH7c00rAiLHMcae4VLF-yShKV1cBDQ>
    <xme:YJIGa8lXqHiwDzn9lInfiWRkCXrLSV9I48SUqCgn-GLClwOG67TB3-ySti2ZRYQtR
    uLOZBLLexTQt8coYzy4VowDlO_wpvfKbqQFQcty6HM9o-beZn6HJKDF>
X-ME-Proxy-Cause: dmFkZTFAHQpZI/xmWqJkf4qQaZjnb70DL1t7aSXRqp9Q8WoLR6vC15YgWWXBRiS5ZLaOzO
    c9hHHmQI5HNBWDQMzQcrTs9jHrOYRIKd+uhSZmO8admFQC+kFohj4ITWiIB9hj8u2qYxnu
    NVsSbLNcXnTirufoO0WsPjOBgeJu+LrRutMwK3XzBd60Y1xB0yCyLRuWcbKGZf0TZ5b7et
    uhwgLjyzHR2Llz2kgxgDI/msY4OAAE0arvpkKCBxW170lxwUgSq7h7SH0XdQugMpa/7hKF
    Omcjso9yY5sKA7I+X+Khd0SdWBeWQZ9FhJFp6iuFLkesOk7Zmpz0U1B1sDW6AI0yL6b9LJ
    7e3q3UP9Onu4o6HDgUmCfvQBgr4Zy/9ne2h/tcb7AVjqKoGc2PJg0tp4b272W9nFw4kHes
    G235t2Jt0EMuHYN14F5Jz/8drDZWYnIDz9HUHbifOZsmLPqczQl+y9zPk2EZU4xqVN3olu
    djE7OhYEL8srUZwJ789MlWBbTnn1Zy1H6GdBnABNFk36bPTsCSn8kQgFKTgqgr/vCepqM0
    k7G/8bMB4rSEOVo0r5aFt42ZBUIEu/FnBXt9gJz4Qd/qe2vLceyPAWkufAOcr65+CSuVBH
    u0sTsjq14MvtdYfpIyhLV7Vk9QSKfnwam7PFwMPfpGl5d/z5Cp7s/q9MEqzA
X-ME-Proxy: <xmx:YpIGa0Eui39VJkfEZzkiKtxxheu9VSTXolwdP0lL7fvHZJbtDJAXjw>
    <xmx:YpIGaxBZLlNACdqF2LfhGfPa2HJCSp79OivD44YqpgOvKxkdPmbKhg>
    <xmx:YpIGa3-mQ1JjsFjufibAXjl32JrqJ3Rbo8eQZhCsuGrTKHzneeVMVQ>
    <xmx:YpIGa9BtZVFLO856pX7aPwU_SoXYO_qhdn1hl6o-GgjZQ6PqcY5mbQ>
    <xmx:Y5IGa2ZyJMx_8qTKWf4PiTn_zMa3EbfgXjskwJV04zO0h3LPqHWVF6Rn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B573832A0099; Wed, 25 Nov 2026 02:46:40 -0500 (EST)
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
X-ThreadId: A8zX0SkmuZaR
Date: Wed, 25 Nov 2026 08:46:20 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Brad Hawthorne" <brad@sim.vu>, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Cc: "Vladimir Murzin" <vladimir.murzin@arm.com>, linux-kernel@vger.kernel.org
Message-Id: <9abcbb45-7408-4eab-9bc7-ca353f53b9dc@app.fastmail.com>
In-Reply-To: <20261125025757.1159931-1-brad@sim.vu>
References: <20261125025757.1159931-1-brad@sim.vu>
Subject: Re: [PATCH 0/5] ARM: NOMMU: fix PMSAv7/v8 MPU setup on M-class
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 25, 2026, at 03:57, Brad Hawthorne wrote:
> With CONFIG_ARM_MPU=y, a Cortex-M3 kernel under QEMU (mps2-an385)
> panics before its console comes up. Patch 1 fixes that: the M-class
> region base register has VALID and REGION in its low bits, so the
> R-class probe selects a region that does not exist. After that,
> allocate_region() can return one region too many (2),
> mpu_setup_region() accepts a number one past the end (3), and
> try_split_region() can return a base not aligned to its size (4).
> Patch 5 fixes the same off-by-one as patch 3 in pmsa-v8.c.

I had a look at these and they all make sense to me, thanks for
addressing these issues!

     Arnd
