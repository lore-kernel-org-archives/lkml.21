Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.108.101.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437383;
	b=OfbwNVm97eiYATSGrmskhp8BNDfJswDuG+AN8hnES0iu34+2GIr7VO2WLdERdYC/oY2v
	 oCglnjFSZbdIo8jsmalBxcQn/5DLqMmb7Mwwv6WTT8Y4jNqTF7lJyBY7MuJF4DrVMBNIZ
	 I2hRZyIRorxVwsbJ2uYBGjZ9LIVhUUUt2vkwNr93dhbK5YdNinKUYbvSAjGtxnvr29eyi
	 nBYNISBBzan0iKyomUpQbd1pezLU5Yr6eiIgPCGSeUSFXk1zWBIuD2W+eFyLOP/iUJHCq
	 TPfOqsQR+ZXglO7foki2mNYKYi04nEHVBI21Trnft9zAeAlKmuel9PbkrBg0QewZ9hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437383;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iFeOy59wvn0iVjKwkBcZpCTAjC6Y+h4cQKqhS4RDEvE=;
	b=zXepP3ChKZffz+WoTOHhB5msw5r2IewemHUe0FLsgG2vzo3pHFS5GL36PLlEApuqZPGb
	 hI2uhZDPBTyRSEUD5P2r9/FMPeErOPwqDqelFvCGn4xKvl5hk/hh4k3lPgy8UTwfgGy9v
	 uhm71Ao6HgW91xPFJ56ZYnI8aCtCyTNZq7ALpAwY8sOQyr1GO9wBNn5wZdg5H9sSd3Pog
	 sxIh0zTiPA4SHanJ3FYGRNeGRLH97EVWXy2GD/jWnn0GQQ6meUwb/Thrgs8NkpI2Fv5KK
	 /If7ngFXiMIXn5Z4d+M5bbHlns8SUTkSAs7R1pRfOFyg+lFseOnVhXfVL0b6JLN68sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vitkazik.cz;
	spf=pass smtp.mailfrom=vitkazik.cz;
	dkim=pass header.d=vitkazik.cz header.i=@vitkazik.cz header.a=ed25519-sha256 header.s=v1-ed25519-20261107 header.b=yXBNMm0K;
	dkim=pass header.d=vitkazik.cz header.i=@vitkazik.cz header.a=rsa-sha256 header.s=v1-rsa-20261107 header.b=n65J2f0U;
	arc=none smtp.remote-ip=78.108.101.136
Received: from mail.vitkazik.cz (unknown [78.108.101.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F69606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F69606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vitkazik.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vitkazik.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=vitkazik.cz header.i=@vitkazik.cz header.a=ed25519-sha256 header.s=v1-ed25519-20261107 header.b=yXBNMm0K;
	dkim=pass (2048-bit key) header.d=vitkazik.cz header.i=@vitkazik.cz header.a=rsa-sha256 header.s=v1-rsa-20261107 header.b=n65J2f0U
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Subject:To:From:Date; t=1795437352; bh=iFeOy59wvn0iVjKwkBcZpCT
	AjC6Y+h4cQKqhS4RDEvE=; b=yXBNMm0KmfWX0mqhH3vCktGCc3++onzIMvK9//JtX1xzXyhY9i
	3mkqK3nZEwnCFBqYXbbFzn+qmpBDWdKMVdDw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Subject:To:From:Date; t=1795437352; bh=iFeOy59wvn0iVjKwkBcZpCT
	AjC6Y+h4cQKqhS4RDEvE=; b=n65J2f0UsQqP3BFhMoaOGBA21lTBa8a3GzIzBdPB+jHSIuISpG
	wdATvoh8QHaIrAUm3ourvP0BWt2plQt1L4kW3s4wdyIJEGy0yVmWxtD+HuDDgLbeLAUd1ZJikAa
	iM+zkzcQnf/tvvkM4Mh5U1LdN7STJv952p25D9ww2vKJCc3V1lnGpZrc1m2mfpyQXPzgpdmCOBo
	cULxnbtGSBMJPSdUwPKOrW7n4+oV8tAZwI14YhM9kBfoTQj58sbPMvkFpKwA25mfbgU+COb8cRG
	NxIgY838wMhpNcotd54v+R6tZ2wB1omU9TR58Yl0FFDHAa2YxY3acTM2PS1jkuN530w==;
Date: Mon, 23 Nov 2026 12:35:50 +0000
From: =?ISO-8859-1?Q?V=EDt_Kaz=EDk?= <vitkazik@vitkazik.cz>
To: Marco Felsch <m.felsch@pengutronix.de>
CC: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sshivamurthy@micron.com
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
In-Reply-To: <34hku3cwz5tgpz4l7jtcsupictopwpwv6dmbkyhwvi2husszfo@5pufgrbxligl>
References: <20261121234125.16093-1-vitkazik@vitkazik.cz> <DF6A2762-566D-4A13-892A-AA18B9F987F0@vitkazik.cz> <34hku3cwz5tgpz4l7jtcsupictopwpwv6dmbkyhwvi2husszfo@5pufgrbxligl>
Message-ID: <EAE15106-66A8-4457-A71E-12D68E06F506@vitkazik.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Marco,

>> Hi,
>> I found Marco Felsch's earlier submission for this chip (2019/2020)
>
>Uhh that's an old series ^^ Can you send me a link so I can check it
>quickly please?

Sure, here is the last message of the thread
https://lore=2Ekernel=2Eorg/all/20200117071810=2E2kuiwr6rhlofp6th@pengutro=
nix=2Ede/

Regards,
V=C3=ADt
