Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011915;
	b=Fs19tJ4KBdh+V9wHj5PQj6OVmPtkPoSxYpcx6YbFJb6u6PBYqyLf+8vyV89BoRTzVngH
	 ruq9V9p74/Lz6DCUgshfCSd2D+PNr1n3jd7CaL6TbLRzcH7TxVqYUfBuVO9cG/c4uhv2x
	 T7mPZs2tSk1j2JX8oukYKYLKHMvMpSHnVEclN4UnalZUHRoxhSeT+XfCHe8m3kESG+Fcc
	 TCp7m/tdUYst4NZB7IawSXWlieHefqXpOTCY+rAtjGQ5QTaCh40AgQwlSkNEb5ZWwxwYf
	 Z+u+7sPL015oJ5/3PTDMJPhNMKM5uYiLCLRycH5meRV70jhaTiA/+m9JpImmiHeu8Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011915;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=LOaxTdk7bxxGSDn8LW/SZyhasTfS18Dof7TxoTx8zm0=;
	b=q82Cbe3omhHaAO9Td5J2oye+C3iiZkI3JolEfJEUQwZx2KEkSY6+IHTeIXRj9VtrLhMY
	 4QVFfokPoeYR3ChKPipMIAM0UW4+F+hPtHnHr1X4c4aqYFCAoDEq6tOkln+4VTJH31I1O
	 1Rmm1VByrcgoBOk3TWTFiQ8sfX9EOW19jxGOyBaZ0R5iT01SwQo/SXLQrv6dGArnLFdjr
	 O2r4wpWJ5amEhxfR/exQl8gaakoBllK20bo+iYc9NeIuKXF0mYm51j46/r/V8aUcomHAx
	 llHjvo243burv8ug0VlOkKmLlhbS5FB18B57EjBYxEfUhxSEOoSuicGhKpJEDmtHHcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Dc1niph0;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED6760A2630
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED6760A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Dc1niph0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D23204E41626;
	Wed, 18 Nov 2026 14:25:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AA9E5FE9B;
	Wed, 18 Nov 2026 14:25:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FC8311BC2239;
	Wed, 18 Nov 2026 15:25:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795011909; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LOaxTdk7bxxGSDn8LW/SZyhasTfS18Dof7TxoTx8zm0=;
	b=Dc1niph0ZFZ34oDPTdnK5z6fDSrSSc1vpQk9LQane7jtoPsFAmPTompMCfsyk9feYGDnl7
	qOuDCeiCkhVGGv+hDmpfsrtK9pt4HbfnhJwNWmHOV5jXkD/EQnh5L7QB9IV4ccG+aTsgyA
	Rb1qkIpHzGv0Tm331ajYM7/MdSKps61QdvXPWSYmDS0Rql6f5W4VUGR3BGhy1iiLbFtC0c
	JEn4XpKzLYdnIlvhOGAuQ/9ldyIG3yRpywT6GpUFcR5MMOHv/zHUMdZze1W/kCGFeJmagS
	e6iTlMd0U1CLLkwAujVA7Y5xXukPkFCCCpcxEsxn95vGmpwXJXQD998hsrm37Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 10/17] mtd: spi-nor: Fix SWP for octal DTR chips
In-Reply-To: <DMYC2B7I8C13.2UQIDHJKGBSP6@kernel.org> (Michael Walle's message
	of "Wed, 18 Nov 2026 13:25:08 +0100")
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
	<20261013-winbond-master-spi-nor-w35t-v3-10-6dde1d513df8@bootlin.com>
	<DMYC2B7I8C13.2UQIDHJKGBSP6@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 15:25:05 +0100
Message-ID: <875wxui5dq.fsf@bootlin.com>
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

On 18/11/2026 at 13:25:08 +01, "Michael Walle" <mwalle@kernel.org> wrote:

> On Tue Oct 13, 2026 at 6:34 PM CEST, Miquel Raynal wrote:
>> During the recent rework of status registers handling, we mostly focused
>> on quad capable devices, partially skipping ODTR devices in our mental
>> model. It seems that many (if not all?) ODTR devices have no SR2 read
>> opcode and have other control mechanisms. Because of that, the current
>> support in swp.c is broken, because reading back the written value may
>> or may not lead to the expected result.
>
> Is this still the case with the recent fix for the .read_sr2 opcode
> from  Haibo Chen [1]?

While I believe his fix will prevent my case from happening, I would
still be in favour of keeping this patch. I should probably have wrote
that in the first place?

Miqu=C3=A8l
