Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084924;
	b=RShgK7RtBAkfD3QmlyhN8uliL98lUqbHpm2szt2+vTlM7wNyN10FCUsCOxhiSYbTWGeN
	 trNjEnx+V6TvcPnoXU/j4e87WcATERCsmwElXwDgY42EOoyPe63iOipc72tpAccuq1qbz
	 IEbQaY0uf/97/2qKyvVTlo6yBIqbTBK1RZcaV4DYtWW+agu8biL6bpDvPPluD1OUIdxDg
	 HhO0q7xfv4m0mgnE1KhOZ5RoMKJFmW5TsiTiVxerYr3wDXkscEzfjDt5zY6z/yGGnmPz8
	 kLsd+HEgJGugHaQrLrAD3bJ0Q62IgjswwzzyS5O9H55onQf4tyjkBzrUJmGSv/33WZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0A8q/L3CmrGgEk1a8NfJ1t9SknZ8U8Gii/mxNtOtl+c=;
	b=FytrdpS2k7wgZVdfZ7qjp0owlwdoUv92hVJmGjt13UhH2AATIH6oKfeJ+hqdekc24ZRl
	 KUIPh73rso30S0widTjqdqrZKrNjO7Mk9R24ICsuvm2x3hNa51V5LxWe/SUmQUCmTwXCQ
	 tT+l6wROfH9cc/3n69awqxA3Ft4F2sBYpI9TpC5iwiv5G+SCPpCBB8Mm0x234XRydPggc
	 8/LV81YfUj6slAl9myqGJLQ6aPR4ugGNCk9RwkcIbr4NJPjwvLPaExb7J7dtKx2+Tb954
	 US1+VeoEYNV8nciMsMEdg+sneAW/SOqb+h498vCnNp40S9iCWLzuQgzpisaPl2O6zIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="ch/kaiTt";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505FF60A2600
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505FF60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ch/kaiTt
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so18451795e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795084921; x=1795689721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0A8q/L3CmrGgEk1a8NfJ1t9SknZ8U8Gii/mxNtOtl+c=;
        b=ch/kaiTtpwL/+LkhPiSBPfToMQlHCXea3CpZL1gXLWCh4nnTJIlioTkaIIrSetrUcP
         yIghQ8TZWyeEufK9m1U84tP7KfCyGo63q4/hTRa4mXJ6F9gvczi6BYx5W+Ai2in0yoeh
         5BBRCRMiooaSjh+pu7JuuLxXVQidQYpsAA61aWpLaFFkuaWpWrCRE+TWEmOQcw2C4gpe
         fLKT38jHavOU80P1E/tPRYj22SZwMbu3WNG5l5U1OmhebatIgc6KpiS/eERdwpOQoKG3
         s8iZ82HjHRgfkczSzn0IENe/YHGSjSnuK0ChwCOGi0lboYM8CmXKIxskJQjAIpD8KQG/
         zb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084921; x=1795689721;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0A8q/L3CmrGgEk1a8NfJ1t9SknZ8U8Gii/mxNtOtl+c=;
        b=nYdt1KUFjUAsvMJObaoC7C4L9y8lPeVNIdh2Y402FOTb1HCJwKV9c17Q8rxIPhbNuV
         I/04ryUlQi2RgCb0CbBarRJZj+b7SgpCB4Sm00bJ6nYEX3h9ML8GwPygSpzCSj4NBDuk
         Y0t9y059P+5gtG+cSCZTiHlrWDuWYYfYYsbChDOmNpU25Uqv+MhdxAKw/Wypbq87Xxa9
         3SQHY6HDhN8G/BfOy8flGqVCuy6jrs9/1LbIVRTjfRJspjih6puJq6pZ+VpwJraX/0eg
         SCxYAgaLtPcRKmDqjxk/waUacbH6v5dKBXUjjCnZSn8HuFjnxxTmrIHhiPUZQJlh3ELK
         F7eA==
