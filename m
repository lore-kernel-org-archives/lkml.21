Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795127298;
	b=nDf5DEdaA2IrIDgVJqDjd1g/HMStv/MUic++H6KhI64sD2y6z8l48KP/++ctW4kvKSrr
	 erJ78X9aB1vmqaZ15JwRV+foIIOyYN0PaI76rLYBGfIAYqou4ZrOm6LyOhSyLNA9tK+uJ
	 2UAQwI4shze/EkDd8AsXIndYiUEVVceqQ8NAIkSzrHYOWgWknGkCkCcjLiEybEMOq4Bys
	 dOPCA3ONJ+BDdLCQ2DEJwpffzJTN/ixPw+44e7qMfU6QxEPBNQ3U8o24Jx+FqQGdJHpPB
	 U9/fSGhBEquPBSUi1Dk1haqmGAbIwrZeI9S0H5hXqlwSDndKTtwU5+IwCymFFBkQc+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PqOM/IVleeod7A0pYm+8MQSeW6D2IecEyUtYHLW5mL4=;
	b=q8jkiHJmPTHrjkvxfagTAs5sixORKFjLNvCryWmSQoOeTMAaObFD1Tmnl1Mwo0JXTlq5
	 zLtV3s2Q8sO+MV5sAZtIsiwztKNFHRTYcgdmeG63GtlCzNuo7GZ1fIHxk8R6YDxkrdjsC
	 JbcOgY5iH/IWF4xr1pRO19q5JcIiwfgeVCxf53B3svFGhvF33r4uNnGTkz6mhPIu9FL6r
	 uCJ0OjPjOjNorpMVEX20O0jDQZa/oTQeB9nxB25ZX+ooOyAXU3x1GOFjfKD299p4X8nML
	 CCCcNYuyiesh/FYw02o+tfa4DF46Ir4JXIJZLDjPZtEaXA1RehZDz94qkWZ/HeIdSnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nev0cxZu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F8606A337
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 701F8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nev0cxZu
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so1982265e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795127296; cv=none;
        d=google.com; s=arc-20260327;
        b=RWI8fPuqzezqG8YbaqxQy0SktzwMClRE+jY1owuegr6PFMAidqDVTUApNU8UEf0zeh
         ZTAZsiiw1rPURvJAHhv7QUZWlCaK2MYJkJpf8IP2pkpwYDs8hv7Qpfn8v2+iu7AI5mrl
         X9Lsg/5vLLt6E57GvlqCGZ3WR1th8o/gJRjDu9Zk57vQmy6Rg9CRE8UdnhpGNaM46hmV
         HDPGX1E9e1pViKzY8FxBWgb53dC/Fuap6lOjDwqInlv7ffzZ1RRXP7Q2aHECeh7HT54M
         RgFFLZ75jXWPlPWXuDztIrnYC/qcVEx6BxyYbpM0I+56fphZoe+QqVNyik0fx/DBaF/A
         3+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PqOM/IVleeod7A0pYm+8MQSeW6D2IecEyUtYHLW5mL4=;
        fh=NWdyilaumMpbiqQZYyisuY7IrC0RWie7kMwNGC831xg=;
        b=VWnpUWTiz4avBCiR90wF9rAhs5yCF1Nv53v76QRA1GfOjNOYkVr1pk/y8ALTc0Scar
         qDj8hJgLTOkoXZjBXkFDFKf3Y95AjJ4FsZkW0g9Mhf+VM5vcf4oLOuTuGxe6IvjPIZMw
         3YuQMMdGySCQ0qqmnzCxtCCI/2L3eFAkdfrbhDd7tSGEmqV3wttpnD5rsoNC7zMzRY9r
         0Rh8H/Iwscq6Vn7lnsn1vBL5r9VFd/5bJVaAiOrVNymvkOLyBrzBtl/2fIBEEpuFc/B+
         8gPLybrgvSH5ecXYwTo4VrQidASsnAGUR/HSzpfGO+SU89Q5Qc7lit2lOaxe6RPhIr15
         b47w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795127296; x=1795732096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PqOM/IVleeod7A0pYm+8MQSeW6D2IecEyUtYHLW5mL4=;
        b=nev0cxZuS/Y124NbcheYqiimSGl+rxwr3V0vU3LhZI5Rv5NaqltmvN9z1kF3zLU+6m
         wk60cg0RHMGoK5rx6HkhBDg5TyW+vt2mVv2hVAZIzLb0CQA4WSOwLB5Kpl54Tjm+uzgx
         qdmftJ6CJWfT+rZgZ8NSoxFEiabHtHABuuN+xvaJGP4yRXlNX9kpwEuUoNY4JYymJazf
         P/k/aTMiQDUaqzptxwHffQXgdrjHwj1e4cjf/tdbsYmEZKid/RzauV0RHrUwyfMVzcQ+
         AsqvHeHqF23ElPhtaXNxgOnPzGocQ8vDpL+w8Oc6EDIcrnUJXCHg61+cRuUrcv3lhm04
         mCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795127296; x=1795732096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqOM/IVleeod7A0pYm+8MQSeW6D2IecEyUtYHLW5mL4=;
        b=oH27DLyMyZcfUubc+KAOIR2aEIIxD/P4VV10Ntv56+Lw2VzSxAORCPbb3XLIzm/j6G
         z4QY2CLJT0Kc5gBZ86RnVYPJfwUI9e3/cOYccLLXSd83RDUU+55q/zJYyYptYpEW8b/T
         /ZdSwVaEm1AX6SEQ43HVI6mkSu12HZC50DNFRsb9Pt9yfUoBCaLBjJbkuJcILcbbfRkG
         Ce+2sKavK1NYrupyk+K+eRCPSztV4Fm+WwGZp45S0L3QsqpAxEi+8RKWwrOXfYvk+cdh
         oeKjQYu4XM3ktPEHqh2H86/EqeD8WSsqQdH+9IW3epCd+oFYY327ChR7MyuxM+No+fLc
         A5kQ==
