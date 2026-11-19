Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795101815;
	b=gWxGKYVH8lFM31hraoi3AYabDFgDoMdZmHWKdxed+gOoZlRqcgYAuSvrzQB54iwhZhOs
	 4Bf2t7fVQYmN/FcmHQ9jFhuHNvQT1LqmNqkUFXOr/VZzfY3YUguVpE3mokQErdrSYBMUZ
	 aEWaZ1GYarewhZMXlILfBFedLuErzDQhV0TBkoRYjn1S6IAKEqrqXvb85oMbSIfu5bF+Y
	 6xRenr0PfDseVLB/qZ6SDGkVOXBwE+LnlVpLme/HvZm1eniE1kKtJpiBM3yHThuev8fQp
	 yFI6qdVm8rzQlcBBhp8KJUWFYd6Gb59iBpCkTf19xTf9YxeMSOticVYm0NTsV+lUmaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
	b=2kXqcnjqOHfegTq3uSN4JXMzgQhzNNYlIV2Sj4WtxOTAFKGc//5pR+ONaVDZfM2nUmhq
	 hkDNiOfjlm5FrC1G8GNJ6A+WHpzchR9VAvcx+xUjoeGGXubPRL4I/Xad0Eom+0vrXGiKk
	 ynAvty/H7Pv/hnf74MlgMRgRGAZ4jhFRSSDYMjf2QqSo6MS05LbUgNmmCwQqVrngtdJlG
	 877NKhoghb3MFULg3WZquEmWi0mueOFbSayFHxACkNC/oDPufTqtLR7cH8R7AeXeOAo1/
	 BGJjr3WD2FDnaudR123CojY3exYOUQz13qGbCH0pjy9JOTnCmzcSvOuUlMBniqUSz+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=PsKvSipo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE78606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE78606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=PsKvSipo
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so23416921fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101813; cv=none;
        d=google.com; s=arc-20260327;
        b=TZlDkhlNfxbcfVQkaQZEsp6qldO4MKBqe2zzfXDxJxbkpSFNsD/duIjT3tRot+y5kp
         Z1jT2gH1VlksHkJsVtIsH2ss7SZCmh3SpGoiVCZRCTMSBtTe3z3yPQ+lX/+22AFQ8jXb
         QzlLf1xv596/TLYWfwuv028Vv3kEVvV70AIj9yTM85JUS6bvD6IVMN46XW59umK2yhaU
         Poi29qpQ34zCjPSjB2aYyNXUL+je3tenRk2L/EI7tMM9OCPD58Y6D6OM5itRgpPqXUzH
         RMaYF0E2P/47UnmOXMZ+xnVEngYMbNOX5AQ4x3RWpNeaeRj6SnhrMTMHbhOtHxxGY200
         SkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
        fh=kdC8FRdaoekYTCRWceKTkW5Avc/0T5IHWo/x8wCxwqU=;
        b=FXN1RO6B5PsUKkPtCgiWfEFMcfA7KBR30Mur6saUq140Om4Vz88CL0/eJbWenKNjqT
         kdaXF387INFhJYKAayTPKh89tcNhrC4vTEtz8mvPiIjmOpvgK0vYAEk1OVIC3/k5FsT+
         TC/PKXaLn3PNDGhyZOTw/Rb3puMDf5zus1JscA8z7f2omOYHHNGaJntr1ffLmZVt4p49
         0UJIxpawviANdemi2npL0yfIXNf4qCJU0SCmBGpXlrsw+bjvSOlr3hW+cb6cxxwXjFWg
         TE2ADFuR/sQmSuv+KqqwbAdyVtoNbr384scCDoCFjd31li4LBdexnsVLdYmMoEB/zTw9
         lFFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795101813; x=1795706613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
        b=PsKvSipo4uwtGNDpuodh58qPWVhgfzyjHZK7Ju83zbKIRcDW6RBRLqDwxpgEQ3B0JS
         FO+hCtjaF8ylDWAgZxhOgWjeLdbCRH6PeIpfdDCJVR84Im3w3xATL2GCh0DkTY640PYx
         nC7Vg58Ij7lX60MSiWsikqTruxxW/QgyQDR+XKwC22zdqRyGBNofVjK6RrNnAxO81NhF
         SrUM+xGyAAZqEPFqJnDSKlZXzHn5Ilv3trNGXCYQk/ixaOifH0APmsKf6DJSsDkLf0nO
         4VZstfeQTsvNX+f9/2k5Y7Ign1Z9khBqS1wBn7xXpNy+7c0L5HNSbCzIbR7c0au51+K1
         Lh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101813; x=1795706613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
        b=LTKqukG/W8l8vRbZSg0XvVZ1476VbuOLP7Cli4vQv7IShsahDURDmf14nk8INLTqTv
         hyFFhFXKgejX1A4sMTPRJ20d0eqStHrnJIpAWEPWsV+dVKFhkActiw0uTkF7b+HDkUTS
         u1ZKdAhiUD/Sf6vshUozFUXaG+eidEVgqN1Q1DQeuN6MpH7onZqcvlF/mcynhD4dadUt
         EUs//5ud0Zcke68llw0CxIz5xn2iCv0y12H8Knq9uLQTgMj+7Kb6V9gS+95s1ScYgo93
         MGxhpWlank8qqueW4VpTB1814vNZq1299V1Bp8XF4DdmtkHaQgtO5e16fejQTxyln5+Z
         HqQg==
