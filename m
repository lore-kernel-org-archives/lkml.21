Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123815;
	b=lIZQKn5WtWIhkL5WZKCw2af5+4qn5RxtF+T1kdgTwSC7HIxs8DyjhyDoly1366a5sous
	 6IuU5+UdYtYUMkTskghcORjsx6cfceV8BuqRdrCPcxA38HjBRcJxm29VIeF/WvQNT7H5+
	 aU3R+2I2yjLSB/8w+alWoZ5YM5CkoqWkNvogT2VZzjv8YPizwMFNe1knTEOxxW7pDZcUA
	 JdTB7NY7y/87jxcTiry0REURVTRnh62CPPZp7m/G7Dd0SW63AP4Ma/FF4/Fq0MrPavUA+
	 zKNEnyiXta/iCOjswllmyRoRpYQN+LFgJKrJfu5GyZd15tqW/pgzRhkb09Sw/9I2Smg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bZCkyOUbNeF4Kl4kbrR0/5p4X2Znv7p8mjS6tvEl6ec=;
	b=3RsLORhJsIVqIhcBeKvMHu8JrTybNg2VdbUAnHHgjIblgWcZYxFT1nGoqBow6+qalBxU
	 z6hrFy6qB5LUJdm7kPxJsWpV66+WmROwoEB6jq49WKGKHAlzykqndQCEpcTElP1KZNJzN
	 ApMz4NZ/rJGkjXCaES+v5olyce2U2c/geesOgccfEAiy5pu/j1C92RMHbTxMsxDl5G3WA
	 diY66TnPTNr7l+YUNdyTZPvyrD0scHOeO0wptMxfwalQzoMMOj45c7BFG1DEH0btf7dxP
	 lqQHuQMH56NgdZuRvf33IiEcVvYIPUxrDGuf6HcpWOCbcPQNVSMDQdkgvFMYPKaTqxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH7GKxig;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCAB606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCAB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH7GKxig
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso238920eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123814; x=1795728614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZCkyOUbNeF4Kl4kbrR0/5p4X2Znv7p8mjS6tvEl6ec=;
        b=IH7GKxigraZ4rc4Prs2sDGZJNk9/dC8TClmzlcBCLRyOm75heF3ogQb45s814EiOja
         FC3TRuNvQqAfx/pOadDV1KhMegifhwn5KWNYqWb9EpnffIci0acksl5bEFlfV8aCpXzQ
         fBFwtMvHnPY3BBGfXeP+DHW3yLx3EqdxdwzmloSbSn58J47wdj1o0nnUnZQ8nQCw7dPP
         Ls3xAmeyBdOkuUKYxz9KV+/NPp532aWaPzRXvnWRW7EKoulmp+UlerlcctfTYJYrbzs4
         9+BRH6FSCzcceQqt27BN0lbYmdYf9CC6lNgCZSIcie+reZpxb16GpzegFRZwDfagy59N
         VUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123814; x=1795728614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZCkyOUbNeF4Kl4kbrR0/5p4X2Znv7p8mjS6tvEl6ec=;
        b=abOsscxDQpN5T2/QjaigFtj2h7Iz55LJMGAbiL15tkp4qM6mVJ/3Mc8azVMsp/DThi
         EavogVXV3gnPxIU0GriUDrI4RI531TVxjPz4CS/2QmFgij/IrpfuK1y4+fe7vSGU3jin
         mT72CJNWmYso7brGX6YetxE1LCo04KcZgz5FjaX3iZRgC/jwyKQ3Xn75dI4Zln/ACicp
         eagHY/jld35qXpKc5rejVTSl2e8AogJ/yW/xDoAWx/inqnsI6EjmZhLzltLxlzBSJqj8
         uTRsp91g7ow5KvBXSx8U+go4sbpGBim646WWwcLZPjLj40mASBS/beKOa6yuBnLkKrdF
         TkWQ==
