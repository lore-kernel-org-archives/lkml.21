Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795629104;
	b=aXNXS8oub/MxQN9J4BiFVSkJxGQtGxG89BcV8f7J5Uss4AZsFQIpqW9UtoEgGrr9+fm1
	 qQr9rbw/szTv6zQpzRsmlqmevXNcAIBZho8KQimLbBGYTxtBayry8ACXrzH5N6bbb3iG3
	 7X67EFe5YGWQXsRfxcevuID+M5tFxWS9KAeEWfkshor/KmKz7GWvtHpe7aoJ8sqr+GvSy
	 m6PZSH5Yu9YJUQjEh59flFFgh/aRYPr99OdgCBlFmZxi6C//IdU8qPMhKssWCviW2QqDZ
	 MHRudI9CB2VWhYUPtGIIK3dgWz36wfNi0lOsg9qY6HxKZ7YOoo+i/fSlIddMc89koAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HR58Pgm1rnNyJEAV9sM8Zkj2jhl51J54Nc/8nPl524E=;
	b=DrGoCaFOHT2C1E1+B7HzZuT3ukbw8scr0PuLfiI+udZ18QW5cvKvSqz0NFg8g+khKNFP
	 BzvVU94LgmaBx3AHNwA8TbRc97if7GNli18G8I1Ak0sL3xPHcc21zzoLNXUSJ0/ICpw7M
	 XpGMOkP9bvkADlwe6tsOxTXW1HdYwiEB2KPL2u6okD9kgaDHx1oEqdqhbVwXfo0OYBGnP
	 8jrn0RHGbLYx3qLW03BAoBoAwnjyv9iJytmTNKBE1M3nRIy6pH6zyG48VftYjI7+QMLAR
	 AUAm9WBBoiSVdYvItHbyIojDPAsIjJf4wO9u/aUCUmW+Nm+TG5ZZ5PLNPc7qWI6+CEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m2QaEsOq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987DA606A68B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 987DA606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m2QaEsOq
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491971ac844so5473526f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795629102; cv=none;
        d=google.com; s=arc-20260327;
        b=Snm+byxhFBQZmuOyqRgq4iyhb5j8ww0QrRWlB8reSM7UdAffyJnBOBC1xKgkWby1Ge
         bkrDQBl372v+hXdBCF1g2T1Glv2l/XqcdYEJyayFGP3ZEWckN3Q+k/ZwQyrjLATENq2N
         5KmmCimaSUx9IP34WOeI5Zyvmh4j29Bokdk5IAOtPW1q3y/9pKzVNfd/VJIpRI1Mfc+e
         GxIC5BKUUBATaNF2MrtOTpWJs+xuaWeJf8lkYlg7BwwYSBnFrSOoTNvYuB3FXaIYwqzB
         Vq+U5v+56uaWFoX2hJHSgQ5pzQ/FQD3HF5rBvn8bshNiUbEPIe1GdL93e9fwEGeaREZK
         pBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HR58Pgm1rnNyJEAV9sM8Zkj2jhl51J54Nc/8nPl524E=;
        fh=/xTP57TK9lxVrQiL+ICWdLEtWKpEDoBMYUDbiJLIvpw=;
        b=ofnTgB+nJf8MVCsh4FpSlvaDfGP6GqBN7vCG5a1LIuEoQuyTZDvri4W79Khf9wiRap
         iqB3f07o4A1YQig/XymS5PvIYQ6ymBVUZPNcpEVX+CmpM5Af9tAKi5RdMyUzQ5U0Qg2N
         86IIopiSfCmKX4DuuCT/E+hLuIGTKHNEgriu/6VgyeuFL9+4VCIgzhbQJk43o7kWWgUu
         QtrihTc171By6mcvQg6HztdlPVNch216VihLI3ZsWFl8lRreCxMHNGi/iKUQtdw0jZ9T
         v9bOHrKr8cUIA7xKCWxLybtTCXpCnodmivxIoKAEgnIDYbQPFJ+ZZ3kBK5WblUKDRc9Z
         QxHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795629102; x=1796233902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR58Pgm1rnNyJEAV9sM8Zkj2jhl51J54Nc/8nPl524E=;
        b=m2QaEsOq9NHlT9JhIzy8paMwQFoN4OGgGSPPIj2VhgwLDymWXrFHTbKXMHmdQzx6Zl
         xKP3ppiVMWlP0fxgB8tJhz7ErB+glSn2gmH5nZczU0kY2hlhSbaj/IZW1uQd+insTSFz
         Y6VvkbZSmRyQJ60HA5wHofUV+mqXeKhGPWmhm0dV4IZRtEM5hYKYPJXlwSpMOGFvHge0
         YQ8n8yTJxSsL5VuW62rbl6r9lgAitvATa8i6pwm0lwNcYLIckHJwZ8r/36cSS7roD7pf
         ZBQldtkCdkO880j+gnw86IQbcoZRTTuypEJySYzSxO3vypcaw3bKWaqYIIM+tvzXva9e
         qAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629102; x=1796233902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR58Pgm1rnNyJEAV9sM8Zkj2jhl51J54Nc/8nPl524E=;
        b=erW266fRnEm6UOTZkU+NKS9Ke5uy6sq3DmbKrzhaPd1zQmsHNMks4fhrSWl+lT0vV2
         tCSDwRyNAz4c7HjY+P0UFCopTs4+N/KFZtHy8HWuaQV1mfBhwMmpS8M4co7UVE8lKmbA
         VFZZbZZtDRghRe1CcS9sj14ozQ4jUoAkxNP/vvtmniUQOcft9TMsTMEW3BSOPOD1nH1J
         6FifOXtoW9M/qeUM02nlMFoxlOWKoWP0M0ogmGbuRUrWY1CkQ29A1l6eoXYd4nhW31A/
         rN7jIjmqeLn1LZSAu2d1QzjA8/TNbCwSMZCpbp863y/3THpVZ/LaRfYbVCePyw55Q/BG
         ZCKQ==
