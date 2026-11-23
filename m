Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459990;
	b=u0h+5njuJNbGjdZxAD+coHKT/d6jqK1d4qfZZSg0q5kWhFJP4rH8mXFlv1jjOvivUJJT
	 iQuhLmSGvj0shNYXpEPrBQgj/5NHLzE7aNuiqiC1MUWtETHn72KMu5VtV3zy/3dyEPckX
	 +JuZF+AxOUjPuOvT1gj/UqwyCe4x3lgzbOKaa/NPMRD2NoY3MSrjMP97HTevaiinZRejX
	 TSDuPcEDp4d/q522mRqpW2L19SyKrv+HMPDJLDIh2mQapivfXu4h1iN8CSFpXMRi5MWCA
	 OqKFTrgSqqhCNmkiTxQhOx71512cSMIMbJ0Z6ZIIxyaeI1kGf9k4/FrBEYILvrR13VA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OzK8e5va1iOv1sYIdDfpKtFNB5Tj3DOer2I2bPq8P24=;
	b=cvaEif321DkY4KxhKjVLKFEATXUW/9umBvocr2J6qdHTaqTlyxIlq6jOE7YNUiCdbPW/
	 dtEmsAyg6WL+eREPEhwi2j38mR41LxuccrPFLKGbZDvHt1xJuR8impK4ANBu1icJH87kA
	 VLmsERpeoZ4j5Kwmjn9Q41NXrfXNFB5j2DcmnQGwJfVbgz2F/sbKEpwthdTOdkCW81Osl
	 rMlH98kAjf7frGa7OiFKzUKA37F1KIEJ1iVG0rDjpGZcRzk/ZQOP6c83J8WVUyCTYCcsW
	 CIF83jouBGpawYQtKm8fotupsnULq/qHY5QSflr7x5BpSKMSR95mOhwlC0IPspJALNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CdlLT9qA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DED606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49DED606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CdlLT9qA
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so29179765e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459989; cv=none;
        d=google.com; s=arc-20260327;
        b=Zz6X3rozuZ+AH2dZQkcsc/4769IKjtZ2nls0QT3X8JxJou0FciGePzf39kkYCGV8uY
         5qVUs0bLLV+TiSTXVBO9XpUHYcKxTQIp8bsEBfy/Ag/ZuQ0wvS8wtKPkRYT1lmo2kZsP
         lS5HO5uTOwpG0NwWDUV4QYHsWSMnApSHkuQOYXi9v0JUU19DWnkjaLkk/c0REc2KruV5
         kC3Py1t4x+VEesuSJ8TQkj28VgjjoY06Ka4E0cvcSfC0DQU8qZIp15lkSxEo3feqlyVs
         2GINnDw+FTtXomV0xfA76ORHdol9MLDgINsm61GL3pm22PS/Pg10afG39/YANaTVdz0T
         m0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OzK8e5va1iOv1sYIdDfpKtFNB5Tj3DOer2I2bPq8P24=;
        fh=j1pgZtYaKQPW3jVhNWBzvmIWDDf2OwW/U0xp0BFr+XY=;
        b=Kgmtvj7wweldwnEvLNVLc0NhMctjlKA0lYpTxoXGYOaoSq5z8gFLe4SQ/sUmaXDGA/
         zaGLOy+XxQtfmm26Aj99O7OLIUfjyaITNI0zYaMSAKmTkkU3JXU0cvaSrS8ZhNjt4wz5
         obgpgiLciRXo4Gtkop9xD9lpqLMs3/agy0T+dbL804oDUeu8G/ghdcLdjqhDYP6hII4S
         hrlET604OVjOc2IqirDSLnFCUjm6QkBTBgus1FqWWpFi574dcPvdLTE566mK22cX29WA
         vWUXsymFNuRboVu1kEQc9dK77Tj6KFPTwlDh+9GBK42VlZlhm1FJhthFLmRwcwl8ThVu
         NuAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795459989; x=1796064789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OzK8e5va1iOv1sYIdDfpKtFNB5Tj3DOer2I2bPq8P24=;
        b=CdlLT9qA2pXjCH2WZFf7BS62GOJsjrzu1gCDGCGbr2jWqS4MWBI9UwNp8kWbyoyVci
         4oD7lh4+lFa0GL3ZUxwOZNN0ze61yWh91ebaHYl8uIZsWwopSSvC2b141+dBW/g0uJ8K
         TR32P3Bw5sjEkY51snLlefVUK63mVc9tMUbYNavLnfzp41CpH7hOh/DvT4omE9Fw8cYs
         X6GlFPUoF0x6zdoCM5c4l6x/NwxL6ZTxA1KKmBgcRus14VIcC8W4H0dQsCD0w5OUeU0Y
         DmffjVyaaX3x4/yQN1CCWPLf2CP1DL9CarMWAA7j5SJ5dZVd085JyVrOYeVDguDhgZkV
         303g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459989; x=1796064789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OzK8e5va1iOv1sYIdDfpKtFNB5Tj3DOer2I2bPq8P24=;
        b=AS6rL2wujx9u0llxUX3W9I9tzyF9ioMCPQ5lNRmrxfNIuPUvAe/Om4PB0ClJ5U+yLs
         T+wxW+R5cKAa1gzohHrrahd2Qar24kBuoxqyrflVhlRnbYhV91oOh70FLlCnBlnQI6Hi
         sWW7IeZQNxu0ugiYCJGPm1Ixz91Z1/0F7GXOqLBZZEBDtwVm5tJ5N2ht00TwSh+snzaO
         xgpmAHjmFfp2PkPCh8TxF1Bunh8jVYmMjMtGVWjzEQvEUIZGgbfUkVTyaVESk6/nQz7q
         yQfxW2OWqmbKZC0sIYs+vQ03Yw37vE0xz/PmpSyZsviIbZ4K46zNX/1QHCvrPx75oQno
         0HAQ==
