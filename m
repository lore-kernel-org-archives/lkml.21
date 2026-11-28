Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795840389;
	b=YTGQUJBk5rCzUbdFlodoS0YE35gW9rLXxwgU0+3Ro69fb/KDRMEywbkDNfhXufpiW5O2
	 Gdbk5s5up4KgMSjsG7A7UHyBFhySFNM4FwmdQe8ixUYUBxRao2uDOp4IXA91VBzBxbFwM
	 0Rt8XA4VN+8ulC9mB2/42Pzsspz35UnH7wW/EBAkgZ1/Er0apz3mhYI5XwYNwFGxF6T2Y
	 3+2KZJFYdkWaeq1hXCoMWeKfzCA8suhDdrPTKUUfL9tVXQ7CuePIstd9sg84B0s01IhCc
	 C3fsTXvPUi0kmbMO1vmEqQo047+6qwG22pT1//C/CLVXjUNrQH13YIe01QdpgwGwiUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795840389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
	b=b+ubT8D6kI00jjJrt3K3pq52olwHI4jj1GVH4zPhxo2nt//RI6xHKrht3aYo27eYxWon
	 CHSoXpZEoqqFaYWr/WHIshxJjs4kqAEN1JL5beerZNTrKl2z7B7QvzPzMkS8C+KGDBYU+
	 v+lhSHR8pW4+91tXlFbQSLDyaL3ZIcLiMLux2n+aspKxeBFgGrlRlkNls2AQNge2m/HTk
	 cglLKZrSBq/j7Wmt/ynYFNn8bMj33dbrzTEmgHwMdd9r0I8EY0i7NMGkEs8NiCU+C+Ilj
	 cFevonPoy7L0KB8D0ibrcgSnYEIAJTkxEh6QR2HbCY73iqCp71REvNv9X0zIPpYY+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwhFStPF;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB82606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BB82606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwhFStPF
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b2382bf051so4639523b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795840388; x=1796445188; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
        b=uwhFStPFskqhXnoduK+N2QkfbdQ3l/s0yIwLSiv2B1bbsHnb1SuZ9x/ESxJ6Wyin0A
         U6o2K2RLng7rfq03UE/m0LuQQhtvOb4Z2IvZgicQY+NfwriHtPj9dBT/M4dQzccZClZe
         7LPfQXRKfjmJ2Xw8vijc5Zx6yQZAU9CcTt5m/Jxxk935hlUryaeUxec6KQCF7p5Ppmic
         mCMn3dBYhl/rJDrZN5TbuKnNeA6dc8lBcNOl/Hwu8cQ8YLzgeUmS/qhSHK2GOVmvA2QH
         AkJDK7H9T41lWqh7mt0x9hiJzliCJkpO+JdYxTfxMMjHdSlAswA9MiBc6UyTwsTuVoGX
         jHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795840388; x=1796445188;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
        b=u25tF5dyY0vdmJSs6RA6k+IIyPBswhQ5ANiuiHGXZdEytM8ObwvgO3D1G/Saq/aNrY
         wzLKJWX86T/Jt3gbSEbyCttyPeCRxziP6Sl6TmTvQW9sGK+ANDGqPaNcTvbFhB8imTHx
         2nqKW4Xv7m+8/dXNjs4C9AZpk13AdxKRO4vlGLdRDu2ohvY6J8n2PcgJrg4NY7tw97Vi
         fbFjL5NLe+bfaB6xb9qFG1Ex6eiPb3CPpzEhvtN3pnIas6iRdnybg+deq4a2PBHEszbJ
         Bw6ShcXGzAZZFpFlhJpSYYou+Kgl61KAl1Tv0YjIr2iOiTy2IFEIJ88cOwzvpASRauQ1
         FD6Q==
X-Forwarded-Encrypted: i=1; AL+hErEinZM/vjs9FnhQv+uJOneGF/BSMBR3bfQsrqryB4jVXd81yXRSJfeWuKeGbHny4/RBTHb3IQvreX4S5VU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9biCh2cT+x8NkCv1iJVwpHXleC41ZOm57wvEAgm2DQyxLVAujx
	N40fXxAwikPGZmOKVTCVVZ7LexaJHdd1clI0OabjUcVsu+F460mPiwh7