X-Forwarded-Encrypted: i=1; AL+hErHaNLmc/h8cs2u6RJYlAc/9pDCfddKlFwYoMEEaqeBLbonl90IYbUILrL1fpV/W1QevhwKwUPbaCt/9NWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WTJAOGV3vMgu04aHah+Y+OAxZHR6Suu+SRACmQswXGC1OHncK
	S84KXPCzrQhFi1lDZeIg8MsvF1NOuCtZDLk/nedihyGCGem9u5AF8d5jWpi4rzPcTIJLXFXlehL
	gHTgFfMeZgxiaoyNUvJa+p9Q+jzYUHhOinOi8lSuB
X-Gm-Gg: AZFdTZeuXCnVMcixAvfR01HrhLnQB9PvF5EtRTnPlrRjmIB/gVYhtNJIyDU4IeGk7Au
	ZND/OMGc9sqtiBImXlsGEa+kfzl5bIJaK+qOVSigKLHJBPJVqVPdjFV6qsHMyogqpIRNTJr89xM
	H2S+4jbLpNQZOy/lgLWC6yAD1aNySR3FKZf/xK4k1HsgJca/AXjmZryKxbpjghMwN9xATQSGsYh
	ovXHLhnLqmVb/jwT9d+vjHt5s4vIzuNry34Yg+GB/3U0VffcrxJx2m5Fh3tv2rQQoDQy8FcKGGQ
	ZJHHJvESuYPZODb/RraosisB6ECfQIK76iN6frIyD5dbJHt946kMekSXjw4dc1WRC6b1U0quai6
	5NTYPhI3T7rQ62SeszR/tvoEyDsyvVACmduhi11rk20F3HXsvosHq70L2wmQ72DPhrNJ9juTX0A
	5hBDD5OUaNOwR0xt1zx2cW8mwB3Mau25BlgNaW9EY9ZdVT2pbDfR+aFwYRnIG6RyF98qaTQm/Yd
	hkgPVADMnj8GzJ10I3KgrBOF2A/57EJRP0mTA==
