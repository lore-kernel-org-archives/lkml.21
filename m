Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772002;
	b=n6A+npZB6h/2QsJ8uNjwbtK6QclTdlE64nt1axpdi3bBu3Ccg1jgCIk7CGq0Jtb4lu58
	 69IXy3MLcmvKHHLEIr+jRss4SUJ/7Laa++ObzlxXlQr07Q8ltdy7idF4B8DOin8kiDPdP
	 BwEpRgb/NUnYwTDwJgzZ9Ac7FK5zJhoaErrY5pgSj4psdVL1ke4nPay+WNL5FI8T9RyB4
	 71XZb+WoBVtAD5Ws9ijtZXW3aeX9+aZZsKiI5U9LOujMF0qRzvdaVQlcCjuRGXEbH8jKr
	 g1/AEOQXKQBPt9DXmnuGZVije2cP2clvZw9UZPFPMiG9XU85Yvt0mi32HJ0VTDlPRNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=A6uudOphVfwIHGV1M9Y+fTURzZzdu6IHd2WuYguba9o=;
	b=NoWODrt5TGqaxZXCVeQbZFJJSQlxlZX6QVJlksBKYrbZCM04EHXoEnk/ZfB5ICMSCpae
	 Isw5scwuJhqiQLBST7F+yAZB1hH98OgADg7LOaFycRuIJNrdTkI5zYWJm1FhvOryeVz+n
	 pYlqD/x/0yJXklSKlci12F0frgQvMSVtnMb7sZEVCA75C8OTcPkYw3ney9TsrixiEkHH1
	 e3fdbx3X+fOz+OOBigsBS5F8ufIKY+HvjeLm+SehdYaH3OU3L09HzM3cYkvRg840DaFS/
	 cdw3jEY4A4fOyawKkW0ZACUV6bFG9TFZNP1nQtWUbIBus25PMCUyEHFtzwpFOk09ldw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rUPrkvfK;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB3A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB3A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rUPrkvfK
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4606075f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795772001; x=1796376801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6uudOphVfwIHGV1M9Y+fTURzZzdu6IHd2WuYguba9o=;
        b=rUPrkvfKizuSIqNH8jAU7CLSDMtHnPWScQPWSe7vozOJCzePlZwslsVwhr2heSoEWC
         S9ZDtpfJxfgDsC290pS5b4hhM92cDcmJd2JsC7eBnBBsFyRBFgCacsG5R5DcyKgBOwNi
         mlgYzZS+2yfu0X+Qn09MXDM+nPR4iCL3yKb79nGiecWOAfBfBS8VqZ1IuxLA2NWr+fMb
         rvcAUdRk3a6sHt8XeQ8M3JeOo5wYWAekUX1RLdyWhKirsBtCd7AaLBhp21NI7UxEZnHY
         IclN7pMEHCX4g74wO4cC7iQMd7UkY0zn5nIMMVKdLiNiQQpO3uxt1ZilT9NI7zuZEVgF
         eaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772001; x=1796376801;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6uudOphVfwIHGV1M9Y+fTURzZzdu6IHd2WuYguba9o=;
        b=H3htFUAV5ZuAIOxxmUKCV/NfmgRZ0WGFCDX6+ErtX/mM1b1k9FFtn9XvNzlGbOZVSY
         qHvyl07Yf0Dpv1tDn1oGOxzT0Elf3O0bd541VrOciYs9HkZazplga2HRmXMhhMjlKNc4
         AVGY97qoN3sYuCrpZzNItjiJDuy7sY2XhNAhOojHPkMgGyDCwW4Bjk+sFJFdI2YwISEx
         wcB0FOj89k2X5W81zS9RvAkaMi8UVcj0QqAVk9F3ZIH36lBI4HKvQpJ0sT9pNv6HdYP3
         bQJbzgrnJkfHUqmxz2QiDBUWuMNPJTUvWEjklYBVo/m1NcQasHUdYJae6mgWF6sXbe74
         /CKQ==
X-Forwarded-Encrypted: i=1; AL+hErGz3zxSPVemSg3wxe8gCJ3duTg+grGxsx8+WePzHBlXwp+bvfNXx5uWH97JRhHfieGVH+0vytA4b6XRsWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sPR3mfCj10GUPEVra9O4AK+9uR1RCz3pqw8mKHZQKrbvx4Mz6
	IccDhsywWipMcF3ACoQbR5ydU0VYkzFFL0XTtXRiarEgappz4+uXI8rztdBh+grw0hM=
X-Gm-Gg: AZFdTZeYGHOi5xlHlgNKO2PIn3gkGjI6biIykKYeXYMR/VNbcat3FDQsDGMbJjRrRLd
	AgNTzYmRsWnoDQA9MFEKub7QpuKV0ov6FWE6S0eBLWqYKUJ3g4dVxL/gh1wnm5KB/X9iSx3jgV/
	x9O3LPCJTlbE9ptQbS0PElaaxC4mpozJFc3V/INF3oIz859AUwqqpDUdV0ocqyLnd/AfhNO+hP0
	PH8F5gnD+FlJcR9ivaEsMwSYHHGrKKcJjtfXJ/Amw6VkJsKADebs6y8G/yL5V2V99UQKc9TOwal
	w5rBa6kgN4cSk0/BZ0a3uqh8h/FzXpq3wp7WD/+bRR0eOnwUtX1W8CmqirXh98RNI7wXcEHUoxc
	bXTiuNmkwvJeOw870Yi4LRDobMdabSyyzAaH8V9whhI0HGEtvfSY6eiU3omX5PtX7Rq3wfwpych
	iPTMT9IA1Lu14Ho5MQGjhYIY4wrjXrjeUc3mp+KBH/bkdxudAOBBka8aBtf3BKPPqsKTeec2hbQ
	XHSo+adKIdBqrmD4QkCwINJXZiawrbg5yz6r91ymqR60ZKqhId2zT7C/8pmnuB9mFsfRw0eOiSV
	C4jTvPeOKRR3Wqq4Djt3BI27iCKc57/drOuUpMU=
X-Received: by 2002:a05:6000:2903:b0:4b7:70aa:4553 with SMTP id ffacd0b85a97d-4b770aa4574mr22944028f8f.38.1795772000643;
        Fri, 27 Nov 2026 01:33:20 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm46450336f8f.44.2026.11.27.01.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:33:20 -0800 (PST)
Message-ID: <41962155-e78d-46b2-a58d-45282fdf1cca@linaro.org>
Date: Fri, 27 Nov 2026 11:33:09 +0200
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
Subject: Re: [PATCH RFC 00/16] spi: spi-mem: Express the dummy phase using
 cycles when relevant
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>,
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>,
 Yu-Chun Lin <eleanor.lin@realtek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alvin Zhou <alvinzhou@mxic.com.tw>, Cheng Ming Lin
 <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/25/26 7:51 PM, Miquel Raynal wrote:
> This is only build tested for the moment and sent as an RFC because this
> topic has raised a lot of questions, there may be things I have

There's no ambiguity that this is the right direction, change bytes with
cycles. As a matter of fact I tried this in the past as well, posted
something and then couldn't allocate time for a new revision. You may try
to search the set, if you haven't already, and check what the feedback was
at the time.

Cheers.
ta