X-Gm-Gg: AZFdTZcNDoysUw8u1256RyKKbyngAl3vOyOHEMHy6WpV95kmmWukMGypjT8BdJlyo1t
	pNBJjkeTyTAjbAIKQgmvoZSXfMDxO+UMX3gyBMSCpfs/7MZahKhDevNzqjl53xoaPAMKPRJAmBA
	XpT2PwmCXYcTvlPf8DnNTHw/0x4Nkrm8Bqu4XUR7LDl1aj4J4SuGVOVC2oq/iHFypISPJGMpYjX
	8BRh51/M1gR4xo8QaxOaHB9tZBrLueb0OA6hQYqxAzbD7uF8NGv9P8Kbkq3xDAX2Eyrk4S1Zms3
	uRmyQFPxRkGp6VYYBgElnDYUIBT9c8lkRM1LalTCt6E27mghGMUF/5RetybF74bs+rkVXVk7P9h
	bp6lMIhyqWpRtVWInlEIt4xVBCmw1qysUNZj3eKCWcndsK0+EI02cMrl52O3BKgUjUpycNPYY9H
	v9O//eDU5zXm1InfW3ImZ5wwVw0gOuzQsPPrCOaFHVAYQ+o2t1eWIhmOPBWqR4nScBJ4JygFYNg
	qoi3qx8vsuXl/7y0sFciivw+WBXpF2+LRo+A2A41ToOpGhAbvWU9GsU3ojC4YTTO7D+w8IUwt4N
	d5Ox8JfvP4sqypuumrBRrt9B73tctU5idGwitF4i7mXBiaD9Sp3y2M1NOMiqrE1iqGnX35anbfI
	=
X-Received: by 2002:a17:90b:2648:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3b41c952ebdmr24822169a91.39.1795840388460;
        Fri, 27 Nov 2026 20:33:08 -0800 (PST)
Received: from mac.lan (114-45-156-18.dynamic-ip.hinet.net. [114.45.156.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7d36bcsm17993882a91.3.2026.11.27.20.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 20:33:07 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 amergnat@baylibre.com, me@adomerle.pw, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
In-Reply-To: <czEp-CqZIp301roqRSqIALy9ubTnOg7uHv75zRifEAuhIS0f1zSU45eKzIC3fZfiUnaahQK6yVuQvthvHZOt267Mpt13X55ERh2A6HJRTic=@protonmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com>
 <20261127030009.10572-4-iasnezhkov@gmail.com> <czEp-CqZIp301roqRSqIALy9ubTnOg7uHv75zRifEAuhIS0f1zSU45eKzIC3fZfiUnaahQK6yVuQvthvHZOt267Mpt13X55ERh2A6HJRTic=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 12:33:01 +0800
Message-ID: <179584038151.67185.14057994923136112895@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Roman,

On Fri, 27 Nov 2026 18:12:33 +0000, Roman Vivchar wrote:
> I don't see INT_FLG and INT_CLR in the 5.10 kernel [1]. Where did you
> find them?

They come from the MediaTek PMIF bank 3 interrupt register layout that
MT6789 shares with MT6833/MT6853/MT8195:

- In mainline drivers/spmi/spmi-mtk-pmif.c (mt8195_regs[]) and
  drivers/soc/mediatek/mtk-pmic-wrap.c (mt8195_regs[]), every PMIF
  offset matches MT6789 (INIT_DONE=0x0, TIMER_EN=0x3E4,
  WACS2=0x880..0x8A8, bank 3 IRQ enable=0x450), and bank 3's status
  and clear registers sit at +0x8 / +0xC:
    PMIF_IRQ_EVENT_EN_3 / PWRAP_INT1_EN  = 0x450
    PMIF_IRQ_FLAG_3     / PWRAP_INT1_FLG = 0x458
    PMIF_IRQ_CLR_3      / PWRAP_INT1_CLR = 0x45C
- The same 5.10 tree you linked also has this exact layout in
  drivers/spmi/spmi-mtk-pmif-core.c (mt6833_regs[] lines 167-169 and
  mt6xxx_regs[] lines 119-121, where mt6833_regs[] in mtk-pmic-wrap.c
  is identical to mt6789_regs[]).

Omitting PWRAP_INT_FLG and PWRAP_INT_CLR in the 5.10 BSP's mt6789_regs[]
leaves both entries zero-initialized (offset 0x0 = PWRAP_INIT_DONE2), so
if any interrupt enabled by PWRAP_INT_EN (0x450, mask 0x180000) fires,
pwrap_interrupt() reads/writes 0x0 instead of clearing bank 3 and leaves
the level-high IRQ asserted.

> Also, the series doesn't apply on next-20261125. It might be due to
> recent mt6572 changes. Please rebase.

Confirmed: the conflicts are from the mt6572 commits and the
dev_err_probe() conversion in pwrap_probe() on linux-next. I will rebase
the series onto linux-next, carry your Reviewed-by on patch 1/3, and
send v5.

Thanks for reviewing!

Best regards,
Ilia
