Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692823;
	b=5pGolP+NVAa5wUFqV133SYY4QL7jTf019eOw5xd+AgrNtudNfoui+dUtHxQjzLdovBbL
	 E6/t7fxiBw3hWEgIhjPRHtYSkAUTd6wlaDvVjVngezU98p4dsgwy/gSeOJKnxZaRdB0/6
	 XX98/297vJosK29VFASMoQJr2Cj3gbJ0ndHc7Cdgf/m8nMSzu6pZPWJ/hMR5oCwmqeQl0
	 k7gPAPg4squ06FrTfICZppwHfPD4zcCJBndQBcnH8oksfCLTaN73Kr2h0Uq58CPLp01Df
	 qBBa6JnOYXaUhrXVUfbQbEkJYEGlNTjdZwsoH50K+7NJq8Vrd+sGF0JqYHhZrCQ92Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z6b8XUkAe29Qbtx4GPrsYDuZ84bX6oCBHUSF9JuGiVE=;
	b=gMpkhwD0FA73gogXudMl6sZfz2bgRrPNM05Jet9dxECL793aUUpzL9vcEq/MJ5NRe4vS
	 AIB8AXB32chLPOSx/F4K22r+uzdr9KoT42DTm0aSM5qZgYVvslcGzbicImb60Qr/lOrx/
	 UZEFYUhktyU1ChI9uWvTGs3N0aKuEIIyWJzDTCp9wQpMZ6S0qKfxIljc90v/VbDCeic7F
	 Q3ySE1yDrScwQJoG5TSdELBt6pLM9APK3Pbt6x0N59QJO0pHptC+Ik0aZlmifI+c8IQnd
	 MobMa7SvW5pasQKEXpUK8y8byquDPiXDgDJSrDbb3SLsyAXmjPFbtN4+KH5FHJqHjpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kgbgu55N;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD06606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD06606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kgbgu55N
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so57317375e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795692821; x=1796297621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6b8XUkAe29Qbtx4GPrsYDuZ84bX6oCBHUSF9JuGiVE=;
        b=kgbgu55NJWqtsl819u2td1h3BTQU/9so27oCJxFth9UtpwHASiUMZJXPMU3X3DVX8a
         XHYpyO1Bj9RCj0FdM3Cv42VJb77av4BgmPN4oKfcfnO+RQRyWv8i6HJOHdbIavx0s7OW
         4vGwxmmNQFnOsfhlB2XpUcy6Xc3cMs8MusZr4djrwqMIJxhhSNL8j0W71saUumvV9TOR
         nwTh2CHjddK8k6Y5/U20tmOc3A7iiYaVV6pCEq2FG5cH2GkBab7F+sc4HwMI0pylQotO
         gMfaPP3WQLcBsf4nYys8Eok8jEEiJtdIniAXp9nQm/gXUO5Ie33WyjbOmXpd1Y1FmCS/
         HYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692821; x=1796297621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6b8XUkAe29Qbtx4GPrsYDuZ84bX6oCBHUSF9JuGiVE=;
        b=kLgROjlqrk44BlvvlzQKg2HFhzy6iNekNt1wPrmWEcaq6Wl2NUESWlVvTO/24igf3K
         md+0Ld0z1dOP4hqCUnSCJpTDwnVBI0bRv5sh7b1QWEnVEfkpf1UfXXPpsofArhOYf5SR
         zX1wc4cCU/bBfW1bUkuOhITsDj2dYS0IsI+NfiisGo2rjkKkpVpE2E6ads7qhpdbjZ9i
         hoPA8ha61gHPDjpksfy1JSNW5nVxaIytWR35d39BNArGRRWDh5tckKUu+ypjE+d1DGnO
         5GBuBT1sbSM7J52O1IPEyLA9o2JIafI8+yT/Brca/fwTyI5aJsSIIGKHdqPKht+rDJZi
         inpQ==
X-Forwarded-Encrypted: i=1; AL+hErF4KIP650Viqc2GTrLmcLiYxwh5U8OWDMwgEByAy4BWS5LSwo2qarpPpnrb20Fin9NOryXrsxHITQV2igs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0pueQtDjynimKh60udls788jmN3kW1TA1u6S4zN6ahPvtw09b
	0eY4Fvzu4vsx0aFpAh1IwGY2fPzxAXQUedpEnq+LQNzY2gxvrtBQoiQyNp88nNizDDQ=
X-Gm-Gg: AZFdTZflK9oDPPK0kZrfqSAZb/lEPEkvQ6jUmQrivNUwfXgBAEYICgTMKChh1M+QCNI
	bk77KOLbp2074BSR2A+ui863VZTELeeMSFjiczuQOZ3AGw14oyHW0pNhLdAptFU94SkkdG68z6H
	Y5v4YDtVUaMMwz09tC/HeyrtZx9fPGbHu91no35U7Ub4idXK+gJzvsQyteDtpgNQG9Ms/F1dJms
	+2bp5yefrvlPpB0BP7RnucTZWa2cLU1Ce89WW2uM+cZfpoBAszgPLJQHLpvqzrlXA6tlkrjQHOw
	mYayJNNUtvzjkbqzmgkUILpjve7GGA8S8VMXj8JJI46knNebMUNTv8iljeWiO236WSloWssYp8P
	PPbQWS0tZcFMRPnplcZz1LOf8SmibEhL75V/6iuP4gWsphp0ABsryQEnMfSktW8Ds221PbQ0cp5
	1SSeuATKdfTwiufLxJ2+66QORBmznfn/+dbZP33YKOh0xzly8MrJ3Qt4jQASWz1scQMbGOV+wtF
	7QCOKXmuuz0odw+ZbOcU+lX/bj+xi/0XUw51P86GJWSWbtmFx9TIcPMyoE7qed7GZNDnEN0yGDa
	dZbGrL2R2oSeuzpPHXlE0UjjckuQuFb4i0galw==
X-Received: by 2002:a05:600c:16c9:b0:4bb:7ad9:311d with SMTP id 5b1f17b1804b1-4bb861692a1mr322942735e9.19.1795692821256;
        Thu, 26 Nov 2026 03:33:41 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm36638402f8f.23.2026.11.26.03.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:33:40 -0800 (PST)
Message-ID: <65f7bd9f-b8ea-46f9-94a1-5129268ead0f@linaro.org>
Date: Thu, 26 Nov 2026 13:33:37 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU
 throttling
To: Christian Loehle <christian.loehle@arm.com>, bzolnier@gmail.com
Cc: krzk@kernel.org, rafael@kernel.org, daniel.lezcano@kernel.org,
 lukasz.luba@arm.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 Alexey Klimov <alexey.klimov@linaro.org>, Peter Griffin <gpeter@google.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Juan Yescas <jyescas@google.com>
References: <20261125173959.2198116-1-christian.loehle@arm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261125173959.2198116-1-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


I tested the patch. With the driver loaded, all clusters now run at their
maximum frequency (measured via CPU_CYCLES) instead of ~200 MHz. Lowering
the hot trip via sysfs to 55 C reprograms threshold 7, and the hardware
then holds the CPU cluster at ~55 C under full load.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
