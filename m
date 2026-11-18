Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041874;
	b=bbNDCGeeZ5ti7Ppoqrgkr45NRKHiK3NPRTnnn3o7ymSvNwnrqT5eAFuI/MWNQX8heVg+
	 9UQJ6YcVn7VF6DfOy9nKuOM9fvATRyXEt7FspDSaZr7JulJi/F0eB+DM0tz53QG5KL8ww
	 uhLrrQi7zsFT0FosdpTKPrRHuSgy0fP4c9uMWT2EnKdq7bvfOHRDZpObYmGLT8NwJvJps
	 pZ4+2yO1PI9oQz1Fja/YFm4H3auDGUV5ueMw2/u/hAV/G+7JSXulxkEjF+67EMkQnyLu7
	 NoN68WDclS945Agvmeb6HROAVCUeiunvVRIW1FBOfCIqamuY1W+lGPRm/zIVn9+wy5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=xb8vaYkXb3WyePVM4A0uNn/vxbvhHtvysyg0tVAcvjw=;
	b=XDePOOmW2Mw6a5Xp6wpPwJR3ysBmHaXQ1yyX3cm0l0si+ikQwL/S29kRLgneD7+L2XSr
	 6z1CcZKAM/WyQ7JBlk+E5kqcX5dtdqSCas4wpecW9d7Zk2vOYVMVvrp7tEKMezP1PPQ7Y
	 VLBwx8vMhYELGGqtHgLqRDy70GN1UBcyyAGczd1DsN2rW5KowrzORwi1J9HjNbODzCKLr
	 l8OLdAtFJgrmVQpxtTdzDsYQ+jNEObJADv1VWJndmIvSvImO7+7cFZ5C4zn+xKPB2JdzB
	 q0oBocijbqKFSzorRwC5vF3CBz9R1yGc1dTw32jYkG12mJZqA6FxrAR5mlGoViuSehA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKSytXbh;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB4606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEEB4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKSytXbh
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so861760a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795041873; x=1795646673; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xb8vaYkXb3WyePVM4A0uNn/vxbvhHtvysyg0tVAcvjw=;
        b=HKSytXbh+AqtrY+a33cZHshN8To9EdC+T6+DNRWu+YI2uB4Yx08lFjSHSUSrgXYKYm
         j3CdR9qkoaftAeiuXRPH1omdTkYc9Ya4BVFCW8kWqoziJk+YVXljpWRdHuXQRZ4S05o1
         Ea97QQNZgrD9DtRRe9zhXsSm5jvRAMkeVY5imSlXp60p5/KVVfbSGCTwKXpsOt8TkJSr
         C+AtI9gnPz5O0hwiZEo6ik66y+CnSiTsJToJiYVyNMClVx8qGEcIPp3jpxrovTv/KIBn
         dY28hivSWVdiRbOTsyuxPfFH8a0O9X/ZRhJP/cjPqq5DRupRPabmtZKXEAG2XMZL0oqq
         Xl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041873; x=1795646673;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xb8vaYkXb3WyePVM4A0uNn/vxbvhHtvysyg0tVAcvjw=;
        b=RqTV3zi7ZlZrPpdt1Uv6d8Byn42sbtIiFXvEsTs/KlLR1cw4ZriTKM3m2dfkZ36Pps
         JbB4c15gZhbt0TaJ9xmOzW2mMuUrb3E2FqDZAiev1iS9QKpeIl3hUjwSlWZ2SoeWT1je
         d7bIFZy8Zs1zLVMTJMeFOKh6bsmRCF4BTTMsWLg6qE7mGS23KJg8VZ4dPYJ5+7ph3Jjs
         /zRywatJJxQxY6NYiAM6dBOajf4ltnRMSkfsP1NQpfVk6UqGwwd+xewP2vTI+dF8QHic
         EwIVWA71YAJKzFf1zJrmv8JMHhXhGVbSjMe/VUgQJYZD0UPnFkXbIxNDyCGveir5GvWA
         Qlqg==
X-Forwarded-Encrypted: i=1; AL+hErHDGdQX1mIE09KfBRqZSM+z2iFyNUwA03FxtEoNw0k6Igll4FmdRavpqmXptmZfu+C/isHTxAZj4GwhAK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PzkSRSYWVR30D8aAeYS/1pa5BemJbxWouy5tRysUjXRBKZfQs
	VyBkFjbPr7ZEZ5TXMt+GNAvJiFRBVY1/2gqhjjHkORjQUG87+QJK27fC