X-Forwarded-Encrypted: i=1; AL+hErE1DGO2r4+hKnzFmXeeH+5efZ/UWhrf4gH8opQmyxqy24spyDiqucya4A0J8Tt6d7vjlGXvKKqLCndPtjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/041SJixc8thfTzvjyZ/VY1n4/tOGnq2kX4sQjzA+BU6DOe5h+
	ojh9iRhfUaNkdz+ipbjZYtBv16equg5zXWJ3DEGx17Va3Ggpk3buyQ45huT8kDnSzYdqYKIm4v8
	G72emat7S3uWa9O50MiPI1FbPbeL8qzkQoh98M735
X-Gm-Gg: AZFdTZc4et62bnarGKhFpDdpA0BOJJerAMgLeFBEbe+cDaGJMdzA34JyaO6l3kGNYu+
	YDHCCcg4cZ191sfyUr0R6MEn84bWw9HS9QcGKhNWxJfDl0ZrKlSjwKLGsR+1JOF08E7O5btepXF
	qf2NMj+sM05QWUpH2D8x536sreDfuK8e4u5uQqbIvqRLXdhrfnd7yA7s/wXlMDBEPrc+S79UhOq
	oUQneZiNN4KinpqYiWUsnb3SvgPZmLRglCVkOINYBxne4r9TipVHQJo8GD/8ZSWqudcWPqgmkO6
	kIOb+cVoYAcaAKvtYunk16XM8WFd5+m/yY3qn6qnL4JFHEEHFfBgcGb8sf9mM4b9Ha/xZduvy5y
	X03s8Vst+aNzxQOworhUP0aqvacpspwJuM0WjMWK/BT5A5gzhb7psbg6VSyIVBJQV86qVDfvVwq
	50vCaD6m+b33LMdO19tCBkJKs8CBGbA4x/Gx6Svyd4ssEcnuo2mjpzgUUkxCtaJzFvgy5JxyNGW
	9kump4Wv15FhoT/1EBRY0+rKxQl+LN5aqUnfw==
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id
 5b1f17b1804b1-4bb8893a963mr247968845e9.30.1795459987961; Mon, 23 Nov 2026
 10:53:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123025645.2385330-1-shingekinocore@gmail.com>
