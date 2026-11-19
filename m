Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059639;
	b=U9xueAPaiYFtditH+PogCvHutsCQM3c8UKk+QzQS5d0bkbmPI2zv2JIxxtZYQCNWXUmW
	 LlgPBPedzQH/ZVraqK1ReB7bnqo2WQs+/oi+UC68thKUGhXOIJLVJWSNVmgy5JGc+VGEm
	 f5Yfrq4j+XbN37JKKJus+kfVqv8wpgLQeZ39qlcST43dDv33utOQnQLV+CHPM9HO3MGgO
	 M4F4wrdnNkXjEXqeB61AoL0AuGy1xI9rxarwzzUP0j6e6oJwX+vrO1EEqmtvI76B0t8if
	 f5mbA0m356GLbWSaNgo8iXUnKleGP+WNcP/77nvHUmb8fv8vLRlY6+fdBGnugY4XigA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c+7vBVE35eU7OvcQRlXaK7erubNGtvgQAaBs8IXCypg=;
	b=23n6qrpTvqyrdXOEIfMkFHBq527t72+QxkJpEqqj4D8LS3yU8NKTqjn861H/Jg2mtqhz
	 aj2LS3IgMHBhSAIsoNizRsdKb2fCwsDkqr6zPl+OAiWQ2BqJegBxz68nK+BO7hl4BuKmi
	 cTnB8WlfNeYbfvsamAmBRPhy90dNAa18GsRJlOEChnHuqybQHG6F6IInhx1m9V55ZWuKy
	 +iYDxYRdTpOTgjHzZ4Z425McyKZ2kG99CtwTifsL5Ifo4J+CzTT7eOBiYHUEeOVaarLdu
	 Ei7jmJWNUzLeXGPtxbOFTp6aL5Sapua51Jg4uarfHtIbZPkDrCx3+LCgYsCuViHURQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P9nAT9wR;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A04C60A5BE2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A04C60A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P9nAT9wR
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2efef1516b5so9914585ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059638; x=1795664438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+7vBVE35eU7OvcQRlXaK7erubNGtvgQAaBs8IXCypg=;
        b=P9nAT9wR/BxrSHFD0rc86O6tPp9oJPwSNHtCDIP49VsyeibeusvaAfn48WqF/RglWj
         H3JMuEh0bFpaHNQAml1uewIK/XABMlPBWHyxyXg9wgEzu/ASbM7aG7mA6hlR4RIMYA63
         x68LfDa1iXT/0CFIP7V6TsEz6Cg6ahqT5XXBrjPNwrEC8XyY3+DfmxpxU29GgAyt3uhI
         iYqMUEutqpOeXhPsGce0xTkE/CS/SPk8rHPfrJ6V84plqOIiHqfYNyG3nvfZM0YMQise
         Xzo7GobJsXAtaHNTQmnGz7R6L6G/avbpQTKAJ5YM1Ix/X4aL0G47Bl622024nWwBZFrx
         qZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059638; x=1795664438;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+7vBVE35eU7OvcQRlXaK7erubNGtvgQAaBs8IXCypg=;
        b=mdm/lDonXXacZzezLKeUiZQAG5vZmfYuugf330ynMwfGJkPLuWFKgbYGqoEjMQo5Ix
         6zGWDLnV7DoqfNNV2nNutJUmbS224HoCjKsiAqbSWkYWEFLBNADKtImH4CobCPsZgnuY
         I6k/Fhw68Guev2MCS/eHpI0KZOBqMgfHVt6FtZaH/5viUKU70mevLGGRAo42ocErhTdz
         II0Ha9C3+6IRq4Ej1KHdIRTzHBsOMxc95ZB9MKJCn+Am1aG6xcJt4vv4Bc46j3PkYvNG
         O4xo6y8ubBm95PuWUV3wL2/Ds1SAR9WWz+3qZGtsaoKhUDhLR6vkXTl42/syoCLcaGdr
         XgEg==
X-Forwarded-Encrypted: i=1; AL+hErFyNHwo1COqo/bf4HUhIZruMI2eV1HX3LlCTjIOvA2YZwlgvhWQqoZoFi67pMWwl71q8gxYcmHZBgwYt3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sQQrnsYkew9qT9HVKCGAZR+ZoLNhyUFwAlitGrrQ/dCQMWb+v
	fABF3+QU6nCsjJETQV/ZLqmqfUOrt1BkoH6LBSqnh9m0pzT96Cicf1aV
