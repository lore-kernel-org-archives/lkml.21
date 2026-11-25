Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600718;
	b=Frpxpq5wHrzkztVnOyEKFg9sfb5LgR76CRlU3ggzhjtP2g3abvy6mXO2Hf0lCvpjwrjZ
	 3IAkfLKEjv38dxkwGNs3viv6ROGXEnqooiGIb70+UYUlUHdA8jmfwvJxC3XmeZNtiTajT
	 xLosdnlm0x0VO6eV0YMgiNxTSWvAidGO5uH8/E+0DKcfJ7sEhDhq79Ezbalr/AgmEdS5W
	 JhmOyFr5EZdXoG+0VOelVNsBXnLv8gkFa18jXmVIr2AfPROtZUSr3v4NkANMuX/M+zTaD
	 X4W+VdbzZ3vr9+4oOha67le7VrRPGfvP1ar1bs0hF01Wl7smbwM+UMDVvtQZRJXK7GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=1UD/fxzUT0tjfssdFOdd5M1pCrEUV3tIjK+qrLIpIpw=;
	b=M2T5J+gmNaC5Yy23wFGteHsWfI0XkabPvnXNvwIutitv6vQkC9FhT8q3+NXIGNO+D9Tf
	 gE/xLMOzx/qRtNKx8jU+QjS15YgOvXPcYqTLim358lzy6FsmAve0KeO3RyGcL7vJygMhU
	 OGvDtGfXZLuVWu9juYX/ozqKQQADkVUmPap9Ti5k+z3gvpqWatbLmueLTd3whfSb3ntSP
	 cYEa7zrPWgtDxFwNVAWyJbENdNi55844dFxPhPFq5DHnvodjEuTz8zR2/C6jBJnx7XWIC
	 Y3Re4BzMekD2PZKTYF9RaEO6gfC//I5iYlkUiWD5X9zGB4Sv+qv5W5DCj1zA304ZfYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fys/RInJ";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1684606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1684606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fys/RInJ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38431138772so7172728eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795600717; x=1796205517; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1UD/fxzUT0tjfssdFOdd5M1pCrEUV3tIjK+qrLIpIpw=;
        b=fys/RInJOM+KHowyp/0+bp6mIOdw17l/KGAP5Hu8FUU9jepLarKea785/2Unj5x2zX
         PKfyXjkBIquOhWWotnJNPdSocuX5G+ajBq27L0xeZvW1xoZwiCDunhgwui+vT3Ko+xdf
         2RChKewf23S27TRhHB86w9pUuXg0RVmEUOpFVHY1WPqwxKva8qIc/EwuDOH0PzPjavoz
         pLzkl44Gr8M58NQ6EVZ9BK19KXOARF36lK8q7Xu126oWzJVMP9hfLMNmhM02W7Et+Ym1
         /CK+3hx0rW+i2D+/rfPpARvlQI9b2hxoBGYUFhARasRTp5BJNKv/xuG/kbvsuo2upaw/
         bVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600717; x=1796205517;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UD/fxzUT0tjfssdFOdd5M1pCrEUV3tIjK+qrLIpIpw=;
        b=knBc4Nxmrp/u1oCJLcRYKJBc9k/w4x0Xfp3/AYiySusuKFrHWXFxpGQukxdkKhNFeV
         PXJoJCSSF9U+WDibDQlUeQOdkKeFCL2ieNyrThNeyw59qrpbm5NnGQHdVrlVjwq1dD1J
         iSMkq8kpSYS4sCFD223pmLgEot4Ci9U51/itYEImYEGz45uQsax89CGhutv0t8ubokp2
         msOosVlrlP8AkClxH7JK0ZzgU9WUwAY+0h84E13728E99pKmYwnXUjdorqihixbWtFvA
         6EMZaFKztxX6T87Eb3nDFE3LkIPTC8zJTVQ4iUBrxjo33ST/Lmz+te6xhGaEtkJnOeCj
         eGKg==
X-Forwarded-Encrypted: i=1; AL+hErHBhmfN9FXH9LtpiV6Lwsjstl0nTkDkOKdo62o6xNzYRMzA2i+j+60QU2zRTB8nqaXf/WtDLvfBN9Q+3ow=@vger.kernel.org
X-Gm-Message-State: APuU4Z98SQVm/NcPdaAJPiIIWrjMX26507x7D4wrNeToM7SJhQUy5oUq
	stpGzezL9mn7WkH02W4A3DKhjdvMKaKDdLWZnBMGNceQcjpQ3L6277QG
