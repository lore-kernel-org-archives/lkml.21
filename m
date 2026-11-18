Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036369;
	b=3xgQgvsDdOs28OkJUAPR1QDP5EFaij5eeDTK2IfYyk8ynxNQImc8o7RbMMnb4e9ITbOe
	 pyrrRC1ZP51qyvwOXu7tApaivkg6Gv9zhaDU+aqQM4wxJEh58ev1ZRLzbc0V584J1GUb9
	 SafiRmwtrnm2GT8wIqIF4gTpwe/Rg12BzbAjKlRiTXikCjic2Bd7k5U32aXMQCMABnt51
	 OPgj3veFDOZkP8Jp9z3J+9nBXo2V362N7OWtE5p8r9E38yRIgjI9quHy++OfH7HuhePuk
	 qjBG35Xy4PLzb9ew2oWXsJK8SaU8a6262NSBPLADo6tCoKOJ9gL8074YZPhJ4FWIg1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=1e/TvLg+e+Z3bp3zIHk3TfdEQA+k1gn8aVFItKGNB84=;
	b=cpM7F3SYjPE3c1bqo0BQ4PKZKvEk/gy2jw1gvbrjMC4GivWyTZ2tgprx0ZKknArVsYCM
	 4bOYohBJ6BxMd0M0Yw73HZ3EEDI1ZXNwhR3WSh/1X5LiXo/MqvvNq+gNASiqdb9Ae1ipA
	 Ep9BuldB78u2neVLrAh3TUF/Pxc5ioA9ikpwnEh6VcLehdKr+N2NMKOMBAi4c2yY6VUuR
	 3wMiYapxBENaMsRPuySw3EckDy4PXNT5DF5DnWVwVPYgbJtopkNtbM5j0q0zbtUu8IkRJ
	 LsvMJr2ed21B/ytVe6680Ry3TueFaTiBVKTK/NYNal95QVYCJ+D+e/4SNG4e6rHbXZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C2zY5yEh;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6530606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6530606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C2zY5yEh
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a05b210703so918881b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036368; x=1795641168; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1e/TvLg+e+Z3bp3zIHk3TfdEQA+k1gn8aVFItKGNB84=;
        b=C2zY5yEhV0jVQa5Es4QLgNKBGwQt5BR94udPyNfmkDm+V05flNM8YhTf+QIt2XRj6B
         56Q8j7JOInZWEyEwyEL7G7G1ZsUnrujxZri83UvI4dVnpWiNLyhE8LdNEJpLjh6W0TrC
         DyA1/cgmArj4XvejyCEaLIzYYS6E1fwWAMjtJH7mMbgFud/TBleVSKCDZpMwVI0ZU9pv
         p3Y0ebhVSbhT8awd0Wdg8gqgE8CIXSwB9Pi3x1UzuJBzh00WgqIHd53gtT+ZCDwP55Zm
         v2uGfUDvrBoGCNBNk1RZ5ZywB4goCyfEsKvsxMVVuPdDQ1kLq9C34JWblm19J/p/ktHw
         LCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036368; x=1795641168;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1e/TvLg+e+Z3bp3zIHk3TfdEQA+k1gn8aVFItKGNB84=;
        b=P9f7ZBY8CC5t8nkMGR5eoYo+aAEe6h5w64Am1IMHfwS7Mz1qtJ+21WD+h6xUf6lhc9
         EkueV+aa1R9wraExlDqyDm9MYvBRFpI0Ufjxyny70gvQ8mTbl8cC05mtdQo5AnkUZ6PA
         dmvQxUcMFwRPFuzrpIF2CghMKZcOOBkmygGSAx7exYuiN1US3BTK3YWq1v1YWrdzTtjz
         M9xEWD7DTWnuXiwmJXkqItyaV6DpDaHQd8Bl+iuDIdQehjbCJtEjKwqou5YBaXvLR/lK
         JceYmk9pXTxTWzShC5QWcroY0w6Eu+Zsm8jU+YD/h9BDENzOY0T9RGtoiD5R2IcG8qhh
         W2RA==
X-Forwarded-Encrypted: i=1; AL+hErGx4WucZeGIghbVy2yIaIVsWz2uBVtQsRPVhWaRQ2SugdVMAgZ5eTay1UxzIlVBtvVxKavwqae4a7dgYII=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K/8dZlIA1e/qub4EpB4T2hJuoc/v/ngRVj7Pk2N9xzEF3W3Ek
	mtd3nCZfJDFEMWZUymqZqdsSb7gcUCRlVOCyHVWJTNa7jtor50cnaLlU
