Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795029316;
	b=TKI9+MHVuXrL/Pqz6CZ44Du3d8QWv2aPD4XUmZ8tosoya7pY5iIQE4G7h0zAB9oU5gsa
	 2bhTzyVjp09lLKUCCrTExH9k+wvr9aw+j1d41GgC+eZ6dm+NDyXrmXVBRsCfO6mM14d8a
	 jrVmaS6jlLrnYbDu7BZVInXjcOtprsVaDWUcFJO70x8HvCI3rJ2CYXGk7ItTD2ZUgQIgN
	 PYIMTFUJSU9ugZ3IHkVpgvOcJ3jDUD/evpCP8GZKgCFD8br6t3fwFvI0HQCto+A0v/lfi
	 sNHNpTXEh1DdRmxC7CvGKsidQzCUyKDzi/VWw6ATfHCINOdSe42+TSAEi1ovJPXibyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=+xA+qBnR4DhGTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=;
	b=Qe2kFt2jloLvgIH8UNU4vGhCQAU+J7pWWDhJWonl6T9Pwe4MngR2rYxtn0aRLOaAm6tC
	 fuFyq9B9cz7OMtT6p4Lc67ZmEOU3piDowA5nezibSRV70HxOZaHMqrM1EP32E1OufhKUj
	 m/Y+9Z1lR+95oFjbDv2r3pHnrgbv/w23O8gDcdQ930RtbfwkSGmGoUbK4DoSUm+aEfzw5
	 2OE0XscfdCEQNgKfQC9QLX8asqcXGb4DvjNOzrYSBSAVVrxIgNbmz1zZY9/lA6j+wYkXm
	 vKB/SEdihCFrTcA2pAXizXITjmYaqon7qpx7Y6M3iQ/JC34x8x+ugYfZAo6PjhB9WPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CI0coo5M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B05606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0B05606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CI0coo5M
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGcpv4172299
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:15:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=+xA+qBnR4Dh
	GTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=; b=CI0coo5MCl6PeMetoQwNQwkRIbu
	JiJgmxit9cRt2nDJWrdAARftxPhoMHNyIVJskaAed9S2yJwVu7Ra0ZkweQuyB5yF
	guA6b+B7Ror/Ay/Qt7H0gVuOq2ynwudmNifTkBxQAYnk71ts4xr1AaSkk4W+eOa8
	idyTtCCV0m4sS5SbBYGeYAKxD77vl1xiK52a0aXDUovzXZHhLZIrtRdrfVhCe76Q
	12cyZpAXp16EprTl+WZPucOgkRXsuml9kXyb/gOq3sIF+GsDHZrnxqsx5q2OGKk9
	Lta3g/1SFu0Ht7eUlEGwKj9v2nyojzUDtpEBFE/6gMcWgBLoOUalALEMPcw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu8g7a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:15:14 -0800 (PST)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso1026457b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795029314; cv=none;
        d=google.com; s=arc-20260327;
        b=nbFZ2VkMsFlqofwzrk3ZvwI5+C1Pa5ZSgb1YpX2DJVovRUI/dzRvRU+ooLzmdrgBan
         tAygUdkZdoDAsF7gG9znKRDqQ0a+Rkku61ndyHyN58sN/mv0CwkUNGlSNNtWfvBZv0PG
         byzfG4XL4tAvOSGv0jjxv62vxIQFxumZxrJt3Oi0etBnYkSMj0sa3LJbh/L8jN9iA1yc
         YMvB/G5NrKwEE1oPH46FobL/jYHfeRkD6yweAwe39vwImUhVAGDnMIznXSm5Fbqfo0l3
         eH0tEwZkcrPNU+xdRBwYGEYn/22KYkP61VFXVmmssnenEsrAemytfwGWcrH12tXSe7DA
         mPtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=+xA+qBnR4DhGTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=;
        fh=84oEJR3rtj3j1qwM0cpMAeRH1lctohRJeHPBobPRLEk=;
        b=qbpNaRG/zUAVvthFwMicHVAY7RYmcIxaBZY1PzXHL3W5iQr4GlTS+MzWHfY+GgZyyF
         6Hx9QjZUWCHz+CFGr5ySLAQ8vzsFeMwB3qSYlZ6DBH9hYQ+1iTWAlRBDkceV1umFwcGN
         fpNYmfbaUd6oCBLnajjLjkhQYjxbDdlTxOzKq3YThNL9RwntDzA95A7dS1UP4+eKW3wt
         vKOXhiF12pRTz4qtnpXMOWVv98dUC9G/61w/fZIY5exYBsPTVHRk+bb6INeR0BE5SuSq
         cqoPv08zuz4NMhS3sd+qcT3mkfHxmA7cAPbMDY8gYgsH9DoVs0pE2yWZi5N6nD2AYzRQ
         KZKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029314; x=1795634114;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+xA+qBnR4DhGTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=;
        b=jEI2bVjDgPT8EzRPmrZtPMi5orQ3CJTwWAu+BFl6+lcuxlU0eUjq1EUrtSIlXfbxmo
         jkVgAUr/Xe0KJ2Yey6Ez/M8EyS8LLQP/Ke5paJ6PhxFuivbqzEUv9uOHY9NXvS+/9o5A
         AUFenWNq2iVp3FP1AF9agGmT3QfiohKhxSY3RGglkFK/kijqlMtbihefdd1sDLKQRd/r
         NpL53JnGnygEjU9azNxrqR2WueZzJTm+PwaawjodQqeW6VrOI4QbWT2mk5E57Ou+WO+J
         EPKWc/s/oNXk5Ozwt3oEiiKsuZREcqQQjDeNjhMw/p6MmMtgfj5UDJUW7U30Kj1Ak0S0
         mK+w==
