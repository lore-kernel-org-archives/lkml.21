Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185792;
	b=MQjF3wHTuZYXTmvBRP8DrDJKbudo41Rn4j/uNMlkpYfdJtrEo3kfxrthjxXf1gQlU0Ds
	 8zTyD0G00hnLjZ1QAtciU8j7uVB0F2ACUMkAz7hH9DBusk0isqyL3jePpCXEhJcVGz+UC
	 89aQaj1+9RfcewKiNfxMoH4ROiYPnxTpBwcYKmcnfjXFJ9jxBrsdh0uIfFCpiGtr1dzm+
	 R+bxDIN9EtYKALsV1S6XbU4ZLgnfqW1bBxJiH37KAGCa4JQNHS4XNAJsc+szlXpeiIPe5
	 eFMbrJy64/m6F1YaZ4y6IkDCee51lOdcuckHZu1Nto1dgeyBMNKKRFlp50+t2gXUzKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185792;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yixQ1SGo4cJcxPp4lugRtTsKJNeATESWf0Ug1fQZCEk=;
	b=ZhgAKAb0wm0HaEX476oXdPLuin9D6w2zvz3IFsDMyeJO9sxyGJh+8WPIVjWnUzDWsq7D
	 M4BB/ra88jdAoFEY12c1Qgcq7lwBk/GuxDT01t2brT/ZQkBM7PhZ2KuMjITAbAeMXY7Tw
	 DirV1HF+V69XR/2K8q3ShuLVMZYiykHN3DZtjkmf2WKkhaa7EW952+CBVBKicxxuMtjwH
	 4Sgs6WUZcSTCUmzwvwSMHXD4BbuU+JC/T43RNQLjcJCacaNCvaJ68mQ4dwdnJ6e7ui62H
	 iizr4/wbOX4QY/KTHgr2PAk7TgcuKLg4GFEsaDBwha7YjB+VXWq9lF6nbvPqphO14lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="D/79QOC4";
	arc=none smtp.remote-ip=91.218.175.184
Received: from mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4295606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4295606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D/79QOC4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=S7L6rbBejoaXnnbji1W9tw5YAp0Tvh6lqzaVd2kGCDU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795185790; v=1; x=1795790590;
 b=D/79QOC4xtbtIDKUe83AQbLg9pCO9CqBIDilnT7hGCf9MisMkZ41b7dEWdnImcre2jWe0jsv
 /mzRf62rY7IcpM2HteXkDbTwZk59WC+hsceYn3bSn2gZFNVM5BA03VUq0RgwpCxqDQ/zto0aZci
 KInZK3+B9FUsvh3zWJfF2BiU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8ce2be2b52f1686f;
	Fri, 20 Nov 2026 14:43:09 +0000
X-Mizu-Trace-ID: 8ce2be2b52f1686f
X-Migadu-Flow: FLOW_OUT
Message-ID: <2909361d-d4d2-4f7e-9754-ec0f5dc5bbd3@linux.dev>
Date: Fri, 20 Nov 2026 22:43:01 +0800
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
Subject: Re: [PATCH] docs/zh_CN: Add core-api/irq managed_irq Chinese
 translation
To: Zixin Wang <w1355457260@gmail.com>
Cc: linux-doc@vger.kernel.org, alexs@kernel.org, si.yanteng@linux.dev,
 dzm91@hust.edu.cn, corbet@lwn.net, linux-kernel@vger.kernel.org,
 Chao Liu <chao.liu@processmission.com>
References: <20261119103147.112197-1-w1355457260@gmail.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20261119103147.112197-1-w1355457260@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Zixin,

Thanks for your effort.

On 11/19/26 6:31 PM, Zixin Wang wrote:
> Translate Documentation/core-api/irq/managed_irq.rst into Chinese
> and add it to the zh_CN irq toctree.
> 
> Update the translation through commit bb6a85b4b652
> ("Documentation: Add managed interrupts")
> 
> Signed-off-by: Zixin Wang <w1355457260@gmail.com>
> Signed-off-by: Chao Liu <chao.liu@processmission.com>

You should use the Co-developed-by/SOB pair if Chao Liu is a co-author of
this patch, and put your own SOB after it. See

https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

> ---
>  .../translations/zh_CN/core-api/irq/index.rst |   1 +
>  .../zh_CN/core-api/irq/managed_irq.rst        | 147 ++++++++++++++++++
>  2 files changed, 148 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/irq/index.rst b/Documentation/translations/zh_CN/core-api/irq/index.rst
> index ba6acc4..7951d69 100644
> --- a/Documentation/translations/zh_CN/core-api/irq/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/irq/index.rst
> @@ -20,3 +20,4 @@ IRQs
>     irq-affinity
>     irq-domain
>     irqflags-tracing
> +   managed_irq
> diff --git a/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst b/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
> new file mode 100644
> index 0000000..366320e
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/irq/managed_irq.rst
> @@ -0,0 +1,147 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/irq/managed_irq.rst
> +
> +:翻译:
> +
> + Zixin Wang <w1355457260@gmail.com>
> +
> +.. _cn_managed_irq.rst:
> +
> +=============================
> +亲和性托管中断（managed IRQ）
> +=============================
> +
> +IRQ core 支持按指定 CPU 亲和性管理中断。
> +正常运行时，每个中断关联到某个特定的
> +CPU。如果该 CPU 离线，中断会被迁移到
> +另一个在线 CPU。

I think the length of each line is unnecessarily too short.

Thanks,
Zenghui
