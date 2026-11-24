Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519481;
	b=IVxj/p8dm7IGO3IusVBxZcvQmaGAsItL7SToeSDtmdC5CEScV+xhpGL9MUahL8RnQk3i
	 3CmHf7mmFF/YG3LHBiDZ1ere9klNb0ZUi4bsbMy89UDnCzHoLlNG/U+V9lVgKC4ampM0r
	 vBZwFsemBhxEWGmZaIp1upH9L1gl8hSrJ/IyrDdgwkCqdNaMWki8wdowrEwPFnooVenua
	 +u6umylB6sFS27R8kCJpWR6aDNhT+MOMzZyT++aFGIPBDzzeE5bPa1XREbHxQrfLFd9fr
	 sN5pYEzWDweMIZsTaSnjm5dJ/ZRJRTGUb55rb0ScoVxx+P7CP94/Rh1ZAsS8XdLsUbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RzFMb3TtzuucWHVLWCFL8thSDn33UJo8KWwaTHZ5em4=;
	b=wjsEHTm+kt9UAX9geNWrngjb6oTtaaDUBa9oebmiCkvu//aJZqBs3tpdub3xzWU5kpCy
	 QmaOOPEfBCUUQsM7DKU0Mb7nUQb5fsyTpPwOz/bpws6AOgA19gdS3wf2U6Lh2bRF5g2B3
	 rADhnKJcyfFg6R/KuqroKziOJ4/uMIEYa2qPgu0L1Bjj3t6vd+aUnLDaxhoH7P6J+aVpz
	 a4u3EMZr2K5acOE7ensX/zjO4PKGWsRr8XgFOyYHUTi7w3WmKq+IvvNIkIxf2Tcrjds8I
	 kCr3JxpsU41nqclj8UCU08l54gpbYqvo4wZGGJErBEuy5atA8/PHv5O9vUzGQgpxmKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G859brBp;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3206606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3206606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G859brBp
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso930976f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795519479; x=1796124279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzFMb3TtzuucWHVLWCFL8thSDn33UJo8KWwaTHZ5em4=;
        b=G859brBp3PRE9sKtnIOu+PiddHE693uDbFkFcyk61iNPdCgzB5fRX7Z0xSh+Ehz9QH
         jnr2NJxcJyyEamvREUpvoTjvvYevuMuRAQmCM4ecpupnJb3514160g5Zh+uEUIbd4mqM
         ktxy2mixDWYnycwuMhm7jiONKjuvObrXipDiOcRA1RrSudSI7WZ12nTVFFz5oRmX2HaF
         RHBy859GtqyGXZPqhSoejfjnPhk5H6OZtCfm33mHNgNI6MENB3xjCxaLdLedLqc3uxb3
         FZgSV3jY/+6gQCplX6mtf38JhQy67GjS4Fu3PTpXFAiE4IWQjnZD4JNLMYcdtI7Qs2W0
         HyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519479; x=1796124279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzFMb3TtzuucWHVLWCFL8thSDn33UJo8KWwaTHZ5em4=;
        b=BKfllqEJ81rCUjZGovxfUOwc0tit7/1Sq3KhTv12aeI4Qq1CHmYCG0Z5kvfj6iiWEH
         9o9oOjRkvokeW4jewGKD4iPShneTielMFn+kIV5thGQyVgWCQPbIff/0xHhyCHVXkqD/
         pDN1C607lPCE66J1QPf/BaEUnTkFEP77QNA3Md1QibjUXb69ewRKlP1xxeHyThCzpZG2
         XKZzTFJT3ug7/2HW5Q7KsECyrcOHPc8wN6XC+fk/m0EOGIgQV8wBf+3uVDG09fAMhkN4
         WHwy2/FHxY1YzwOCxj5iWz1hbirghk0kHE8dkK6GLwLvPVav42rGHav5ohqfBGKmknLv
         yAHw==
X-Forwarded-Encrypted: i=1; AL+hErHRbbseUzWe55kECy+e/91Ri76bB0W/SR17ZOJxcoKlqbpnyLxNonx+bGXjnH+MTI9G8vY8XYaGMWz7VRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yYGTCgPn0F8/GUwJpacTaP2CcINHyIATo/F5cAghMNREv1tuI
	lQd94n/ezbbAY1ck+FQWm7ZXSwShjCngCUKHBCxXUZ8aTpPznKnFfXFspkt7WbWPLa4=
