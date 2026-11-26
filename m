Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701198;
	b=NkYD2ZdWwwfHKIjutdQMomjl4kjsngvY6JcQ8UrAk36cwQuI4lUELXJJe/floFaN73Mf
	 xU/sSiinGnk1IYSXlj7QXb1S3jK7nzrGEV/xrAiGCgHPvLbaRh6+xtbsvz8RGAW5snJQo
	 jvAkc7/OqwQncv7Mu1eK1cbqmCf7UHChf7ocEC9+Pz6y8wFUkH4r3p4wyYDxtcyIROydV
	 UzB0ah1Eurs2NYDhJWcIxgbX8zWknYdeeUxdE7rBQ9ugyj+KtGwbArfoHW9r8WaaQhMNx
	 5amVndMW13g7sfaQyXscqGa3I/dR9GkUt2dWOkEn8ScTKdqt2wL+ZuPenqmS6Gx3Rvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AU2h9lPdSzx4S/KR98PU1M8jqATUeMkcc+DImUKw4Bc=;
	b=yLiNFTK9ksCmTvhy47ZxEjtdFYQeWaQDBvi+dXOoT6LIPmYT09eo5TwvOtsxNz6//j40
	 8ewaco5SKSSvHM24QGKHQj8TC/9p4vajWXjrg/2XFv7KDZ6sawR4AThsSJ2Pn9IwD6a+Z
	 mRHJYVJuINexgEWt1KZNI4X9ClPN2xsrM91wZP948gQP3e/l5fw9eVMCdXZC04QihzR8E
	 TMs3OCyv6Q+fZqlSDSrRw4fnZDFYg3BNLYIr/Xg5eigseMYTjG7GHvMHWRnpf2LQBa4Qx
	 73zMOHJto+aS4WrXj3BfGk8rlvy5ReDn/5n8LPzc3sx0YIs5pZk/Ppyur6ZTVlCQnGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VkIP9xLb;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EA4606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39EA4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VkIP9xLb
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a358881793so3705384f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795701195; x=1796305995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AU2h9lPdSzx4S/KR98PU1M8jqATUeMkcc+DImUKw4Bc=;
        b=VkIP9xLbrhFfOU5CgEzhM3QwmHcp5igdX1ivprss0A0HdKClrfnz7DSLV61dXSlk+A
         nzWxpzPBNG+4+OEVrt+HCLPzFGY5JSLe9N9GaghMtFeifoLHZqQcyuuREhL54ICIM0N5
         0ZiZa++LVPq0rPkxCGXVb3ToLDwiYHnZwgLW8alIu2HDPK0Xfky5m75u1GFgyei4k9Ru
         427/TOwqFDhPYKNgJtBD/wYKpdnDhZr1NSCb16shJ/GQ9r7PhTLukW9khA8thW3+iVFC
         RcFQvpcazns1g/gyMuEQO+WapzIUwK3eZanoQgZQCZzYd55N/BfFPpc2rBYScnfUERKF
         +RVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795701195; x=1796305995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AU2h9lPdSzx4S/KR98PU1M8jqATUeMkcc+DImUKw4Bc=;
        b=VIje/x3Wa/3YNHRMGWXad7ck0EQKZ72lm8Ye4hx3UXutQ90B5Uix+YKeeuucdrQs/9
         9PMvQAGBWwNBdYDqBy4X1Zf/SS1a7j7eOjvhyoJinyxpMaYFiEGx+sZ0fp1tKE1zBQ+B
         A+WUsgLlozfhO+1A4vya8jc5NuD2mVBp4uJuP1Z4Yv1LmKvaEml3cvSS7kkxGGoAIaYl
         CM+9nolJU4ejilpAgnU/ezBAVLFa7B+w84R615tms2aZZLNdy0yVv7C6X1Fss7dVW3iA
         ch5P81SiYfqHYjAaJu64xuzodnCTNr+2mkmX/T1ylR8OtdqBP38KKxxfYIs6QrbgZE7i
         9Ukw==
X-Forwarded-Encrypted: i=1; AL+hErGBXZNl9oosQt0W3qK/tcjE376+GgltZJLespNRLDJgdIpHvAJIy1y4cSPGWBtXsSmpap1Dz76uyD/MKwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YSsi4ih11mROcwNsioB6pTLDOQ1xdcfBLNu7X6B1eCDnMxv9u
	qMhoaIqLYOBBkOTy0m7Vhip+yessYOZAaabMfyo7eSKuDD89YaF4njL6g3NIliRpuyo=
