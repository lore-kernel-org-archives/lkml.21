Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795564573;
	b=nikFErW9eFiwAlMv2Nbn7A/o0nrdsBcPqopDWbSJFMlFYab91Da1yaxVH7wJS5t+VHOQ
	 lMmiJOjyHbyZBIqPDDivlu+4ptK3d3lh+cbkq3tisVem1q2enTVOJU9vT8AYI3/l6zx72
	 NbpqChCiFRt97W1WerEbk1sY1vL/txyixzlXKPrgADPNG3ChF3rrrlSMlxOWSes/MZHro
	 WsPYdU/7pKt/Z45gT2ARLMo2b0oR1fLnjU3629Fq/y/SOwWCeNa3ixPinAYQMBj1XEhG0
	 sDbNAGRTLv+ahJQbKuQw77VnnPQLWVLhLllOXz0+nQpqPjkbU+yxckw+z/wQQRa2+KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=P9obVUdl+GBU+uYDBqJj2c9nK5zYkSjOyVqFSSATZbA=;
	b=cW5NH0syqmXFbOlqqfmwDiUU9f04IusYc3jhQTTe04gBe5HJxzK0htSOJOGPj2SXfzjw
	 dex+bcFnefmTN56lCnjQmo6zzUKeD/rgKBNb/50VKXDHa2xYwsbzqt6TBE5FNRLTrBZUb
	 Mw6ODp5ohZhIB5paeVAhl2xgxxbLiPAJbGaC6ex9FTspKinanCTSeonXIdNVC8dNFcujv
	 a3tknXg81jb/psS8Z61GrcY6N8oKkyoDhUO9mPcQnexuRMGvXxtTpSdgccUM3BtcHD6FE
	 f9UOK4v/X70qYYANGMTpOTK6qSNT1kkdgNNsh6tGAHfNocL359NVBKshPYGlcHoKftg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=fail header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F095606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F095606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0d126f631so44537197b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:56:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795564566; cv=none;
        d=google.com; s=arc-20260327;
        b=WT3JU7Cui4klIGT3FkPKIaQflWNa8q775JtEYN6ZHssq9MBSlRQGVKPdxyC10ZVapI
         9sFukqWkqdngsgWT1hI7JD7s9TRErumTv6DWHJsi4s6PPhVq5WijsvSwkwLqamyWeTb6
         PcMYVI9aNmgdLmmG06ghU85nZjL1DJTR3aZPKlZp4leO/RGN8MkFDilVzghjxWFSDe0U
         VDllfPuGQnaAPDm3n0RElWwIdsxA/2hj+9WYoPw6Q2JJly/T2Bj6MbuxX8CNxdVFwy+T
         amF3sMASV6XGiu0o188vi2vNyiNglglk31hqFpRT8rfWLqwbBk1WzG6xYFkNd2q9C7wI
         urzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P9obVUdl+GBU+uYDBqJj2c9nK5zYkSjOyVqFSSATZbA=;
        fh=JTnils7MReNE0lXKoiEUdyWojt5tmeruUZQX4WbVLxo=;
        b=JvSfxc0R3XenXRvAcyRu427RfR2wOzTTWVHDMrJ9ZZAw0ttzOPgg67b99TQ9LwKe/C
         F4cjW319oMmPIB2HNx6h3SvAktdFFNFFQJXTcInmik8EvH+0pStH3kYUCxTH7rWdhxRP
         sQ7kXL5AdWqpnRAWcsvLuuk7jv4fCNX/TWn/aBMYbMmmYL6ACEH3RyaXXR9PlYGMG7wO
         zjDqAkapvYAsD2ZTMvAi7ivnDw13qqOhMSZ7+MWxV5C4VTA3tKRj/DC3BgZ95d6j8Tt+
         cv7LhmOAVXPecEQlJZmdBipoA9xdUNRcOMcOzHgknJQdw++a7vToQVrBLlTchGSRUuU4
         PvkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1795564566; x=1796169366; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9obVUdl+GBU+uYDBqJj2c9nK5zYkSjOyVqFSSATZbA=;
        b=KQJEvgV/wKeyNB0KNlqJX7snbc3zIKOfTZAql6AWP1TzCR1jPXYC5r2ywwSIKOIQc5
         rmcwo/xbmMmraNu4ITwffvnRK2u8YrS/ZULaqClugFZqGD6CCkOCafKAMO21gFooKWfh
         GIBVcQ0xmghVc9yMr/tdy+Dr7D+6tks4eF/js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795564566; x=1796169366;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P9obVUdl+GBU+uYDBqJj2c9nK5zYkSjOyVqFSSATZbA=;
        b=HN4QB49O/4Wv22yPGFIZrQ9XRo9kTdBNpFVzL9qnZlWku0CpeRtUgKCtn0KTTp757O
         yrtcZ/ldq1CKj1RCm1hzb+LZZn+dkcodK7s1vpPktXxt1x3aOF6qghPlOEV7sbcP+Tsu
         RyFurEPF+Eb2dP5cXa9cU3qCqLJeIp7rLHKZaPoCgWO30MTmEPjMChM10wx3/LLRSdjd
         NreTHeVB1fjCrveEnkGaVLFh8qU6ucJ5U4EsD0viGvxnKkdSlr69X2E3bEIHtbThy5Uz
         ZJUsXrfvbufsJj8uuzT68yEQY2E6k13u4P0ueqEtm48K0wpqu4RszibaQuH564h79dls
         75jA==
