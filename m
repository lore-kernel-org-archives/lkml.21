Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692450;
	b=3AP8hScFlIx865AlAK3/yHnxR4lR8K2SB7o+iUZfr+Hdugx26K/qgTctfCS3arsm78GX
	 d8XfH+NV1ZEsSfOUd4jld2A0DEYWpKHNxFIGfwDzMakYnWmniYlWxYAbPchiOn1N3ej0F
	 wPfjXM4h3uIX3iKF086yi183oqAz4N4f6F6JqbLChjuw4GSjDk2TYpCt3WrLXgAWSunuZ
	 08aHJg/+cLEaAEvs3NupNmQ5Z9TskW7CzAYq9KSmMWobJZo0IbCUYK5/WaOeBfnNveGGr
	 nNHJn+PXDK8iHI41lGNE++Bn8k+h4h4/h8vUBj+v7SNinhiYESQ5xFp5m3QILHb6SqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0BkCbk1BZezpNWO2fSE0tmudVFsNXM8eMjdZoP6Bz5s=;
	b=r5EKrfHcftHXbI292tTjCfAAfZJkI2h9Tvz/eisnCbxLF3hMV2Vq6uZlYwgYePddVOXb
	 eL+/ML876yhyLtLfMJ25N0OTjXsu7XYqLdhpqOiN3PzBJU+72r6YaC4d2auD9hdeRE4sG
	 BwlfPpvQetMosRVoqaVlNs17wcdcdD0X8Q+pIsJjiYptce+bnqbgvQrW1lFqoIVbjfYNE
	 OPVaIGxAYy/G5sYTdmEw+iW7LRFef//9lbCdI3IZLBHffSS5EZyu7RV5K655utt0kDuQj
	 lmhfeQOUJ2T0xIc7nqPXWbMypOp3Euw2J2tKQqMpX+r5cJyv5h85thhbh8vCg+wnKXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kwFrKoVB;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF6F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF6F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kwFrKoVB
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso49122245e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795692449; x=1796297249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BkCbk1BZezpNWO2fSE0tmudVFsNXM8eMjdZoP6Bz5s=;
        b=kwFrKoVB5hzmQhv6yuusxdLFrwEaIKKbFwB27NqjqrY7nr4rcKokybyObjZFnRrVYs
         8gNvwpRRNLmGde+JzFX6J7QsRUDi4huOlm3BaXXmQ5zznxpCvLxHWh1QcHWltDxoBTQj
         uabQ1BLeRgkn6wkWt2wuXAOCx3SpwLUhkPVdP4DaN09Xjpl8GSB6Lik1Ncdfg+OvXLr6
         VL0mMefmNEMCgud7ZChy+cEhqK97ZQMkUYZmj+dtycRcR34xa4nXsxt1u6+Dy6nRC/0W
         8wGTRebVKfjxDl4OdktXXp2wtjYxD8jUzgwBaw1eSE8GbmR1oCG6vI8W0UTSo6DaeHgI
         Vbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692449; x=1796297249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BkCbk1BZezpNWO2fSE0tmudVFsNXM8eMjdZoP6Bz5s=;
        b=sIkZIf2VSeCpIF7dvXiLGrvHGCtILFJzOIM6j8kTwKOlT1Q7PXjz5yaG7Z61l/DMPJ
         zViDOTFEazP76bVm/CYJQ73zDBGtnSPX4RwOn+meGYukt3tlYlWLgQaLtgLKuFTCBjZ2
         nnWK/Hk74uEEvJR1a3cocN2HTNren9myYt8OvWwPy9yAXLHambH9gHjgMeUEIiJp6OxG
         jvujz7H2SwgVdDTYXrVMriu3bTYAUV1y9SxfqpgsxrrHDz3do9ayg+V28QU90cOTb3Pj
         j4Gm+c9vGbBVf7B4TuVoEF7Os7LK8OzpuRHp/yuF+NNvIvt2slCVFf96qHmLd2LKkNEs
         omdw==
X-Forwarded-Encrypted: i=1; AL+hErHoSWAT7XrYY54FiIhExW385GGy7lZFL70uk9hNNRFQcaM7dUvaYv77PEeR7gWT7uwrfKnSzNmhkvWeqKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aN8xG5tWCuNCroxPqCjG3Qs+jlz7F6WRACQqXdD4S20d85WcQ
	B3g1Ip5Z2bRgQ7PNaJbXTTKXUgglrLn/00OF1EjxauxWnP38cOPacBYw
X-Gm-Gg: AZFdTZcHnDOqY3YMYwWUGh3+h51UFoK2K1Xafuo1Dc3E/AblAV4ztJ8vmH4UDs0NZ6i
	wodXikOS2+Mgziy8HCv8TP3TpP6W0Giw2+DACeUNy/igD7ZQKd31iCuRbwkUYZ+r9D/5uFv522T
	Y4DULQpoFAQAE0GPIFSuShDIdGinNYA/5/YrbQu0UzpkdwbBvj9ds6/CJsLyToSi/n3MXdcPE+x
	GDyOXLu23Jv9qWIh4ne6kEPZsyi/yl4bbkygZ9Q+StlnscNSuUvZSwWY+3gDLsD3+4nbOUxoZ86
	S7e6IXY7Fnz2JKs/RYkBpkOsEb2seqlPTbiXpmA18XVVt2MWZOeDruxT+tskIODvsJsFxDQKGE1
	LB8oLuwdQh9+vP460KAWjGePRdZyfHZPD9WI9V+08f6VcZYKibcNCos64+6fgWQjuCrvt5c4/Pf
	aR0yyMPKBCSk49ppL6NwBiz/zWhWwkDKU4FPnkvLsKVxSJ4N15vFIt1gFwKRpxKXB1A7FJDwe4e
	X5RbGm9jM0gMgDQAV4F1Yqe9HgMHtTOjhAY44iJiBgvr1L+EQOFB0xdKYLXuUtkhFqqvSNOXWuf
	BNetTHkOY5HP38OPmOLzLCLbJyoa+HV9HWoZmHgu1smbr3JOIG68vjsWgs9meWHXNlw=
