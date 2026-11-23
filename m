Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795408693;
	b=Wn3ZIL7UE21pi6dnobqSIO9IjkCFpY1efwN/JHXS+eGYU/X38F4mhrefNVXbO2UMdO4T
	 x1osGftSCs8OTSXZIPoJ2nFbV2i9BRRdmUWtPpG/aE/iJ0jOrd96/NtB/+6gFNN5LukM4
	 Lc0UHXxYbDdRp3f5eRr5HyWC7M83i04wQX4+bR9CPtaFDAhyDY9h2++rYmdSjgoUsbuDL
	 gnloCpu1YqnlmPm7Z6HdZ3ChT7LCk75G10d49i15Op19qqpeG9EhWcNnAucg+laR85I6w
	 fpqVZgjNS4AIml46xfUGOWnXVtzqxt6TQHxCHquSxnJKyhByW01fusLPFdvR7wEZ5IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=01DOf2iRHDHQOjpqPMN2Rm96jVRX0YsMS0cwL0w5nL0=;
	b=Egti2nfyIQrqa1g95ub/Ny9p/KRITLbuxObBTA0Mst/yi19L++8lqtQWd9S2bJF0JXi5
	 KPRuQI0aX4T7TbtpnEVG4lzahvLOx4aqjWdd5aaw4dOlXhKFILBOaRvDUXZHEHi3OPLQO
	 bNyYuEC4XJzvb4tBQRc9XTO5fioMS5UK4o9UAHwOdr1RtaZzIsq1dv53/F5P6aKuNXOej
	 1Ph7xc9/xDv3dL9hLIAY8ieA4y1b3cn25mQDfPWNwJMSJJ+gWQMilkcM+FYcd3bN0BAH3
	 cZKhg2IyniRfi+xV7/6U+0rcH02NPMh/7ZU4acwdvqNidgHuynctTezKMG8X9seOCEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sl6aBOjm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8956B606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8956B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sl6aBOjm
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-833e671ee9fso2785113a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:38:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795408692; cv=none;
        d=google.com; s=arc-20260327;
        b=YzpFQA7q7vFgIphP2j1NGVgjE9wUjYt+6mhZWKedrcDJlkK/fLzhA+tuJyA0aESIBC
         Y340Ejx1uoIpb74mSCnCuPa0RppbYx5qBApJgnXOsFxt4CUPzeBQgTbADMINZSB1BVuO
         PLtffVbF4St9mF11nIzI0qoLv7IDVoZsV6Cd4Q0u7PweFLm5DU/rwivuIexK1ryxgM8+
         C3BplIz6XOTsl0o0uiLY7WTqtBnotFsU3LycqBmcB8VGqNTDzG4ZqxN4SKZJCOM2zF4r
         y+mk2mVl5avJ3wvvvCaG81kStER708RFBsP4gNUVrxmSJkfbySp+lhVMFbkuKWNs81IC
         u/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=01DOf2iRHDHQOjpqPMN2Rm96jVRX0YsMS0cwL0w5nL0=;
        fh=vwgLx45e3L4nhY394KLqX7/YbxGkBAgkVUyu3sP8FIo=;
        b=TSjW/KNTshvRm+vUd9nw761e67sNKLuw1hfUmpRypw7IRuWDdhhDRstIodxzqK4YPU
         SFYQ3BIhkkUAKJ2zQuGiqhwky64TRhwXP0GKS24nh21D+7PZcuUn3lUwOqKAd0btAQSP
         WUbxEwCaOqX3gRd0Zu9BQdqc/0l64Q1EVp6OetNbyuIUmDj88EO2KdcoBUWcjYIjw7Z5
         7YifMF/A/640H0Yl4bjIki/O+uSNdYyAtKy35+n9NVOrLS0vmN1GLAWm1LlnNGqiF5F9
         pSGlMz0IYu5SOyIOQaK3yzo2DdA20n74Qi2oafiIZJIKOl30gdOzJaXa4ei6RIkrM3Cm
         +x1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408692; x=1796013492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01DOf2iRHDHQOjpqPMN2Rm96jVRX0YsMS0cwL0w5nL0=;
        b=Sl6aBOjmfdJYiC93IpBafu/98klT+7Vvi64r9/V7BBFpVK/IjO7f8734XlL1eP+SUU
         bLHnJXBSFfM0DXJrPgkv/1DP9eEuwBcawVJtMDpAHU/ZCsDXb8VkGW7Z2MZ2rdEZrxPq
         HoVaMj/jC6a3Jw5YMa9yhhewScQ2lg3ph0DsEp9o+D/jpnDeyQL0iDE978QUjoZFrdsv
         5MN339ODhzmGp4O1ifePS4BAlC8X5DXf34SBGmOhs6Kfx0DC3DE69VbjjczSsQAlqcj7
         dkxpGkQ/ex2QlXgm7jLuEECBc9IxXp1Nc3swTunZkaDJlTVKgGDiTvCLTe+JNiNZ/cX9
         1XKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408692; x=1796013492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=01DOf2iRHDHQOjpqPMN2Rm96jVRX0YsMS0cwL0w5nL0=;
        b=CsVL7VdCWhIinKeyLqDfswoQhfWLoUGCJ5zWzg1Ew9rwiA/TYRmDsTrd+bu5zRQBOo
         DhWF7tDu/hRto8Qlqw2UL7lj2hFCXh65ylry4CgI5lddkWd1F00H5zExNDjTkjQnXNUY
         ue0tblE+BMpKHq2zuJ97ZCpyu3mAERWgdAqL64CnO7OUR5iLG4E/2iCE22Z00F2FOHL6
         mGOyx6jJevmVtpZLB6OaVpMNEJUS5rFebgsCqRhJKyjIEai1anJNVBGsc3+Se7eYWoLY
         Iyk4lGWoaBKIK2MPD2jBtAj6RZiE0SvEu60xw1NaCI/Th1tFohY0U5Z1fi0b4vgFt2mr
         xOqw==