X-Forwarded-Encrypted: i=1; AL+hErGaFDb2SBc0K3dCWSe43Cmptmeo6GSMfJWSbYak4tIyp3Mm20w2/lGDEJZMBseX/IkHmq6M1U/sPdC07n4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OyM1BXoHhvjooyVKISKnKkYqbkQ5mKfLTmt21AIhvAfX97idG
	iWIh1j0aAoTz4wO1IdaSVyB3LUGKzSglyXusm9YqncgG+4fOm+zrpFOumPvwUGNsq8XdQetoyl2
	/irjgSUWdIGJ2KT95QQtAMzPMr1a3OKLEXEj6kgj7
X-Gm-Gg: AYBFou0nPvB9RV2F9RimqS8v5kxa9r7Joo+eLK6ClJMdgkCUXir84fHTirsE57AhQO/
	kxlq9+ZGRvFtRjWsgH15tdZyTKL3jqm33zK8sUw54vvKb9WrNy0TSmLkCck2f/uNQKquLaXnkO0
	I9jUCOExA3JIJgd+tgB8EBfDre4ANX+hhuIV6VqrK2ACqdMliv394/Rbzlru8qsfqmahSuH7PKJ
	75ywwMk7gNw9Aaq8gNoh9AUF9PiZM2fZxN01S4wSZfHz8o0aliucLu8uwEuy/6TCMg78hf9+egN
	RaX8UVEScfx36xc8gWGwigPO+4jQ4Z5BDRBdDIqE98kbkQ+i+VaX3//tHdmi2VLGoX5fH6KAtHV
	Hsd5BXSYVJrMcDb4mnJluQs+J3dSTWztiCFmCTZxiVamD6emCrq6l/WXxtpLIJ7h03ODL18nlNL
	hh8dCSust/tlmfnf4QAdjE8OVUKY7GLRTu34AmeGmP/+gXAYmOis6F8QxsfM9ccLND43/fVlDKO
	y6USoDRochBZ7xoxgrZeUpVp/wSPOFB/0TD
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id
 5b1f17b1804b1-4bb88809950mr22312695e9.17.1795127295355; Thu, 19 Nov 2026
 14:28:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119213147.1094488-1-usama.arif@linux.dev> <20261119213147.1094488-3-usama.arif@linux.dev>
In-Reply-To: <20261119213147.1094488-3-usama.arif@linux.dev>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 19 Nov 2026 14:28:04 -0800
X-Gm-Features: Aa3M54rGe2WhCo8NjeyvCl13h6yYFCLQD9z1s09DtfOo7EUnkavEum06rHONXb8
Message-ID: <CAKwvOdnzNU_xtLeb4vXSFe3DLN9QmdNSSReUmQahsLX+1pZxCw@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack fills
To: Usama Arif <usama.arif@linux.dev>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org, hpa@zytor.com, 
	gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com, nathan@kernel.org, 
	morbo@google.com, justinstitt@google.com, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com, 
	shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com, 
	atish.patra@linux.dev, dgreid@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 1:32=E2=80=AFPM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> With KSTACK_ERASE, every return to user space poisons the part of the
> task stack that was used since the previous return. The generic
> __stackleak_poison() does that one word per loop iteration, so a syscall
> that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hosts
> running many small VMs, stackleak_erase() accounts for about 1.5% of
> non-idle host kernel cycles.
>
> Override __stackleak_poison() on x86-64, as s390 already does, through
> the hook added by commit 491a78663e03 ("stackleak: allow to specify arch
> specific stackleak poison function"). Fill spans larger than 512 bytes
> with REP STOSQ and keep the word loop for shorter ones, where the fixed
> startup cost of REP STOSQ does not pay off. REP STOSQ starts to win at
> about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span gets
> slower.
>
> The fill is inline asm, so the noinstr function still makes no calls.
> memset64() would be the same instruction, but it is only static inline,
> and with KMSAN it is an out-of-line function.
>
> In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per return
> to user space (71 ns to 46 ns, scan included) over a futex, epoll, procfs
> and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix socket
> sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/proc=
essor.h
> index 77488ff5eb8c7c..049231d484ad0e 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(void)
>                                current_stack_pointer) < THREAD_SIZE;
>  }
>
> +#ifdef CONFIG_X86_64
> +#define __stackleak_poison __stackleak_poison
> +static __always_inline void __stackleak_poison(unsigned long erase_low,
> +                                              unsigned long erase_high,
> +                                              unsigned long poison)
> +{
> +       unsigned long count;
> +
> +       /* Short spans do not amortize the startup cost of REP STOSQ. */
> +       if (erase_high <=3D erase_low + 512) {
> +               while (erase_low < erase_high) {
> +                       *(unsigned long *)erase_low =3D poison;
> +                       erase_low +=3D sizeof(unsigned long);
> +               }
> +               return;
> +       }
> +
> +       count =3D (erase_high - erase_low) / sizeof(unsigned long);
> +       asm volatile("rep stosq"
> +                    : "+D" (erase_low), "+c" (count)
> +                    : "a" (poison)
> +                    : "memory");

Surely this isn't the only place using `rep stosq` in the tree, right?
It's not, see memset64 in arch/x86/include/asm/string_64.h.

> +}
> +#endif
> +
>  #ifdef CONFIG_PARAVIRT_XXL
>  #include <asm/paravirt.h>
>  #else
> --
> 2.53.1-Meta
>


--=20
Thanks,
~Nick Desaulniers
