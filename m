Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630429;
	b=VYfsVI45HS6ED8CgclovorCsHh0jIBTXunu1BE0JMYXSq1MxXfpz6b7LK/J9WqsmbdQF
	 kxPPQ4jUDjKvB8wXOATpFbWlR0q1/0CYMq7BS2w5cZxtqS/iFpHLqS0sd+ea799otmujy
	 xu6LzSWT7TxsXGG/RpzXPcpLsPsDaGKigUCthmrzld1Po204Y0gDnv+lsT92MJUWJzdgI
	 NhbGk3MGt0JsdedSN8IoPrXw5KBePQagRE5Xx4G6ZAWZpNemFYC2HlhB1/hWSQcs+jSGI
	 QJBLrHr7w+wZzvNwaoossmMwgtyToHaoUA2imVrmtunaS7/tkQ/6/D/idlPoezMCP6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:
	 In-Reply-To:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=8KCb3jyGQ/bigmlFvziRGIAlAhwF9099ubuYHNXm/ls=;
	b=2oEbIqpDU4GKBNHIURqsJ1goo7NEibhnWTeptT8XtheM6qyUMvklQ9e5T8uI86bE1TiT
	 1rvEI3p2iZyTjOf7kg/kMfCbLy+Lv0FkHuRdAUz83J+UIs9eMT1IEjS9+eUIP1ax9Ps+f
	 GgqQrEDmgFSFhrfS2vGsN25VIPp225Fure28Qs6rlCqN2OUPuSt1XUgIoRKbwbdaP3TBd
	 j1jxGIz/85mFQIbnwBRVF6sOtR7emDO/p/3/D6kmV7GMFCh8rADBrBWLaBKowG4VJqA7+
	 6F2Bri3DBE4Iw7Ip31D9h1ZXvMGQ9I4QxVE/cenHFnomzZnIA3R0h16dXgGA7b1KynQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XwL2dDMd;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519F0606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 519F0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XwL2dDMd
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b238436265so3466071c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795630428; x=1796235228; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8KCb3jyGQ/bigmlFvziRGIAlAhwF9099ubuYHNXm/ls=;
        b=XwL2dDMdxOjPh99q4ez5iWWLaf9tJx/AtmO2pKfFiCzsJ3Ibas0cHzNoIbMtwP3lMm
         2P1+gdy33p5DYB7CzEfLaKB2Q0jnJIpfMoBttk1ToJ3AYC3u7IIIO7rRfH0RblTvQ5TT
         B71obICAjwtt3tPcgrEdgDiWInH1SActGSuN8hS2dObRWKDHmDWB8R+AYczXu+AU+jd7
         6GBSeq90n7vxJCTQX2Ylt6hHSneouOgbdZngVNLb0TG78ijxYYVpXPNb/FSiwUg9FGv5
         JkqFNs1ukyMy7R42tFZn6xJsaIjv0xmUU8ieAWOOrvUurIJeIB8+VYWXUKqN2KmxrvXk
         trYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630428; x=1796235228;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KCb3jyGQ/bigmlFvziRGIAlAhwF9099ubuYHNXm/ls=;
        b=m1ddh0v7URaa+oIuE8MXbtOJ3TX1GHcCWuRyVaD7FK5Mi3eiquqFPm6nJ+WbdEupJY
         8O+BFbqfbcaR76pVIfY6k++9pGBpQGDRsgw1EVZcqwy616qVQOkc4RM+eVR440wu+/iH
         MPtsyZlukinNCy019nJf7c5vtzmoA+vjYG+ro8u4U7sI5A/FnuGqmNNFSz5mEtWwCBrt
         9PCJQ7uZrqXYt7Ygyora3h+gLK7VDF9vQUnO7CBSz6ByqhCNPy2+u3lwCKyyfD04xaO8
         4UcWe1HkxnIc8pUQUvC7vuFoHQlPjq/3AHlJlH0XmysUvSTuBXpuhboUddKuTrCpkM4A
         2jUA==
X-Forwarded-Encrypted: i=1; AL+hErHT2gq+abnkSZpBtguM8ca0knI/U0btdNdUnYpj23hJyUWM4S20BtthRT95CHBCEgSQyOuXdbLTr9miDzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W5++VrdM45oET698hB3/Q3Eor2vGjkeIkb9MEZoTLHmSTPCe1
	cI9JM/dbaFK0uS44scvJnci66X652tKtBopjhBaLR3lOuBzNv/p58hyKss55d/OWL0FjpiYwT+h
	9/bGC
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from dly27-n1.prod.google.com ([2002:a05:701b:205b:10b0:1ac:f9af:14c])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1e0c:b0:1b2:5884:a020
 with SMTP id a92af1059eb24-1b5568700c2mr14495372c88.6.1795630427906; Wed, 25
 Nov 2026 10:13:47 -0800 (PST)
In-Reply-To: <20261125-perf_aux_alloc_optimize_psi-v2-1-b2ac7ed12849@arm.com>
References: <20261125-perf_aux_alloc_optimize_psi-v2-1-b2ac7ed12849@arm.com>
Message-ID: <18eb5c5c4ab1b230.3137322e32382e34342e3133.0c82.0000sendgmr@google.com>
Date: Wed, 25 Nov 2026 18:13:48 +0000
Subject: Re: [PATCH v2] perf/aux: Avoid reclaim for optional higher-order allocations
From: Yabin Cui <yabinc@google.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Tamas Petz <tamas.petz@arm.com>, 
	Tamas Zsoldos <tamas.zsoldos@arm.com>, Michiel van Tol <michiel.vantol@arm.com>, 
	Dev Jain <dev.jain@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 11:54:53 +0000, Leo Yan <leo.yan@arm.com> wrote:
> PERF_AUX_GFP includes GFP_KERNEL, which contains __GFP_RECLAIM. On
> fragmented systems, costly AUX allocations can wake kswapd. When perf
> falls back to lower orders, the allocating task can stall in direct
> reclaim or compaction. Yabin Cui reported that the resulting memory
> pressure can trigger Android's lmkd to kill applications.
>
> [ ... ]
>
> Reported-by: Yabin Cui <yabinc@google.com>
> Link: https://lore.kernel.org/lkml/CALJ9ZPO9XxF-kz5K67Jg8RtpiEmK7XFU3e+xDak6LyV_We7yBQ@mail.gmail.com/
> Suggested-by: Yabin Cui <yabinc@google.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Thanks for updating v2, Leo!

Tested-by: Yabin Cui <yabinc@google.com>