X-Gm-Gg: AYBFou0kbMLYfKAQT0O1I1diaSS56e4tYO/xhNp3y/AS2p5ClVyDLTlztrLMaAlrdTl
	9HgfpU5DAl9LsFHGkRkbqrf2n2Uxqh4SoSDlvWDKvp7iTvl+aWvhT+ptVpatMN/Y+ei/zBD3pAc
	A4BNtRRoqH8Wt8+llVhmiJpGovHg4yvj9Gn+JXRsLDD0R9MziLa0Tv7SS6brckdfT2V1wNBHZNL
	WM8HqNfYHvvHcRGvI5MqKVhcESrmgJ+QZyej6O3niu/tBHURzChKE+ZN+hWAkD18cMyCuMRnFrS
	q6vgFfU+ycUikJy+E24Z377QTsLu0gET+4tq3b6BoIZbDzJ85545cy0BlDYrXZe93HZKi8YArrh
	Fwz+kp4lRIyWxF2MBTqSdBuuZLv22WyR+VdwvwaZrIAT+94KPMm57UrxfJ5mRx5xtrCeo4s+Q7H
	k/T+37Qfg2eLXRePZcxNyeNskWorgZiK6oCQr3r8wz3ih+GEV0hOdVjzR4NKGToPR+vZ0ERkwey
	0+OGGurzwSp3sFo4fxkiH+L2G3OG3hFrI/G6Ce71vQbve6TIcmpzHW/Azx3FUJksW1b6goy8XPO
	GNNXwYDoSx34IqsVPHG/JFOsm2IRcdKf6U0vGUWMGrjUk/nJPs8tyROy
X-Received: by 2002:a05:6a21:880a:b0:3f9:9114:8045 with SMTP id adf61e73a8af0-3fe980f701emr3110108637.43.1795036367942;
        Wed, 18 Nov 2026 13:12:47 -0800 (PST)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb35da49sm1732055b3a.38.2026.11.18.13.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:12:47 -0800 (PST)
Message-ID: <df72a9ab1ebcebff573485a808e45cd493665e75.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 0/4] libbpf: Support kernel-side kfunc
 flavors
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>, Song Liu
 <song@kernel.org>,  Tejun Heo <tj@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev
Date: Wed, 18 Nov 2026 14:12:45 -0700
In-Reply-To: <20261117192153.3384031-1-ihor.solodrai@linux.dev>
References: <20261117192153.3384031-1-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-17 at 12:21 -0700, Ihor Solodrai wrote:
> An incompatible change to a kfunc's prototype, such as an added
> parameter, breaks BPF programs built against the old one. libbpf
> ignores the ___<flavor> suffix of a kfunc declared in a BPF program,
> but makes an exact name look up on the kernel side, so the kernel
> can't keep the old prototype available under the kfunc's name.
>=20
> sched_ext ran into this. cded46d97159 ("sched_ext: Make
> scx_bpf_dsq_insert*() return bool") kept the old prototype as
> scx_bpf_dsq_insert___compat, expecting libbpf to bind old binaries to
> it, and broke them. 2dbbdeda77a6 ("sched_ext: Fix scx_bpf_dsq_insert()
> backward binary compatibility") reversed the naming. A ___v2 kfunc
> declared as vmlinux.h spells it doesn't bind: 56bbc91219c0
> ("sched_ext: Fix scx_bpf_dsq_move_to_local___v2 compat detection")
> fixed a compat macro that silently dropped enq_flags because of this.

Please prefer examples to prose in cover letters.
Also, please de-Claude the included prose.

> With this series, if the kernel's bpf_foo kfunc is missing or its
> prototype is incompatible with the declaration, libbpf binds the
> bpf_foo___<flavor> that has a compatible prototype. So a changed kfunc
> can keep its name, and the old prototype stays available as foo___v1.
>=20
> resolve_btfids fails the build if two of bpf_foo and its flavors have
> compatible prototypes, unless both have foo's exact prototype
> (aliases), so the fallback finds at most one match.=C2=A0 This ensures at

Why is an exception for kfuncs with identical prototypes necessary?

> kernel / module build time that no ambigous kfunc flavors exist.
> Documentation/bpf/kfuncs.rst describes the rules.
>=20
> Compatibility is determined by bpf_core_types_are_compat(), the check
> libbpf already applies to kfuncs. Of the 70 same-name kfunc prototype
> changes between v6.6 and bpf-next, it finds 8 incompatible (arity,
> return kind, callback prototype). The other 62 (const, typedefs,
> parameter names, integer widths, pointee struct names, annotation
> suffixes) were made in place without breaking old callers.

Do you mean that without this series programs referring old prototypes
are broken?

...