In-Reply-To: <20261123025645.2385330-1-shingekinocore@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 23 Nov 2026 10:52:56 -0800
X-Gm-Features: Aa3M54rjSx1yo0dE65bPncdIJw5ozLFQnetXM2ws-XF0yEzirPrTrGmtq_bnHFU
Message-ID: <CAKwvOd=aZam1UR8O5okim1PJqjm5Biv+cBQUmA8ydctUd0v=QA@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: Fix genex.S build with LLVM before 21
To: Tzu-Ching Yang <shingekinocore@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Marco Crivellari <marco.crivellari@suse.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-mips@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 6:57=E2=80=AFPM Tzu-Ching Yang <shingekinocore@gmai=
l.com> wrote:
>
> Since commit 56651128e2fb ("MIPS: Fix idle VS timer enqueue"),
> BUILD_SKIPOVER_PROLOGUE uses label differences as the immediates of ORI
> and PTR_ADDIU. The LLVM integrated assembler accepts such an immediate
> only from LLVM 21 on, so LLVM=3D1 builds of every MIPS configuration fail
> with LLVM 17 to 20 unless LLVM_IAS=3D0 is set:
>
>   <instantiation>:7:11: error: expected an immediate
>    ori $26, r4k_wait_idle_size - 2
>             ^
>   <instantiation>:10:14: error: expected an immediate
>     addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>                ^
>
> Wrap both expressions in %lo(). For that operator, LLVM 17 to 20
> emit a LO16 fixup instead of rejecting the operand, and resolve it when
> writing the object, since both expressions are constants by then; no
> relocation is left. Both values are between 2 and 30, so %lo() does
> not change them. GNU as and LLVM 21 to 23 emit the same code as
> before, except on microMIPS, where GNU as now uses the 32-bit ADDIU in
> the delay slot instead of the 16-bit one. With GCC, the 2 extra bytes
> replace the 16-bit NOP that padded the end of the prologue, so all
> symbols keep their addresses; with Clang and LLVM_IAS=3D0, except_vec_vi
> and the code after it, up to nmi_handler, move by 4 bytes.
>
> Fixes: 56651128e2fb ("MIPS: Fix idle VS timer enqueue")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505071331.Z0N2eSkr-lkp@i=
ntel.com/
> Link: https://github.com/llvm/llvm-project/commit/b65e0947cade9bd39036a77=
00b54c1df4ec00756

Thanks for the patch.
Confirming that landed in clang-21.

Link: https://github.com/ClangBuiltLinux/linux/issues/2201
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> Cc: stable@vger.kernel.org # 6.6.x: 56651128e2fb: MIPS: Fix idle VS timer=
 enqueue