X-Forwarded-Encrypted: i=1; AL+hErHs42XVdcydrN6WciIk5hRQYoaGwklD7yMKy7ktUJmP/VaysG8FD8RT/vHbgsycWgzgS4V3EW5XiPSONS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ikHd1t/gtdByo18j46PUk7vpPNkB0Q6TeVis4J2tbY4U05DRU
	dCRJyv9MsZYNS5e8/vqW0KNK4zfe6xV5pL2JwOVqD1YLLHQkuLIv4oTf
X-Gm-Gg: AZFdTZd2AyG45UFM9PVz17MVINgb2XpnQTw359617r0RfbLLHOUHfu2tKkLbNTjZAo+
	AWa21Dd4AyBK88JnfgOlcc0OLsxtUVfrOxLFbQQtMQXWb6h00hFP0LyKeWXFIHcNwo2R4WBmAQg
	ZrH4NbAsbsduJT1uaTaOHhYbkgygh19YEf5TQ+htkhBItcjohRPpiDwKSn2cTkhAdYzExX846NI
	xxD/Z7o/vLf78QDA/1T2RujcgyoQSwpNRATrU6kcNLidsFaoTcD12eHqa6SVZeNpvYoED27NwQk
	d85kYOtw/l0muS+tazsEJl3aqWnKq4ike4mnW+P7/6u94Ketvb1ODC3wSIwk5f+LtmiLduXfrTL
	FTZeAUaJkHzCUMg2v+r3nhU95m8rUHBpar+TIZIQxT3UnxCUjP5ZHeozGcDVLXOZN/u7aHcNmq5
	NtiF+EVx5+0u8ywU4oyzCOJeyd1DCfcWHnNzuz/pae3Zhkv2wvOkB38XJ66Tfos+wTjrm0jWKS4
	6rCebOJgg/n2iHrz2yOmw0BAnSSdaTivFiOK+dhq/vODuFhN6AQsb90QbqVNZbE5Tzrpos3Y/f6
	41n9UW6HVDPNuFRaXcB+WPjrpOG1MK4EBe/MjcGtGXq1PzIxslN9o8Yp6A==
X-Received: by 2002:a05:7300:e9cd:20b0:36c:f88b:caae with SMTP id 5a478bee46e88-3857025cda6mr693592eec.22.1795123814059;
        Thu, 19 Nov 2026 13:30:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385675c9a3asm1145138eec.19.2026.11.19.13.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:30:12 -0800 (PST)
Message-ID: <75c6a1d4-8c72-4590-9c29-4218bef2a1e7@gmail.com>
Date: Thu, 19 Nov 2026 13:30:11 -0800
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
Subject: Re: [PATCH v6 3/4] MIPS: Ingenic: Add XBurst SMP support
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?=
 <zhouyanjie@wanyeetech.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Paul Burton <paulburton@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261113190836.470937-1-f.fainelli@gmail.com>
 <20261113190836.470937-4-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2611191915570.54328@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2611191915570.54328@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 11:17, Maciej W. Rozycki wrote:
> On Fri, 13 Nov 2026, Florian Fainelli wrote:
> 
>> diff --git a/arch/mips/ingenic/ingenic-smp-entry.S b/arch/mips/ingenic/ingenic-smp-entry.S
>> new file mode 100644
>> index 000000000000..290e23c65707
>> --- /dev/null
>> +++ b/arch/mips/ingenic/ingenic-smp-entry.S
>> @@ -0,0 +1,54 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (C) 2013 Paul Burton <paulburton@kernel.org>
>> + * XBurst secondary CPU reset entry
>> + */
>> +
>> +#include <asm/addrspace.h>
>> +#include <asm/asm.h>
>> +#include <asm/asmmacro.h>
>> +#include <asm/cacheops.h>
>> +#include <asm/mipsregs.h>
>> +
>> +#define CACHE_SIZE	(32 * 1024)
>> +#define CACHE_LINESIZE	32
>> +
>> +	/* The CP0 REIM register only stores the upper 16 address bits. */
>> +	.section .text.smp-entry, "ax"
>> +	.balign 0x10000
>> +	.set noreorder
> 
>   What's the point of making this code `noreorder'?  We want to avoid such
> code whenever possible.

This was in Zhou's implementation and I did not modify that part.
-- 
Florian
