Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795830512;
	b=t6/01xqoeJn0qOJ1yeyfEzR3nLW+mtKfL8BDUB47A1DveUqS/j6QIvazV83Lr9KJecBF
	 mrmKyQWaBl1wpSU5goeSThO//I84nrbR3rNLcc/ZMRZX9sqGcwZabOIfQspslWw3T0IGo
	 HBfs6oLyDGVQx0xhCbfVvx6HcaxEkSP2BnODpv5qyzjNNG4bW6mJ+kuulUKtOOBGO2V9z
	 pUR9pwEZQnHv417GnsA0C6LsFvceheXhV55Xdezrn8AewfQHbl70e/UWuSTnb+23YcOmg
	 xxEPYJdm+rz+UAr9MKl9UPDvA/v7QmThT555A8J5PQh/HXKDkjE5RAFIOtlb4+2dokQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795830512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=21r2hb/jryykCmBdAXC3ICR29YFM48iOqHSTEFvPQaE=;
	b=qOmXFXDRMtJqi79N1MCswWKKD2liMTikFIKVdTLt7fOJG9NBI9Mm+0fUB6Xx9nndmirB
	 iJR92mtrNd1hbiiaUwKmOHQiK4LTs6RV7NNGmtUXzvZjPPns1KxwDVYIJTVSzA7q/No0s
	 nQLwP3WWPlSuOb1xVWcC9ktcbuhROHVnqhODA70Z/ifpkNp9Z8cxD+37o5O4kQBSABp2m
	 r7rgNOKhevOJzxphpo0rolkgwpgmsV4J4hyUirGs/eGDIjH8hNkpSz5jo+dxO8UXvxVuq
	 eBiVnqCnKU9rxyLsjAkOKE3K+D7w8cz0nxTTLniT2y9uxIa3EVPL/TKkQoGRt7CKr4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFCsrOuh;
	arc=none smtp.remote-ip=74.125.231.139
Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A419C606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A419C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFCsrOuh
Received: by mail-oo2-f11.google.com with SMTP id 006d021491bc7-71b7aac1211so1190004eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795830510; x=1796435310; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=21r2hb/jryykCmBdAXC3ICR29YFM48iOqHSTEFvPQaE=;
        b=PFCsrOuhKvYWkecKExagreSZMqNIYx1J9I4Yf4CUrLdWpMnVcm/nOL25IFScfnTlDG
         EbehVJaCCimcsR/2V1R7vnG1t4qDYbdszIYo7hyfrQn8m+Afr+apqdbHuknMNYo39Wao
         AcXet7EkLqfv91/xOUshEi+N7lscAIojxeCM8xXhdKGRn11ZrgKgY1+S2XfIZjkEV31/
         c5M9HmOkN/S8uafflqaubnEL3hWG8548wZiXvnxbYdzKxH6hY6SeXJS+aikJ0mcdS/3T
         AnYsPsFTFIsfOboi5rt+NK7/tezwqPdGkP8Co3XBJEInvKX3aUa1J1sbas/eMwv5MQit
         simg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795830510; x=1796435310;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21r2hb/jryykCmBdAXC3ICR29YFM48iOqHSTEFvPQaE=;
        b=Pn5NxcWV0IzoNgqryL43ls8mxWiP/xp7GqjdxG+J3bgPdZ4YKl00um3SZwup3mRVNB
         kYPdb1esj55Pyn/aOSQmM4cykv9bd4IHv2GPaEGLd74X+ZK74cvYVnrp2yncrDpbQDqd
         ZJcX/d/EH9JO5AhVcLnr/QZa9lg4wUmSa560+6/XY/JQScL8UtunOujdzC7MAO7+dnmM
         SSxF/M8leoVH00KWHOjlMnmHsEuQoQV764bYBLqN8Yw/GftawVlNT4fm2VWh/aeA6Sdx
         tYe7UK+rIAT11IP8Ef9GlFPv1lh/SvQ+Nbz0cjxIDPtOKVjfTpsMcQwyLsMblTtZp48X
         UBLw==
X-Forwarded-Encrypted: i=1; AL+hErF/WqhYULfBxf99dxMdP4Hq2H8L59matdgcA4xWnZQ5z5qZAKU03ADlZO+P1aEd5u+qFgVBg+T1UIflPwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OctwuQx8Mi0NLJ+tTFgiixH8CbTKQawA/tmaIwAtG4j8h6ABq
	WkbFHuQW7fKi5/48Pa7qH+43vLODjpCw0uG4cVWD29XeosX2tYf6VK5I