X-Forwarded-Encrypted: i=1; AL+hErGoTpt3xXNfkglLcqAYrQxVU9u26o7YlkrqctuEOn4IJk4YnIvVYTicJ+FlCrZoUO2LkaEJZy6paobdzX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZLRat4UdtYn+oi5jeP6XbTM0DFmzYNlc81ZJCW/px45gokatG
	oJmAyivfeBqIugryybs20bKmXU4QW3VsW1eleGxiKE+G8gFy7RILF+tBRnnMqYdEGa7nyHhaeAu
	AoO/fPgXLTZ/xfMNl5uM/XbPyNwV/MSN92HedP3m0V73A+NB06N0JaqlhAEPA1QpOazlIH1EcQF
	QjhbH8FeIKMNopXra72oZKIwlTlr9uTWHN7uOJWZE=
X-Gm-Gg: AYBFou2mKi6sj/J80uLf+oSREY/N0QLTtjVMMJ7fgVYCcvMsWnMa7p64zoWCYG7tPLv
	/4TGv5+X25LMoLeTS+ICv6iA0KLaufSZHXq7tS0e5w0OqCV1OvdG5Ir4NE6JkIf1gFyoOcnTltl
	OkHtGZ+XwSGQPqHzEoVeHbPF+n+fkZjWqyXEel4N6fSAx1w45RJRomEM3hTdaylm5oVvALPVu2R
	+8R3kRZM0Jw161piNEtqUY5S+Me/IkV
X-Received: by 2002:a05:6a00:32c7:b0:880:e4a7:b1aa with SMTP id d2e1a72fcca58-8c5d46deeffmr3344616b3a.55.1795029313734;
        Wed, 18 Nov 2026 11:15:13 -0800 (PST)
X-Received: by 2002:a05:6a00:32c7:b0:880:e4a7:b1aa with SMTP id
 d2e1a72fcca58-8c5d46deeffmr3344573b3a.55.1795029313133; Wed, 18 Nov 2026
 11:15:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <20261111005533.6436-8-toddfreed@meta.com>
 <ea8a18e0-12cc-48e0-903e-325a8ece5a0f@iogearbox.net> <CADh2yMxffQ3cywT3aNg3SkVfog5CFnUSp34F1esyun-xUBVa9g@mail.gmail.com>
 <4d271539-b2f5-4fb9-a4dd-32becd02ce5e@iogearbox.net>