X-Received: by 2002:a05:600c:4f4c:b0:4bb:8503:69f4 with SMTP id 5b1f17b1804b1-4bb888097a2mr516443125e9.5.1795692448756;
        Thu, 26 Nov 2026 03:27:28 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm816437995e9.13.2026.11.26.03.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:27:28 -0800 (PST)
Date: Thu, 26 Nov 2026 11:27:14 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Jeevitha Palanisamy
 <jeevitha@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Andreas Larsson
 <andreas@gaisler.com>, Usama Arif <usama.arif@linux.dev>, Kevin Brodsky
 <kevin.brodsky@arm.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/3] powerpc: Add support for 128-bit cmpxchg
Message-ID: <20261126112714.021a3e66@pumpkin>
In-Reply-To: <20261125174035.1412724-2-nysal@linux.ibm.com>
References: <20261125174035.1412724-1-nysal@linux.ibm.com>
	<20261125174035.1412724-2-nysal@linux.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Nov 2026 23:10:22 +0530
"Nysal Jan K.A." <nysal@linux.ibm.com> wrote:

> Implement arch_cmpxchg128() and arch_cmpxchg128_local() for 64-bit
> little-endian PowerPC (POWER8 and later) using the lqarx and stqcx.
> instructions.
> 
> This enables HAVE_CMPXCHG_DOUBLE, which allows SLUB to use the lockless
> __update_freelist_fast() path and provides kmalloc_nolock() required by
> BPF task-local storage and arena allocations.
> Select HAVE_ALIGNED_STRUCT_PAGE to ensure 16-byte alignment for struct
> page as required by quadword load/store instructions.
> 
> The lqarx and stqcx. instructions require a consecutive even/odd
> register pair, with the most significant 64 bits in the even register
> and the least significant 64 bits in the odd register. Leverage GCC's
> PTI mode variable attribute to allow the compiler to allocate suitable
> register pairs. On little-endian, the halves are swapped to match the
> memory layout.
> 
> Link: https://github.com/linuxppc/issues/issues/463
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106895
> Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
> ---
...
> index dbb50c06f0bf..b3164c3c0b81 100644
> --- a/arch/powerpc/include/asm/cmpxchg.h
> +++ b/arch/powerpc/include/asm/cmpxchg.h
> @@ -6,6 +6,7 @@
>  #include <linux/compiler.h>
>  #include <asm/synch.h>
>  #include <linux/bug.h>
> +#include <linux/types.h>
>  
>  #ifdef __BIG_ENDIAN
>  #define BITOFF_CAL(size, off)	((sizeof(u32) - size - off) * BITS_PER_BYTE)
> @@ -617,6 +618,65 @@ __cmpxchg_u64_acquire(u64 *p, unsigned long old, unsigned long new)
>  }
>  #endif
>  
> +#ifdef CONFIG_HAVE_CMPXCHG_DOUBLE
> +union __u128_halves {
> +	u128 full __mode(PTI);
> +	struct {
> +		u64 low, high;

There seems to be a mismatch between the register order that PTI
assigns and the one that C uses.
It might be less confusing to swap low and high in the above
and only use 'full' (probably renamed) in the asm statement.

> +	};
> +};
> +
> +#define __CMPXCHG128(name, entry_mb, exit_mb)			\
> +static __always_inline u128					\
> +__cmpxchg_u128##name(volatile u128 *p, u128 old, u128 new)	\
> +{								\
> +	union __u128_halves tmp, r, o = { .full = (old) };	\

You don't need 'o' in a register pair, it might be better
to just have two u64 for the two halves.

> +								\
> +	__asm__ __volatile__ (					\
> +	entry_mb						\
> +"1:     lqarx   %[r],0,%[ptr]\n"				\
> +"       xor     %L[t],%L[r],%[ol]\n"				\
> +"       xor     %[t],%[r],%[oh]\n"				\
> +"       or.     %[t],%[t],%L[t]\n"				\
> +"       bne-    2f\n"						\
> +"       mr      %L[t],%[n]\n"					\
> +"       mr      %[t],%L[n]\n"					\
> +"       stqcx.  %[t],0,%[ptr]\n"				\
> +"       bne-    1b\n"						\
> +	exit_mb							\
> +"2:     mr      %[t],%[r]\n"					\
> +"       mr      %[r],%L[r]\n"					\
> +"       mr      %L[r],%[t]\n"					\

If you leave this exchange to the C code it will likely get
optimised away.

The same is true for the fallback code in the next patch
where you can use asm("r14") and asm("r15) for the two halves
of 'r' and then combine them with arithmetic for the return.

This would all be more readable with slightly longer variable names.

I'm sure the above and the fallback code could be made similar
enough to avoid the duplication.

David

> +	: [r] "=&r" (r.full),					\
> +	  [t] "=&r" (tmp.full), "+m" (*p)			\
> +	: [ptr] "r" (p),					\
> +	  [ol] "r" (o.low), [oh] "r" (o.high),			\
> +	  [n] "r" (new)						\
> +	: "cc", "memory");					\
> +								\
> +	return r.full;						\
> +}
...