X-Gm-Gg: AZFdTZf1CAaYKwFltsyWrd8EHpB7nNc1UKRlE4xM5DYR20l9ZReLgnBNnBsI7uOy9B8
	8Z1NCcylCchHjODSlPpz0GUmqjsQ64wqU7ikk8ticR1AHvfQ3NZOQF9rJrGi7wRVAVAtkpafKpw
	6Ev3hG2qLsytRxfeUGRWddGtO923Gfw3u8828vUtg0MIXIlCKb4cinAJKWMwePtFYdcX92UOqD7
	OVAYuMDV/Gl+VS9Cx0OkUbt+9vWhSVdKl+bg2YtmJbljK3jyphiPbDZaYE4L/XmVnmUHDg/gWgV
	uOKX3PmCbVvUbwv7t9avTtMa1JLEZEW5Ep6YNaIpuUJSuUULSaPACJTrN9nL2AB/BiiahXjXJtM
	EaX6OIv9aotNbINwtyKVO7ePN1POmD3Tfy8UdlDqYspOCwlHIuqpu/Ie/rYwcHRsYtrXapSF7VD
	3xD5s+sblJ7HQbmxSTYZ9bVfxieWhyPU7r2oY6CrF08CWUSSz6Zs9l5KN8A69T4046A84DC9xNK
	yYKqx29PhCilxM6nvaxvEa+eIxsw7EfK5bMt6IQINvnr/8QanW4uTyC8RYJ2naqyUAHel0GZjXO
	gDU0Hj8zkKB0gHvRjUkBb/6j+NG7lgj4AhnJvklMadKbOWSmmvbWhaDjd8w5U11B7VVYOs5eFj4
	XadBXoajo6TBNvlJasB4dRNDO+gKjRmD0I5q0
X-Received: by 2002:a05:6820:f034:b0:71b:3fec:38a6 with SMTP id 006d021491bc7-71b3fec4b36mr20333111eaf.12.1795830510586;
        Fri, 27 Nov 2026 17:48:30 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:57::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380bdff9sm17750840eaf.11.2026.11.27.17.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 17:48:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 02:48:27 +0100
Message-Id: <DN6GS9V7A3HS.1COD0JUQQDHQ@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>, "Andy Lutomirski"
 <luto@kernel.org>, <bpf@vger.kernel.org>
Cc: "Puranjay Mohan" <puranjay@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Emil Tsalapatis" <emil@etsalapatis.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, <kkd@meta.com>,
 <kernel-team@meta.com>, "the arch/x86 maintainers" <x86@kernel.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups
 for user address faults under SMAP
X-Mailer: aerc 0.22.0
References: <20261009024925.3169077-1-memxor@gmail.com>
 <20261009024925.3169077-2-memxor@gmail.com>
 <df69ab5d-bc97-4651-8668-a2b3e4bb272a@app.fastmail.com>
 <DN437OYZ5FGP.20VLV7ZEXQ5YY@gmail.com>
 <5f46d1c1-fdce-4f3b-9d56-675a822b2d65@app.fastmail.com>
 <DN4X9KVYMONH.VHKD1QED1BUQ@gmail.com>
 <03275761-8de2-41be-92fd-8e3012a87eeb@app.fastmail.com>
 <DN5K8Y9824AE.3GPOE0WP9ELFN@gmail.com>
In-Reply-To: <DN5K8Y9824AE.3GPOE0WP9ELFN@gmail.com>

On Fri Nov 27, 2026 at 1:18 AM CET, Alexei Starovoitov wrote:
> On Thu, Nov 26, 2026 at 09:30 AM Andy Lutomirski <luto@kernel.org> wrote:
>> Okay.  So maybe there should be a nice patch set to *fix* it.
>
> [[...]
>
> The main point that it's orgonal to this patchset.
>

I was wondering whether one concrete improvement could be to emit BTF type =
tags
for __iomem annotations in the kernel, then reject accesses on BTF pointers
formed using such walks in the verifier, so such programs would fail to loa=
d.

I think in practice, at least for BPF users, this will close the issue.
