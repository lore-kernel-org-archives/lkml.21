Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795305986;
	b=mTHO8V+HtdL6HAbIFloDpuR0oejL769VHSCcb4U3StOVHCNpLhl+5zWtFgjxAfLZLMQa
	 j29qUqyFBhPZpsFsfcx+GswQ4cQaFj8OwNvPDhQrXbp4doc9d2smquUSl1DB4y+6DZ98J
	 XH4zg6pmaU6rW7ItgDZeouB4+RgKhVaflDpHz7a94hu1/VsVVoSCG4G6elSzP/IMDdy3I
	 mpqZHMFK1j2Lvi/bSaiYDrWYxlrdF1ZQGIqIRDTuPV5kRzxXT2vu92mZt0F7X6+lf/QCz
	 PFS9OD48syg3upi9ZW9M475lRL5CwrHXgzlGZvNB3NBMlhrNDlXmP7gdVbHmVIkgwag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=43XSm/5Oye+v81W5sTWVY2MRJ2snpM9u71zn2mup/WM=;
	b=DTFG5bkCFt1/b6GE3MYGqWMiXwmVGVVeMf9k6vwdt6R/ETDtCllzULY3b5eQv4VaENMg
	 0OWaF4mOi/BNQSwt46lLZiBg0Av586WX0vpuX1GmnauJbcZUdb4+rLtYC7uByq/9Ei+o+
	 uz9JzB1cdc6xh7rC1/uNrtCh1m99j7xdDvgCdY8zIcy2HdYVnY37GVGgFizamODq8m/cs
	 kui9QoS8apwtqm3D8Jk9I3JPdFGsRYg4oqINA/Jx56pPwzvEiwNngU0tDfdzKsYyDO/8N
	 OnhCbVRsiVJ8OTJFj4Kv54kcfB1dnbWFUfxsRdpAldkAD4TJDuES9MmNzXTGkZ4Z+2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=566LQgT7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73386606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73386606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=566LQgT7
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67dae7d3f7dso2666328d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:06:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795305984; cv=none;
        d=google.com; s=arc-20260327;
        b=qtEPc+8ic6pCL4+9dJkmF1vT/Hs989jsVOAyakZHDZYY/OLHjJUwwjUFSldZ2nPM8H
         vD4rtEJBVtOXuNU3RpW3fRYCKnmXesAdvXElVzyMN9m0erHSHTU7uyx/8bjphT5QZ0g/
         dCE//5OLOhAvxyfV9NYkHm3oar+0qZsiDYdSPVA44GuN1UYXzrPfdipmCjozJ8eKUdgB
         5ABO3Zp9c5Mv4rzLpVhX2LuOafbd066kSXfhLJSeDduuRyanBaFIvwbKfS6M1T0zKt4a
         NH+fFVLVEqr4IaxEBHyQOrj5P2dFM+ci4vx98hb8rXf5O0icG7hT5gSfYgAowDMKR5ks
         tWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=43XSm/5Oye+v81W5sTWVY2MRJ2snpM9u71zn2mup/WM=;
        fh=l9Hhrr8A72isawjNsCIgK6aelG+xFrIK0COTbzayDjQ=;
        b=JR8TQmqeP+X+r4fZBCMpCwcD5inVMpgT/BLL/LoEdVvRwVL23gHFrZfXnIzk9v5S4T
         UZigQ13tVXNCjQSbecq3FnKLa+fpPu/LlU0kNT30EGJTu9HT3+H9srtnbmFfcXcJlIrJ
         Srxt87SPwnrHeT5FvA+u5fZ5wfFmJnuseKn2Y8AKj3zZs9edixe9M7sPR87M9oTH9bbH
         f6RJd9IVgjJdUS2SNFKjamrhpTdt5pR8xOS5uSLo0zZUYUXk0nPr9appyAbd/LLQfaMG
         zka6DiX82Ajfb89XU++u6UZlb6YEAtg0kvqzq18BwL2vZ8rfDDNXmpndK0N7Cz4Sox5a
         mmDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1795305984; x=1795910784; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43XSm/5Oye+v81W5sTWVY2MRJ2snpM9u71zn2mup/WM=;
        b=566LQgT7esq2VEf3NoVa7rCAvQ8TecHs/i7tv9HbFirGVyPs2RBtUUUqmI12VYGptA
         ah6D10dKs8SXFrmuKX3qKhw3YW0Xwa/+vYB8dN9K+ipJCyRuFbtTIcyDMXAx3hN6nxcF
         +Xwy3CDZQUgHCj9WLDbpQnD8tGb2Nn9WSkZ48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795305984; x=1795910784;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=43XSm/5Oye+v81W5sTWVY2MRJ2snpM9u71zn2mup/WM=;
        b=kFArYdCYikQXmhtuL3iREzvEV5t3TqYRwwjFw2aLV+milAiujtwmhx6Hz3j2awVhSy
         fvdgeTzmw8zzx+y5u0AMp3jceJcPO7y1BTD70TT7+2ie4u+vULTX/aLFTwHl7wX8a3o8
         7JH+GF/iLynAxm1t9YuBfZC5hlDdUiZtiyfPaeD8u7ZTcWL62xeyduehnNG+kSbOTSnx
         ocMytOKcHaMC6bIqZVur1eywWQgZvn73UZcshCVub5H+igh2rFOUs48qnfl3721b8rEm
         XSnJTV+yFN+eE6T3QHQs4JpmptCaMUnw2CV1Vb3TVREAUjN1inUAU+zD06a/gfG7Xq6g
         pYIA==
