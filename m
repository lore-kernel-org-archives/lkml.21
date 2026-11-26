Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683100;
	b=B/fj201J4DKIEXw92xBmythgGyPkyFCILADXwveWbk/QD1JT+tdb9VojOtElSuKRAq88
	 ldViwytHxutKc/yYow9GXhf8l3fhEB/sSXFrXv89pmL7foahemo00tGt+vEd+0caX5e6R
	 95oPzS9S61JFIhTG+gpaU4bNptg3HvUKl6frDTrO35xx3pSXKKJTWq3srukQmg328QZ4P
	 SV6Y29lTiFxM1KkrQ6MnOubfPoEsL4yZpDCHpIDBC0OhPXFPAM8KPYyEZrxRluuAr5PuO
	 /ZhigOGoYTUxip7kkgNMSYorZgKLYhQ4bnUo69aYErwko6+qyPy++myTRzn7WQPrbQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683100;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=RppIeY5vllf2+hf2cp04t1WXDtYA0Vaihax7esewOL0=;
	b=V2abLQOtg+Bo/9deSaYNWhTSudYDFU61AJMipWcgwycUIXKXlGnar8xp7IucTHAJfqXH
	 Inxidhz6OHHGom/9lShHmpj90BDHa42tYffLoSxgNhov7nvOnIYrR5sGJdBQEDakcPzMM
	 adKRbbLgVZByJ5OAIIMDLXyQcomykLfGO3s8R1zusmhy8QwwD7ZcUkOtJAB0BR85CAPvi
	 WDd62tMGvaEe4LRJkU7sbKatOI4q6VPMrBSkrJ3OlYwXxLzs5QEmN8qAB+c1BlCq52YDv
	 WOeTjHFrECLCjOCh8xJsZIiGJhMhCI1T3aXgj45NVOPzGJlo0Jp59xc6WK8/yiOov4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+k3bFOr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AE7606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+k3bFOr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4201F000CF;
	Thu, 26 Nov 2026 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795683099;
	bh=RppIeY5vllf2+hf2cp04t1WXDtYA0Vaihax7esewOL0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=H+k3bFOrtB+M/y/hsrp5E7jt7ysIBCnOHf8QrKbY6fcqUIHkQFODkA55wASbdu833
	 XnbZdZt7cTgFPknbkPyXFfUdt8LLciVE+H3/JowEfQK3GnzvRyhiaQAYlXsi1uLL3O
	 Fc2P9ZAe/SF9J4xE40bisJmhuIiVG0BqXJdu2a6biWUMRdpe9WPNjQcoAVMrgxC6EH
	 yMoSsOaIZEbeZloft7Wji0yIFcJClkkM32zWc9GQQ/B75/NyUh/aHVTSTsLXGCAFln
	 L6RYRCtypH9CGMd4E3zN7/RvFHTi2RGO+1lFDmREfvrUTeQk/usXhPIwTdGMxzB2gq
	 vffnJFLHnqwKQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 83A891980074;
	Thu, 26 Nov 2026 03:51:36 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 26 Nov 2026 03:51:36 -0500
X-ME-Sender: <xms:FfMHa0laADlyZP9M-X2_UHSrh236MdICVSgypDwlKXA0SCf0OmTtUg>
    <xme:FfMHa-raHvt7XdxLCzDERzgJTX5XxFgmmoVBTF-3sBgwA0-EWmt-gTJWdnwOrjFzH
    NQ7_-HqieKrcmXvq3oCVMBDwEqBGI8yikb467-7Ip7x8spCYMlto-tC9g>