X-Forwarded-Encrypted: i=1; AL+hErFx9gnO79WUW+cFd+goaP6d4idy5rOj7TpgfcjiJxVNbzsng3I14RoJbpPKNKTlEw+RWliulkSk7zCb6AM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VnOwBWcWh1HSem7yEHBnBwmCrYMgyiemcn4NaSawMD2a2vZcH
	Auo+rSkjxlh9qZB8I/tilY7AIBXZ7WApAma2vQ2sRTZ4lh98WykgDmM4LoXEGliloj4=
X-Gm-Gg: AYBFou3OpUGsezaetTEgUvdD1EDFzt133OAF6OVNbt0TUCPV8ZxM1BotJjlH6dVulio
	zk0ZMz+73WkJ0IMjtperqGQqhp5BXgjCTILgBVbM7+F5Y6tlGYBl9gFgHmVXboxXdjNd2CSxAYF
	YZkHhQFr9R8BomgyBoYvQwvf95EuZgooISPUWXLcw1dnoztcisknGrZp9B7JqQw3kBcwa19Qaqh
	YsQCKkVXQLTRdhF57CLf9X0nkiAY/q4OWPk/tPyB9nvnryLNiCpAbCC7iI7t5FPGWPculSnADOK
	AB0mwgb64+y53lHjeKX65UAraToF4DLid8irb44EmZpGQDPeQ9rvEsXYb4DZ733sNrPvn63LJg/
	cvGVzuzNOgyjaf6DQMVdzux1z8pMBXZpj+COvo79Qb9uYK8t+AvVT2HHEf77wXHrLKcXOlLVay4
	v6oZdw/hoH011QWTGQCCyG7XjYm/Lnx0prOEs1BLxCKcfEf+EozEcrerhGPyEJbD5dteCXUFzoD
	dWGz6RAG1RwkF52AyLeSglN+i35v/+vXCpZFQHFr/UmZGtkhVZir/EQ0mJ5v8bXSYFveOEYhfY0
	CnyM5jtgECbMh5wS/Tw/bWfGv5C6y0C3jw==
X-Received: by 2002:a05:600c:6708:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4bb7d9fd2f6mr104170865e9.7.1795084921602;
        Thu, 19 Nov 2026 02:42:01 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm26726305e9.5.2026.11.19.02.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:42:01 -0800 (PST)
Message-ID: <56700f45-9cd1-4375-947a-d59f9aeead0d@linaro.org>
Date: Thu, 19 Nov 2026 10:42:00 +0000
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
Subject: Re: [PATCH v1] libperf mmap: Arm64: fix transposed reads of counters
 12 and 13
To: Ian Rogers <irogers@google.com>
References: <20261118200057.2134362-1-irogers@google.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Rob Herring <robh@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261118200057.2134362-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/11/2026 20:00, Ian Rogers wrote:
> Reported in Sashiko bug linux-3291a858-209c-483a-b4dc-eeb57abdaee6,
> the 2 counter read functions for counters 12 and 13 are transposed.
> 
> Fixes: 407eb43ae87c ("libperf: Add arm64 support to perf_mmap__read_self()")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   tools/lib/perf/mmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
> index ab3adf1d8baf..92acb0e911f7 100644
> --- a/tools/lib/perf/mmap.c
> +++ b/tools/lib/perf/mmap.c
> @@ -376,8 +376,8 @@ static u64 read_perf_counter(unsigned int counter)
>   		read_pmevcntr_9,
>   		read_pmevcntr_10,
>   		read_pmevcntr_11,
> -		read_pmevcntr_13,
>   		read_pmevcntr_12,
> +		read_pmevcntr_13,
>   		read_pmevcntr_14,
>   		read_pmevcntr_15,
>   		read_pmevcntr_16,

Reviewed-by: James Clark <james.clark@linaro.org>

Interesting mistake. Doesn't seem to have been copied from any of the 
other enumerations of PMEVCNTR either.

