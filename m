Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446995;
	b=5oHH4U1YXbeyC7YttTimk8J1FHxYaS4VRwCCacsXoz3qT0DmSGq7tLRXLFfmYwBnFSSG
	 P8iBJp7L43k+zE8Mhv44s4vQwuRpW7feJB2VQNlLof7TT5z/1ZB+ZhbUsHlSGkApqEtXy
	 Fv0S5Strv+xINjbfozVLIZMb7t87eRA5nB0l4NcSBXf9tCClhAQu3aqyhmuUl2liK8dK7
	 Qm9Rrwlt5uH+zUKVGzEh2VkXjm4Hv7Xb6f+vOjl35QvD5+zT6B0p04wTleghFZqLQwvLt
	 APlTmBm4LtP2gV55vtjT5fr9B+xaaU56h/IyvjmmJ/rsS4+CAThquu2w+jlGn2AMGOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=UfQmc2c/VBqjJpzYZJV/mvR5pLjgufyNtaYeJb3a0XA=;
	b=k6qgdfd+f54y2vSXVKYKbFSuV6qZpbOV0ESX1rHumWl3mAM28SYvCYtwmjTRFNKvgpZx
	 uQtxWP5QOY0uc1Qs6QB1yACvQSbmx3Wa64/JbWIsL6uhoHFetJalPWs5Oqfw9jSx7lE9I
	 qwc7yaEWcmHhqjNfISL16WgkhtJc1XXHUliM8OBiA9leMyhOjhQ+5k/j3gP1MHaeqNuPx
	 vG85UeKGL6pr5kf7Oi8KDSakSNzjVPOcGBaqBBHlc4gL47LZvNhqQBMQMEJp0n1Fa+/2T
	 NTSJIrrve+w2LOCbmLXFphKU5H31bXGaHgMddZrA/I9TT1WAd1gt+42+0j0aqIRNu8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mw4m1gfp;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC84606A334
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAC84606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mw4m1gfp
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1773100a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446994; x=1796051794; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UfQmc2c/VBqjJpzYZJV/mvR5pLjgufyNtaYeJb3a0XA=;
        b=mw4m1gfpUrv2FreNB1ZNFYzNad9WSMfE2DUOWTxfu1Js/8bHT/D3Nb3OHw9uGeIhLD
         yW7CNvkhOKWcTfFvvMZts8R2aR6t6AR0cHwm8pZD705K4Tqbf7Xz2x+0BymycsMY4xPV
         tLu7++89hUi8MRiMUa3u+4QcVY4op8HfQtdfE3iX8fg2y/LVLiCIUPe53HdFEIg9H94M
         IBcdG6op9YsSCfqQyKfdzHrxG5N6VP7mGesC4g1GzO7EpdpbcWrdFaUO+8C41JQtVxDI
         p/Y13atkvC1BHSqzbKx+glAXQt9AEf8vgZy1Zx3RmDhis4kCCd8a8c41g8/I2SCq/c+n
         0zTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446994; x=1796051794;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UfQmc2c/VBqjJpzYZJV/mvR5pLjgufyNtaYeJb3a0XA=;
        b=ssSNZ0BRx+6k3+dKgW7zNOaKrviePJ9CzxXiGDSrTDo9HzuWlqvI9+5DGMOL8yqRhu
         ZIpAsw2Z+HuAH6hKLc7CLX8ipfrLxrjNKEc5xIj6p/BllE4KHUc0huMlD3EFBDguyPyU
         Q/5H+iNEMTPiCr2I3gcuU3W+ecTdm9S4mQFTojTg3hfVFpYKIza6EO0/cOeDTJWIPK3C
         8uXdNTpcn2+m2sgskz955LjGpVMCeKWeDwXNhgL22VLnJJHniRHem9HyHk1tiP8HaMWV
         AFVQd8EiAL1VAH7sNmvk3yLsaVDLjZuGcpzbPvaPeG6y5nPmo0NUZwLrfH+fD1cqwGX5
         lSYQ==
X-Forwarded-Encrypted: i=1; AL+hErFjbuZGHb5naUYP5fx9+i4B4iPIc3HPOQYnZi7RZMP+w0wq8TvIRDnZ6mCmSeE7SiqhuTWIuII/kOxAz10=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vBA6lNGEUldFcoVbbOXTr9GWp2poN2/g56+11FP1scB2KJ3AK
	n2Bw8Many/YAhsFf9nyt0EcxezM4YdGKaKX8V/Z8kPEsynF1kwmgJKEy
