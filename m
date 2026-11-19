Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091835;
	b=oE1Clsmrcx6N9e7MdMATSSNtAj8ouUPSdunj82/X7fndUuWisaMdTSbxZux25aOKmiQo
	 n2BiMT1A0Z60gPsXsiki8QG3ouvCQCMdaywEtyAi06xkPgz/vanUjMOEkCZv9VmeUVyKY
	 cNQK1tHGEpPQWkm//Dj9ir1gb8gcokCqv2EZHYNmrzLmDpMtuRjxezJRTXpVlhg60yaaB
	 o/oITyaUVUHUt8H3MfgtAapz5dV/m3a+6bOWDvOvq5ul/FHTCXGc5szZMzqJ+AJJZBtVF
	 2wd5YNyBOJApbgw/lykcRlpG9vacKHeuTvlAAH3LPD0pPcQLwgzc3YDxhYh1YrJcYJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091835;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=h0MsyfDw3DMzxkx/kpuO4HPbu+iTf60RKyuc5OLnDM0=;
	b=zWnbHDLZ/qizK4u41+DGYBboKlz1HH4RGFB6yatlNH78GSAfNdvGqGQws3325vMIWlhU
	 2cK0P9Bdu+emsL15gX8lTvnthuwKUvKsFCHZVPlOJRpRI3t0rL/aCQcGf4a/cjhKxGwuY
	 8bsKzwMCGDgwyVabUacuy8R1DVsxE8+xxS+vOH/pXnTlK0STgPI8sBAVqF3gQ3tIu3MaP
	 t7uFOY0C/ano4nTU24+M36OnWeh2nkLkVr4M1vtj1M/Ew8vFBwbOYKt4qs4g+86IadSmx
	 wdiLLPyDsZ32fDISfNuuMjaltZOXhqwnGkIqx4J8A7d47JVMZ02RbhN3N+TzwhXpQJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vZDKaLoz;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE114606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE114606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vZDKaLoz
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0660AC4CBEF;
	Thu, 19 Nov 2026 12:37:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E34D60237;
	Thu, 19 Nov 2026 12:37:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF9E111BC0757;
	Thu, 19 Nov 2026 13:37:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091831; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h0MsyfDw3DMzxkx/kpuO4HPbu+iTf60RKyuc5OLnDM0=;
	b=vZDKaLozsIDrOVGeuSFQdOw9BhdWa+6GBYgGhJKlZIP/1+6naqFap2tFR7lpZ6GelhHIIx
	MUEWLPxddXcQTFwxN8NtEiZLGLzuq9FLe+HMaHVxftVl25qz2DSmDKFZku8SpHX+UIjcaW
	BAKqCBmw8azffD20HANmSWITU+kLlRISIzLQDuEZ5CAxtLNuetLSz5gmEmvwXascLrVyYr
	frgdw/EL9ZyrzV6nNqViQmk/+2/jwDe4Z8/0XuTGzqM//11tcDl+ba8WR8kRtgB3+sxqQX
	5Rhdy1bF+GKyzb+yQGAWbYhN4gf8xbGULavSLKyPzFxYiuT9eMl6DBiabiAerg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Huang Shijie <b32955@freescale.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103-submit-rawnand-read-retry-oob-v1-v1-1-2a6a91b39e43@gmail.com>
References: <20261103-submit-rawnand-read-retry-oob-v1-v1-1-2a6a91b39e43@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: copy OOB only after completing read
 retries
Message-Id: <179509182919.2889394.9027822038627951164.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:09 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 03 Nov 2026 23:09:45 -0700, James Hilliard wrote:
> nand_do_read_ops() copies OOB to the caller and advances the output cursor
> before deciding whether an ECC failure requires another read attempt.
> The retry restores ECC statistics but does not restore the OOB cursor or
> remaining length.
> 
> For a combined data/OOB read, a successful retry can therefore leave OOB
> from the failed attempt in the first output slot and put the retried
> page's OOB in the next page's slot. A later transport error also leaves
> oobretlen accounting for attempts rather than completed pages.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: copy OOB only after completing read retries
      commit: b02489cea8ce609ea920246b533df0383aa05092

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

