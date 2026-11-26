Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795713687;
	b=wDRC9cHc7G955dl161RaWFfzf0UJOdKxGRpUaKs5pZ45JzQW16nUdAdEHiAEcN8LauTr
	 R+m20xkr3OzUPd11QmX5/wNVDIMwJ1qViRQabSItpzFLKfo2yHxrzsKifbz9gTHoQwCHK
	 PiSu7GWiSER82PrtXNuLtycDbJbrqmsUMv0eoJWOSqW+ltB/vwkC+Lz62g9rUOSLAfafg
	 zMd8ush9OnOjN2WyNpdhiibVTDctTGTDTYYhk6PqDsleuDB1KeK0D8FibTurnAKyuS7y3
	 vuc3mf7PNyLVzKlptsMx8qFww6LRgmY2pnc3/E8Zd5ZpOfxU27hoa8PoTgFsW+P287g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
	b=WDyjxzmBvhqjoAuxSFI0fussxksAYcD9SFUSyWuwBHDQe09DLHVF3oca6Nmb4961S9lv
	 G2jZM3c0ce6S6qKRw2fxrgMFlYpvz6rYs7Qbo3sdSZRD738OkLgogsmz8c/79MYVChr9s
	 VD90PtmaZXFexA05flo7vwq8feF4NgyxOjIq0dgAltxHPFKCLg5EhnTdsEzyNA9wgbgIQ
	 1s7hUokkbxL+Oi1vdKI5LmUg/hHQ7QLprQcHO4jPn0laPzC3MJ0O5jW+ca1J+qRw2mlnx
	 FgcC8u+VFoYH1MfsH5/F5Ox3UoNqMNS2H+uXFa+rHSeXDNOkdYsmtZFomoJzthY4FyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eAUyELCh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED62606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED62606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eAUyELCh
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4395d31228so1231595866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795713686; cv=none;
        d=google.com; s=arc-20260327;
        b=OoaNYS1MnIKr59u7IbvxQaL3mgMggD6gNaUBaXrzDUSUAFSP5XAeYsjD9RrPxCBEY9
         8FDcK10TPdb4x8lXGIkf4KUzJ4vtajRK4sQeYtBOgZgZO8JHuvOL6HEqLcsKFBUxR91z
         ce7kyewZPUS8pMa6w5PAiozlmtovywC25mFjOvjQT9O34lXs0wT7utq0nDhHvcXF8FOr
         k7eAfFms+1PFtdArKkKT+JXXZ3wrz0Y/1eliTaDohcqBnnM6yYnh78/RcYZ6Kj/sYAHt
         8fnJ+va9If4ERuEnj2MELN1Du7vmi9FowC/NroYIPxZVetbFaPI1JGlmD4olHqCkerFD
         2vkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
        fh=nKv7JqMMTFu5howMNt4uhijdfhdmiwBN6KzC+Ttwt5I=;
        b=ZJR5o7u3i7P/oyn0hBliZCvlLIwfrQA2T9DLni6BHo3cQR84R38dgEm+CB81wizf+Z
         GsbupHJda/2yG40fdC/+7Hmb2W39BA2FHken/98daEBy03Qhbr30jJGK2xqOVoKo4ktW
         kmTS440rNXk1HoOdNFac6SQMsnC1fN4s37ylAKzzgLaG7E8MRper1ksvFrPT9GQ+Qdnv
         MsydLbencEc6BU4qcUTOD/OnzDMRf1tZxklNqnORPyhXuiM/Q3K+aqW4bqJBgdDP87LA
         m11sY1zsWTXfToCd+KZVEw4ulfyHwGfoEMbTWJwYGueVvTkilevr3vfLbO6LS+DKalgX
         hamQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795713686; x=1796318486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
        b=eAUyELChNxN03tFWhGSn40N0o3gjWO71tl5Ghcmskz8b4PGVkssqVMVbtcP1ufdgYD
         siuET0E8+b/8ouzgAVqs2MIlCaW9vlronDx+CN5r4hENRnHoThYegScR0BXwbEXaFWVv
         vbCqNQk7tkQOJoCj6JvZkgF6A2MrU7JYcLhNOXZ1Xe1EpXiHSTAa8An0988zX+AY8Pep
         2FxXxxd9Yyf1K1seELTv3Pu/d0l8SVkab2alnZfc1y6/i2PE4nJZz1OmTUDwKwoKvPhp
         1ls0QPxv3w/sWpsW686NeXrfa9MjQEe1y8xx6d3P6ciusGwK3AyEX4jEpfF4Bn9DZiMX
         a+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713686; x=1796318486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
        b=0NXTTC6OeqdvJGyJ22/vxKlYk1HyFMw1V+zlQ6H7RHoYTar2guaoLCwPBCRtPQNxcV
         rd6VvFD9F1M3e+LPC/KZjHdrRFxlOnl+I653hl7GlVd0LPJNMrlSmiOtlXbLYVAjqIZ0
         Dl1Et45f7G/Iiq34igYnSCmdF4DoYHv2RoSK7iQ6G/MbwwK4Rr9a5hA+aLvyTvGSxB49
         eS/Qk/JpJKwvGu48UGNyvCGW33zXbpfmxyPEDXaadxuORBs7RGy1K7U5PP6QpcfUBeWL
         jwp00bQpNjA2WUJE5XcecwdSlCo5HaX3n8BTkmXWv/OLcCeupme7hGtbtDIeq8dQZMWU
         R6lg==
