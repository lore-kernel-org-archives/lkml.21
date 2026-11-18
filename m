Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987402;
	b=B/XTWT8/0HglKW5wBOEyIhDfSiLmVTZuH0H/ym3xDOh1VUaEoojZLTE5tLd9pdHAf5LM
	 1bhKbFwB2basbqpHmit/jR1KwtdXj2erx7w4/XO6T+we/3Jy2ungnwYUyg+h2nC8MyVEg
	 9IAF8cwebQyZVL1bA0KQijKV+GaX99FokuLncSV4T5s7kgxwI6pu4p5jRMIHmHpKWkhgv
	 MKT6htLJlsZAEV0YCgLi0aNBksk7Grr1Q4L2D7ydQashR0uUlYBUb06/hkvY3NRo/gwLn
	 fl9/NdPSMlBYYrqa+1L/EDC/VWH0kGP1M9xngqFocbhduJH8ZUFshkKes7ZUPNlaZag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987402;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3bQUkTtQtFHtNT717eq7Cz4Y5/0ywVBOTDLcqCWHl/g=;
	b=F/xXGl3rXXyynAIfU5mQTp/M0InXl2MbOTmn5Mcips8GlnmDrMUZ6Qjy5orb2SkmaM7i
	 cHWSXcgstgKsu9aOWARNGHwSMvkqA95GMZ2+klTOPghLiiPr6dbFQb/3g2Am2jrD0qi6I
	 CrAPs2ilrZppwAuLyL2yJvTAE0c1KtrMrcB2XqUMAQIu2b5le9fQcjjgCnqnf6HuJftdR
	 DfOHagSShZfiZWo1amkPGZB7EUlNBxif6Zm4GxJnQfSNVrIb+1qi9bt7JJycyMj5+0ZFA
	 N/OE/xv6yBfl48ku4liKuF9xr9Hyk6T315HQtAqjnqooZpkoKGMUwCymbqsG6SpcPpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UlUVR8Lb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FBB606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UlUVR8Lb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FA41F000C4
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987402;
	bh=3bQUkTtQtFHtNT717eq7Cz4Y5/0ywVBOTDLcqCWHl/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UlUVR8Lb92kBC1DwaybFFuN4+9DOao0o8SXKRFLvyFXQA5hSHmiRFervy/P/BZbk/
	 Ji1VyuGzQP64IBTwS7ObTW+cSnyWLGCDHACLY/EX4Ld2yzBMtSubE/qAbjmjucZOCt
	 vCnTQnls8Sv7TnFV0ha4tqHoGwD+pqLiXPJp+gzAnZrt0OKmPVoKTehog2bqbphVdv
	 fpRXHt53HrOrPgq5njmDLVVHnUBgVrQZN1EFS10dob34BNaB8C/ruQXEifA14qJg57
	 ZVM4EkdFYPeKNMqj5i1D9UHVfG8pKx9HD7M6kOaihHjIYtzxXT6Ocp5jfw0ewnAUOa
	 7a6DyMUROBHgg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so714237a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:36:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGZXmZ3ChqnxKKXzjy+iQYUkixYUmG3NuyQbJDaVieQVUoxTn6q+HafvtiUkyfRe3nyD4aZhIUkxrBVtao=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/UdQr2z+qDQQKmE2/u5TcL2bvcsKlzeIFMhPD0G/Sw7fg6qKC
	NnBGINS2KFheukMn9eXdMQbK6GCh+UzAUkMFFD177YAj1uIyIYXGVgUiup0VJIFbj7zaaR1mIXz
	0HI7EXOHeTTtTIAia/+skFfdkMC7mF2o=
X-Received: by 2002:a05:6402:1598:b0:6b6:e808:9711 with SMTP id
 4fb4d7f45d1cf-6b887eed9a7mr1089834a12.29.1794987401013; Tue, 17 Nov 2026
 23:36:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115193107.571674-1-hanbings@hanbings.io>
In-Reply-To: <20261115193107.571674-1-hanbings@hanbings.io>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Nov 2026 15:36:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6ww3dObKa3zNxj4jv7JWoB_fukX+b-HYnb_31_=sPbEw@mail.gmail.com>
X-Gm-Features: AclHuK_D_Un9lgED40yjZJGpoQ-aah58o4T7MJlx8H1GjYPfzxP6N8z6Qn2PuhM
Message-ID: <CAAhV-H6ww3dObKa3zNxj4jv7JWoB_fukX+b-HYnb_31_=sPbEw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix off-by-one in bt_address() exception
 vector check
To: hanbings <hanbings@hanbings.io>
Cc: loongarch@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

What's your opinion?

Huacai

On Mon, Nov 16, 2026 at 3:31=E2=80=AFAM hanbings <hanbings@hanbings.io> wro=
te:
>
> EXCCODE_INT_END names the last valid interrupt exception code, not an
> exclusive upper bound.  Since INT_AVEC is 14:
>
>     EXCCODE_INT_NUM =3D INT_AVEC + 1 =3D 15
>     EXCCODE_INT_END =3D EXCCODE_INT_START + EXCCODE_INT_NUM - 1 =3D 78
>
> trap_init() installs handle_vint for vectors 64 through 78 inclusive,
> and the switch in bt_address() also maps types up to EXCCODE_INT_END
> inclusive.  But the range check uses:
>
>     ra < eentry + EXCCODE_INT_END * VECSIZE
>
> which stops at the start of vector 78, so an address in the last
> interrupt vector is never translated.  For example, eentry + 78 *
> VECSIZE + 0x154 is rejected instead of being mapped to handle_vint +
> 0x154.
>
> The off-by-one has existed since the ORC unwinder was added; at that
> time EXCCODE_INT_END was 77, so vector 77 was excluded.  After AVEC
> support made vector 78 the last interrupt vector, vector 78 is the one
> that is excluded.  Before commit 4cd641a79e69 ("LoongArch: Remove
> unnecessary checks for ORC unwinder"), this silently ended the unwind.
> Since that commit, bt_address() returns 0 and unwind_next_frame()
> logs:
>
>     cannot find unwind pc at ...
>
> Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
> Cc: stable@vger.kernel.org
> Signed-off-by: hanbings <hanbings@hanbings.io>
> ---
>  arch/loongarch/kernel/unwind_orc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/u=
nwind_orc.c
> index 9cfb5bb19..784edf6a7 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -366,7 +366,7 @@ static inline unsigned long bt_address(unsigned long =
ra)
>         }
>  #endif
>
> -       if (ra >=3D eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
> +       if (ra >=3D eentry && ra < eentry + (EXCCODE_INT_END + 1) * VECSI=
ZE) {
>                 unsigned long func;
>                 unsigned long type =3D (ra - eentry) / VECSIZE;
>                 unsigned long offset =3D (ra - eentry) % VECSIZE;
>
> base-commit: 422e532809572ba1043192bf6a0c653bc68b3140
> --
> 2.54.0
>
>