X-Received: by 2002:a05:6000:2201:b0:4a8:663b:63e3 with SMTP id
 ffacd0b85a97d-4abaa976b48mr45498627f8f.4.1795629101291; Wed, 25 Nov 2026
 09:51:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125174035.1412724-1-nysal@linux.ibm.com>
In-Reply-To: <20261125174035.1412724-1-nysal@linux.ibm.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Nov 2026 09:51:30 -0800
X-Gm-Features: Aa3M54o9X1WdWJoRSllfktiwX4MIEHpsBnKmPf0mGd1gEpiEdAxkLV-H4qy3pQ0
Message-ID: <CAKwvOdkW5+xUCg-8Qp=1wJkNFXAJZTmTDuxBi6hKDuiNxUYiDQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] powerpc: Implement cmpxchg128()
To: "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, 
	Jeevitha Palanisamy <jeevitha@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "David Hildenbrand (Arm)" <david@kernel.org>, SJ Park <sj@kernel.org>, 
	Usama Arif <usama.arif@linux.dev>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 9:41=E2=80=AFAM Nysal Jan K.A. <nysal@linux.ibm.com=
> wrote:
>
> This series adds arch_cmpxchg128() and arch_cmpxchg128_local() for
> little-endian POWER8 and later, using lqarx/stqcx. This enables
> HAVE_CMPXCHG_DOUBLE and HAVE_ALIGNED_STRUCT_PAGE, which gives us:
>
> * SLUB's lockless __update_freelist_fast() path (avoiding slab_lock()).
> * kmalloc_nolock(), without which BPF task-local storage creation fails
>   with -ENOMEM, and the selftests task_local_data_race and
>   struct_ops_assoc (timer subtests) fail. BPF Arena kfuncs were changed
>   to be callable from any context. kmalloc_nolock() replaced kvcalloc()
>   in the arena allocation paths because kvcalloc() may sleep and take
>   ordinary allocator locks, while kmalloc_nolock() can run in NMI or
>   non-sleepable contexts.
>
> The lqarx and stqcx. instructions require the 128-bit operand to reside i=
n
> a consecutive even/odd register pair. In the Power ISA, the operand uses
> big-endian register layout where the most significant and least
> significant 64 bits are in the even and odd registers respectively.
> Until now this could not be expressed in inline asm without hard
> register constraints [1].
>
> GCC now supports this through the PTI mode attribute [2,3] for PowerPC
> and it will be available in the upcoming GCC 17 release. Backports have
> landed in the GCC 14, 15 and 16 branches. GCC 16.2 is the first release
> which has PTI mode support. For older GCC releases and clang there is a
> fallback implementation with hard register constraints.

Is there a feature request in llvm's bug tracker? If so, can you link
to it? If not, can you please file one, then link to it?
https://github.com/llvm/llvm-project/issues

>
> Additionally, this series enables PPC_HAS_LBARX_LHARX for Power10, which
> was previously omitted in the Kconfig.
>
> [1] https://github.com/linuxppc/issues/issues/463
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106895
> [3] https://gcc.gnu.org/pipermail/gcc-patches/2026-April/712831.html
>
> Nysal Jan K.A. (3):
>   powerpc: Add support for 128-bit cmpxchg
>   powerpc: Implement 128-bit cmpxchg fallback
>   powerpc: Enable lbarx/lharx for Power10
>
>  arch/powerpc/Kconfig                   |   8 ++
>  arch/powerpc/include/asm/cmpxchg.h     | 100 +++++++++++++++++++++++++
>  arch/powerpc/platforms/Kconfig.cputype |   4 +
>  3 files changed, 112 insertions(+)
>
>
> base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
> --
> 2.52.0
>


--=20
Thanks,
~Nick Desaulniers
