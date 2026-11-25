Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638512;
	b=iN5ronU7Npup5SADLfNSGODFoXvYTshoH8OliBAntsBe6rjCa+mXX9So4arfwDZa69km
	 U/jcNqRqfaO0p7r3W/m0taCSz8ne1u0Q8U6+L9vnh+K/HyTyAZ74HWvf461IJOV28oNfY
	 VvMaw/78207poBY4p1FafHrwJF21dC96wYASpDwLBH1D2a9Kg/0bpFhpzCdKjxpaC9uSb
	 UNItNygErxPUAAzd5mYDS2xhQ4iIS6ELwgWCwZs81bnGNTkI1TWDTaPosjwc9E7550jqU
	 /t4EjpyFHdu597Bx8dsjADw1AKWVJHGfHBGlnK2KdJNT+O2X+0oiszyd0JqKBc+Fe/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=SisNFLl6/hL7hmRZwdbuXo3SaIIXW/p4Ajlw7Gvb2tI=;
	b=qJqGU5m3jPoBXGtS5irAyJTvjvQHXdDD12L4QVSOyxOGZJpSf4YQeRwKkYrYs6Vic80K
	 LkwRVxmWv9we3bo08VUjzyY5Qb81bP/bKBu+B3bedd3N9vJNxjGkaUbuznBEv2C5uFd/p
	 Kj6B8tDReJfeqpDkpGjdJoyYUquCih5sSSD9rHFTxIX3LijlTNgofpejX0elx7/ZsfJqX
	 R0yO2agwZWWhvv1zTYNhHCVcjThYzDD/0rNgPh5ymcbgBfXz9CR8B/6w4oWPsOpf+e5yo
	 SuBLGIKDb17sK30D6bPXXIbneogM1P8NRcFEqmMyGSEMtlMkuE+k3VecU0DoVREnfKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HroB/jVl";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5987A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5987A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HroB/jVl
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso4222293a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638512; x=1796243312; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SisNFLl6/hL7hmRZwdbuXo3SaIIXW/p4Ajlw7Gvb2tI=;
        b=HroB/jVlmabLPVmLCSRqYdFdT/IvkAKiv0gc1aZNWlMBlti+4W8yCOdlmrE2Jp3Mq3
         WwkBxef68QYSvq+cU1USt3uUMNlyS/wUZDLU5Ft6ytWq/en4ss8SCjmmDe9Xg+VaH6Be
         +kwaymaaqskWHKW4fMVPoHIh+4npySZ5x1yhOP2msU6t2drtv9aOtVIqmSPyqFjpod4m
         WRVrTMQ030Yq/pZEx8gAtgj/VQKl0qMDd2furtBN8zPbimfqLbbgYIeqEEeiAba/1WGJ
         SUjcgZEptGY/AlgQ8i28GNb5ja2lAs9hmDHs03gwGx9KZq7sUY7snOYxuGDd8aAvFiPT
         YJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638512; x=1796243312;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SisNFLl6/hL7hmRZwdbuXo3SaIIXW/p4Ajlw7Gvb2tI=;
        b=qA7MUhzB3vkAXxFGye7yMday9xq+viL44lWYSrIKKO1vrnzKdopdPVhK7QgH+sJ/6V
         dGWd8c8r565wLai6KOtG2Ayfwh0RLPNARqyR4LVGP2xs/ZKSPNEqSICmn7V9Lqmu/0tg
         n3oMOo2HjjE/WSaHvzLU1Ro/0M6aN3lIX744FPxOelwWXq+WK1fHOtj1JLFq7V2htBXn
         fV2QrK0B5G4L4qE9OHW0E6iqg+KWBFVE47lHoElqkQoVVm2lJtXrPomYKy7F1R+8foOg
         oABGTx8S2m1z9/lnkDReGwnZI6Q3i03Mh0GIS2ukHQlN4SejfjHKMm+fg4Oy8qEvt14z
         rFtg==
X-Forwarded-Encrypted: i=1; AL+hErG+nQpcSczNggHZxv/KTUa+FCo/w8SjkYiYM2bid52iX2AS/pp5wuFYxnCADYr2AoASFiOLtpguvNO0tc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WZTT180LvvoNgcYIUDl2H8WtG7ubK53afpWSrH/zFP39yBUmt
	6sOFriNQ+LuxK9in8EJtZqnQ/84YuwiW7oiwyubKEToTp0peruEmsPMA
