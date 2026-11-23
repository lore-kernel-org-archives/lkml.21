Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406265;
	b=sn6L8Re4wbobUreouKkJidLq/fcXkbclBYQwLooxoFVHziD3728uYS4cHxMiNXgNtDRZ
	 Y86VExXeqgQQYdnVj41kUimk9Mb3zsd2wKia+ILyF6K8MuqghhciHTRSn835SESBuQ0cg
	 J9EkzzLZGDB17ZmELtKgQFOFHzGJCAsgbfgQ9iXJutJEwRTeCIOIkJfAjzseu5nAhysxi
	 M9bgdL0pJ29X7oZm5fY9bvsLD4ffJdTCemGmrueCJ03iOwzWRkR6ftOvAPJiJSvFuCk02
	 pZ/fu2UHaLT8Q130XQUEnCf+6aN9J7+wwRB2kpXOp35DzlqqvjW4UYBb7Dho6AejrQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rdX3BSYdbVjaIyIWjU8rHw3DXYIedtrWZubrMfj2zsw=;
	b=B3Vp8ZWu/RYRtGnQUpc3aAqNyJDCXKylgsf2b9rNWMN51x7kSdBfiIWeTUro5MrTC/ZA
	 Mow6AVwiaFeJMVYtgPar1yL/CtOb2BCIdQR15NNe51YwiHTfq7IeGDTwvurGxPaouMLOC
	 wpUEP8EkmADqbyxYkc9+zMCNCDnfxaJqzdcfruAe4iFgkNtBevCMFLkRJwIFqaJxmOg1o
	 0mXm8m709HGuDSSrSGPO2HicRGKKZ8Owjijt0xq0YckA2ubzEIGPKlmdeBVOwYo5p7I54
	 Gm/yc00xJJHzjySxzBhDBLNxuIx5RxUqmfDrXybjq3wxDAwDuwENCx/nZn1NqNKuIkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMIJZ1Qo;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5BA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA5BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMIJZ1Qo
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1308164a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795406264; x=1796011064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdX3BSYdbVjaIyIWjU8rHw3DXYIedtrWZubrMfj2zsw=;
        b=LMIJZ1Qom2C68AFpllTmaEmyK4bDNSuOfwCyFUEEFjGXg24xLrirKNdB0moooSg5pR
         Pm6EByrcFA6v2zMj2eRuT08YX8Nubt8m2zJ8MfKzo7WSDkbB4yIY/b1+WCvcDyi47Bff
         gsKcOxJehwThI1lZ05OPE4JoNqX4rSWhqyApu6SkGvX1/XPdQKymHq4/RY7tr0ZHRrJk
         00zVfdEyOSfEFecnq0iAAqLLFmH/jCmgltttFvHBkqhnPNLs88PphNfQoWxOGJIs3HCo
         RA5xp5ySH2USK2qo8hef5bdYj3+gQ/w20yqmIj7uqXH9QAQJ9MZKf5jEkuCG/Qy1bqlk
         y3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406264; x=1796011064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rdX3BSYdbVjaIyIWjU8rHw3DXYIedtrWZubrMfj2zsw=;
        b=sAKZe57Esk4U6vEn0hfUrCw65OcWMeNzxopJqcE0o6XIlGs3aB2ehi8m+si3DtkDIW
         cDEJjGItOMf4OBnMBMk5l6V375dOlyloS3hI1FLQNfe0hg7+UQ/EX/eYtW3uV8nwjuPQ
         1VRgm6upxPJvm3zyYO2BYHC7EdUJrbFRIlDU/BoDRzdN+Db1DbozWSZUHCHeoce73GSc
         JiQ/YUydkzi/fuAnj9POjTfO4GRwj6YT71t5edcwqRVbgtS8vskx3U5RYBuG2fY3n9mH
         IAZg7b+BO0GVqJkKNQ/29uuqDGKW+WplHOOBDTephBteFPbz0tMK/Sk33+VReVBVFMDx
         mtvQ==
X-Forwarded-Encrypted: i=1; AL+hErEtQoL0UalZw11AxZ1Z6jnisbYnqQup9rRekSK0tw08uqwOGjt00cPtV9HSnAeXhM0PRssobgjVxutSjSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+iQ88S1S1/RH9rShwwmlxGgEhhMdjX1zE9/wdkL/cl7KKK0U1
	IYhjTcgjx3BUgjdZKKClky8NEB+l2WoHa5kpgXQ54WkQ2fu845rFOHt2
