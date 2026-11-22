Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.108.101.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307209;
	b=scKw2UzNDJj3a9/xB72ga+8OPW1f0cwWejBcbxU/0kxAzHieJlYPFgFxX1Y7oqGa3Lpb
	 qUH4e2mDRTsTb820l1U+91iG1zHupXrMgGrGMLMPn41ywCZ+MfBJsLzq1iJl18zwkBSex
	 N9K82pGrtgAFES1rWA8lEfY2w/fQidGH7sg60HjbT9lVMM8WlXYDTlrFo1YZGk/DYCgNJ
	 sRbj2xPWIt1413mvhczsKmQ8nn0cSLaEcg3Pc+wyRIpXlojFAB7j6ea9GTOjH7gqNhIHD
	 QhhNl57EUrd0lRp++rS+YCuS2SdPFn2wxHpePyKqEvOiiNxN80rnHYR/EMvex+x1E5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307209;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FdMdr0OPoLSwNkPJr5yD1+5uK3Sil+tJIjrmqRVSmVo=;
	b=ANBV8/J/G08R6R1OL4hDFKOL+3XNKRSJbzXT0X8Hh5K+ONtxuhiqfme0/7zZZyMrq+Oj
	 0QI29qhPJuocOrqeCQ8bClb2X0oVDcP6X4jtng3Jg/HL1jg3zHUQ0E1lGK0SLitk6V0mo
	 RgpDnadygFPYAvLmxCyAIxznnMfudmkGhF4Q7xKOfQYoDuxJ6BN/QITyMQAIufAorehKy
	 MQItG8as1pJNXtzgavJNuNldwddQHDSkgMBsvU91Lr7/PyhpoweDoKtQSDkr/MvwyWE09
	 3IrevXzHsIrYDR1M6EzRdSuwuOz87mvbalSsTrXwEH5J9USq2HzDY6Kg/k+G2hZJl5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vitkazik.cz;
	spf=pass smtp.mailfrom=vitkazik.cz;
	dkim=pass header.d=vitkazik.cz header.i=@vitkazik.cz header.a=ed25519-sha256 header.s=v1-ed25519-20261107 header.b="Ts8I+/ZS";
	dkim=pass header.d=vitkazik.cz header.i=@vitkazik.cz header.a=rsa-sha256 header.s=v1-rsa-20261107 header.b=EMeJOWKo;
	arc=none smtp.remote-ip=78.108.101.136
Received: from mail.vitkazik.cz (unknown [78.108.101.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22A3606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D22A3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vitkazik.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vitkazik.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=vitkazik.cz header.i=@vitkazik.cz header.a=ed25519-sha256 header.s=v1-ed25519-20261107 header.b=Ts8I+/ZS;
	dkim=pass (2048-bit key, unprotected) header.d=vitkazik.cz header.i=@vitkazik.cz header.a=rsa-sha256 header.s=v1-rsa-20261107 header.b=EMeJOWKo
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Subject:To:From:Date; t=1795307196; bh=FdMdr0OPoLSwNkPJr5yD1+5
	uK3Sil+tJIjrmqRVSmVo=; b=Ts8I+/ZSlO6lfLVX0gBKNOTrDXwUEusdM7CQYroPAOKkGeL6fV
	aWDuOVT6LtGmhhczOv0qtV8BUb8dDgSNQFCw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261107; d=vitkazik.cz; c=relaxed/relaxed; r=y;
	h=Message-ID:Subject:To:From:Date; t=1795307196; bh=FdMdr0OPoLSwNkPJr5yD1+5
	uK3Sil+tJIjrmqRVSmVo=; b=EMeJOWKoqNGNL1NCGCsS1FKDeVOY7qjgpJjB1bMaAU0zeRbBug
	y2AsE8+3MiZJocMcjnkesX4nwkQyn+tUi8pQOoc98w236/ZnEKsszr+eP/CKhvAKQ2UdLzJeJAI
	8MjiPqh0b+fQlsceGbc9NrCF5CwsllgukXWcPy91YYkBgB1Jo4qGjTJGVcbiAYc1xecSWU1RCV+
	WdtUw3vgg/azOHn5KuD5UH685JVeFja88YTVQc0rEjdDek9LeB2iiJ+jKTUNg5bY4e05sxT39kW
	GPDdas72S4QWMM86Ac55ZLd0ZK+DqUJp05n4R5v/qmGAAGgANWqwHSevz5JNq6e57uw==;
Date: Sun, 22 Nov 2026 00:26:20 +0000
From: =?ISO-8859-1?Q?V=EDt_Kaz=EDk?= <vitkazik@vitkazik.cz>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
CC: tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, m.felsch@pengutronix.de,
 sshivamurthy@micron.com
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
In-Reply-To: <20261121234125.16093-1-vitkazik@vitkazik.cz>
References: <20261121234125.16093-1-vitkazik@vitkazik.cz>
Message-ID: <DF6A2762-566D-4A13-892A-AA18B9F987F0@vitkazik.cz>
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

Hi,
I found Marco Felsch's earlier submission for this chip (2019/2020)
only after sending this patch, and have read that discussion now=2E My pat=
ch was written independently from the datasheet, and it already uses
4-bit/512-byte ECC as agreed there=2E

One difference is the free OOB area=2E I expose bytes 2-7 of each
section, following Table 11, while Marco's version
exposed bytes 4-7 so that the free area is always ECC-protected=2E I'm
happy to switch to 4-7 if that is preferred=2E

Marco, if you still plan to send an updated version, please say so and I w=
ill happily step aside=2E

Thanks,
V=C3=ADt
