Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795376540;
	b=BsW5SsiPQI8QZgXhJbpU8MgrwVUHXXCBmT0vL59mPYtoN4x8emKwQIeKTEPiRWlfr+/O
	 ASmWJ82Ls7yYyGh9X/at1Z2Vc3ozXcmPkkMs0ZCrBq6dmlfW/GCCaZeVJ+zfZwuGrhxWq
	 uSHr1uL3Jmx1eVU/i7nyodxtbBeBVgRgBUlnOBI5DXQZJ1K0h/E1grCbYJmUW+/+fjLzU
	 PQEevUJW7wiObKLKEysubv2YijBaegeW3mrOs11K+lLv3td7Ntar2lSBuOAGUdZ/pWHhA
	 XIDmyZhkGdnEPnqFSTi7PPZqnyKTQLhFeNqtgOKf+5Wy+ZsiOBrnICeK8IwlA10VPKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JaMj7DSQxOsWfySVjl+8FAo+oR/C5pxC4TqOkn9ph7U=;
	b=nEvANdXwllALq5fHq+DyLa3UKGS9s2lPy8VUi8kB7C15BCqMwdC+9S3FajDYznfZB/kn
	 VSKqe30EwhwUBfgCwJ+7FL0cHP+1kOjRB/TZfcRkpVIDYViIXu7vzoguY7YLBq5o2EMHX
	 F/mXIP+10CTw4436SPNBYQlCm7uxCjvjz3YcjBPo/2l+ML0wpWQJCpw1Q9kBNwE5F1Q9S
	 866xduMRq87XFq0rYoPYGAnEf8nRNiTCYOsfK+HIzKAhjZB0fIuy8B2furXzViGZepifz
	 4weIdvNaF+OEfitYFtso1pBxQ+jqO1R7qCWu5LAAEQ/Jdj2IiS208ai3Z16FrDb1rsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tdqj+PcI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C216606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C216606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tdqj+PcI
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-675617e81f9so2829476d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795376539; cv=none;
        d=google.com; s=arc-20260327;
        b=NDIAjaHy7Ny7Dev6Cz7mTE8+Q2grVmkaxK3CxA4eUmt213UPgAqkvdGvSdd0cNI9DL
         5FkoEPboW2Qz2KLh1xrfrij75u7H+HEdHIVILvcVBmeBxdfMfAz9nYgNE8EudRbtGr0/
         Zzb2kjlq/iKaun+IAspqU0umYS2I7nQfY8qFuY5T8715zWze4xB88JhpY1myevxhld+Q
         Py1AoYnIKaUYwUa97mt7s7lNK4r+ZDra81m0kKDEZeBdPNAxsT8tNzjWvvBpwltQioJI
         p2fJnfq+M7dzp5uVP++mnj2bEhonND52waHb8NfsDq7PrOkVlhnHGE4Fv8+Efmn5eIcu
         7itg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JaMj7DSQxOsWfySVjl+8FAo+oR/C5pxC4TqOkn9ph7U=;
        fh=fGOMygfFmjXzsryCa8IBavwFc9U3df3pvnMzIvd5Bok=;
        b=Tx70mU+NMHJTDUAUkiV0CZO3a1njuRAKfjZyL5IrIQczDT60ERU7+VcmIfVCjnrFWY
         O7LdYZJ/5fGKdFw7Kqzmp7XqCBJBjVz8qLTA3hkFcrmjOQSahkaFexzT1Eci0CS132Lk
         lLND3MzJ/M8WwwhT3UIS2mXTz3TMJ+kso4lSHIjmdZ7HxfZmNM9WXuLMmJ7kI3dZEObf
         3c0YF1RfwL3xzRc0S21OAlTcx5f3cN1V2fZig7z8tBZ/GtDOmUVo9rec1xosK97wdiyd
         fF2lBFaZyjRyRBj182IFdsn95rXJydQqATR/sUbQEpZ76Xwu6/bINTwJWoNuvOZ3xER0
         DoXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795376539; x=1795981339; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaMj7DSQxOsWfySVjl+8FAo+oR/C5pxC4TqOkn9ph7U=;
        b=Tdqj+PcI+YzUkvnQGJmeejd4G5lpDPgIiG66Fuv0gauAWue3irjr8ZTLWRvp1q0CqD
         XqK07IktDNEkDDpTdo1UYGkzoBTeAurOKsD3hoT5zny35c4RfYPRWITluH19wyHVGi53
         1XQ9wpiBI8hmnPlmL1DLlJqjgOqVEPINc9wI+0gD8LfaQJTbPrpINHZejDM+AujiFxLN
         gUnuyOIWAAqRicSV/F8eoif8xTo1SZH9mS2CHgfMRHRpKU0h2hDb+M+EDEn54k31XaAd
         kBY9k4VPC9e6gOH1n6DuW5Bs4uUPwsPxSgyEe1814rtjmpngH39t93fUeKOJkjrTdFTf
         /IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376539; x=1795981339;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JaMj7DSQxOsWfySVjl+8FAo+oR/C5pxC4TqOkn9ph7U=;
        b=IDfiqOFcvB9Yg4c6PiaPpRwve0Y7USzW9qWO8j1IY2aQICuv7kTVFM0bdJ0QBQj/cN
         rgajeqPdzxQzBxHnAUAxZTs/fgWkk8HJn6CMd/D9h/JvvAK5rEX1vJDWnwtKn7BwiNh7
         jR01605LIMebTGIZah/xrjvAwMrJmd/dbzSrruyGTVehFVoFLig1egwAlgwHi5aGOVWJ
         D3b+aPUs9WBJZxVtUVe8COEUTGWHuiydsCZYp+wVdrce7BPAcXiRWkeQeF2pUMwNKFKI
         qnxG3LSluQ4vkoCtQwxzHayBIskbG4ZC4BkWJv/RUaYUt5wRc269cvxFj0sDoIY1Uxxw
         6KmQ==