X-Gm-Gg: AZFdTZdmzzvsWqlkM6YtaGv9T17jpMGid7FjNLxSO0WNcOqmzcmnusYwaWTbbIstlU5
	WNVUU9Q2YfYBvtFxpxU87UbcmdA4pTlN7+6TgZs8ysRS5N+WLHWsR6ILZfMqn7lelwvmX5lj4Wh
	koNijp8GxJ9OPd65fQNqSPZVFEZWQmFAUl9jIY5QZeqe8RDDP9ysqv19CPOqJ1mvtuSyBt18oJV
	zNVYpazlQfmUA80AETPOe7tS9f/mUAlRwJ3S/UZiI34Qj9C5FYhtpttL5AIIf8/te+fSPvH9YpP
	0oldaj6WKcuN90xIv4ODa9KSgL5M0/x9hyI8nrypK+b9fCc9YGhJgXXx3H480Y+AFoE2JQvpv9n
	vRQQeRT4IwPbYrN8mEGvUBfoyOhV1antbunj6zNuSYsKPqCBJZSRQ0NWAcWltoiCOvMucPa+hQa
	oJxBaEiPPW/SNx693tYFOcm10SbRXj36w/ghzWHIMl3t5jyp7PO0fHehQdIjgCnzFQDsSYVw/Wr
	DFDEfy1Uz1CsqPFHRVZGoPZdZB6yE6kGt/7SqDnVQwZeEbpIPxRWGGzUGMj9DLE5sonMqWqV77U
	HRfeX5Q7dJaJRw9TbEBkDjD08X3mLuj0yz6WaeZZBGxxk0eQlLI7exA=
X-Received: by 2002:a17:90b:4b85:b0:3b0:96b4:ceb7 with SMTP id 98e67ed59e1d1-3b41c7c2384mr9850850a91.8.1795406264056;
        Sun, 22 Nov 2026 19:57:44 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04a49cfffsm37453605ad.46.2026.11.22.19.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:57:43 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: Make cpu_has_mips64r6 constant on 64-bit r6 kernels
Date: Mon, 23 Nov 2026 11:57:32 +0800
Message-Id: <20261123035732.728281-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <alpine.DEB.2.21.2610301515350.42255@angie.orcam.me.uk>
References: <20261030140430.1857741-1-shingekinocore@gmail.com> <alpine.DEB.2.21.2610301515350.42255@angie.orcam.me.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the late reply: your mail did not reach my mailbox, and I did
not check the list archive until now.

On Fri, 30 Oct 2026, Maciej W. Rozycki wrote:
>  Umm, the wrong fix.  You want __isa_ge_or_flag() instead, plus obviously
> `cpu_has_64bits' is also needed (and __isa_ge_and_flag() can be discarded;
> I guess it was meant to take care of what `cpu_has_64bits' does and broke
> the whole idea by mistake).

Your form and v1 differ only on pre-r6 kernels. I built both on
mips-next (bfe97f12a0a6), and this is what cpu_has_mips64r6 folds to:

  kernel       mainline        v1              your form
  ---------    -------------   -------------   -------------
  64-bit r6    run-time test   1               1
  32-bit r6    run-time test   run-time test   run-time test
  pre-r6       0               0               run-time test

On r6 kernels the two give the same vmlinux, byte for byte
(64r6el_defconfig and 32r6el_defconfig, GCC 8.1 and 16.2, Clang 23).
On pre-r6 kernels your form compiles the r6 paths in behind the test,
for example the dmfc0 and dmtc0 of c0_ebase in decode_configs(), and
on 32-bit kernels every cpu_has_mips_r6 check also tests cpu_has_64bits
and MIPS_CPU_ISA_M64R6. In bloat-o-meter -t that is +264 bytes for
64r2el_defconfig and +3352 for 32r2el_defconfig with GCC 16.2, and
+168 and -2500 with Clang 23, which on 32r2el_defconfig no longer
inlines two prefetch helpers in mm/page.c.

> Your proposal precludes the use of R6 stuff
> with pre-R6 compilations -- not sure if that makes sense, but let's stay
> consistent with these macro definitions.

In mainline cpu_has_mips64r6 is already 0 on pre-r6 kernels, and I do
not think a pre-r6 kernel gets as far as cpu_probe() on an r6 CPU.
The comment above __isa_ge_and_ase() in cpu-features.h says that
"a kernel built for an older ISA cannot run on a MIPSr6 CPU", and
under QEMU -cpu I6400 (an r6 CPU) a 64-bit malta kernel built for r2
takes a Reserved Instruction exception at the first jr in head.S.

That leaves three ways, and I will send whichever you prefer as v2:

1. v1 with the unused __isa_ge_and_flag() removed, and in the same
   series a patch that defines cpu_has_mips32r6 as (MIPS_ISA_REV >= 6)
   to match, like cpu_has_mips_1 (MIPS_ISA_REV < 6) in that header.
   cpu_has_mips_r6 is then 0 on pre-r6 kernels and the code that it
   guards is dropped: in bloat-o-meter -t, -11524 bytes for
   64r2el_defconfig and -11156 for 32r2el_defconfig with GCC 16.2,
   -18704 and -14140 with Clang 23, with no new W=1 warnings in these
   vmlinux builds. r6 kernels stay byte-identical to v1.
2. v1 with __isa_ge_and_flag() removed: pre-r6 kernels do not change.
3. Your form, with the sizes above.

I would suggest 1.

Thanks,
Tzu-Ching