X-Gm-Gg: AZFdTZfJKNMOeKjv/0jCiNrE/aX4Ja+sPSlbP1ZgfhdlsQMEhPd1Q+NipVtWj3Wx2A9
	lo1VvoKHyiGP/A32v5Xs7aRqvFq8RTYhlXT0MJB0Q69CeS025yqY9wzA/ku0OqmnA5I0DL7GihD
	NSlW9KOUcRSSh22yQcT9L6Z6/5VzQnyfSVF5LOFlT2MzDB8C0MFRCp3g/VPnEQk1KLonBm47u/E
	+jL4kv98r27c0x7jb//k/gqtp/xRPTQILiN73yVWf4GWZWGMGvVl1ikz6p+lVuR74OVfU7ExT23
	CIYklN+1gOlCtQ0cy4CMTark1ZEvc5UsUh+A/C5gdfYjRPpAy+ii42jpT4tD5fqb61F8NlBGr72
	k+g2ZgFvk5PcXr6QZGSJTHX0PseL/zJKFoJ4N49hdMvGYbbxi8Bw7kjbOQAtuKOGdv7i+ONceoN
	uIf4bMsRRxV8GJwlhmd2LXTaMtU2OwD4u3P0rpPWfocxWQrVZ0Xu6/2dbrJJPcLfPvikcvyMbF8
	2mNGflJD4fq6TD+gfosrv992UfOAUaMxFL2fz25q7j6NBQG/HZX7uFMGJ4wR5/Fk8tSV+Zd9sJB
	I1MlNlGHlv1XSgTx+ALoRbtQdHChBoj5j4W2AlH2qMb7AmD/Kyu+1CE=
X-Received: by 2002:a05:6000:4812:b0:4aa:8da8:4bbc with SMTP id ffacd0b85a97d-4abb5702827mr38115253f8f.36.1795701195608;
        Thu, 26 Nov 2026 05:53:15 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm39382253f8f.47.2026.11.26.05.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:53:15 -0800 (PST)
Message-ID: <acb7a0f9-610e-40db-b38d-26e63fa5818a@linaro.org>
Date: Thu, 26 Nov 2026 13:53:13 +0000
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
Subject: Re: [PATCH 2/3] perf cs-etm: Use the packet instruction size for
 stack events
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Robert Walker <robert.walker@arm.com>
References: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com>
 <20261113-perf_fix_gcc15_failure-v1-2-eae592c5ff64@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261113-perf_fix_gcc15_failure-v1-2-eae592c5ff64@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/11/2026 10:54, Leo Yan wrote:
> cs_etm__add_stack_event() uses the last executed instruction of the
> previous packet as the branch source. The decoder already records this
> instruction's size in last_instr_size, including for T32 instructions.
> 
> Use the recorded size directly instead of reading instruction memory
> again. This removes an unnecessary read and the dependency on DSO data
> when updating the thread stack.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 25f12bd110934a204d79244f45317085b7a81666..312d4a734e84faa0d24c4ac1fee16f4dae4c2398 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1626,7 +1626,6 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
>   {
>   	struct cs_etm_auxtrace *etm = etmq->etm;
>   	u64 from, to;
> -	int size;
>   
>   	if (!etm->synth_opts.branches && !etm->synth_opts.instructions)
>   		return;
> @@ -1638,11 +1637,10 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
>   		from = cs_etm__last_executed_instr(tidq->prev_packet);
>   		to = cs_etm__first_executed_instr(tidq->packet);
>   
> -		size = cs_etm__instr_size(etmq, tidq, tidq->prev_packet, from);
> -
>   		/* Enable callchain so thread stack entry can be allocated */
>   		thread_stack__event(tidq->frontend_thread, tidq->prev_packet->cpu,
> -				    tidq->prev_packet->flags, from, to, size,
> +				    tidq->prev_packet->flags, from, to,
> +				    tidq->prev_packet->last_instr_size,
>   				    etmq->buffer->buffer_nr + 1,
>   				    etmq->etm->use_callchain,
>   				    tidq->br_stack_sz, 0);
> 

Reviewed-by: James Clark <james.clark@linaro.org>
