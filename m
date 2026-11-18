Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795042800;
	b=ESw4ZFdJAc1GMV0sW4XDFWA6gp3ebmzNfSkrTbNkJ4ToGugaLRkYbL9L04axMqleaInL
	 TFjXYh/WhK9425JaRhNsyPv2Z5UflHm8icacwxIMSf7qKhWCiCshvaspDo3IBfppG06D9
	 zGuNVzDUihHmF95Jaqkyyrcf6RqIlxXJhxJLT+rw/BTihLMifMLLtNENJnKvofwiDdN6P
	 oUZx9uP3N5M2gogyFm4fDediqMI9FcGZn76xRLHy1c7HTlyQMvzLjVTJ6clxOHaXfYR75
	 tn2lo9f/RDs1q1uI8Yp6MeBT7LsPHR7ASMxtvXxal9pVQHhRQ3TT4Xapb0ITb9/sKAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795042800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LBiQjXroGIgbRFbCXNC43q/C52U0JtTLkOoI/rutDOc=;
	b=zaDFuk/XQl3XdSjU39QV0EYjFvQ7CkgAXnkKO/30y9ypYYfYvX4B5MsCZHufyGcvJFLJ
	 qkWTV3jX770eHae6gHXftb2rgYBdH71CmAwcamDgB6dxWFCfCvcapahu/0hnT08RHq0DJ
	 pbAm6yPsxh5NvlOa1jHYDDZ8fVunKRXov4/7Hihtp/vlFcl0fLME0mMLKSRi2T4f5IlwF
	 KWvVB80GJSa2caLygeqb8tKX9WczCFeoQTER7FCxv4rkBFs3/y/oxjCZN2jlnb9Aqm6BH
	 RBMWRaFjHmJaOa9tIJr6YPAhWM08owtOYBj+63WnHytPdvSV0Jf3SEiUE1YFLDYPwNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fK2Nph+L;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B50606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B50606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fK2Nph+L
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so97776a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795042799; x=1795647599; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LBiQjXroGIgbRFbCXNC43q/C52U0JtTLkOoI/rutDOc=;
        b=fK2Nph+LESqq7ov6ugJUsX0MzNHngmSsLwq4j3z9Ls+6kKA0V7OWOjf2BI8RW7bYfw
         eISYq3SbxZjr1dIfgpUkaYPAFAE0fXzXpIrDbATgeT4Cv6NYCrU9QALE+6avPv7yVW1E
         +2DPIYTnXqsrJINH17hg8VK3NeFXcnHgeOw4fsKrIOnZH7lYybYBnAeXSpXJGT/VyLMy
         SDrLkERtVIs8K4lNUA2LyOBQNvM+N1k/T9Wu2wemwuli14YawPEho9RV3hJe+QLZGmci
         aG5km4/kZZN6RLlSxfx5mKdLVDu1aKDkT41DSBrIgSHVOv1FnI8vgOxX6rHRz2w13Qbl
         t2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795042799; x=1795647599;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBiQjXroGIgbRFbCXNC43q/C52U0JtTLkOoI/rutDOc=;
        b=r+6g31IavIjpe2iUfRyMfVXl9PE13lxw6bIB/EiSEv97VKwi6aoRSc+zpdh2k61URt
         qRLZCelpVFpZRGF+TCW1kGlI4v/+pJtyDPnnsJ6rVQmGrZERpuAG23FrwdRZgCZAuclz
         9U6LWfrQlQWMuYsp2kAzGxhcp0PvhkGaRv73tJjBJKZfIPR1ucyrXHa7Ibr0fYg1WlFQ
         8MwlaApCjmMgglR6WGS6MK7VFDetmIgCdKGDV9uasnSiwoyoq4C8W3MzSe5iTqy5a51f
         UZiPrwb66dT5QYT72uAJ7uvEDafoBeEb4rslx5MWkCS0YLbkZJbmsvUHx2TViyeEt11N
         5XEQ==
X-Forwarded-Encrypted: i=1; AL+hErFoVxOuaedVXKgUpTzF6vGGWADnhfq5lN7ztnFn07QBNMiynpgqdMSUxbC8cR4UPhJlPUCscCP4uWRfjVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CeS7We1VcasfzSGULSh+sfUG4jvAtSY9MxZpQWpe3HK69EXfL
	1es/DoEZ2PiEc1JbC9jXxtCU0IGbH9AnRXb/1hIDPkaZ14nw0ph/VwupdwHc8jz6
