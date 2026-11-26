Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696796;
	b=2Cfg5jAAt+oJ+lp/qupQUgP2BFiN2ly+L8dU+3D2tb9c7q5tIqHZZXWyczEScmgfhndL
	 NrR4VSe++cORjy57DdEs0RwCcmLJxYT+foi6WWxcOG4ZGNppbdtxKjCD7SraarMkgIZ9t
	 u9Sw+w5J1pK3nhzJV4US1PdJ8FF3poqtByT3+1ARzBX9JH5tiKIrAFAUbVf4BnsBZeN53
	 2iYQBX8xDpEXv2oDjFKpDk8oPvvgYFI16OAaFYhwRwOGDROrmjylwwTsYY+gKJCJi+Ske
	 /DLc1pZPgOAWzoMGSyRkWsMLAjrA64cWc3S5cyHaLqrYvPv1zf7JFSXlyZrhONii+Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+CjvtlLtZ8LD35jmsrC/DW5uvUUSL1yNq5kGmVgUFAw=;
	b=fYfKjwSVPXJmU2fFFCOOhZqjTCxdkJVFOFudbUGF5pA+oO5euVKeeWIpX8Ji8y2FjkYn
	 wn9viWU4ap6Mk68hkC8R7I9CoxhRH2beiMu9wh6IfM9JX+j8tgRCtnrmIkyJPU8j1rMnj
	 jh1nVOFYPDAkyveIncarAsugi4nN8Kvk/pIRxwoUntQZZeAwdc4+ujow4qCEousAhiLED
	 /z095QWo36gh8aXpzYCXwjoKHqK9TaXWn+ZB837klT+b6cjKskQ2pK8owughiRaE6mAcw
	 K4JqCTf3ZQk//YlvgEpjh6S/3NbW681c7TeC9b4V/1C5PXv/ypRjPq5n08YWuuZyQDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zxL6kgvY;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102C2606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 102C2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zxL6kgvY
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so59635725e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795696794; x=1796301594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CjvtlLtZ8LD35jmsrC/DW5uvUUSL1yNq5kGmVgUFAw=;
        b=zxL6kgvYYeHE1uF2N0d3iaJwovorY8yEoPfTlFMvMzb/+qWZy1Kj60dXHat588BHnQ
         I6qhP05EusskdgnFqAdp1pWWNsId7oYixOYmxXk7j9+q1Eafh5PhuF84ZReDiJFOQnFb
         E007V47UW6KdCfk5h/ihUSmveqvCJiolu7ZsQnoM+R6m4KAa8oSeKXXqxLkaw2nc+YYU
         st/sIDDeAz0CJa+Zw6WCLB/heYg8BO0pr6aFWmgjnITK+Zz+d14+kV0x2vMQeFj2pu1Y
         9q4mr8+vrHI5S63mZqJhWwhKa712yVoexhtQP0Orvis3QMX2eDV9vKlFkQ0mV3cY7Rdx
         IATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696794; x=1796301594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CjvtlLtZ8LD35jmsrC/DW5uvUUSL1yNq5kGmVgUFAw=;
        b=cTN0ELBGay2LhXaxefjBGgw8di6JxMLWOdzNKnuXizj2oCmKM/EIJ3QwZi7RaNQyHW
         bjKbe+2iTdqLzdiT1l5wP5Lkzogn4RfZl4antK/kQyGx9hq+yxP71iuWZkm1TXKOZfVq
         EgFwCbvrlzwNLFqXRKHcZ5OdFQIZ8GtdqgdScXVLcHuOt2ad4iaq7HSsnfZ9+zyNsVO0
         yq2pD7NO0E6MQ+QqTUNc5AvHzQLBzdLFl+c5Bcs5tPukPyH2kBCzah3BaxCYoaJtiDqg
         1LaOreBroIXuhhBe+cOsxzqnWjTwsMci1C3cyK6UyUi1UaloGL4vgE3Dh3yJr149yrbd
         MWHg==
X-Forwarded-Encrypted: i=1; AL+hErG3wh1tIDDllGj2p4JzybmZVLn/obpf6BA7NU7nbz1eaNkBeiTeqY8IThuQG19gRnEX2Mg7n1gmhSayxT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HlNptPZlWuGQr6foObCZdubizUCn9jGrPodilI1oW2THEEFUM
	ZnfVgv3LmczjOCTcwjOII3XkW4HVunqmuwoYD2MOczxKLp003PuAV/upRaLRW28k/30=