X-Gm-Gg: AZFdTZejQ5gkkO+6mnLV8t/xmcLhqjpE7Mp6pBvwPcK/MnxSAvXhKxOlAb49QGHcRBS
	8wHCCHn1qG9OQrELjISKY+jFa41Iih1Src7z0Fw5AEK1sbJU/etrmoqELZiXeNhHdsGqcHsOD3E
	vU5BRqk1Jl/EPpkUb+TfLPsVAknKUU5fcmtNwLwR216nqIAE4CHGiiro+ntpOdyn89Zb89K2VB4
	/Fh5PnTYaizPnipuIqYQjlkEFP4Q0UHITxuP8Tf5bUSot5irGxR5NJLchD5QeCfc1Y3SiYaRqHj
	pvq3fQaW+p5377sLxpFctOEmE0wwi3eFLsTWZhyXVEsT8Y97kh3VLrFKTvX+IE2JJA0I78j1aV7
	ExqsCy1KB2D7Qh8rbvzlylxGtMtLyKr7/E+HtwNvximynJlsX87FiGAsa2W+3xOO/vufUQ6ugEV
	0qDV2Gknmmsb9LcifW4n7PwbBJc+MV1mXqtITmvQTIv6o/KFzn6eIUN2BhrvaIpU07gPYjCMMzI
	G4kjdpMEDAGuxuMbIcNtV+KDg//x6P/yk7+EFZbsc+mkhuODaOxznJGwct9lP0KAsEl8rZenabu
	1GM4f1xjtrZv6CYBYZ2XHhOZ3iHAuQ==
X-Received: by 2002:a17:90b:3d8d:b0:3b3:b750:d2ed with SMTP id 98e67ed59e1d1-3b41c7b56c9mr10763673a91.8.1795446994016;
        Mon, 23 Nov 2026 07:16:34 -0800 (PST)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm20067482a91.5.2026.11.23.07.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:16:33 -0800 (PST)
From: Gary Wang <is0124@gmail.com>
Subject: [PATCH 0/5] upboard pinctrl support for device id INTC1055 &
 INTC1057 & INTC105E
Date: Mon, 23 Nov 2026 23:16:13 +0800
Message-Id: <20261123-upboard-pinctrl-add-intc1057-intc105e-support-v1-0-f2322a91686d@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1YBGsC/zWNQQrCMBAAv1L27EK20lT8inhIN1tdkCRsUhFK/
 24QvM1cZnaoYioVrsMOJm+tmlMXOg3Az5Aeghq7w+hGT0Qet7LkYBGLJm72whAjampMbpr/IFi
 3UrI1dMTnmdfgL9MCvVlMVv38frf7cXwBCl4bkX8AAAA=
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 BillyChou <BillyChou@aaeon.com.tw>, Gary Wang <is0124@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

Add missing groups and functions in Tigerlake & Alderlake & Meteorlake
for INTC1055 & INTC1057 & INTC105E.
Add support "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
"UP Squared i12","UP 7000".
Fix pinmux-select set CPLD GPIO OUT not function mode for I2C pins
on the AANT0F04.

The pinctrl-upboard is provide additional driving power & pin mux function
through native SOC pins->FPGA/CPLD->hat pins for flexable board level
applications. it's probe from ACPI device id AANT0F01 & AANT0F04.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
Gary Wang (5):
      pinctrl: tigerlake: add ish_uart groups and functions for INTC1055
      pinctrl: alderlake: add some groups and functions for INTC1057
      pinctrl: meteorlake: add some groups and functions for INTC105E
      pinctrl: upboard: fix I2C pinmux-select set CPLD GPIO OUT not function mode
      pinctrl: upboard: add device id INTC1055 & INTC1057 & INTC105E based UP boards support

 drivers/pinctrl/intel/pinctrl-alderlake.c  |  40 ++++++++++
 drivers/pinctrl/intel/pinctrl-meteorlake.c |  32 ++++++++
 drivers/pinctrl/intel/pinctrl-tigerlake.c  |   4 +
 drivers/pinctrl/pinctrl-upboard.c          | 116 +++++++++++++++++++++++++++--
 4 files changed, 185 insertions(+), 7 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261116-upboard-pinctrl-add-intc1057-intc105e-support-01c37cfa685b

Best regards,
-- 
Gary Wang <is0124@gmail.com>