X-Forwarded-Encrypted: i=1; AL+hErFOpYCQLsAIPMy0Cny1eElCjktPUmwmtFaTxGXZkpDFcMU4VS8BxZoLdmfKGp8bdsJENvNvO9yftLCVoMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6TnagaiYvUFXVkPYKv0/1TsFc/ftFNC2Z2YbU3BLFiIdzb1t9
	wCgayVugYk59OR32QJCG9FPojx5a1B5LUgrCNvaLkKYlRgQesIbWJmeHNFkcd+4aE04xE6Krrdv
	o1pTeBov+R4gNef71g6tT8TC/dlZCXm4oNrZBuZY=
X-Gm-Gg: AZFdTZexr/KGDIM9lC1PmP0EREVAmWkURnESr5kbKAad4Ein03f21do6LdYL7SHb1W7
	6/cnbY9da4Lb5tkefUZpsaQJA7yl10K9H9yxxecNnFvN+7aAyaaZnDITTbB92j9kK+mnLcqtdY9
	Jz1ymsD7wL7xorHVCtSnxn+R3hzNKAt+amEPZMk2fPP19xouG9quLDPWbXDJC464NJvDkL0GGKD
	OdyFM4ysOeH7L/7VpPrDAO/WmvtRDba0EUB5UVYCBv892xcE0R4j3S/DwUq2iWOLlA9/j9S24To
	40uazKg6LRRIAfeZR5w9haTgCmWfy2lW2FR+ToiqbTgxj1yy2vLRvyhxItRRP4F6RY0u2u8mzFi
	zM/ANvudG/XtwUpethoDbx31XqyFrPNJwiluBCEe+POD1ckSiEwxAM3aXi4Yt7OhgmrxD2lk=
X-Received: by 2002:a05:6808:4fe1:b0:4fb:bfc2:1a64 with SMTP id
 5614622812f47-57a0b44cd17mr11494284b6e.31.1795408692409; Sun, 22 Nov 2026
 20:38:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-kdoc-dup-warnings-v1-0-265f89bc3f9c@gmail.com>
In-Reply-To: <20261114-kdoc-dup-warnings-v1-0-265f89bc3f9c@gmail.com>
From: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
Date: Mon, 23 Nov 2026 10:08:01 +0530
X-Gm-Features: Aa3M54r_6zFrjE47vx1VIyjklPLWdMiuvshDWQnxuz_-5roWSbw3R6AYghZ4C6k
Message-ID: <CANYW1HwYge3KexMovtx8UiU_RBqv9VDqO==TLVLD5zD9i57Ypw@mail.gmail.com>
Subject: Re: [PATCH 0/2] docs: kdoc: print each warning once, and only for
 selected symbols
To: "corbet@lwn.net" <corbet@lwn.net>, mchehab@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jon, Mauro,

Gentle ping on this series. Randy has tested it and gave a Tested-by
on patch 2/2. Please let me know if you would like any changes.

Thanks,
Prateekshit
