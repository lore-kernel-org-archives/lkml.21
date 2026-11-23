Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432526;
	b=5g2kuPa8ATc2AWymSUWez2pXL2G8D0mB32/x9g5qv0uUJGM5Bz5JEPT93GF6VeE45oaK
	 c1v83TJOsRBI495T4fxqbtIquOgqU1YJhzrYmO0wyg35L+ZzmoQU2rZ2byHc9lQdwFgX5
	 6UE6si2EjJWOcoWGdB0oUgTpUeJkA9EbRUajcqvYb1l6mKA75etrwFHQPlAVAavXHXXqE
	 7FKPpSU2PKYSTa6QR+SG7g1UYVQ55f86wnoYMrbwYl8YRhegVYWNM4a2x88pvlxoTFzJv
	 XcaLF48veM8745q0TgWUcJdIYMCoNcjCh56J+13SwyHw/+Ky/tG51pRRcWEUaK+np9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432526;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m3FH9Inv0u/v073kkt2usO8SlhkKeOQiuSBxAimhluw=;
	b=iPUcEVXNgb7aEepMRc8wqIHXRMA7zn6PY+nJD74R9y6z6CKrux6FUJiGHMFC9NM+nkD7
	 hVRbzw9lgvSMLScRdE+6GjrYLMxEiHo1/9XDZIYvCzYsVReQHme/PWNfG9A7IV4aDpjxT
	 WNLa3Z0p7r3V9lT2xA6WW3v7x7/h/n282LsNgXOEYyW9OnVUx2UhQYBC4yCtqQulwZfwY
	 gxJtyl3UyKk6gFaxgqkjL8y5DmbFPNgnNGBxo4glQi2Rn2+b4OeVwgFXDOTADU64LemgC
	 acb2Dsle+OneU8tQOZoS490HrDzTWVFdNv0Jf6rRIZQfFwemGQaWaUcQzls3e3N9UGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="K/y9pfHw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144ED606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K/y9pfHw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C411F000C4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432525;
	bh=m3FH9Inv0u/v073kkt2usO8SlhkKeOQiuSBxAimhluw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=K/y9pfHw73GAzlQmjcS8+MU0hJ8thxYc/h57qMiaqMrJ+OooIQ7e6zCy5J1ExTCOw
	 Gg25ykrF33YovsTmHj1GbKy7l8KOXILBz5cnbjfGkrhJMgiGpNvmmgKINppoUFYRRz
	 ZIX3zb38lJxxOn+WxaH1WcqayE3K+LNgAqctj4DthFl/N27KMZcLwZqwiVchho0hEX
	 wYVrn9zlhW0Cri0FY6YxxuAk/DTdcHmuJbDWfRdSLBhikl7PMfhjjQyELOX0VoeWhU
	 I2skRoq2HGc6n149rtUDlYooV7hTQ9H0YYar+/eW5Z7VBI+ofZMEoYMYMiZet+MGrS
	 6sQ7+1a9Lw/GQ==
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1943616f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:15:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGyix0QmV6ozvNgXf12UJoD9Km1Z4qv69HHqoPcJzUvOrafhK664J1QKm3X3Xd8sOM0AjGVtWmgN5SRibg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q0ILglpgyehqefguqgH3R17fW/xcml/YmDtg3ZFvfb6aPsVDT
	WtQPj+ykOxhkdryI9xzmtwsAuNSs57hrAfJDx87oJC+OM5nNwLKz5f2fUJYxTE/xZ2htqSgLnE0
	zt4yQKerUo/5Bqr6lxBonq8hJNwzN/Go=
X-Received: by 2002:a05:6000:4381:b0:4a6:5a2a:f5a3 with SMTP id
 ffacd0b85a97d-4abaa9773abmr21927640f8f.3.1795432522530; Mon, 23 Nov 2026
 03:15:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120012712.1957564-1-guoren@kernel.org> <awPgjwuswbjeDftg@thelio>