X-Gm-Gg: AZFdTZeGuE5/lipo/FqngZ9DN44QPp+ap4ehfwJ7a39IOArWdOKmSwro4CDVejRYfb9
	d5MRohSZPhVzxHAs2Lh9jLf5Hd/rlxqXBt7bez3gPTKOtfZPvTdIZdqHyJeqC2t/9U4FAdfL+RE
	haS3vdZ2QYiitdeIRuJTx5PE6J3+E2MSUGaRKliy7JXZrBscVsODg+t4ZWaXhJbkfbqBzpycawN
	Qp537fl4SrmqIvKaG0j3tdP0I6Qkj53r02M9+F8olRiPDkXM6apokPNJGeTOcnaU7sEqHrG7kMI
	b1CRr4onmcY6iXT3NDWXjNUFX9StPGFSwGLJJj7Sj6YYufz3zwKtdgJaLhEjxUNYtY2uNRVNSVX
	JcxJnMvrNNjyjiW77s7jJPspcXpSgb492I41JnuXf3CrN4gI7jdXjd4+dMhaRTDTFT2DC117HLR
	G5QQDW2LfueXIbzxtbTIYrbKQ9W4+g5RXGWmQWtr9hx0x+pC/ms/Xli6MOMpDbJMv7juqYecUTQ
	WW6evLayIgUDP3AD9ANNmh6A8u5vCNvaSFmCNpioR+K+65/HmFIw8M6rSIIjCl2GgqfWmVOKFoR
	JK/le4ZI5qCovnp3FTEU/weX9jh4skcWug==
X-Received: by 2002:a05:6000:184b:b0:4a7:9630:7b36 with SMTP id ffacd0b85a97d-4abb3f15ddbmr29862376f8f.21.1795519479042;
        Tue, 24 Nov 2026 03:24:39 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b205443sm28811395f8f.39.2026.11.24.03.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:24:38 -0800 (PST)
Message-ID: <46a896ba-cd45-4747-837d-50ea4b4dbed9@linaro.org>
Date: Tue, 24 Nov 2026 11:24:37 +0000
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
Subject: Re: [PATCH] perf build: Only enable context analysis with Clang 23 or
 later
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Melo
 <arnaldo.melo@gmail.com>, Ian Rogers <irogers@google.com>
Cc: linux-perf-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org
References: <20261123-james-perf-late-parse-attr-v1-1-cfebcd81a962@linaro.org>
 <CAP-5=fXuQWTt1F6BvKSXqgSkEtBQPKvKg6gmAe-ngyr4VGyGig@mail.gmail.com>
 <EC27692D-9692-4976-B7EA-4C3A91173CE3@gmail.com>
 <awSu48pUIh942Zm4@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <awSu48pUIh942Zm4@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/11/2026 21:23, Namhyung Kim wrote:
> Hello,
> 
> On Mon, Nov 23, 2026 at 04:55:16PM -0300, Arnaldo Melo wrote:
>>
>>
>> On November 23, 2026 3:44:12 PM GMT-03:00, Ian Rogers <irogers@google.com> wrote:
>>> On Mon, Nov 23, 2026 at 8:46 AM James Clark <james.clark@linaro.org> wrote:
>>>>
>>>> Context analysis requires Clang 23 or later (see
>>>> Documentation/dev-tools/context-analysis.rst), otherwise the build fails
>>>> on older versions, e.g. Clang 18:
>>>>
>>>>    util/env.h:142:39: error: use of undeclared identifier 'lock'
>>>>      142 |    struct rb_root          infos __guarded_by(&lock);
>>>>
>>>> Only enable it when the Clang version is supported. Leave the other
>>>> thread safety options enabled if they exist because they don't cause
>>>> build failures at the moment, and might provide benefits even without
>>>> -DWARN_CONTEXT_ANALYSIS.
>>>
>>> So we've had -Wthread-safety for a long time in the perf tree, I'm
>>> guessing __guarded_by is missing on older clang versions. Can we just
>>> stub out the __guarded_by for these old clang versions and keep the
>>> lock checking?
>>
>> Looks way more reasonable, and no need for a feature test since we know
>> the compiler version when __guarded_by was introduced, right?
> 
> Sorry for the trouble.  I checked with clang 21 and it didn't have a
> problem.
> 
> Thanks,
> Namhyung
> 

Looks like __guarded_by() has also been around since at least clang 18, 
so that wasn't the issue. The problem is that it's not supported on 
struct _members_ specifically until clang 19.

I sent another version that stubs it out for < 19 which works. The 
commit summary changed to "perf build: Stub out __guarded_by() on older 
Clang versions".

The header diverges from the kernel one which isn't great, but I suppose 
that's better than someone on clang 17 or 18 missing out on all of the 
lock analysis.

