Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995159;
	b=zP5cia8LBPtP54O+rN6qnNEla5ez6LTkqwWOefNe8rHyhV/7djukvK+fRtbE4aJz2+bA
	 GX53j6IjoLr4/9ZvymhdMnUf13WgqsC8GnOQy/mKXQCCp1tOoqYc/Lvjnw1EJDPyg5cLl
	 xmFg6NtGTGpMyO87GBycD405G91GtPj+Ch0K2Ah+oke8B1x2nZg9jm2zq6BpTX9HmoJ5I
	 /MSfQuHdUrQDJ1gMwByaaMNWjafS/uiO/MQ8G4GxuoT4fNEMpzRJcY4gfYpU76eexSBVh
	 n9ats2pjYrpGn4W49WmFAhqdsQmwCIpQrgF404vLIhuf0PNowtGGELS7VkojSFLk5Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995159;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=7cHtxhfx+Jp5jkHHuQhj/jLx3mH/a2nxfneU8+kMyOI=;
	b=UEcATEG4CrOz1shQMHif6PGpb3q98H3/TtH2v8T/zUIJu3rqOs5AHAPGQZuqGJ8NklrF
	 FHj1DbU7phmvdHd508pnzyK4djch2WvUrD9PmGdiDo0BZk8l0CqOtU90YR/s195fEFbbl
	 v7aAduJq2cBkpDrgTtCYIId0So4iixDOmaljbeaCJJEv/QNufiYVQxgHipRxCYyBLY8G/
	 2UkC+aHvk82tmKf6FPPBLq+1hoFHuY6cRNgcrY4+t3+0NuWu5UIktTEHQ3IXEP9gTD03f
	 0rwRcko+n/6LqIG01PKD3nvjlQT7SZb/Z2gBdof4p++ibuYF0XCbKnBomDEY9O1gMkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X+SBRXXO;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7F9606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7F9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X+SBRXXO
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 63A924E4160A;
	Wed, 18 Nov 2026 09:45:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19B925FE9B;
	Wed, 18 Nov 2026 09:45:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC81211BC0DFF;
	Wed, 18 Nov 2026 10:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794995155; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7cHtxhfx+Jp5jkHHuQhj/jLx3mH/a2nxfneU8+kMyOI=;
	b=X+SBRXXODI88ljWGiHFKGbDsD/94jik0Oxd0bLQ4oI9Gr852F73/PkP0CFK5KUCQGkF1Dk
	if9aVJsrSZ2JpBzECGrFBTzu+1gOy3YzR8Zk22+a7sHFqKMNddxfkUIEQsSuc74bHERNOS
	0HT/RVMYevAbaP4BiwNBJWSa7pw/qHFW0JWinw3wuhX7dwp0icBI2gxwUp3g13ovg4esrx
	vxJa79XL+bsEAJwmWMBzZQsvZLmgzKaXZhSiOC35WziuRcRo0LPwsFnwMEYMhCadHAXFMI
	/HELQWXaRZ9KEeMZ4Qj0yG+IuLOTPkJkYUiwr5rD+bode+3zn6cyOG5WwY+Jyg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Gleixner <tglx@kernel.org>,  "Artem B.
 Bityuckiy" <dedekind@infradead.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
In-Reply-To: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
	(James Hilliard's message of "Tue, 03 Nov 2026 22:52:39 -0700")
References: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 10:45:51 +0100
Message-ID: <87fqwyjwvk.fsf@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 03/11/2026 at 22:52:39 -07, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> create_bbt() returns an error if reading a bad-block marker fails,

This sentence does not mean anything.

> but
> check_create() ignores that result. It can assign version 1 to the

That's also unclear.

> incomplete RAM table and write it to the primary and mirror locations.
> Unscanned factory-bad blocks then appear good in the persisted tables.

Here is a proposal which I believe makes more sense:

mtd: rawnand: abort BBT creation on scan failure

create_bbt() can fail on a non-ECC OOB read error, leaving the RAM BBT
partially populated. It is preferable to bail out early rather than bump
the table versions and write incomplete primary and mirror tables, which
would mark the unscanned factory-bad blocks as good.

> Propagate the scan failure before changing table versions or writing
> either copy. Keep explicit NAND_BBT_CREATE_EMPTY initialization unchanged.
>
> Fixes: eeada24da8bd ("[MTD] NAND: Read only OOB bytes during bad block sc=
an")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I would prefer if you could write your own commit logs, giving us more
confidence on the work that has been asked. You can use an LLM to
improve/enhance it obviously.

Thanks,
Miqu=C3=A8l

