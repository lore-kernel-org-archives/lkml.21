Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795092419;
	b=tFMXWEMK95wiaeyfxRmzpBMHfksabAdCfBxFg0AFtQmXckeQX0FQMQODFgMyWxBOeI4A
	 zBU/SxzxC2+qVIp4XVp4hF7UFBmlkwmGXv93MHGzSK4FuD/IOeNiO13w11FZC2lX4Rmkq
	 WInT7VE+9nK4ZUofs+r4nc1kp2U5DQyJRzpvOC46fieIA2R1pLlgftYEPP6I7TsSB4RIf
	 ybijZEzcYA+l1XBIMSubeES63WjQbSWSqyZE91jj9/6Ez89Xx6CLxQlAPjQIUe+cSkbfO
	 w0TgB9p2YQKTzgKzWYXpu17nzVjWXcQHpD5xorahyT36B8U7/3VU715EaNa4F09PxFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:X-Original-From:From:Mime-Version:User-Agent:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
	b=JhCnPMywAdkBA6jzZeXHV5KaqogbJ3tJDGeYU6w3Ggi7c/7u03NqAZlZdW8MHO/Mfxl2
	 4w7ihPjozKAYOFdsQJCwMAf3tGdYp/14SRPzRTcdmkvbC8A2s25/RxWmjAA7LKbRqu/2/
	 EzHawkYOj/Ws6FPB9/A8kJKvz9Z7JnG7zybCDAjnD6ZmQmBpTw93cFTiPV/LiwPqV4vSQ
	 ZHILC7KMeV/ULZVQWaUopz+Je/5xDmCdezMiwQN4eDq3vXDd3Gt3Q/Rzdr0/Y/5gifdwn
	 YwsOTOFhGa8FD+K8hGEi0ELRSP5EJ26wvwe1ahUJ3tGPbpNycfJIpQCezY/EhMNl11Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PVBcFpas;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DAA606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7DAA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PVBcFpas
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4c685c751so18192587b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795092418; cv=none;
        d=google.com; s=arc-20260327;
        b=UzusUWyyw3xE+8LWWCzoA7M405HcKP9FAUY0gECzXNoWz3s3uCAm5gY4Wx3HTPT3ir
         oFLasxVSYxFx5/8m0tDfvtmsPqxA2k7aLFJMRMItYMUZ+5v4SbLA3KTjrH1819jMiv/6
         5w0DO4ZZjNnHLiFcUvLyOjXnuuLAVqjJywSvXuQwFANJYIigC/aEgIK8OKR7IU4Gmky/
         7t8GkpghdqaJ6Sss4AQkw4gLA/+lNhYClx2NO7ktcDsq+vMLgi7oE1BbOWVgJZV9aiqJ
         daJIdXYds/B1GZuGmCcBeQoNNKPsmsm0FyG1gibr6THXCrIF8oZ2y9F1WLPI2S2c3lmS
         NBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:mime-version:from
         :references:in-reply-to:dkim-signature;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        fh=A4cThjGerMytajWDd8Ao78ji3VRRe6jcmiKl6vYiYqU=;
        b=DCg3YUKI70B1bSU6YII8DkGkmVGsTcf0/Rd0cMJFB/lOhDfdbbu/Eo38jbfrJKVMQ9
         fBIBkKcCL8spRea4bldan1K50w3tfwFIcj48aAwmnCGSdii4pWkZVQUXgczoOK6l5hH1
         Z/FdW1/WF/AZZpfkuoqdLKsMOJmMPJmFrOsmGd17PwSGSY/P9q6fnSJ+1gta1L4ve9Rq
         uebzp/sDUw2IyvKuvHY60jXdLuydTo29r4U5JCfJdwLkWYtFcpdkiZHBPH9BCdp+FXRO
         //VhrDfH6MFOn0p70mY+He8qm+YoG+GKfqBOuMnf5IiofmJxv40Q3MfUIislkb8zrHTd
         z/7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795092418; x=1795697218; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        b=PVBcFpas1O8smDHU+vAfrzG+rYFHrAQDcyNbr5hyCzToAVKVsl0IlJXf1fAxNIbcMS
         fFaMWPOIOO67Ge+lHCBqORfslCkWcgsu2TU0CDhp0qWnbg6+8wd7eFEzAt8d9VaDLdM2
         pIjVG+zDtEvZo9sQ2wU79yJo/+foxmdaxtCiOxYBKT/lgB6jYwTQteAv7sk54loaJZia
         mX5J+YP3UglKO1N9wQZ9BdscQDjZ++aBfNEbhKM2S5kXHY6gfg9HbHNxGiT/9zxGPwAu
         Yem+qoolbm7IdPNK2zTIsK6XZBZs0XnAfsi3gMxB3mjZAeIml7J0XqLZc4D9Hma1qGqM
         px/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092418; x=1795697218;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        b=rXUFudgcgLB/2RlIE+6OrffXkHu8GdwlEQVEYtmf5+3JmOXIM+f9w/ywHGqwFBZFuo
         FFvduULsbufcqTZ9A+/83MuJB5oH2zhP0x9xHQzY9/n9n+5eOictZtwtLjEzHN/GC6pt
         2oTkyT9lrblgT+I/O50SR+km14cZo6/EcV2HZ2VG/lF7EicSgqLvTG1QxAg++aGOp69B
         GdpTWcqmJ4VuMyxldHciGlN+NSU+tCQ3w8WoNAYGurmrGPE8klKnPmj8F3SEmLTSStol
         of43DDDTdbjjlj8Kmz7eRw7WDqVlTv0iEJ52lTxhKXOCjMEY9CQD+fKnuR4ULeOiH+HR
         +gQg==