X-Gm-Gg: AZFdTZcnvaVPw+8MbkKZhwtzBqN/7Ix64if1kQ3Efw2m0PuhR7gGvUky7Aj0znKfaWV
	6ddtI1HPWsE9AvxIzOlDAiApHmga+bLuVG2vzdcHpdh7ViJDP8ZdELiL4FB2gtNxSbqxQ7pI5AV
	HmEL0vvcCmHldqQEqcKS8jZ37O4Zi8sgJfNUuxtIMkx4w6Khw4LlXr3J80rJLxSdhCBENXRvkHu
	FToiYZpevw+L2f+3BQ6mvs4WxOlGCyBqKV/xJRGLEOroVBneZMbf6l3o8o0tKf7RIdo7ZvZMtnu
	1yWjA0n06yRSiy5dKo1N9xO64Bu+jEkG2sjtYsDLR+MQq1tTJKwfLshixNPEauQA88T6q8qKXM/
	Si97U9TKHLWl68wawsC7/LeOMv9k0CTZm6HohFPLuO3RxODV8H93H03lLCYtQaHyFi0cxsneDt4
	rxzxyOTwqN1XBxsG/10elkpESAH3LltF+qQmRzBY/NGLmFLKVqazmLIGNtkYRJv3X7PR5n61QkL
	CXRhdLh75FC3bxk2ndT3kje6pr6Aacx2gaDD88vjBKDHz8XLgf6TuWXr4DfEBIj0fs6bzJp9yZ0
	K2s+08xkOOSnKO3kQkYZwq5lkKyl
X-Received: by 2002:a05:7301:e103:b0:385:496e:80ac with SMTP id 5a478bee46e88-3856fe59334mr19973566eec.8.1795600716629;
        Wed, 25 Nov 2026 01:58:36 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm26470301eec.18.2026.11.25.01.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:58:35 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, chleroy@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCHv3 4/4] powerpc/kvm-hv-pmu: Free hostwide stats buffers if perf_pmu_register() fails
In-Reply-To: <awZ4ZhK1GFHKi9Tr@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Date: Wed, 25 Nov 2026 15:18:30 +0530
Message-ID: <pkvtjl75.ritesh.list@gmail.com>
References: <cover.1795441238.git.ritesh.list@gmail.com> <a9e4029d0e11b3c944f4b4cb781fc5ff1696709b.1795441238.git.ritesh.list@gmail.com> <awZ4ZhK1GFHKi9Tr@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Mukesh Kumar Chaurasiya <mkchauras@gmail.com> writes:

> On Mon, Nov 23, 2026 at 07:21:53PM +0530, Ritesh Harjani (IBM) wrote:
>> kvmppc_register_pmu() calls kvmppc_init_hostwide(), which allocates
>> gsm_l0_stats and gsb_l0_stats. It then registers the pmu. If
>> perf_pmu_register() fails we return without freeing them.
>> 
>> Call kvmppc_cleanup_hostwide() on that error path.
>> 
>> Fixes: f0c9c49c5067 ("powerpc/kvm-hv-pmu: Implement GSB message-ops for hostwide counters")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>  arch/powerpc/perf/kvm-hv-pmu.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/perf/kvm-hv-pmu.c b/arch/powerpc/perf/kvm-hv-pmu.c
>> index a58634f656e9..ec05b4855736 100644
>> --- a/arch/powerpc/perf/kvm-hv-pmu.c
>> +++ b/arch/powerpc/perf/kvm-hv-pmu.c
>> @@ -402,8 +402,10 @@ static int __init kvmppc_register_pmu(void)
>> 
>>  		/* Register the pmu */
>>  		rc = perf_pmu_register(&kvmppc_pmu, kvmppc_pmu.name, -1);
>> -		if (rc)
>> +		if (rc) {
>> +			kvmppc_cleanup_hostwide();
> Just a question.
> Inside this function, should we also take lock just to set the pointers
> NULL rather than putting the whole logic(free also) inside the lock like
> we did in previous patch?
>

In the previous patch, we brought GFP_KERNEL (sleepable) allocation
outside of atomic context. However, in here, there is no harm in keeping
the lock to assign the null values to pointers. But I guess what you are
suggesting is - Do we need to keep the lock around in the cleanup? Looks
like no, we don't, since if the perf pmu register failed then we won't
get a perf pmu update event for this - which is the only other user of
this lock which can race.

However, this patch is mostly an error handling fix (reported as a bug
by Sashiko). One can pickup the cleanup of that path as a separate
patch.  There is also a powerpc wide clang's context analysis work that
is going on, so as part of that - we could maybe optimize away taking of
the lock in kvmppc_cleanup_hostwide() as well. As for this patch series,
I think let's go with this, as most of the patches in the series are
with Fixes tag to be backported.


> Apart from this, all looks good.
>
> Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Thanks for the review!