X-Gm-Gg: AZFdTZdmmh7ZFWf5mYfQFJ/XtuWtZddi7cx3iYUKS+vwy7ilqnz27zD6BnUDwXeT/NG
	81hppigIM2u9Ow0sSxD/g2D0sab9mybPGU7X9oZ51NPN/gxXpA/z3ntpTmZx0JGR9S7ElCUZ7IG
	YIepgfvbxdRnhmvgS1Egn2/4AvoE7iOnvSjLSxmRwmDYr9y4z/GYXVnwhhOS8QZ/e1brPgNbYee
	nPK3RHKwE3ofFRBgwxaaFMASD8xi4RSZ+jqIJVXm01x4xTLf/KNtNZ7CJs8gkdO726s2QhydVvN
	ZovXpQa+iLJksM4mPcQdtlWvXTohIent5zB8ddaDgSKw+gsJNdto/RCF7SVP/ocvdD8mOucjxK/
	BL+tATS8AiSB1uBr5O303FFk+yDXmzXzxKdzKz/KVgC89pyH3VpPM57H5MkMbtwHDmoKUJxFD18
	mXLbdiDUTlbC9gqUr6TZWOjite8R4vTmmdhf9oCPrRUQ5DtWDfr00VoyjQj/rNB3w0p2u9xKvDF
	un33XTK5KZMVJ9j9IZywiWr9B+MSmwWp/zQwMQVfmQc7AXlPIEGsYlF209GDtyCuoQNiZYEbQRx
	lSsDyvFZKuWobvoE
X-Received: by 2002:a17:903:18b:b0:2ed:130f:869d with SMTP id d9443c01a7336-2eff753bb92mr47715105ad.43.1795059637889;
        Wed, 18 Nov 2026 19:40:37 -0800 (PST)
Received: from x1.hs.local ([2601:600:a482:7d70::5e59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62897d0sm22109355ad.64.2026.11.18.19.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:40:37 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	m.chetan.kumar@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mail@maciej.szmigiero.name,
	stable@vger.kernel.org
Subject: Re: [PATCH net] net: wwan: iosm: fix S3 resume by re-binding the driver around it
Date: Wed, 18 Nov 2026 19:40:23 -0800
Message-ID: <20261119034025.480656-1-davidlwesten@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179501477167.3136.5713040375169842773@kernel.org>
References: <179501477167.3136.5713040375169842773@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> - [Medium] pm_notify() in drivers/net/wwan/iosm/iosm_ipc_pcie.c decides
>   whether to unbind the driver on PM_SUSPEND_PREPARE by checking…
> - [Medium] The changelog limits the problem to "platforms where S3 cuts
>   power to the WWAN card".
>
> Pre-existing issues:
> - [High] ipc_imem_cleanup()
>   (drivers/net/wwan/iosm/iosm_ipc_imem.c:1231-1266) cancels…

Thanks for the review, these were good points. I tried the suggestions
and will send a v2; details below.

> Could this be gated on ipc_pcie->d3l2_support or a platform check? And
> since the patch is tagged Cc: stable, could the changelog mention this
> change in behaviour?

I looked at gating on d3l2_support first, but it doesn't match the
power behavior here: the X1 Carbon 6th gen reports D0L12 and the modem
still loses power in S3.

So I tried checking the hardware instead: on resume, read the exec
stage before touching the modem, and only re-bind the driver from
PM_POST_SUSPEND if it no longer reads RUN. That covered every sleep
state and left platforms that keep the modem powered alone, and it
worked in most runs. The catch is that the re-bind then tears down a
modem that has already booted again. When a port was still open at
that point, port close sent PIPE_CLOSE messages to the new firmware,
they timed out, and the modem crashed:

  iosm 0000:03:00.0: modem lost power while suspended (stage 0xfeedb007), probing it again
  iosm 0000:03:00.0: msg timeout
  iosm 0000:03:00.0: msg timeout
  (exec stage now 0xbadc0ded, the probe then fails)

Making the teardown safe against that would mean changing every path
that talks to the modem during removal, which seemed like a lot of
change for a stable fix. Unbinding before S3 tears the driver down
while the modem still answers and has worked reliably, so v2 keeps it.
The trade-off is that on platforms that keep the slot powered in S3,
the modem is probed again on resume, which drops data sessions and
recreates the ports. As you suggested, the changelog will spell that
out.

If you'd rather see the resume-time check, I'm happy to work on that
instead.

> Can pm_suspend_default_s2idle() tell S3 apart from s2idle here? It only
> reports which state the "mem" label maps to:

Good catch, it's the default mode, not the target state. The target
isn't known yet when PM_SUSPEND_PREPARE is sent, and
pm_suspend_via_firmware() is only set later, in platform_suspend_begin(),
so I didn't find a better signal for the notifier. In the cases you
list the patch either probes the modem again when it didn't need to, or
behaves as before. I'll describe those limits in the changelog and
correct the suspend-to-idle sentence.

> Should ipc_imem_cleanup() call hrtimer_cancel(&ipc_imem->adb_timer) along
> with the other timers before this path runs on every S3?

Yes, thanks for spotting it. v2 adds a patch for that ahead of this
one. I could only build-test it, since the XMM7360 doesn't use UL
aggregation.

pw-bot: cr
