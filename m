Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146717;
	b=XjuzghIyeMz9tcIRkQfWZApwjjv783/VQtQD9d2WeYyAgCVIPbs3yevAuASLOLZ3ejEC
	 n1htuUrdSSwN5PxMVwvxh8s/7apQiSquwG8Erik333IeLMmpMlgbwN7jDUu3kYf+h3smy
	 tay9nt7K3Fh/v3K7YKV0w7gRiy/3DyWK08MFUxIYv8pdxpibUe26JF2FVj6zz0S5SF4YC
	 qcLVSyx+srHN2qJcVkPGVIE7GQ4TaVDWmulxxuqVvyHMuJWEa87rXX+rjXzQ4eTeck6sP
	 KWBc5l4884fQedgrZSZeQH5EQKRta8xV9mjWjyO2sEi3YOWEtNZbSXxPGK1ulDETmJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0ijvBy4ouVUsUQ5IZ7FDovA+rd5a1vR7YYBZwOw//FY=;
	b=f2FMvBtLVcPs2dxu1bVYDxLFPXBDM2NbrrPOkaxIcWxRBmZio3on5V4dgwEAgv/RTmu+
	 a0Nzu4VvOIa+xX33kfPuUMcfGm11xSH1w+A2foI2R74e0lRWXkDE9U1brh1U8H3938ZCo
	 Y5VcMStyR0mtd/iGDIky/VF3sKuK6eAv7eiyTjecCaSeHr+fLexfNvIfN/WSvJuXm4wiz
	 CjcNw6RpKF1qB/XPC5L5tBl64a9m5R8sHa/Y8jd8OAeCEJgYIa9vZsCVoKfndUCcEkgiU
	 Iqwgz3+Cazy/9e9PqnoUTw7gBTICwR5U298Wds0lQP0FSjji3EFcMWZR2LBEJOANxLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oqwhbhLr;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48E9606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C48E9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oqwhbhLr
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so318576a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795146716; x=1795751516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ijvBy4ouVUsUQ5IZ7FDovA+rd5a1vR7YYBZwOw//FY=;
        b=oqwhbhLrke7wU3DhtxDtOl/nykjJS3bA4ZIbNYIXKgTaOVaisx7KuhslYsv2tWIOJZ
         AciepnPCV8zIU/GjpOY+AtgDTsqgocWlalI57xhxY9Jbx82VkrSEZO1csuxDdRiMv50i
         IPwCKdRELs54af3bTeIXADnubtxSBYqPKeFVLAj7KYhg0Zip9AtXkFuPSMq0HUtQ2Oud
         fn7x2U8ri37dOQNZU9CttSiuyeJfv2dGSMjoltWMhBdSWiIx5yUXkyJ7aOcykiW8OPoc
         d+sABrGXOa0K3Rg6H6ddzKZSbPKQDBEfoJBjFF77Tvq1SMTrdNEn+JpgKGcUE/+YlidV
         eH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146716; x=1795751516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ijvBy4ouVUsUQ5IZ7FDovA+rd5a1vR7YYBZwOw//FY=;
        b=gDpC9+dk4z10tUJhejkzXoz5ud9QgwO9mbcggxqEfzNy/DVNtnpulylQFd19dIczCQ
         q3Qd/noAn4tcKE/ckJiM2ER+mu9OBsto82CbhlYII+CCLtxuf4ucfoM4E2aTl0GnDN6P
         bBQM9/5IgTSVBO3VE8mA5CLuuH+HWhtBHOciPoCTvzNEVeglwGlRz0GpnlITwiMUMKy2
         Qv9hJf0IaBZl4qDI6pvaPwAf0dUiY7Ol43lhAh0oCEF/QT48QI2x4OISFyGLnOMiwRdV
         lKd3xlImntiCYa4HQRQ4hA0e1soAZ9kggfXoaTyNsBPPTco7sHkD9S5/LmRKx1ZkJLu4
         fogQ==