X-Forwarded-Encrypted: i=1; AL+hErEYnrwkjo9K1nrK/pcXc78l+ZiXp+yVmkj+XoqidiJae4QY6UBLbmJ7edHHtu4MKmCf9yiJo8nxeTb4qv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JcH9TFGZ4uomKdzDlUj2ZeBs9zjAvm6wsFSog26hPf9YDsmD7
	kOFpgfvm2DecfWmzgpEKMPryv5Oe/GVU2fofvmpcpGW/2RlEbZbe+nj70aMCPDzjpd7hNG4oT/K
	trtbsP5LctfolHY7rZWCNA3XrcC4t1+zO0koecD9g
X-Gm-Gg: AZFdTZeNYJBEvf9zZasw2Lmfg75pmj28SwEWNQX/PZ9Evqod/Ji6mz/pNBbrKSiE0ku
	W9rpnu/WaqL7nc739g+0Ih/6wcpNN6EMTmfMSlt6jVj/hyAYbiYQJ4yV7+6EPG4DxFSDgxL9ZyD
	Ufga++6cA1TpaEWgUX6ltW8ozPxEhdN31tNq/6UUSNqvnJCGTjOGZLsN00WbDJ6JiccCQpXyUTf
	yfXfpdBYBIBolqKHuoihRfo3RQJK+d2or78qr8pzavc3jPyv2TDCC1/KTmdr53NYt9za+agBxLN
	sP3MQSceHeBrEV2d6mL+mHflI/HjTzElW/0rWhVBLB9Jdy1N7kALZObC0NbGOsbEQKHjEwwReDb
	1AnvOUb1Ejw8Ya6RuaOqGlBIbgWiiNN9DM/20R9v6AthAH1HAJB0vSkBpo30P/q9BA+zKsg==
X-Received: by 2002:a17:907:9612:b0:c2e:2baa:a642 with SMTP id
 a640c23a62f3a-c513a8845femr1932673766b.30.1795713685324; Thu, 26 Nov 2026
 09:21:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-14-wusamuel@google.com> <a40ad738-cb7b-469e-b67b-353b64622dbd@suse.com>
In-Reply-To: <a40ad738-cb7b-469e-b67b-353b64622dbd@suse.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 26 Nov 2026 09:21:13 -0800
X-Gm-Features: Aa3M54rqUPDLnBBM9ls6-9-k9q7s0wsA5-hr6KgHVGGraAEFEEYG4syBhxuXwjw
Message-ID: <CAG2Kctq7Mb=pb-SFU88eRA1cp2Qt_HJ0nADY5fET7Es-_CcCOQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 2:45=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 11/13/26 11:12 PM, Samuel Wu wrote:
> > To find a few kernel symbols, users such as libbpf parse all of
> > /proc/kallsyms, which is several MB and text based.
> >
> > Add the KALLSYMS_QUERY_BY_NAME ioctl. It finds a symbol by exact name o=
r
> > by prefix in the entries of /proc/kallsyms, with vmlinux matches first,
> > and optionally in a single module with module_filter, or all modules by
> > default. Each call returns one match and its position; pos + 1 continue=
s
> > the search, until -ENOENT. The output returns the address, the size, an=
d
> > optional name and module buffers. A buffer that is too small gives
> > -ENAMETOOLONG and the required size.
>
> The kallsyms data in the kernel can change between two
> KALLSYMS_QUERY_BY_NAME calls, for instance, when a new module is loaded.
> Should the mechanism provide a way to detect such changes, likely by
> tracking and exposing some kind of generation number, or is it
> unnecessary?
>
> --
> Thanks,
> Petr

I'd like to keep scope of this series simpler, and I feel it's
unnecessary for now because:
- today's multiple read() of /proc/kallsyms have the same race
- vmlinux symbols are immutable (I imagine most queries come here)
- ioctl is size versioned, so a generation number can be added in
future as needed

I've documented the non-atomic behavior in the UAPI comments, so users
should know what to expect.

Thanks!
Sam
