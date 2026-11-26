Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706889;
	b=UOS/IMELKhuydg6GFuObun6xIPWJq7D6kolfOr7Zfc1dUqjqWZsRDzEBHHNbmS/4SBEL
	 0NXjLJdBk6FSHQjSa01qsC/19ofFHKGl3f2TP451L9IG8bosxYrzpHTrVzepno2WDAvxW
	 JYkcx5sK94S+FlUSpMhk8e8yQriOfmZy7ON/Z7Z8Y2aZNLd+NLNYxpOVjevRTBmox3cw5
	 rRyZ9qzeUN+5NfvYQIsW+mmrWg3Gq6qY6eLKRdrhk0a5eIb8ToB4Z0uEXxguktTf+NzdJ
	 n1BTalgCe+Z5oHypkQOKxMWSxkDbltgweSw+dirrU1YTJEW7PuBfH3LE8z5XfogYFjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706889;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=dQ2pLlHkipA5j/g4e46Tzr27HhC2bIUcguIGENtKDSY=;
	b=jmcSrAlAx6VD1BwwyvGl//Av6kiJfMf0GNLaXBQlgxDt52KtytEo4VUaCS23qAWNPgRL
	 SYWRQX0k4Sh7dpXvU2/tjBvAY4u0KyRrqFbc/li9Nm0CIenITeRwFl0vpmKb8wz6g6Ha2
	 8LbQjQg4tLUEb4nWt1ZNOFfU2BvBKDYZmRImhTq4LTY0LNFdzbZYV1XfPvsd6jW+7zcJ+
	 Wf0cC2e2D1grompaBIICIedXW3Ic7UxDPVvNw8XRSbKOX/G2ESH89Fj5+3WdkVeZBls2K
	 Uac7YDARb6AEhxIPhdH9d3XlCi0YfOLtatxPNLOVtMINRYbPCi4v7NO+3+QMgUOLgkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=lQ7Jk51k;
	arc=none smtp.remote-ip=79.135.106.121
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3767606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3767606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=lQ7Jk51k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795706880; x=1795966080;
	bh=dQ2pLlHkipA5j/g4e46Tzr27HhC2bIUcguIGENtKDSY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lQ7Jk51k51sJryrt6f93LDAfwohteLVmYmEZRVZHELMQtenvQeZLxHybpXp9ZkOIx
	 yC8pjLT9PcPtRaif0E/ThjDwai8qK6mfBvmUyqeFR1iZVFqJ3fLpV54KPIlHBpN7RX
	 OdA0wgTvwK219/BumT4wVASQAJd80Qpp0gbv8/pxAEJ4UgE/T472Ywa3UyUqvjBryx
	 DeEQ5UPVbC5uv3U6hUZFK2Z+XnHp7+SfVPxlpR1tXLE4sv+hOGPx4/IRimi5/puBz6
	 FCcGiV7qrBwC3el+604HBQIpnVhhPa4SlOUO8+6jzInkqi1vtQXUPlDNmHLQiiEN89
	 RLHREO3kZTlAA==
Date: Thu, 26 Nov 2026 15:27:56 +0000
To: Pablo Mazzini <pmazzini@gmail.com>
From: Norman Herms <dockseed@proton.me>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH RESEND v3 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Message-ID: <Rr1r6gV_K1pXOchQNOVGHqSsBhPKVvUm6B0ze5_HRKLV9DsfwfdiGcZAC3zB0Eabk2BwSmD9-u8KC_LZQ6U-HG7YrIKcFQ92B-7rZrQXwdQ=@proton.me>
In-Reply-To: <20261124215048.42074-2-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com> <20261124215048.42074-2-pmazzini@gmail.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 6939877897ff4f8c7a0c2e7b39d0cf71bfe5a30c
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

Hi Pablo,

Tested on a Radxa Cubie A7S with v7.3.6 plus our A733 patches, with
this series backported, our own IRQ-bank workaround removed, and the
PA interrupt dropped from our A733 DT (as 3/3 does for the A523).

With the series, GPIO interrupts on PB0, PJ24 and PK0 are delivered
(GIC INTIDs 101, 117, 119). Without it the parents are INTIDs 99-117
and requesting the PK0 interrupt fails.

Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)

Not tested on an A523. Built and measured by AI agents (Claude) on my
board.

Thanks,
Norman
