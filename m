Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207333;
	b=dIntEhTBg0t8zy0dk3ls/5z9JtMpdA7z3TP02RKwSqnQ+55ylM3KHPlzVf6a0XmYZdtu
	 um45VCbmS9e0qhW7fwKYYVh2Cdv9XEkg89zAvcJg6klrn24paAKLk3uysEasuN3xwMR+R
	 AhftrdjRh46lOT52Ka7LtGNZtST78B7ZfyTl5aAKFECDXq9Jq02/SIb2c7YIkjrTHE6Vj
	 O1/8C4GLiFy9xOyZkrlIu8k0nJA9xgzR5WzviVTtMn88u2FvWeHcfr1mGvFqvMyl5Iwn3
	 GbIOZEAL8WpK4y+K2wonpLpnhPGOLD8PruspwXd0ubOTrv76+oe6/13qLwuCKI2NH3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207333;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=shmJAbGA1MISsC+6N7az7V5nNrP0Lt5U/4QpgbvguTg=;
	b=ipjx/Ef01STR1vrb9DuRtdU4hOBNEedGP+LShhlg+LMbkPIP9f0TziU74kNXp2DIfOSx
	 5RI7nggo3nmGVWk4aQtqYwfxQMDYGG2tmnpdeAkUqdCXOZA9/8bI8c8AOMSiOVDZxR8pk
	 w8qAG9xyjpBf0jEw77tEkHYyWIv3MuN/gmhCCrfU6QtnGLnydyX1rHccYme1IGvwesVKs
	 48tWg9KlgJJOBlHHNOoCzTV1WGhvoT0VhnASp+9IuEpQwVvUYv9TXshcKp4dQJLve7f5P
	 c9xnaugfl7I5eaX7HrssUfHlrbSb6l0oTC/a4MAUciLf/FNYhBg5JIXbfpHkoHRfkOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09941606A6E4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09941606A6E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-94965745d92so135191085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:42:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207332; x=1795812132;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shmJAbGA1MISsC+6N7az7V5nNrP0Lt5U/4QpgbvguTg=;
        b=w4nzGiAJchkEJ7JQywxQmq3FP2trNTrnq+r2SHdr2PtG/mZ0OOSupQE0oASAmvV457
         SG1Hx25uyF/BQyNE1VX818oBvt4S/Eh/N9G1bXslbVBngtbp8j3EG/w2PRLBmLCW94ZM
         tLPQ5Af/BSWwIcapL96n3jf2SsJFl0MgZBbuE1CEvVI9/jlcbJnjR023b0IXDm0pMDmj
         0PbW7nqlhT06uJeJ+KpDIMs0pmdHD2stZ4jlJoIKBMruE1aBZDbqgBPk1aFXfeslcavw
         y9HxZmh2f3ynH0BgF777U8PpBupjuT6bbF6O3v0dLPJTdiyZyIFsWKDzw439uQDtkad+
         fKFw==
X-Forwarded-Encrypted: i=1; AL+hErGFDkrzNK7ylp2YDtJUixKTdxgmxM3lTXXRfc6S1wVg72Z78Q5AsVKHDHrHfLq/dWCheKeSzIWeQ4n8Xkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e1NoZfO8XOv8bPyrAIW68UhyqWlQuS8Cg5xGzdDYv6bLZYtVL
	S6javTFr3bjpmpFp/8hbO+GWsihYuRsvHZKK7kDaICewovQQwbl1otBGi5gUpg==
X-Gm-Gg: AYBFou18xUMCwIoa4JVEOyXMz3QQrZzNl8+n9P+MbMDVnhc2bVZj8Kubru6YVaXchXg
	15vTc947AdpZT8MqFVztbwvhbt1Q5BtGVJikoaf0GcvD+n8dnNk+G/bTJE/CM/XtpjQIdLwaAO6
	hRZv++KSuxMb6Yx1TUMifrteT5wiXc5OIsmlz6gpy3Lpjuiv8BztBSpdM9gJj1XgXnlzdMe6TzS
	7g7dKItDjIPxgrcDtIr6X80e4aS/O6oqT4fEfgX/ZKgXfXpJaSxECx1ndNFBb7wUI/ZmA0yAaof
	AKAjK+bFALxVL5BwEghJx1/6QfiZXPkUbZw8VY5v/tzIl7M40eCHBU1Q0oOGFuWe2cO2FhBiIW4
	eiFMAmz5A6Yon/+jfdW98NEaVxGPMd3FAS9dTEo+sEheTLE6kXHl5TTLjWM2HWQR3NJAS8w52I5
	hjPtfYHPvh1o8AEIqIgUjbCo0IX33YsE22Hgqk8A+rlhcWJ3ZLLb/hOs1HwOKY1+xzzgR/ntW0S
	KVhg0hSbD6d65ULIMJitcMP0KS2ML1ZyY2nxqa/o1dY+JcieCmaZLNNrLq2qNziX942oFq/gvJS
	yWT9mg8a0BjgSZ7nkRSPzIbOXg4boytH+LNw++ay/4wNhTTvrB286mdDIJ3Oauoacz+LQig58Jp
	4hJcR4Yp9xOrMXvgzJnHtqWHyDuo9FqZu1M5kYO+A1cslQ+lNeuBd
X-Received: by 2002:a05:620a:17a2:b0:949:6e15:e1ca with SMTP id af79cd13be357-949ba965b33mr726231885a.19.1795207331941;
        Fri, 20 Nov 2026 12:42:11 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949c555faf9sm158988185a.0.2026.11.20.12.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:11 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>
Subject: Re: [PATCH bpf 2/6] libbpf: ringbuf: Prevent NULL callback crash
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711424.18576.15326586614235160874@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <DJAWPR7RA9VX.2LHJ0V3EVGR7S@etsalapatis.com>
References: <20260613-bpf-ringbuf-fixes-v1-0-e623481cb724@kernel.org> <20260613-bpf-ringbuf-fixes-v1-2-e623481cb724@kernel.org> <DJAWPR7RA9VX.2LHJ0V3EVGR7S@etsalapatis.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Can we just prevent a ring from being added with a NULL sample_cb?

The NULL-callback fix was merged as c0628a0659b6, so it is omitted from
v3.

V3 adds a caller-owned iterator that returns records without invoking a
callback. Rejecting NULL at construction would prevent iterator-only
registration. The constructors therefore continue accepting NULL;
callback consumption rejects it.
