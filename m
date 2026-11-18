Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001216;
	b=MBSAre+pOET+udY8rQNe50M2Hen+bHHaxre5PZROzTj+rdbBSECFd/eGqZwZ+Nme5m+V
	 qadMPI6glHCAWk8lM7GgVnVeObRjPWoaKH90as3UvfYvsbeDcjQAVcBTdwUvdNyiJ8bg3
	 eGosk9s3ZKoejPiri0vvUy+OrQy5jJidnV+3qnRqbwgHA4xBr84sim2WejQsWIMG1TC7D
	 9xihOrwVmpv+Q58GLzcAIUEW2lYo3BK3ot6M7kClMIZMxaaoQGezUmodPX/yufPhTr8HZ
	 FyjKOI/ca6X8moeWoJaXqwfl6Ti2483ltOoCljh9ho8MMPK+j4/rEPjIJgDvht7EODA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=msXJndjH6JzkweLBaiGxmBinT8C/Wtkx/0H1bh3p3rU=;
	b=4c0YhzDIwezY1B0QU6Vpp2aPus+qPJRj9k7GoKiGTI6tjUhBH1fGeNtEtEEEuqg1n5CO
	 E/ppuZvp62/aFQCiFImw9Ov5g9CrCQRBSgnULW7Q7jxFz5i5eO/kbO1hvpi6Huw8aTRjo
	 7aXb5DTQeXSa1QkQyo3RI5bnMZyw8PjXK39PtIo50B5UaQ84nvnkpNuEXVXF82BGM4YDZ
	 exnZwNaxDqFX9NQkPBcFigG48z2kwuUF70aGyWsLMHMJsCqKYyP4aWl4icDCifm/8XgEP
	 PB/8jEagQDrMTQHg/zl0nYw5vC9E2IR9V955slXEw60QrKdxkTE73m6XGp572o23a1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P5otasT3;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E7060A261D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E7060A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P5otasT3
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso592832a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001210; x=1795606010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msXJndjH6JzkweLBaiGxmBinT8C/Wtkx/0H1bh3p3rU=;
        b=P5otasT3x0KiFi3TS4Vwf6vtcEOMgiVWP29dcN/e9s7NBmiEG7HdrHGZImmidMDo5o
         5xU+BvlKcj0+KXFWFEC6gq77MtAhKse1eou1ji4Zd3lSWe8x2gQiVXGBx0eaaDdXC3I3
         wD/SMzHcbNyQGxuokrJROPQ7UU26BYymJf6lubkRav7AWx7Vn2P5Vi6z94wCSxUojU+s
         +xApZYHKHYnFFfeCQ7t+Q6hM32sj+uTaXL5J+NtlmYzf2R1JsVDdgFZqZiRmPH4jyDNX
         TVXJxEdQW6qA8P98NZx6jAwMpmvFTLN8U3ybDvWsif3nBIrOCjLrCqyesYadO329VCr+
         tBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001210; x=1795606010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msXJndjH6JzkweLBaiGxmBinT8C/Wtkx/0H1bh3p3rU=;
        b=STWwyJNlDUKpC46kjTdJLHXqzn3pASX3niEx/p6PVjOAEbEmWMUrTHXw+Yhf78QHx4
         cytZjqzTQmSkn1JIv/ljoo321jT6NzdIU4BeDuWxDCTBi30wW/GgsSMaB5pPNiAHMmOb
         QyJidgZpgGfzK997I8hV/DQyt6E8NeGSxgT2sZo8YHBv1Ch2efSu3EhYg337HPPqXuxA
         n1GorSlN5gQ9OfB0SkjNq5zdzb7GfMsTKWwvr3GeRyTbI9K6tYZSdwRgmneIo7evM9aj
         +CUXqfyMV42fVEm/JUoOZRKbcdOzdHE5D/Kl+mQrM3QcQp5iqHQvppaG8tZ3iodldCcp
         7b0g==
X-Forwarded-Encrypted: i=1; AL+hErGrb579/IbYQ0DgZUtCPBhChVXtz2zxi/VNSwCnLYsdwd95powDtNksKU5LLdZFgrLBIMvi7/mOGmt18gY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fNcyvJM9ZAZLBsyFWw3Lc2YaNiDw2nqsKTjdcwCQUO5vToSkG
	cWOZThvKs6ZYISc3DxiiSD26Wmbse83MO3lNVN3JxLmTm+YqcfD2ZLUL