> Cc: stable@vger.kernel.org # 6.6.x: b713f27e32d8: MIPS: Move r4k_wait() t=
o .cpuidle.text section
> Cc: stable@vger.kernel.org # 6.6.x: 2b6d718c8dbe: MIPS: Fix whitespace da=
mage in r4k_wait from VS timer fix
> Cc: stable@vger.kernel.org # 6.6.x
> Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
> ---
> v2: only the stable tags change; the code and the rest of the changelog
> are those of v1 [v1]. The tags now start at 6.6.x and name the two
> prerequisites Maciej suggested [review] plus b713f27e32d8.
>
> What each stable series has today, and what it will get with the tags:
>
>   series  56651128e2fb  b713f27e32d8  2b6d718c8dbe  will get
>   ------  ------------  ------------  ------------  --------------------
>   7.3.y   yes           yes           yes           this patch
>   6.18.y  yes           yes           no            2b6d718c8dbe + this
>   6.12.y  no            no            no            all three + this (a)
>   6.6.y   no            no            no            all three + this (a)
>   6.1.y   no            no            no            nothing (b)
>
> (a) On 6.12.118 and 6.6.162 the three cherry-picks and this patch apply
>     cleanly. For malta_defconfig, genex.o builds with GCC 8.1 and 16.2
>     and with LLVM 13.0.1, 17.0.1 and 21.1.8 (6.6.162: also 11.1.0),
>     and kernels built with GCC 16.2 and LLVM 17.0.1 boot under QEMU.
>     56651128e2fb needs b713f27e32d8: without it, all the code after
>     r4k_wait in genex.S is placed in .init.text. Both were queued for
>     6.12 and 6.6 in 2025 and dropped because of the build failure
>     fixed here ([1] below).
> (b) 56651128e2fb conflicts in idle.c on 6.1.y and older.
>
> [v1] https://lore.kernel.org/r/20261104030147.3117325-1-shingekinocore@gm=
ail.com/
> [review] https://lore.kernel.org/r/alpine.DEB.2.21.2611040746160.6502@ang=
ie.orcam.me.uk/
>
> The notes of v1, unchanged:
>
> > No MIPS hardware here. Against mips-fixes (v7.4-rc1). All builds use
> > W=3D1 and kernel.org toolchains.
> >
> > - genex.o, before and after, with GCC 8.1 to 16.2 and with LLVM 17 to
> >   23, both with the integrated assembler and with LLVM_IAS=3D0. Configs=
:
> >   64r6el, 32r6el, 64r2el, 32r2el, eyeq5, eyeq6, malta (little and big
> >   endian, MIPS32r1, microMIPS little and big endian), ip22, ip27,
> >   loongson3 and cavium_octeon.
> >   - The objects are byte-identical before and after with GCC, with
> >     LLVM_IAS=3D0 and with LLVM 21 to 23. The only exception is the
> >     microMIPS ADDIU above. The 4-byte move with LLVM_IAS=3D0 is harmles=
s:
> >     set_vi_handler() computes the offsets and the length of the vectore=
d
> >     handler from symbols before copying it, and ejtag_debug_handler and
> >     nmi_handler are only referenced through their symbols.
> >   - LLVM 17 to 20 now assemble genex.o for all of these configs except
> >     microMIPS and Octeon, which the integrated assembler rejects for
> >     other reasons. For malta (little and big endian, MIPS32r1), ip22
> >     and ip27, these objects are byte-identical to the LLVM 21 genex.o.
> > - vmlinux of 64r2el, 32r2el and malta, built with GCC 8.1 and 16.2,
> >   LLVM 17, 20, 21 and 23, and LLVM 17 with LLVM_IAS=3D0. Where both sid=
es
> >   build, vmlinux is byte-identical before and after. With LLVM 17 and
> >   20, genex.o was the only object that failed before, and vmlinux links
> >   after. No new warnings.
> > - The malta kernels built with GCC 8.1 and 16.2, LLVM 17, 20 and 23, an=
d
> >   LLVM 17 with LLVM_IAS=3D0 boot under QEMU 6.2 -cpu 24Kf. That CPU use=
s
> >   r4k_wait(), so interrupts go through skipover_handle_int. Each kernel
> >   boots to an init that keeps the CPU going in and out of idle and then
> >   reboots; a QEMU trace shows every interrupt that lands in the idle
> >   region resuming at r4k_wait_exit. A microMIPS kernel does not boot
> >   under QEMU -cpu M14Kc with or without this patch, so the microMIPS
> >   change was not run.
> >
> > In the 2025 thread [2], Nathan suggested requiring LLVM 21 for MIPS in
> > min-tool-version.sh, and Maciej an #error for older Clang. Both would
> > also stop LLVM 17 to 20 builds with LLVM_IAS=3D0, which work today, and
> > the stable trees would need the same change before 56651128e2fb could
> > go back to them.
> >
> > On 6.18.y, which also allows LLVM 15 and 16, the patch applies after
> > 2b6d718c8dbe, and LLVM 15 and 16 fail and are fixed the same way.
> >
> > The 56651128e2fb backport was dropped from the 6.14, 6.12 and 6.6
> > stable queues because of this build failure [1], so 6.12.y and 6.6.y
> > still lack that fix.
> >
> > [1] https://lore.kernel.org/r/2025051415-unloader-likely-b0e6@gregkh/
> > [2] https://lore.kernel.org/r/20250521224450.GA2412476@ax162/
>
>  arch/mips/kernel/genex.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index be1b049d856f..ef27965f6ad9 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -146,10 +146,10 @@ r4k_wait_exit:
>         MFC0    k0, CP0_EPC
>         /* Subtract/add 2 to let the ISA bit propagate through the mask. =
 */
>         PTR_LA  k1, r4k_wait_insn - 2
> -       ori     k0, r4k_wait_idle_size - 2
> +       ori     k0, %lo(r4k_wait_idle_size - 2) /* %lo() for LLVM < 21 */
>         .set    noreorder
>         bne     k0, k1, \handler
> -        PTR_ADDIU      k0, r4k_wait_exit - r4k_wait_insn + 2
> +        PTR_ADDIU      k0, %lo(r4k_wait_exit - r4k_wait_insn + 2) /* dit=
to */
>         .set    reorder
>         MTC0    k0, CP0_EPC
>         .set pop
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
