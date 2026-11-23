Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444999;
	b=jnNSB/O891lsHqQdT/becKlTM4FpATGk1+X1LIFBuoynkeEdQkDI6gyTRmj5iPySV9c1
	 sLszV1mUlbcCqzfKlizC1upnv9scO0yxdxF9WKYMgLJAuSRlmJmSjOlLSVNUHenrQgfiC
	 QWb1ayOdWW2IcXyymvJTTe4IsYz4YDmKHPXmyE0YQbCikjrNg3fxEM1cHwfqx65pq3/tB
	 JoZauaEB6x4tNrwcwqYhbitvjiuheOKzevGiZ3Jjyn7KHGlFYKbaxOT3fTSOBnkVFM8aC
	 Eaxs9vilqod0avHqeQc0CMSjB3uhHEOgOKmPtH/EYiKoAZ3WKwVMuNplSu00NdxbA2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444999;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=K2ZBTu5FPEAc2aDNIGM3UHtvI9TE4pMe5TUNHjDZbP0=;
	b=OYCX448oraqGekrggkI8h0KH+dxu2Kyx5HPlGbz592Xt1+/Ji+u61mBSbcFK5N+92g79
	 UkrIeShwaO0zdReZzqSd/kTWvVOGl8ZOyzd/+4PeFCqOJmIX9/J6dVPVHLbPCG1OX5cxy
	 XY7FPah5iY76w9kabMNFdYCpp+XlFozBS5hHWUTsHM5NJr2ug4wDbsdFokgw6o0V0QyYi
	 DfR5ztE5BbpraHAKGEHSiUkMca3FBc05IDFlbAI402qiE2pJQETx80oMUMb6Ego2PHWwL
	 amza9tVWRTByy8RpEHcT8G+pBXa1Fva+33Kx71Rr0gfK6cVJlNuKrsDH/1SYxmKs6Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=z9oT49X9;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A99C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A99C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=z9oT49X9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2805B1A1799;
	Mon, 23 Nov 2026 14:43:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF23B601E1;
	Mon, 23 Nov 2026 14:43:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F32911E6A573;
	Mon, 23 Nov 2026 15:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795444992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K2ZBTu5FPEAc2aDNIGM3UHtvI9TE4pMe5TUNHjDZbP0=;
	b=z9oT49X9XmE6aTc9yjc9P+kCRuzonn0YVsqXu9jffgdJa+BOlvuXcFP/F2UwLZ02B1cxip
	y/VQD07mij/5JHEGyuKtrcJvIg73tB4Yi4oOGFQw/RD0SNOSnta5qOslkpU6g/WEWMj3gH
	Hrc8tqmAJt+fteEU6q2HR5l8pxT1NUP+marovUsn73IAJGlsdvGWIsOHYy7VUKekW25TG6
	stjpavVSuAULVJLOpIOGKYnGe/S3WRxZcsasVxhxGk2HhnKz/a2siDbUbIa9lczE0s4atc
	qY/YhG/Ulz8BHAhdojPSJufV5AoxGZRaOhusN4PUnTGYn7zI3p6MKgIQFJWqLA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?B?VsOtdCBLYXrDrWs=?= <vitkazik@vitkazik.cz>
Cc: richard@nod.at,  vigneshr@ti.com,  tudor.ambarus@linaro.org,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  m.felsch@pengutronix.de,  sshivamurthy@micron.com
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
In-Reply-To: <DF6A2762-566D-4A13-892A-AA18B9F987F0@vitkazik.cz>
 (=?utf-8?Q?=22V=C3=ADt_Kaz=C3=ADk=22's?=
	message of "Sun, 22 Nov 2026 00:26:20 +0000")
References: <20261121234125.16093-1-vitkazik@vitkazik.cz>
	<DF6A2762-566D-4A13-892A-AA18B9F987F0@vitkazik.cz>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 23 Nov 2026 15:43:08 +0100
Message-ID: <87mrqztxqb.fsf@bootlin.com>
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

On 22/11/2026 at 00:26:20 GMT, V=C3=ADt Kaz=C3=ADk <vitkazik@vitkazik.cz> w=
rote:

> Hi,
> I found Marco Felsch's earlier submission for this chip (2019/2020)
> only after sending this patch, and have read that discussion now. My patc=
h was written independently from the datasheet, and it already uses
> 4-bit/512-byte ECC as agreed there.
>
> One difference is the free OOB area. I expose bytes 2-7 of each
> section, following Table 11, while Marco's version
> exposed bytes 4-7 so that the free area is always ECC-protected. I'm
> happy to switch to 4-7 if that is preferred.

Yes please.

Thanks,
Miqu=C3=A8l