X-Forwarded-Encrypted: i=1; AL+hErEwn/su+OFCMRaW+8TyR44wwPNGG+45EFskJlx8o7vdoqRGyiwe1MyQgi6EKy2bHQGEn4SEeA9iUVsIk1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IuTDofVnG50gCLgsP0GFiHf5k0kKSVqfyYdaiggwZoWSnkOWB
	r8q5pZTfhtf8sLCWuhnhx5+o0dEs2I4t9hnM8ZNeS0fksqFW5gGXqlCjnsn3mxindzlwFv8yzLc
	qBQL3X7be1ratEtm/7A8IPef3a2UFsfM3Z3w3mJNvuQ==
X-Gm-Gg: AZFdTZe9mnPtrcRGRT2dQaPrSXGdkGe4jmDfQ+oFn6HpiuiAdLSJLGHwq5PniDXQuou
	A7YaVk73MrC6ojVc/1tq7IMMrmZSe0eb8F4zmQi8fkFR1IflLXKxzErStu4GX/pNS6dh5T2Tlr+
	LfeYTXGPN/mo2tbZsS2l0fi6TJRLQWxnR2m1siFqHVcPRU0Iu2KiHt3C1BnaOe9whFeNH83yrYz
	iCWJ9TwHKRjndUHB/c4s0LHOvcheWCxx+NXJhLaHYaO3shG3LtTbGev8C0TRhj/JZ1li2HJ8Z1h
	lZbCgWBusd92TEIBuQdT33XLCE/Bo6PiV271AFhnnQKLF8PNKCCaOJFu8LVF6DnNnzp9CZxmbKk
	Fshv/v9NZ1gtOQ/8erxx5d7ehEFgCjrTknCR/0A==
X-Received: by 2002:a05:690c:7405:b0:8b3:3fe5:f6ab with SMTP id
 00721157ae682-8b4fecfa349mr19565437b3.24.1795092417770; Thu, 19 Nov 2026
 04:46:57 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 19 Nov 2026 04:46:57 -0800
In-Reply-To: <29e631f0-c135-bea4-0a3b-81dd715cef54@kernel.org>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com> <29e631f0-c135-bea4-0a3b-81dd715cef54@kernel.org>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Date: Thu, 19 Nov 2026 04:46:57 -0800
X-Gm-Features: AclHuK_VCp2Kj6TuYw_2lEwgIiu0LS1C49sX3AV2M1eYDrqr2PQ_yG1as_cK4Hg
Message-ID: <CACnXVne49x1JEPZhCaQzofGDuZa65F6cRpE5Pzj=3s0rzpHUcg@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] riscv: add SBI Supervisor Software Events support
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
	Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Yuanzhu <yuanzhu@bytedance.com>, Yicong Yang <yang.yicong@picoheart.com>, 
	Susheng Yang <yang.susheng@zte.com.cn>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On 10/6/26 6:21 PM, Paul Walmsley wrote:
> Hi Zhanpeng Zhang,
>
> On Fri, 11 Sep 2026, Zhanpeng Zhang wrote:
>
>> [...]
>
> Thanks for taking this series forward.  Could you please rebase this
> series against the current riscv/for-next branch and repost?  I tried
> pulling the series in, but it needs quite a few updates since we've
> queued up quite a few patches that touch SBI.
>

I've posted v13 [1], rebased onto riscv/for-next at 642fb67393c1. Could
you pick it up for the next merge window?

I'll address the crash-kernel kexec restriction in a separate follow-up.

Thanks,
Zhanpeng

[1]
https://lore.kernel.org/r/20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com/

> thanks,
>
>
> - Paul