X-Forwarded-Encrypted: i=1; AL+hErFsGhMOG213DvwBUhSiS8gezSdlhwZFbfC8scuB3DRV/a8TvLa41w6OCH31vXvljlNH6ACV6xpBoBvuc+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6ymhV6L6ZMH0vTcE1RnM4EqaqlMp3oRRizbfgOmU4m8IpWzYO
	8dRNUymKIu4Jx4Kfkvg5tmrQsfHTB0KoMG2/q2wzuKp+8mzCDVAQmjXHFQd77dUii5aLVFWsiyV
	EkQxJUaa2LBNC6AHYTotaQPW1a00vwZmKcZqXZCUdFw==
X-Gm-Gg: AZFdTZcpzVx0LzBWiK5QIZR5kAWmN98nxfYgUqrUAqhGnbXdqsZzqT5lS3rNoUyWai3
	CGGQ3IhlqUMBUR/jg+5H1S+PoaNijXfSsDSRPwTcSb5Vy061KufMaMZRoZ5W5npQDTfHkLK8QL2
	iKz1PZPq8tu5BCxIaj25uYVXWur7e1/93QSayLdmzyh2/Y4inGlMMpd4Zv92lMwefD6m5bClnZS
	EUvPGa3YRxup7LkQHVXJqDl9LaYTI+0q5Yzd67sOR7Z3UEHvMJzCJl667hPt8AUvSL01rjBKmjt
	R6wbTDLmfeb3+H2lPCJW+hlUvloya10/xNafDETVaDqLq8XHfgIvpjJLU4mb9P8HsXq8X4BAllM
	kCqzANsEVH2We+8sNpc1eVLl+w1jb/SkJtTGNPaUJBiwH8FIPvCK8vo+BTDlWC0e37LEYzr4=
X-Received: by 2002:a05:690c:3610:b0:8b3:2250:aed1 with SMTP id
 00721157ae682-8b52045fff4mr69121787b3.26.1795564566176; Tue, 24 Nov 2026
 15:56:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124223109.820609-1-irogers@google.com> <20261124223109.820609-12-irogers@google.com>
In-Reply-To: <20261124223109.820609-12-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Tue, 24 Nov 2026 15:55:48 -0800
X-Gm-Features: Aa3M54p0wKfFj2VYe_421BdDrEqHx34EbkPAmcEFEeQK_CnTJxGvYmUYMfbbS4A
Message-ID: <CA+w=M=SDh_XybPCxkLdJxS7GRVrx_dgjqouoHSi3kLew=NUM6Q@mail.gmail.com>
Subject: Re: [PATCH v10 11/12] perf session: Add dso__session() and
 session-scoped allocation wrappers
To: Ian Rogers <irogers@google.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 02:31:08PM -0800, Ian Rogers wrote:
[...]
> +static bool perf_session__try_shrink(struct perf_session *session)
> +{
> + size_t freed;
> +
> + if (!session || perf_session__in_shrink)
> + return false;
> +
> + perf_session__in_shrink = true;
> + freed = perf_session__shrink(session);

Nothing calls these wrappers yet. Which allocations do you plan to
route through them? In v2, __symbols__insert_sorted() called
perf_session__realloc() while holding the symbols lock, and shrinking
then freed the array being reallocated. Knowing the call sites would
make it easier to check the locking. When callers are added, could a
caller hold dsos->lock or a symbols lock when the allocation fails?

Thanks,
Alireza