X-Gm-Gg: AZFdTZeTfwW3EuscWLa1L9zjuHVZsTPMH7gBzqpJ/3YpdXvUwIjdz3jKxgwGP0YFG9i
	cz1LIcpj3zpU6Vw5zsyycgojVpdZz4u4L2BayU/fAmXZHRQEd6uoJzWhFoRaHTrxojtA32wFklw
	d7bkl0MjDGVHy99xkKmABsmXwQ98JwDTpVdOajcLklklLbwY1xLwgX2ewMzd7TRaIXxAwNMdzWx
	bOcxqNs47sKbUAkUu91DD9/HjpBn12lUNQrauOMq6KUuia93kVIM/bGRBkJocjfqPIe8j4FNaF4
	FmVUVLmpqSzHnh29o7RbOunDKMIc0Rkru8CSxWxzQlpUTAlQMsnAIWrmQuR/iX6FiEgTK1OCD4C
	5zl4KSS+jCU2nZXrEd7ZE3dxfbfcINm/nzA3Ky2sGp0+RVWe1vvcK8yUwdQCTb1groOWxgWe4Mg
	ZLr6lUHdsAS2UMuYHqSnU2u3CnfqjCdAm5TT6f7pZuQs0kvB9TS0p+eo0lPmc40eNm50u3/FSVx
	W/a91SVfUvvym0NI8yjh7WJmHVBoQ7GfuKvo8aSPeY0B5v4M2C7zfohqMAe+AaEhyOocrixgCeQ
	83THFnkNMMP745DLxB7ScLoP/wipLX9XK7KQaxQv1VAZhcYG1W17uBmGSg==
X-Received: by 2002:a17:90a:e7d0:b0:3b4:1877:8d31 with SMTP id 98e67ed59e1d1-3b41c97b893mr19440149a91.55.1795638511504;
        Wed, 25 Nov 2026 12:28:31 -0800 (PST)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7a8c64sm13004232a91.3.2026.11.25.12.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:28:31 -0800 (PST)
Message-ID: <a5ece3a1e01d2557b4b39fc89670df677e4f3b0f.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 3/6] libbpf: Resolve kfunc variants by
 prototype
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>, Song Liu
 <song@kernel.org>,  Tejun Heo <tj@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev
Date: Wed, 25 Nov 2026 13:28:29 -0700
In-Reply-To: <20261124224811.16134-4-ihor.solodrai@linux.dev>
References: <20261124224811.16134-1-ihor.solodrai@linux.dev>
	 <20261124224811.16134-4-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-24 at 15:48 -0700, Ihor Solodrai wrote:
> libbpf resolves a kfunc declaration by exact name, after dropping its
> last ___ suffix, and only then checks the prototype. The name alone
> picks the kernel function, so the kernel can't serve both prototypes of
> a changed kfunc. For example, vmlinux.h declares:
>=20
>   bool scx_bpf_dsq_move_to_local(u64 dsq_id);
>   bool scx_bpf_dsq_move_to_local___v2(u64 dsq_id, u64 enq_flags);
>=20
> libbpf resolves the second to scx_bpf_dsq_move_to_local() and rejects
> its prototype. Keeping the old prototype as ___v1 and giving the new
> one the unsuffixed name would break old declarations the same way.
>=20
> Select a kfunc in two steps instead:
>=20
>   1. Collect the functions in vmlinux and module BTFs with the same
>      essential name as the declaration, as CO-RE does for types. The
>      "bpf_kfunc" decl tag is ignored.
>=20
>   2. Resolve the candidate with a compatible prototype. If there is
>      none, a __weak kfunc stays unresolved. More than one is an error,
>      even for a __weak kfunc.
>=20
> The prototype check is stricter than bpf_core_types_are_compat(). It
> also compares the names of structs, unions and forward declarations,
> ignoring ___ suffixes. Members aren't compared. Typedefs and qualifiers
> are skipped. For example:
>=20
>   typedef struct foo foo_t;
>=20
>   void kfunc(struct foo *arg);
>   void kfunc(struct foo___local *arg);
>   void kfunc(foo_t *arg);
>=20
> are compatible, but not with:
>=20
>   void kfunc(struct bar *arg);
>=20
> So a declaration with an outdated struct name no longer resolves. For
> example, commit 8740156ad33b ("bpf: Require a BPF cpumask for
> bpf_cpumask_populate()") changed:
>=20
>   before: int bpf_cpumask_populate(struct cpumask *, void *, size_t);
>   after:  int bpf_cpumask_populate(struct bpf_cpumask *, void *, size_t);
>=20
> Each declaration now resolves only on a kernel with the same prototype.
> A stacked suffix, as in foo___v2___compat, no longer resolves foo___v2,
> because its essential name is foo___v2. compat.bpf.h now tries foo___v2
> first.
>=20
> Module BTFs are now loaded for every object with kfuncs: 0.5 and 1.4 ms
> for 8 and 32 small modules in a VM. Lookup cost per kfunc:
>=20
>                         before (hit / miss)   after
>   sorted, 23 modules    0.14 / 0.65 us        0.8 us
>   unsorted (v6.18)      0.1 / 0.5 ms          0.7 ms
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

I have no nits besides what Andrii points out.
I'm curious if you tried this one the BPF programs corpus shared by Alexei,
to check how many real world programs are broken by this change.

...

> +static __u16 kfunc_type_kind(const struct btf_type *t)
> +{
> +	if (btf_is_fwd(t))
> +		return btf_kflag(t) ? BTF_KIND_UNION : BTF_KIND_STRUCT;
> +	if (btf_is_enum64(t))
> +		return BTF_KIND_ENUM;
> +	return btf_kind(t);
> +}
> +
> +/*
> + * Return 1 if the types match, 0 if they don't, or -EINVAL if a type
> + * can't be looked up or the types nest deeper than depth.
> + */
> +static int kfunc_type_match(const struct btf *a, __u32 a_id,
> +			    const struct btf *b, __u32 b_id, int depth)
> +{
> +	const struct btf_type *at =3D skip_mods_and_typedefs(a, a_id, NULL);
> +	const struct btf_type *bt =3D skip_mods_and_typedefs(b, b_id, NULL);
> +	__u16 kind;
> +	int i, ret;
> +
> +	if (!at || !bt || !depth)
> +		return -EINVAL;
> +
> +	kind =3D kfunc_type_kind(at);
> +	if (kind !=3D kfunc_type_kind(bt))
> +		return 0;

This makes enums incompatible with int types, do we want an exception
for such a case?

> +
> +	switch (kind) {
> +	case BTF_KIND_STRUCT:
> +	case BTF_KIND_UNION: {
> +		const char *an =3D btf__name_by_offset(a, at->name_off);
> +		const char *bn =3D btf__name_by_offset(b, bt->name_off);
> +		size_t name_len =3D bpf_core_essential_name_len(an);
> +
> +		return name_len =3D=3D bpf_core_essential_name_len(bn) &&
> +		       strncmp(an, bn, name_len) =3D=3D 0;
> +	}
> +	case BTF_KIND_UNKN:
> +	case BTF_KIND_ENUM:
> +		return 1;
> +	case BTF_KIND_INT:
> +		return btf_int_offset(at) =3D=3D 0 && btf_int_offset(bt) =3D=3D 0;
> +	case BTF_KIND_PTR:
> +		return kfunc_type_match(a, at->type, b, bt->type, depth - 1);

This makes `int *` compatible with e.g. `char *`, do we care?

> +	case BTF_KIND_ARRAY:
> +		return kfunc_type_match(a, btf_array(at)->type, b, btf_array(bt)->type=
, depth - 1);
> +	case BTF_KIND_FUNC_PROTO:
> +		if (btf_vlen(at) !=3D btf_vlen(bt))
> +			return 0;
> +		for (i =3D 0; i < btf_vlen(at); i++) {
> +			ret =3D kfunc_type_match(a, btf_params(at)[i].type,
> +					       b, btf_params(bt)[i].type, depth - 1);
> +			if (ret <=3D 0)
> +				return ret;
> +		}
> +		return kfunc_type_match(a, at->type, b, bt->type, depth - 1);
> +	default:
> +		return 0;
> +	}
> +}

...