X-Gm-Gg: AZFdTZcu3KiE6FDGnFZvYJqHKq/lNadnFyJR3tdsG6hCM97j8qOInp5r1iYg4JIp8g6
	AHZKSSauvTYycCbR0fuQ1ztxsFnIxMyzvaJzwQMviOcCHcHG1S3cEs3Fus++1SHuzx+b4op6ULU
	u1hs+P3Gju+fYJg7achxWVQvGH2BStC8gJfLX9VM4g7bIPl3ip8GVYcWIiFSfgzxfm5awfm/vdJ
	sCZPC2w6OGwtIU2QK3Y1ixuQxI3zhbZ6+gKFvpefwOBTp47ITmwtQ4PC7dmuncpcIIXd4hbwNu1
	OpMSqLFST2f2LlJmTrLEu7bJN6HnBh1poqr7CY7aJ88fG/4lJXL4rkjLhqrBCGLH/h7D1Dy1rQh
	1EmkAW86xj66PtNCo/MyKMv3TJR7xlgriVY4/mK/7ZW/+Z9NsJtjE8XuIJiPEiA8k1NWal3RYLG
	iyo8vR53oq0Lv5xz6xeaa4XChxMAe0p06vTinODcaE4wVHKBGntULjL19Tj3is/6cD2Qv2FJ0Mp
	aQimqD2Jd9ieiXBa+XKVIG4VXg58a6gAnGqW2Vh1DtJ1ZF+FSrL4zXoIhjIzZ64LS5sqskWxOko
	t0KEZ2nm8GPY1UcQKb6YER2Kxyvd4lfKsLJfPSjRj8hB2N83IVtVTf6x4fURU0yvbOWK
X-Received: by 2002:a17:90b:440b:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b3d07e3950mr2232429a91.58.1795001208717;
        Wed, 18 Nov 2026 03:26:48 -0800 (PST)
Received: from ?IPV6:2401:4900:1c43:8cbf:33a7:8ddc:7a9c:40f7? ([2401:4900:1c43:8cbf:33a7:8ddc:7a9c:40f7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acd118sm3997301a91.12.2026.11.18.03.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:26:48 -0800 (PST)
Message-ID: <fe93e84a-1876-4416-b3cc-547b9816c865@gmail.com>
Date: Wed, 18 Nov 2026 16:56:41 +0530
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
Subject: Re: [PATCH v3 3/4] openrisc: Add unit tests for KProbes on branch
 instructions
To: Stafford Horne <shorne@gmail.com>
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, naveen@kernel.org,
 davem@davemloft.net, mhiramat@kernel.org, pjw@kernel.org,
 wangruikang@iscas.ac.cn, namcao@linutronix.de, kees@kernel.org,
 linux-openrisc@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930202744.50489-1-sahilcdq0@gmail.com>
 <20261026201240.107462-4-sahilcdq0@gmail.com> <avAsy43KVO-7Nm9z@antec>
 <dbfe2a41-c99d-4f00-ac0d-2b2b31a72986@gmail.com> <avkQctt0CKt3YcsH@antec>
Content-Language: en-US
From: Sahil <sahilcdq0@gmail.com>
In-Reply-To: <avkQctt0CKt3YcsH@antec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 7:22 AM, Stafford Horne wrote:
> On Fri, Nov 13, 2026 at 10:45:03PM +0530, Sahil wrote:
>> On 11/8/26 1:33 PM, Stafford Horne wrote:
>>> On Tue, Oct 27, 2026 at 01:42:39AM +0530, Sahil Siddiq wrote:
>>>> Tests already exist lib/tests to verify the generic functionality of
>>>> KProbes. Add unit tests to verify that KProbes work on instructions
>>>> that require simulation in the OpenRISC ISA, and that the corresponding
>>>> delay slots are handled correctly.
>>>>
>>>> Signed-off-by: Sahil Siddiq <sahilcdq0@gmail.com>
>>>> [...]
>>>> +
>>>> +SYM_FUNC_START(test_kprobes_j)
>>>> +test_kprobes_j_addr1:
>>>> +	l.addi	r11,r0,0
>>>> +	l.j	2f
>>>> +	l.nop
>>>
>>> Just a tiny comment here about indenting the delay slots.
>>
>> Got it, I'll indent this.
>>
>>> You could also use the delayslots here, for example:
>>>
>>> 	l.j	2f
>>> 	 l.addi	r11,r0,0
>>
>> I initially thought of that too. But then I thought by keeping l.addi
>> before l.j, I would also be able to test this for the case when
>> there are no delay slots. I can reshuffle the instructions if that
>> test isn't required. Please let me know what your thoughts are.
> 
> I don't think it matters either way since these are tests.  But, it would be good
> to note that in a comment at the top of the files where you want to maintain
> that convention.
> 
> However, thinking a bit further that may be hard to enforce down the line just
> for a handful of files.  We should assume the kernel code uses delayslots.

I agree. Since "head.S" and "entry.S" already use delay slots, I don't think the
kernel will work with a CPU config that has delay slots disabled. Also, there
should now be no need to have a static key for "delay_slot".

> 
> -Stafford
> 

Thanks,
Sahil

