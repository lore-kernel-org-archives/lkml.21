Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795480279;
	b=j+gmSW7KpIjyuEBpQ+REpPKJ/J/lhKwleYYr8U5Tu4sq0bqLGWJTM5rk68/U0G1SXA3/
	 qoKeZ8n9fA6Khwqc5tV/xxxW+Hi8dFaFkZVuh2RSsHh9tjXoJyZhJ0pELv/XFbhhP53w/
	 yfsFqHEOvRC0ofFjHTD0ms54pCGFBHNmihXD61BGsQazKPQ9BpF89yZCLWCTHBH/pdsyM
	 gmtx5KK0pSy85PzrR/cY/uV1jn501ZtmiTi4TTrBtbhoTra9xL6HlzoOd/xUnqgNArmhb
	 hv1F5sKhJCEOnfOO1pMvlb0I+61WBLdOVuY7bVqkhZ2VqLCWPJ1Y7wTjxs+4q1U+5iQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XBBRJhlZK91IRv9lRpTyJCctT8RJXhFRC51jo1VlnUo=;
	b=Dlo6J/7Bwx4EFQedtxM+bK44odUfYeQm9rtIeEEhexrSPdaNUwKsCFiNWKqSg9cTgmUA
	 oUsWA5io2qQzFHXEBmaoM8CT0Gk646BuMOqymTmASSuJeWCpA4eNVFBbTsyAqnWLI66MZ
	 n5paGN15DukKYDE1T+JjwOv5NlTalzd+sto1SDwZHYuqelawpmLHUs+Mfu3uxGmBIk6fi
	 cMDGaGCxljt61cAqkBpKH3Yh3388krT302DQGx2UZ8UjQ2OHLyGMTzQhD1O9oGm66re+q
	 /Sa400Pl6/xoxDQyOA3tQtpyu97tYVm4MJmMmOJJal80CJVwVaV98LzgNRW5v3sHNag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=LBFiC2j+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71B4606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C71B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=LBFiC2j+
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b503e2a87bso41115217b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795480278; cv=none;
        d=google.com; s=arc-20260327;
        b=MIB7CxdkjaPmBhyKFFuQXnYd8OB7UDZ/+yvauIuj5fZtKr2Qn+4RTnyE3ZD5M3rab+
         uxkJwucCPa0HuHd9PKhx0qnmiBwWBLMhGyJw5Gmlvg9K5LAUvFORKCC2/YRFBFqLjK7X
         2lyfVekJbms1uNgYLVpxZ37XAmDfa7bLS8tATC8GVJc9tA3K2+eDfKECL8pgb+XAJX1S
         V1Pc2Qj2mwvPFDvAkI7NW5DcjjbV3JkQcANz1d1pwGPYlNXpCs56uboPj6Xj7P8cqqtt
         fTVIwphGbqMM+06Y2YRqCz/Wj6VZ1yK5Q9AIJ3jdfterLeYhO37Zko9rS7DotyhJELaY
         /s5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XBBRJhlZK91IRv9lRpTyJCctT8RJXhFRC51jo1VlnUo=;
        fh=JGEvnYTVthfb7R8eT0f7fxDAFCfG3ceSZRo+ApLzv0Y=;
        b=Vpgse+/EPSpFC4nWGL13dQj5kfNscc4RvGrGNUGdOuoS46hrwLj+oMFcBVY3M33tfe
         iqsS1cbc9OdCtclTIA2dvzb7+U4MtM2vu0nSmT2FbVTt4jHUeK1xfWs/StVF5mzxoEXj
         VrmJR9pfO/m9us+emTKLqrpVW5+XW8V2KKeaChVJGtdD8Q+9A5vPAq+KntxYVB05x4E9
         zMxISoK3w9BI54URV42j7O9eQeP0xDRNcapxtAjPu0u8dqxnPInR7ID0hA1FAbZjZo7r
         td+xV4Z2kXRjAHo1yUup5XlACsS88RA4MWC+NCxFdf+SbRw9WDsUOvyChjaNL7SjEXk7
         tv8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1795480278; x=1796085078; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBBRJhlZK91IRv9lRpTyJCctT8RJXhFRC51jo1VlnUo=;
        b=LBFiC2j+bNqRr3AUvQgWzHe6jh7NRWpzgANTRV07wFyXobIXgKJT1JpIDGXsR7QRxX
         VE1zxJGgxZCSIv2v94gOuosdIk8+h8j4wA1bPDY9Ch4uq0GUd8u6Yd6qCzO61Bw6+7PQ
         s1AUw2pli8iaYqsrheSREKpuPrGMY2Ewek/bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480278; x=1796085078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XBBRJhlZK91IRv9lRpTyJCctT8RJXhFRC51jo1VlnUo=;
        b=gpG73jYLPgYQla9H1p/F7lfJdUDU64qG4xu49iuNYQWsxjvYzwKkN91GZtwFDFk1Mc
         8skPv5mD1upf1O/rU+cbvGHf61Fx9+7hPOZ97kfzoEqM4+upSwUPq/ZU4kFxcq+oJcIl
         h8zGycK0bxvYlf/9H9W6qwvex//JORFQX+XEX48wuSELhIF68z9TLBI13vizyv3N8Kl2
         WsOQpV5rmhSo8lo5F8v1XYeI6/oypolXiw0UVYGHXwPsrK5SH89mZ3LP1IJPauAIJtBX
         BWn6tqZfZYoGq9dVcknVQhojlBqk3HoBO5sCV13V5RpQ2OVL416QuonO7v+lcFyoJU6f
         HoLQ==