In-Reply-To: <awPgjwuswbjeDftg@thelio>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 23 Nov 2026 19:15:07 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ+cOYfQX=JsK6T6Aij79FU9RGuyxAAouyL958z8ABqng@mail.gmail.com>
X-Gm-Features: Aa3M54qkVWzvIW1E3JY7I_38vKo1jeuZ7f-WFYjpRl8FFdSV5EvMxwly24Z7rYs
Message-ID: <CAJF2gTQ+cOYfQX=JsK6T6Aij79FU9RGuyxAAouyL958z8ABqng@mail.gmail.com>
Subject: Re: [PATCH V6] riscv: errata: Add ERRATA WRITE_ONCE fixup
To: Drew Fustini <fustini@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, arnd@arndb.de, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Leonardo Bras <leobras@redhat.com>, Inochi Amaoto <inochiama@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, 
	Yao Zi <me@ziyao.cc>, Chen Wang <unicorn_wang@outlook.com>, 
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:43=E2=80=AFPM Drew Fustini <fustini@kernel.org> w=
rote:
>
> On Thu, Nov 19, 2026 at 08:27:12PM -0500, guoren@kernel.org wrote:
> > From: "GUO Ren (XuanTie)" <guoren@kernel.org>
> >
> > The early version of XuanTie C910 core has a store merge buffer
> > delay problem. The store merge buffer could improve the store queue
> > performance by merging multi-store requests, but when there are not
> > continued store requests, the prior single store request would be
> > waiting in the store queue for a long time. That would cause
> > significant problems for communication between multi-cores. This
> > problem was found on sg2042 platform with the qspinlock lock torture
> > test.
> >
> > So appending a fence w.o could immediately flush the store merge
> > buffer and let other cores see the write result.
> >
> > This will apply the WRITE_ONCE errata to handle the non-standard
> > behavior via appending a fence w.o instruction for WRITE_ONCE().
> >
> > This problem is only observed on the sg2042 hardware platform by
> > running the lock_torture test program for half an hour. The problem
> > was not found in the user space application, because interrupt can
> > break the livelock.
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > Reviewed-by: Leonardo Bras <leobras@redhat.com>
> > Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <gaohan@iscas.ac.cn>
> > Tested-by: Yao Zi <me@ziyao.cc>
> > Cc: Chen Wang <unicorn_wang@outlook.com>
> > Cc: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> > Cc: Paul Walmsley <pjw@kernel.org>
> > Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> [..]
> > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead=
/errata.c
> > index 6f1c683f0ec0..64683882d50b 100644
> > --- a/arch/riscv/errata/thead/errata.c
> > +++ b/arch/riscv/errata/thead/errata.c
> > @@ -168,6 +168,23 @@ static bool errata_probe_ghostwrite(unsigned int s=
tage,
> >       return true;
> >  }
> >
> > +static bool errata_probe_write_once(unsigned int stage,
> > +                                 unsigned long arch_id, unsigned long =
impid)
> > +{
> > +     if (!IS_ENABLED(CONFIG_ERRATA_THEAD_WRITE_ONCE))
> > +             return false;
> > +
> > +     /* target-c9xx cores report arch_id and impid as 0 */
> > +     if (arch_id !=3D 0 || impid !=3D 0)
> > +             return false;
>
> Doesn't this match more SoCs than just the SG2042 and TH1520 like the
> commit message mentions?
The issue has only been observed on SG2042, though TH1520 is
theoretically affected as well. To the best of my knowledge, it has
not been observed on any other chips.

>
> [..]
>
> > +#if defined(CONFIG_ERRATA_THEAD_WRITE_ONCE) && !defined(NO_ALTERNATIVE=
)
> > +
> > +#define write_once_fence()                           \
> > +do {                                                 \
> > +     asm volatile(ALTERNATIVE(                       \
> > +             "nop",                                  \
> > +             "fence w, o",                           \
>
> I tried this on v7.4-rc3 in qemu with -cpu thead-c906 which matches this
> errata, and I discovered boot fails when CONFIG_DEBUG_VIRTUAL=3Dy.
>
>   kernel BUG at mm/vmalloc.c:879!
>   epc : vmalloc_to_page+0x212/0x260
>    ra : patch_insn_write+0x1a2/0x414
>   [...]
>   [<ffffffff8026ba1a>] vmalloc_to_page+0x212/0x260
>   [<ffffffff8000fa76>] patch_insn_write+0x1a2/0x414
>   [<ffffffff8000fcf6>] patch_text_nosync+0xe/0x22
>   [<ffffffff8001b886>] thead_errata_patch_func+0xac/0x144
>   [<ffffffff80009548>] _apply_alternatives+0x76/0x96
>   [<ffffffff80e038a4>] apply_boot_alternatives+0x48/0x54
>   [<ffffffff80e04d4a>] setup_arch+0x92/0xe8
>
> The vdso getrandom code uses WRITE_ONCE(), so it now has entries in
> .alternative. patch_map() ends up calling vmalloc_to_page() on an
> address in the vdso and triggers VIRTUAL_BUG_ON().
Oh, thx Drew for catching it. I would disable it in VDSO code.

diff --git a/arch/riscv/include/asm/rwonce.h b/arch/riscv/include/asm/rwonc=
e.h
index 081793d4d772..5305b8bf82bd 100644
--- a/arch/riscv/include/asm/rwonce.h
+++ b/arch/riscv/include/asm/rwonce.h
@@ -8,7 +8,7 @@
 #include <asm/vendorid_list.h>
 #include <asm/errata_list_vendors.h>

-#if defined(CONFIG_ERRATA_THEAD_WRITE_ONCE) && !defined(NO_ALTERNATIVE)
+#if defined(CONFIG_ERRATA_THEAD_WRITE_ONCE) &&
!defined(NO_ALTERNATIVE) && !defined(BUILD_VDSO)

 #define write_once_fence()                             \
 do {

--
Best Regards



 Guo Ren