X-Forwarded-Encrypted: i=1; AL+hErGwB0uCsQWWwgag48zkOZhMCnBY762/iJx0A3Ltxq87J41TWvUMPonjHsOUYtvoZoB5rBSAmvDQhuhz+GY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5fUUqu88JlPnM0opsF4Ck1yxnVIaiM4kbWIHfup8CbifWpEyl
	8Vc3gLv58krm/WGMCHbvwWYNDEQdIKjBPxH+u3UNJzgNU4hc4Lno2Ne5FmnZlGIOzZPDFt1Yr3r
	EjuyzawveTxWkNAzES7HHS0RioEKl+a4=
X-Gm-Gg: AZFdTZcvz62CnHsxzvCUAIgevQTzPpPxnbgtiosnAWIsTA73mhP6Wy/e+u4TrvB7rI/
	5ioldbOS7CdYVhbMV37cAD9rB1BhvEY1/B5Hso/7UZPWqIiWf4FZwqJff+WHLGPpT0l87/66i0n
	pa265Mm11r4hb86e+BQYyhBlKZbrGfjdGW+qUrzstAOdOOTT5hbeDBdkqTz6aKGoAs54YLf3A1e
	a8HxcSPDRYpDNItWOY9bRCGJ6CUFAT7DWZNTviWUG1WyuRqKG1kdmMbHqpl79nH+wqnorr18r1S
	MYJ2PcDPc8TFVcvVBz/LyloX3Tr5sMBpF3VdNy2WoKr11UhmInOEcrbzJ8vHPcwckPoNLQMY/6Y
	YhihwbUAYc8tcCmJScfBL51cP1WxazfCdi3xwVKZPgvzMTfxP37fHsOkconz+tNPnuiRu+OVuog
	1LI9CAcJj42mNbsY3IMr0mlmG3u+0MIUcP6gpeOl3s+ho64KK0dVvdu/0ZH4pxlDt89uW4Crc8B
	8OvV8M7tg==
X-Received: by 2002:a05:690e:1508:b0:67d:a57b:aa93 with SMTP id
 956f58d0204a3-67df448b47bmr3072488d50.97.1795376539312; Sun, 22 Nov 2026
 11:42:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117222224.1465328-1-arnd@kernel.org> <20261117222224.1465328-2-arnd@kernel.org>
In-Reply-To: <20261117222224.1465328-2-arnd@kernel.org>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Sun, 22 Nov 2026 11:42:07 -0800
X-Gm-Features: Aa3M54rGSfhmBnOjNHZCXlTHs3QWw1coAt53gmc8CIX_0C5jk10mHzHBcQ2m1ck
Message-ID: <CAE5sdEgMSSAnZ+XM+03BfRS4_nZDxcp0hGMPJJWCa0PcGwNwDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: add HWCAP3_LS64_ACCDATA
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Navneet Singh <navneetsingh@microsoft.com>, apais@microsoft.com, 
	hargar@linux.microsoft.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 14:22, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> LS64_ACCDATA extends the LS64 feature with the user-space ls64bv0 instruction