In-Reply-To: <4d271539-b2f5-4fb9-a4dd-32becd02ce5e@iogearbox.net>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 18 Nov 2026 11:15:02 -0800
X-Gm-Features: AclHuK-4R9Nf7O3FLY7hrUyXB1KdmwvUFFQk3aRrICEDQQcjmr2v5AAMDg1nX5s
Message-ID: <CADh2yMyo1VCNKC58oJiOLJ2NtGqAFQfxLY3iNbP5mtQhaFsR0g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 07/15] bpf: don't redirect decrypted skbs from
 egress to ingress
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Zahka <daniel.zahka@gmail.com>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfXyGuTjWLOIpqm
 h+NKpFemCNNUJBE+QHkg0+DQQCvbV0bZTvRKzVzQmbosVeKJXyJxkxzVTQCNdzSb8bGRnr97v+P
 oYK++kCFzWDtNvxj71c3M3br2qVyldA=
X-Proofpoint-GUID: GWEIGMliHC9iAN7GvPCW9SWoGjTlwou7
X-Authority-Analysis: v=2.4 cv=aLRlOr9m c=1 sm=1 tr=0 ts=6afdf942 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=DIuMb9_t4Eg30DVr1XQA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: GWEIGMliHC9iAN7GvPCW9SWoGjTlwou7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX8ProWzpGu2Qa
 7aQcZw0IrH9q8fkxgzTDY8gHyLiagI821KtKUvzHY7R1In9hmAY+xoTTTCypEfmEQAJbXAA2FIH
 qL4cAYFdiVPcbSfLdgUmhXXFKwc3RMAhEReyRTZOxjEa+YHNCvvmO5kul1oNRNmtpiNWV7UYVo/
 3nCKQyZUw3WxyWMsnIGf+gTGhLjNl1OjzKGoVzK+9nFMBKf8VQBaxiuFyUW2K/fak6ko2m1a7Is
 PLh51n+AvwFO/gGiqQm1IkLoTRuK7zXchdHpPqTHg8PljlfQskzoedbaxjOGhxwhyLgE90eD0jQ
 qF59HRCzPYOz9Rh9HqykTuvDwD59S+PWkdtfowuj6plk31xOULfsxCAeOtUcgfQeW01yvGBje1t
 1EQCF54LPLrHU7rGdecEaUTcekoThohidmuNhU1TOlK0qVnQj8+XtNeS1Yt6NaLUMjFYTXScbhk
 muIh5T90MnLPZ0SMjMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01

> But why under skb_do_redirect? I meant just here:
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 532405988fd9..ba112111de22 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -2471,6 +2471,8 @@ BPF_CALL_3(bpf_clone_redirect, struct sk_buff *, skb, u32, ifindex, u64, flags)
>
>          if (unlikely(flags & (~(BPF_F_INGRESS) | BPF_F_REDIRECT_INTERNAL)))
>                  return -EINVAL;
> +       if (...cond...)
> +               return -EOPNOTSUPP;

Yep we are on the same page for this one.

>          /* BPF test infra's convert___skb_to_skb() can create type-less
>           * GSO packets. gso_features_check() will detect this as a bad
> @@ -2563,6 +2565,8 @@ BPF_CALL_2(bpf_redirect, u32, ifindex, u64, flags)
>          if (unlikely(!bpf_net_ctx_get() ||
>                       (flags & (~(BPF_F_INGRESS) | BPF_F_REDIRECT_INTERNAL))))
>                  return TC_ACT_SHOT;
> +       if (...cond...)
> +               return TC_ACT_SHOT;

bpf_redirect() does not see the skb, so it can't check skb->decrypted.
After the program has returned TC_ACT_REDIRECT and
skb_do_redirect() is called, is the earliest point at which the policy
can be enforced.

-Todd