X-Gm-Gg: AZFdTZfapUKI/OHm1s5iD+IdSvrM2dTJyJ94fUAdQ91mH00QhbNLjgSBwCzdqJkhIKZ
	1sT6YnEVvG93riUjt5N62J6k2lGPQoRee301HMNRNl2mRHHezArQIbOCpM4IUbHi623mFO4MdeE
	+AGFZFm3b1F4q/cMsr6GaDNy4u+Lm6na/9nmTA3HabXGJeeX5oj2nDA669eUKkXn1Ah1rJbRtda
	/TRgtNSVKWFlecmk/dCgukLqj00mhFEL8vXr1l/MHOETeeCP4xSj8A3Tw4/hHwv+aIv86tKDF17
	irgROGcX++V0Nvae36CA34k+pGqGAv/IWxP4BxFU8IRnIBCKioUIY8K58SirRNDVo+hU7198hFW
	0CPx+fmusBtXhA4an6USXLJCo8OLH1DQWXnkl3paSBuNGU/A1u2w/GrVdIJe0mEAdERvHUDgKr0
	CfMqsCYEMj6ofXiPR35zkipNFrRP6M+Gahjta3SXj3zwHCdZsjQv/WvW7vJBMOpUS5VZAGWyySN
	Bf+isxEWrlZckFrAx3J+sNDXZWIeWfwhtQKV9+JQhAlbMK6daE63SuVTXxXJW+GuObttXd5drQi
	OjnRjW0B7l5Xxsw08F/JQ8o/znLfICEkbaZ+PginS5wcVUft7ZdZP5pw2Q==
X-Received: by 2002:a17:90b:2b4b:b0:3ac:8af9:4a73 with SMTP id 98e67ed59e1d1-3b3d07b90eamr3666378a91.28.1795041873232;
        Wed, 18 Nov 2026 14:44:33 -0800 (PST)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe09b6a2sm207669a91.7.2026.11.18.14.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:44:32 -0800 (PST)
Message-ID: <9e6ac7882314fdb1215dcebff1c35db72380ad0c.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 1/4] libbpf: Fall back to kernel ___ flavors
 when resolving kfuncs
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>, Song Liu
 <song@kernel.org>,  Tejun Heo <tj@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev
Date: Wed, 18 Nov 2026 15:44:31 -0700
In-Reply-To: <20261117192153.3384031-2-ihor.solodrai@linux.dev>
References: <20261117192153.3384031-1-ihor.solodrai@linux.dev>
	 <20261117192153.3384031-2-ihor.solodrai@linux.dev>
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

...

> +/* id is a kfunc named <name>___<flavor>, where len is strlen(name) */
> +static bool btf_is_kfunc_flavor(const struct btf *btf, int id, const cha=
r *name, size_t len)
> +{
> +	const struct btf_type *t =3D btf__type_by_id(btf, id);
> +	const char *kname;
> +
> +	if (!btf_is_func(t))
> +		return false;
> +	kname =3D btf__name_by_offset(btf, t->name_off);
> +	if (strncmp(kname, name, len) !=3D 0)
> +		return false;
> +	/* kname is <name> itself, already tried by the exact lookup */
> +	if (kname[len] =3D=3D '\0')
> +		return false;
> +	if (bpf_core_essential_name_len(kname) !=3D len)
> +		return false;
> +	return btf_is_kfunc(btf, id);
> +}

Why is `btf_is_kfunc` filter necessary?
As far as I understand, main kfunc resolution logic does not check for it.
Having different rules for exact name matches and for flavoured matches
seem to be inconsistent for no good reason.

...

> @@ -9526,6 +9650,17 @@ static int bpf_object__resolve_ksym_func_btf_id(st=
ruct bpf_object *obj,
> =C2=A0
> =C2=A0	kfunc_id =3D find_ksym_btf_id(obj, ext->essent_name ?: ext->name, =
BTF_KIND_FUNC, &kern_btf,
> =C2=A0				=C2=A0=C2=A0=C2=A0 &mod_btf);
> +	if (need_kfunc_flavor(obj, ext, kern_btf, kfunc_id)) {
> +		ret =3D find_kfunc_flavor_btf_id(obj, ext, &kern_btf, &mod_btf);
> +		if (ret =3D=3D -ENOTUNIQ) {
> +			/* an error even if declared __weak: ambiguity isn't absence */
> +			pr_warn("extern (func ksym) '%s': more than one compatible kfunc flav=
or\n",
> +				ext->name);
> +			return ret;
> +		}
> +		if (ret && ret !=3D -ESRCH)
> +			kfunc_id =3D ret;
> +	}

Idk, I don't like that this is implemented as a special case:
- Check exact name match first.
- Check flavours in a separate loop.

It appears that having a single loop looking for name candidates is a
bit better from code structuring point of view.

> =C2=A0	if (kfunc_id < 0) {
> =C2=A0		if (kfunc_id =3D=3D -ESRCH && ext->is_weak)
> =C2=A0			return 0;

...