X-Forwarded-Encrypted: i=1; AL+hErHdPNtMCwENb2ryvmLr3ohvshT+P2NAb6oZ85THgJIc6DBx+c64gWIEzgQjumxrE8f3QJC5acG6eCvOuAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LivL55EwZh/pE9+V6EpdhbHDp0Urf24aWMnQWHdnhlc9USxDF
	VDQkrDDMusF0yAGYqssm38StEXf6mMCycqhMfqHOljcofTkINTEC5Kwn4DYSMEHGf7wXTY+IHZ9
	DQZgkLH08bgXt3RWZ+jL/32RqhpL16OuNqBYnb/poeA==
X-Gm-Gg: AZFdTZcZKUNAz8uuBUZNJr7VOtvPvvBVhK6MIELUTzUzYZwNccmCRS0vkCtMtvEnocX
	YCELSzJnMLnw+0j7/rlcch/w3jqdPeztBBZDavaovMT06oRm5IifEpNsAHv1Mem5v4EfSV0uAfU
	xK6DjXS2amDigkYCZT2Tx/QOYUV77iwth2VgChS4Xje/8pXfj5ZAQGA+qIPHq35mzS9iK2URnGC
	cIMj7PoLd+v+MLRIJuP+FQutDwF2H3ZyzLYswrmdMRlGFBzC1lhoZgimE7qjHdWQaXQsFxcD/lY
	ydAnP1fFJJu0LDueFpB3rYOQTZzOX+ssCKWD+8BRFM9c1Ai20DnRI/yG9w20LAYcTFKTzL9utq0
	22U1rt/t3gdf22dOcxD2dkwA1r6rvyg6/OU0ruYz3YrlzseU3gZ9ZOTtOYfPIfkrgzLelmg==
X-Received: by 2002:a05:690e:400b:b0:679:c17e:407f with SMTP id
 956f58d0204a3-67df42b59e6mr2399497d50.10.1795305984101; Sat, 21 Nov 2026
 16:06:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005-perf-symbol-memory-send-v5-0-165dceb2b049@uber.com>
 <20261005-perf-symbol-memory-send-v5-2-165dceb2b049@uber.com>
 <asbDJrY97tRqoPaR@google.com> <CA+w=M=TtAfiHVQqiwmchtsWwNeN5So5MxWW=82RRAUXHhg8D+A@mail.gmail.com>
 <atTzPJJvR2-sqtJn@google.com>
In-Reply-To: <atTzPJJvR2-sqtJn@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Sat, 21 Nov 2026 16:06:08 -0800
X-Gm-Features: Aa3M54pmvrE4E58Pk7_kkWcO1hx7Txyg9UmbRekqT_g6DcaxVJXnk_2vAMUNgOU
Message-ID: <CA+w=M=SOVcLiy3Bs8CKpHmKYMzyN3BOBjV+8wFWH6xoo-DrE5A@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] perf dso: Allow reading DSO data from an explicit file
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Namhyung,

On Sun, Oct 18, 2026 at 9:26 AM Namhyung Kim
<namhyung@kernel.org> wrote:
> On Sun, Oct 18, 2026 at 08:09:41AM -0700, Alireza Haghdoost wrote:
> > Unless you are already working on this part, I can send a separate
> > series to make the data cache type-aware. The series will add a type
> > argument to the read API and keep separate cache state for each backing
> > file. I can then change the lazy loader to use the data cache again.
>
> Sounds good.  Please go ahead!

I looked into this again after lazy loader v8  series [1] and built a
prototype before changing the DSO data cache.

v8 checks the file before each lazy-name lookup because the saved name
offsets are valid only for the file used to load the symbols. If that
file is replaced or overwritten, the same offsets can point to
different bytes and produce wrong names.

A type-aware cache would therefore need separate file and block state
for each binary type, validation before using cached blocks, and
invalidation when the file changes. It would also require changing the
lock order between the DSO lock and the data-cache open lock.

I measured a behavioral prototype on six workloads. Keeping cached
blocks for later name lookups did not give a measurable speedup. In
the many-DSO test it removed 64% of the pread() calls, but the run
time was unchanged because the file open and check still happen for
each lookup.

[1] https://lore.kernel.org/all/20261121-perf-symbol-memory-send-v8-0-370561cbb5a7@uber.com/

Thanks,
Alireza