X-Forwarded-Encrypted: i=1; AL+hErHhkonJUvt2Vf0PU7V9pFWPLmcBV/921dxeSHxE06OTvZijNoh8Rb+CVG4B4HuyiPyJh9qiZpYwPW7wR70=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XKrkGXBgnoBJr1tt8rd6magAjMKjm7QJa9rDmhuDT4pAkN0zA
	Y7n45b8S3Cdm0pIetBx4UrIBChlaQ9Yy6T8MuhwVycFUxNvwXDAVwxSENZQzINTDFgXlXgq8OSG
	rS0C+A7rBfdEKLipxtx9AdYWcmpWVfqpUnxcpHruSfw==
X-Gm-Gg: AYBFou0cT4IlWNIRsvKjWJ2X6No34M6ApdcCcZJrCe/BdHNoI4Ldd9I+tW2cKJdAZWs
	RMwR0vABIBtP0rT4n5EPC41X1cbe/G4EtAFwbSHCwREkSi8tni1Ih6kqFMeJ/0uxahORtF3cOwg
	28mHvzNBs4m1AATETTFL/HyXXQ5FylmmSfEfS1xgNHlRv3GHzzLW0F1541ujzhPfssVb3UBoIU9
	b+WuxdciljL38HJ5O1VXGTBQGXN3RgXxli9a3TmWnT+gqQAMdT/8GkJ8sqqDH8xSq85l8PWvrpw
	/VJgAcK8lBDwgtSMeTfxEP9gajcMqa7f++U3D2DQnAd/HLsgrxs0zriH5ZL8HyALjucAQ3EGQot
	eXH8TySLcYEUpYnTqMkc4W3s6CbBb2aZloUgY7v8CHlwCKu94qOzBGyzsebOh785MiGa781MMam
	NVgNQptw3g/b8XwV1rnC4jI8f40Sh1BF/+XQrpOP4L2CRcd6ktEq5c4mI=
X-Received: by 2002:a2e:bd05:0:b0:3a6:6d05:7375 with SMTP id
 38308e7fff4ca-3ae7f9d5f2bmr884941fa.8.1795101813092; Thu, 19 Nov 2026
 07:23:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-4-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-4-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:53:20 +0530
X-Gm-Features: AclHuK-bYeekeWya8STnw2Y8eECaMfbCySlAAK-yinBr0JM6XHZ34xL9AEfbGuQ
Message-ID: <CAAhSdy3TtQCE8Fa5FitihgSKewXLApPOOhWHU1QCw=6F-P_4=g@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] riscv: Add Control Transfer Records extension parsing
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:21=E2=80=AFPM Vikram Singh
<vikram.singh3@oss.qualcomm.com> wrote:
>
> Adding CTR extension in ISA extension map to lookup for extension
> availability.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-4-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  arch/riscv/include/asm/hwcap.h | 6 ++++++
>  arch/riscv/kernel/cpufeature.c | 2 ++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index b5952db9259f..ee200d8cfccb 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -126,6 +126,10 @@
>  #define RISCV_ISA_EXT_ZIC64B           116
>  #define RISCV_ISA_EXT_SV48             117
>  #define RISCV_ISA_EXT_SV57             118
> +#define RISCV_ISA_EXT_SSPESA           119
> +#define RISCV_ISA_EXT_SSPLCOFI         120

These two does not belong in this patch.

> +#define RISCV_ISA_EXT_SMCTR            121
> +#define RISCV_ISA_EXT_SSCTR            122
>
>  #define RISCV_ISA_EXT_XLINUXENVCFG     127
>
> @@ -136,10 +140,12 @@
>  #define RISCV_ISA_EXT_SxAIA            RISCV_ISA_EXT_SMAIA
>  #define RISCV_ISA_EXT_SUPM             RISCV_ISA_EXT_SMNPM
>  #define RISCV_ISA_EXT_SxCSRIND         RISCV_ISA_EXT_SMCSRIND
> +#define RISCV_ISA_EXT_SxCTR            RISCV_ISA_EXT_SMCTR
>  #else
>  #define RISCV_ISA_EXT_SxAIA            RISCV_ISA_EXT_SSAIA
>  #define RISCV_ISA_EXT_SUPM             RISCV_ISA_EXT_SSNPM
>  #define RISCV_ISA_EXT_SxCSRIND         RISCV_ISA_EXT_SSCSRIND
> +#define RISCV_ISA_EXT_SxCTR            RISCV_ISA_EXT_SSCTR
>  #endif
>
>  #endif /* _ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 72bce616491f..b3e3c30f4c8b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -652,6 +652,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
>         __RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinux=
envcfg_exts),
>         __RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
> +       __RISCV_ISA_EXT_DATA(smctr, RISCV_ISA_EXT_SMCTR),
>         __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>         __RISCV_ISA_EXT_DATA_VALIDATE(ssccfg, RISCV_ISA_EXT_SSCCFG, riscv=
_ext_ssccfg_validate),
>         __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> @@ -659,6 +660,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinux=
envcfg_exts),
>         __RISCV_ISA_EXT_DATA(ssqosid, RISCV_ISA_EXT_SSQOSID),
>         __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> +       __RISCV_ISA_EXT_DATA(ssctr, RISCV_ISA_EXT_SSCTR),
>         __RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
>         __RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_e=
xt_svadu_validate),
>         __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> --
> 2.43.0
>

Regards,
Anup