> and the EL1 ACCDATA register. Like LS64, it was added with Armv8.7, and it
> roughly corresponds to the 'enqcmd' feature for shared hardware workqueues
> on x86 CPUs as described in the kernel's SVA documentation. [1]


A few small notes on this patch (the first three were also highlighted by the
Sashiko review [1]):

- Nit: s/ls64bv0/st64bv0/ in the commit message.
- Should this come as Patch 2/2 after enabling st64bv0 in the kernel so
  HWCAP3_LS64_ACCDATA is not advertised to userspace at an intermediate
  commit?

>
> Userspace can check availability of HWCAP3_LS64_ACCDATA to see if the shared
> hardware workqueue feature is possible on a given driver.
>
> Link: https://www.kernel.org/doc/html/v7.3/arch/x86/sva.html#enqcmd [1]
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Documentation/arch/arm64/elf_hwcaps.rst | 7 +++++++
>  arch/arm64/include/uapi/asm/hwcap.h     | 1 +
>  arch/arm64/kernel/cpufeature.c          | 1 +
>  arch/arm64/kernel/cpuinfo.c             | 1 +
>  4 files changed, 10 insertions(+)
>
> diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
> index f60ca5612daa..f63035696654 100644
> --- a/Documentation/arch/arm64/elf_hwcaps.rst
> +++ b/Documentation/arch/arm64/elf_hwcaps.rst
> @@ -478,6 +478,13 @@ HWCAP3_SVE_LUT6
>      Functionality implied by ID_AA64PFR0_EL1.SVE == 0b0001 and
>      ID_AA64ISAR2_EL1.LUT == 0b0010.
>
> +HWCAP3_LS64_ACCDATA
> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 >= 0b0011. Note that
> +    the function of instruction st64bv0 requires support by CPU, system
> +    and target (device) memory location and HWCAP3_LS64_ACCDATA implies
> +    the support of CPU. User should only use st64bv0 on supported target
> +    (device) memory location, otherwise fallback to the non-atomic
> +    alternatives.
>
>  4. Unused AT_HWCAP bits
>  -----------------------
> diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
> index 10272ddb4d6f..c85c445275f6 100644
> --- a/arch/arm64/include/uapi/asm/hwcap.h
> +++ b/arch/arm64/include/uapi/asm/hwcap.h
> @@ -155,5 +155,6 @@
>  #define HWCAP3_F16F32DOT       (1UL << 9)
>  #define HWCAP3_F16F32MM                (1UL << 10)
>  #define HWCAP3_SVE_LUT6                (1UL << 11)
> +#define HWCAP3_LS64_ACCDATA    (1UL << 12)
>
>  #endif /* _UAPI__ASM_HWCAP_H */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 952f70a48190..bbd809c83a6c 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -3226,6 +3226,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
>         HWCAP_CAP(ID_AA64ISAR1_EL1, DGH, IMP, CAP_HWCAP, KERNEL_HWCAP_DGH),
>         HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
>         HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64, CAP_HWCAP, KERNEL_HWCAP_LS64),
> +       HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA, CAP_HWCAP, KERNEL_HWCAP_LS64_ACCDATA),
>         HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
>         HWCAP_CAP(ID_AA64ISAR3_EL1, FAMINMAX, IMP, CAP_HWCAP, KERNEL_HWCAP_FAMINMAX),
>         HWCAP_CAP(ID_AA64ISAR3_EL1, LSFE, IMP, CAP_HWCAP, KERNEL_HWCAP_LSFE),
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 94e6cd211d70..009de5255d2d 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -158,6 +158,7 @@ static const char *const hwcap_str[] = {
>         [KERNEL_HWCAP_F16F32DOT]        = "f16f32dot",
>         [KERNEL_HWCAP_F16F32MM]         = "f16f32mm",
>         [KERNEL_HWCAP_SVE_LUT6]         = "svelut6",
> +       [KERNEL_HWCAP_LS64_ACCDATA]     = "ls64_accdata",

should we drop underscore to maintain consistency?

>  };
>
>  #ifdef CONFIG_COMPAT
> --
> 2.53.0
>

[1] https://sashiko.dev/#/patchset/20261117222224.1465328-1-arnd%40kernel.org