X-Forwarded-Encrypted: i=1; AL+hErFRPVfbd/U3HH1ivy3MGUm4DRZKRZmI6/hMKerYOIhLiaQl12DHkHU4Gq16FsIDpovnpIsLXIwv7+CuDIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mP/SXzsYx/NvYlypmAzZ0zcc6YyRymt31H+/dw2wYTlXmahfL
	ObWMnkss7efjXSLWUy3uJPdTxAV24fFxi9jt6JkRw63U6bNFts0bpHiw+moMRb5d/m7PwoPViMa
	emZziN+ce22fIm6SGYiOuh6+j4PbwkchF5Muqze8V0g==
X-Gm-Gg: AZFdTZcGchoxR9tl5vkn92N9YU/vvn6kpUODIMI6dsI3f7bonHwz6+iMJfVQZrVxks5
	Vx1qGumt8jWJjX7jtQfHnbgAXXDNr0fEzKkS2aj7FYMLIeY1loYuFclrk1810xHeNFVwsw22BlG
	0gbA6Pevc9NQR2JgeqPwKwJcWNm+jc9PKNQNtpngOj9aThcDxbCtw8UevdB35fhk9yq1mUK7iDh
	sO0zmLNXiMnvT/cD5UUAdR636aBBDzJhxexkigxQv/Hg76go0e6JJfFvL5HkeuS5Wnoqomf95Ot
	80vr6fQPwBATEOTKWStV2anGE3709jlLL/nEBgm5uoTtkGUSkDEglEky3s1kaccfGpS4uK8g/6y
	9pO5LhzHBikpTjUVTuZEoiEk/AsZtEyBnyBO2F8zYhAH+kTmanNlOaNRfKB0vjhQV+o8Mkg==
X-Received: by 2002:a05:690c:6a86:b0:87e:2404:6b45 with SMTP id
 00721157ae682-8b5204ecb30mr59678307b3.53.1795480277123; Mon, 23 Nov 2026
 16:31:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122050405.80335-1-irogers@google.com> <awS0QkL6JuMfC7Z0@google.com>
 <CAP-5=fX4-HqRbB8zWNSUFyCc4Lzz44iNmok5HJVj5O1+oqoWOA@mail.gmail.com>
In-Reply-To: <CAP-5=fX4-HqRbB8zWNSUFyCc4Lzz44iNmok5HJVj5O1+oqoWOA@mail.gmail.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Mon, 23 Nov 2026 16:31:01 -0800
X-Gm-Features: Aa3M54qz5MWiuh12iW5spvHAu_-ZVuYeTacDOMGL10nwbT3pFevtztiRCbhiN5M
Message-ID: <CA+w=M=TtEOjHR83QWYknCdSxAPxMNSmQ8yHdVJOXcecRgNEJNA@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] perf symbol: Sorted arrays, DSO-owned lifetimes,
 and memory shrinking
To: Ian Rogers <irogers@google.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ian, Namhyung,

> >
> > I've applied the first 6 patches to perf-tools-next.
> >
> > The patch 7 was bigger than I expected.  Can you simplify it more?
> >
> > Also I don't plan to merge the rest patches as of now.  Let's wait for
> > the lazy loading and try that for a while.
>
> Thanks for merging those ones. I will split patch 7 and rebase. Patch
> 8, shrinking DSOs, etc. is kind of the whole point of the series.
>
> Thanks,
> Ian
>

The lazy loading v9 is rebased onto perf-tools-next with the first six
patches, so it now works on the sorted symbol array instead of the
rb-tree. I'm going through review fixes and should post it later this
week.

Ian, it uses symbols__visit(), symbols__sort_read_lock() and the
symbols array directly, so if the split of patch 7 changes those, I'll
rebase on whichever lands first. I'm also happy to run your remaining
patches on top of v9 against the same profile as in the cover letter
and send the numbers, since the two should save memory in different
places.

Thanks,
Alireza