X-ME-Proxy-Cause: dmFkZTFdXZx5D+wChms5XzfJyMjmRiHcVmSWyeb39LIudyuiUQP+DSckdhBpJ4yf3dQhj+
    zGeszSE2EDJQvCKnVYJmrBB/fxdre/UH26VvWx3g/bXO3btQWPWplkcD/yV9Xmsfh2ZRmO
    Oz7e49MSWqBnPkR0wD/AqDtL4UVXu2tXVDCZoFf0CxOGUHxMTUBZmMjPC7idq7aVAO6/zL
    VKRfVEGTP0jds+z2f2soiTVnz6lxZsB0U1G6lmog627s4DRoEbvOI0bTGdqyQJjfDO6hAj
    +PzGhsdlA+UV06mt5H9wzBE87UJvyKrYxyzDUETfV4U/egMu8ZwnCeOUcB94TSWdO3Y2I9
    LV0M3QK0PD3t4WpZMGPsjcIgA2GATSGpaVmiQgkwNGkRsEQ57DCwr1dZno4DN882EQCu6Y
    URxbKvx8JtMqI4kZzlPB7U0y65GpjbW+8ZQoOCOIuDG2JU/MVQvYvSdeuWXd+weMLaHvTH
    jj3pWKbc1Hoom1YsQ5uodFcJCNxQy5n5/OkkmgSXdwDpDNsrGeGWB8Qxtus5qhXNDDDhQn
    L0z/7/XuOFrr7MNBxxv2P9G5QHrz7OD7ZuI877BTQcwRNuuACNcDhKox/dN1cOhS7ZnW/K
    Y0rKeG9wbRUB0J89SBKKWp8qbG0HOCjp8zfofz8IjSIN2QveWFRLeMIFgL5Q
X-ME-Proxy: <xmx:GPMHa4g-SlUFgZ2cPSt9dtgyZL1bP3nywzHUviRweRroVpMqD-gefg>
    <xmx:GPMHawf0kbWzw20qIA6d8m3B5FMh-e901--sN-xLoVAR14t-oKcIvA>
    <xmx:GPMHaxI2Ag000y8zCdwDStt7yhVRSGT3fB4taL3YwB1AXtZLP8Iedg>
    <xmx:GPMHa9mkxy5VYxKMQAoj9dRdwKZJDFYxkoKIMRWdhcubO2gS5lC0nQ>
    <xmx:GPMHa5eWC9BwrrMrLd1-Q4rLqx6RobETgeAJEGzuouO03tjBJZIf0fWP>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 97628F80093; Thu, 26 Nov 2026 03:51:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 09:51:12 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, llvm@lists.linux.dev,
 x86@kernel.org, "Alexander Potapenko" <glider@google.com>,
 "Marco Elver" <elver@google.com>, "Dmitry Vyukov" <dvyukov@google.com>,
 "Uros Bizjak" <ubizjak@gmail.com>
Message-Id: <38ad4de5-1a41-4fa3-bd73-2f24d5578c41@app.fastmail.com>
In-Reply-To: 
 <CAKwvOd=1u6d2Epp8MgkesknixWcB+JLKfAQq8g9kqYw5sDoLow@mail.gmail.com>
References: <20261125104953.381561-2-ardb+git@google.com>
 <CAKwvOd=1u6d2Epp8MgkesknixWcB+JLKfAQq8g9kqYw5sDoLow@mail.gmail.com>
Subject: Re: [PATCH] x86/percpu: Use address space loads for per-CPU reads when using
 Clang
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Wed, 25 Nov 2026, at 20:05, Nick Desaulniers wrote:
> On Wed, Nov 25, 2026 at 2:50=E2=80=AFAM Ard Biesheuvel <ardb+git@googl=
e.com> wrote:
>>
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Clang never discards inline asm with memory operands, even if its res=
ult
>> is unused [0]. This means unused per-CPU reads are always emitted,
>
> Ack on this missed optimization.  I _just_ got beers with Bill last
> night, and forgot to bring this up!
>
>> including the load of this_cpu_off by this_cpu_ptr() in cases where t=
he
>> resulting pointer is never dereferenced.
>>
>> Clang's support for the __seg_gs/__seg_fs named address space qualifi=
ers
>> is insufficient for full CONFIG_USE_X86_SEG_SUPPORT, but works well
>> enough [1] for plain loads, and is present in all versions of Clang t=
hat
>> Linux still cares about. So use those to implement __raw_cpu_read() on
>> SMP, permitting the compiler to elide them when the result is unused.
>>
>> On a v7.4-rc1 defconfig build, this gets rid of 174 spurious per-CPU
>> loads, 136 of which are loads of this_cpu_off from this_cpu_ptr().
>>
>> [0] https://github.com/llvm/llvm-project/issues/245738
>> [1] Exclude KMSAN, which ignores the segment base when instrumenting
>>     such loads.
>
> + Maintainers of KMSAN. Ard, can we get a formal bug report about that?
> https://github.com/llvm/llvm-project/issues
> With the report in hand, it would be handy to reference it below.
>

Posted a fix here:
https://github.com/llvm/llvm-project/pull/246269

Will add the reference to v2, and incorporate the rest of your feedback.

Thanks,