X-Gm-Gg: AZFdTZfDyPOyX8YgurteiXDucWoP+Xsmzn+itxdaXOxhg9+wWMBVLcrHWWHaRkyyEaw
	zQyHwIgbOeUIMMLSdX7SgAk+2QsrSf9aPIjIYQhTEBojoUy2tmzd6IDQdzjAr+WoDTlYxWKlLNb
	Ne+zPk/zMfUTbNuKCuXe/k4AHfdMmNZFdap9dMDY3l7vASdN90T+NcJrxDhMCmYYblUrrMwtCpy
	Dtuc8XRIkUFPjpg17DlftztvQJOlqUobO4FHMdqXpOm/hDtNoiyC0ghg2PVwv6yrliDeXgcX7R9
	0R7rSnnfg6TQ85IbMP24RzZM0hI0LgFVekC8DL2AeP+pRpviNG+nt3GMf5Djgw5HtZ/WqQ76Hd9
	Mg/QJINIDNpGhvXfhNLghTaIx3gAg0LL8Ge+HxQIZxRZdIipdOsWBbgEaCkK70/BESyMsHBd7CI
	UxgjgwOhP2oNKixrTqKoFh8AzV/icGrsNsBd4yyI7WI2ZPoQtWrdU1tUPkT18Ab5Q+PcpuRP7Rz
	2wxuQBqKWnSpmIEtYHskYUCzc6aLNAHxF9JP/IenzBBIyIMcVju5jgesrxTjcvg/7876BvajBZJ
	APSAcV60+8wEwFl2DPDesuY9rl6AFU9c5ltkFCq1NkLA3+w49pL5pwfZ
X-Received: by 2002:a17:90a:e7cf:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3b3d07d45ffmr3520075a91.47.1795042798682;
        Wed, 18 Nov 2026 14:59:58 -0800 (PST)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534de506sm595959a12.27.2026.11.18.14.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:59:57 -0800 (PST)
Message-ID: <a838d40d84ccf3115faac3d3b7b4d91b923b03ff.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 3/4] resolve_btfids: Reject kfunc families
 that libbpf can't disambiguate
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>, Song Liu
 <song@kernel.org>,  Tejun Heo <tj@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev
Date: Wed, 18 Nov 2026 15:59:56 -0700
In-Reply-To: <20261117192153.3384031-4-ihor.solodrai@linux.dev>
References: <20261117192153.3384031-1-ihor.solodrai@linux.dev>
	 <20261117192153.3384031-4-ihor.solodrai@linux.dev>
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
> Kfuncs sharing an essential name, foo and foo___<flavor>, form a family.
> When resolving a kfunc foo, libbpf binds the kernel's foo if the
> prototypes are compatible, and otherwise the only family member whose
> prototype passes bpf_core_types_are_compat() against the declaration.
> That is only safe if no declaration can be compatible with two members
> at once.
>=20
> bpf_core_types_are_compat() compares prototypes kind by kind, so it
> acts as an equivalence and a pairwise check is enough. Run it on every
> pair of family members after dedup, using libbpf's own function, and
> fail the build if any pair is compatible. A foo___<flavor> with the
> same deduplicated FUNC_PROTO as foo is an alias and is allowed: libbpf
> binds foo first, so the alias is never picked in its place. There is
> only one foo: btf_check_kfunc_name() refuses to register a module kfunc
> named like a function in vmlinux or in another module. Dedup compares
> parameter names too, so an alias has to copy the signature verbatim.
>=20
> Recognize family members by their bpf_kfunc decl tags rather than by
> the BTF ID sets. The tags are what libbpf filters candidates on, and for
> a module they also cover the vmlinux kfuncs in base BTF, so module
> kfuncs get checked against vmlinux kfuncs of the same family.
>=20
> The bpf_kfunc_flavor family in bpf_testmod passes: ___v1 differs in
> arity and ___v2 is an alias.
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

> =C2=A0tools/bpf/resolve_btfids/btf_colors.c |=C2=A0 11 +++
> =C2=A0tools/bpf/resolve_btfids/btf_colors.h |=C2=A0=C2=A0 3 +
> =C2=A0tools/bpf/resolve_btfids/main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 134 ++++++++++++++++++++++++++
> =C2=A03 files changed, 148 insertions(+)
>=20
> diff --git a/tools/bpf/resolve_btfids/btf_colors.c b/tools/bpf/resolve_bt=
fids/btf_colors.c
> index 5d307d70e7f2..91c10106319e 100644
> --- a/tools/bpf/resolve_btfids/btf_colors.c
> +++ b/tools/bpf/resolve_btfids/btf_colors.c
> @@ -13,6 +13,17 @@ void btf_sha256(const void *data, size_t len,
> =C2=A0	libbpf_sha256(data, len, out);
> =C2=A0}
> =C2=A0
> +size_t btf_essential_name_len(const char *name)
> +{
> +	return bpf_core_essential_name_len(name);
> +}
> +
> +int btf_types_are_compat(const struct btf *btf1, __u32 id1,
> +			 const struct btf *btf2, __u32 id2)
> +{
> +	return bpf_core_types_are_compat(btf1, id1, btf2, id2);
> +}

Can main.c include bpf/relo_core.h instead of this symbol-laundering scheme=
?
Or just define two extern prototypes?

...