X-Gm-Gg: AZFdTZdvd/BJfEx4NpCb9d3iI16E/MaeHVwmijaVSzOXC/lChZPBV2WDJyBkdCDLDpW
	HFybprd/oQTOs2AYwDAOb9YGhukb7hUhy+Nc7P5H4EoBVlubolpxbz48wBaKrGo7QJWBOe8jxRF
	Oywdlama/3xoNOJC4jshEJ9Jh14cWKZVx99N9rIE1m7YU+pvQusl1c/LrDKcZ/gcux9V2Xwzf0a
	aAezDitbeTgc3/Fm9+YCBJchuGzeHFSKz0ZxJdN+ywmsWHEcKOhwa2ZQPxrxlb7beBY4Bp+ux0R
	y+0Mh7nUXyRgMuKCEVSfK1r81GaAg7dnwrq065zJzO3GVs2EJmT/Mky7NlTiM3dNLiMdJFTooBy
	LP/Izo8qlpdMqZYltPVr/WAajWZJCL96e7ZpgdJD/70EbZUywqGF2zJ3xnNA2Go8v+FT6j1ewz8
	8UxWn8kOLknkLZYUgV5GNmgVAjGnA0JddGER+OGNYJ0hvIMx4XeX8TqHCphNNAzAxjO3bb7WVW8
	VZ0zl8UQDKTJbZOYs39kf9BxDIwzRPk6caBvohoqDYYdcBK/PuU/llm2wnjJdRh8TdBLjEpqkkp
	uL6gFHbZA/jhq9ev2Aj5VX45TJH7ElGA6g==
X-Received: by 2002:a05:600c:4515:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb888267f4mr432189715e9.29.1795696794423;
        Thu, 26 Nov 2026 04:39:54 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm330174705e9.3.2026.11.26.04.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:39:53 -0800 (PST)
Message-ID: <5c7f4a5f-fe5e-4367-9c60-86f1818346e8@linaro.org>
Date: Thu, 26 Nov 2026 12:39:52 +0000
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
Subject: Re: [PATCH v6 0/3] arm64: Add BRBE support for
 bpf_get_branch_snapshot()
To: vladimir.murzin@arm.com, Puranjay Mohan <puranjay12@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>
Cc: bpf@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>,
 Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Stephane Eranian <eranian@google.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif
 <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>
References: <20260810164622.1829843-1-puranjay@kernel.org>
 <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
 <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com>
 <dfa8362e-0dad-4f23-9d2e-dde03cb5facc@linaro.org>
 <CAEf4BzZ=ahQNtA-1KdZFRONXMOEkV9Nb1OUY==JRQCarkbMM0Q@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAEf4BzZ=ahQNtA-1KdZFRONXMOEkV9Nb1OUY==JRQCarkbMM0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/09/2026 17:46, Andrii Nakryiko wrote:
> On Wed, Sep 23, 2026 at 2:15 AM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 22/09/2026 21:40, Andrii Nakryiko wrote:
>>> On Tue, Sep 1, 2026 at 6:45 AM Puranjay Mohan <puranjay12@gmail.com> wrote:
>>>>
>>>> Hi James,
>>>>
>>>> Can you review this version of the patchset? It is implementing what
>>>> we discussed in the thread on the last version.
>>>>
>>>
>>> James, do you mind reviewing the patches again, seems like Puranjay
>>> went with the implementation you suggested, would be nice to review
>>> and ack, if it looks good to you.
>>>
>>> Mark, Will, you guys seems to be designated as maintainers for
>>> drivers/perf/arm_brbe.c, can you please take a look and give your
>>> feedback as well? This is important and useful feature for newer arm64
>>> CPUs, it would be great to get access to this functionality that we
>>> had on x86-64 side for a long while now. Please help get this upstream
>>> or, if it's not in the right shape, guide Puranjay towards a better
>>> implementation. Thank you!
>>>
>>
>> LGTM, and the Sashiko review is good too. It does conflict with the
>> FEAT_NMI patches on the list, and you'd have to disable NMIs but as it
>> stands right now it's ok.
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>>
> 
> Thank you, James! Mark, Will, do you have any suggestions on correct
> sequencing of things and how we should proceed? Thanks!
>>
>>

+ Vladimir

Hi Mark, Will, Vladimir,

Any thoughts on this approach where NMIs need to be disabled? 
Alternatively we could do something like track where the PMU interrupts 
and BPF snapshots overlap and then discard the BRBE buffer and make sure 
they don't trample on each other etc, but it looks like it would be 
significantly more complicated.

Thanks
James