X-Forwarded-Encrypted: i=1; AL+hErFYJdd9P9qzmP0QoSVJGBIt0cps/ZCF0Mn2od+kEmPJp8PczPBXz1h/jDuaOYA7u6MBtJ6hIbOJy3hlRnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3wt3N8G8MmtQdYibIcR59w+ECktn1a1XjYTMHFwFX50SVq5NQ
	p7T6HBvIjfTN96KZZZAw6hAKxkmEkMb+2+6SfRf0pgLzZ17MCwwFQaewwHlWVSPC
X-Gm-Gg: AZFdTZfTtXQUuDwofbFS+up6RPqRix3aE4spunkq548u+hlGsfAAxiowfISS8bpwzav
	MQubhM8UHV3FVOozJcUAcLQc2rYsEMbY+ThZX/EKefZ1rpQ/hNGxF2zBHzIkhK4Sr0GiFjvvETP
	gp0p17BWJFpoW8ncwIRvGxj2IQkBGCPyFyBB3uQNfrJlQTCLlRdr1nZy0XECax6RUig4gErGh7H
	RIPQwEV7h0S4CarHpabc3gIijiGrNjLiqcBSwRdfduW7QHKV3b1cmYrHpI/fsJTSttlPp2UqYrJ
	gYvbtHpJHNiIlQF7AVpEqtcgJYQ5130zugQ6HTIuq0C8H1YHVCJMW/+s5gVAmIuC762LMK/pm0a
	rGh9WfU6jMR2T5uUCcMKmHfSQ29lGaH+tiAU4C4bOP7dIakJG3zD3jJxaehJ8Wk+8TFI/3QZTDv
	ME45ssqahN0PJndbx2ATkirbJ0SX4A8GhhWs6vle8u8It4dLHsvMwFZB8IUSWGaUEx7ThKUt5kG
	IbuV6yOjqPFTlNX47zJ7ZK2u1BoaRSXPjOkBQls2ZUvMTlOStkr2BfuBIZ76vRWIS8ZEr98NlVA
	D3XNQ9Fsx4BNdn9jBqnFby/iQi0//C0MIhUGABNIUUq/S1g0w/kI
X-Received: by 2002:a17:90b:3c11:b0:3b4:1336:4f6b with SMTP id 98e67ed59e1d1-3b41c905a49mr1415853a91.33.1795146716074;
        Thu, 19 Nov 2026 19:51:56 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm4638218a91.11.2026.11.19.19.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:51:55 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: robh@kernel.org,
	kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@kernel.org,
	hkallweit1@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	shaojijie@huawei.com,
	shenjian15@huawei.com,
	David Yang <mmyangfl@gmail.com>
Subject: Re: [PATCH] net: hisilicon: Remove orphan femac driver
Date: Fri, 20 Nov 2026 11:51:27 +0800
Message-ID: <20261120035127.1383109-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104145038.946918-1-robh@kernel.org>
References: <20261104145038.946918-1-robh@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Sorry to see this, but please reconsider removing this driver. It is in
active use here and is about to get its first upstream SoC users.

Two HiSTB SoC families that we are bringing up on mainline use this
MAC as their Ethernet interface: Hi3798MV100 and Hi3798MV200H. Two fixes
from us, both found and verified on this hardware, were merged into the
net tree in the weeks just before this removal, so this is not dead code
on our side:

  444889dfa27b net: hisilicon: hisi_femac: Move setting of netops to
               fix crash
  d54b21d82430 net: hisilicon: hisi_femac: Stop the receiver before
               releasing the RX ring

Beyond femac, the HiSTB platform push is active on our side: a dmaengine
series for the Hi3798MV100 PL080 variant is under review (v2 [1]), and
more HiSTB platform work is in the pipeline.

We are also willing to maintain this driver going forward. If you would
rather not undo the removal, tell us the shape you prefer and we will do
that instead.

Thanks

[1] https://lore.kernel.org/r/20261106072602.77560-1-mmyangfl@gmail.com/
