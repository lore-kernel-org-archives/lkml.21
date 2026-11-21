Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272537;
	b=E6+w8ia454AUE5OuDhpZ/gNnoxkcnz1wd6cHVYX3W+aOt2XfNF51v5LH+Opu5hVnqMxV
	 opO7EAF187Ya4LP7XdaicNW9scIOwF5+q8+R9wx+cxePPsFUvYveail2S4fO79e8Qi9O1
	 YOrj8BAv4jLgPn06/Mx//V/kDFDDXx9JX5fTEgtx2mbmJM2xAs+b+9H+F5FZnXTrot9H1
	 o9Ig0TNKvpqVmadeOkaN3xqLAl3VrZ+6Aop5lkZHVpl3sa5SgDt1uv7AxMNWwPWhKSW8s
	 8JP7dJ4+CMO8Cmy5OOFIsF7DThuncTIKS7cM5WPGxRmZTdeB7vyLB6GkhXRyJ81ER3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EdCe+8kSe9PjEo1XndTkJdrgn2vsntTF1WvbXrRZYxs=;
	b=YgA/nAWSoHmpoPaD4jL/2RjhUMxA5TYb3qG6LAolPIwRVxTq02NlSq5wVTyvjR8d3u6x
	 QGdzCtK6ijFA57cyTCkBqcwnNg+nkKeQkvSJSjbD9+bfEV7wgPANHfM9MzK6f1vDcl7Vr
	 IQfKEaWOL3JPkuFh3nJCgAbBfsm/7UTbJX0SyEZFAyMCNCO1azaNwphqHkgr3s7WwQoqu
	 ysb5j+BJuU7of1HDxxxPALoHWT2II+Nl0PJG8JWnFmYXBEU1lmjSf1Rtw3sHWQf1ZOI5X
	 EYYM8Cz/wfUBl1PtsdR4jKfC+AD78Fh64YIkG0X3cH2taHb3kOxtRJ6uAhVs6H3QAwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ddZnEjuz;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5365F606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5365F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ddZnEjuz
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06e79e152so919332b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795272536; x=1795877336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdCe+8kSe9PjEo1XndTkJdrgn2vsntTF1WvbXrRZYxs=;
        b=ddZnEjuzbdWoUoW/4tbAOHS9vp1GkI8ol1D1jOZqCCmgvyVZuD/hITyx40rje6PmnO
         L2bKPzDMD1Y8Rgl7HDxTiNdXliZI/LkEzkZxbz8gCfvYDsXS5OfUccZFb5s9VYhEeRKW
         GpMoMHTzRtaI5orPzWEmwmbkvaVBKELWc9GPKYfta9p7ae7hj7N4G/kgB6LK6Q7zDtEt
         IT6Ytp739R+9fTxXrl6VigiUBnTrvpJeu7GkmKvN7qB05yqbUi/NqOk6O7Onzq/u1Y7i
         r63ag27vpXzFc7VRoLZeoob8+B1l7g0iEr02eR6Qb/I7NlWsfX79hPyYlXSHbYbW+ULb
         80zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795272536; x=1795877336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdCe+8kSe9PjEo1XndTkJdrgn2vsntTF1WvbXrRZYxs=;
        b=T3fjwoEpQsCfuOM2E3tfNYgYvxi2g7ezTdzUDb1tPr+eDNs2QM4ww/VV38NnFDuQdK
         ljhJUHNIkkPNoyjQtrkPU2BHIwAtaWgI8w30y8O5dreix3Eez1jaibdH31InrgLAm+6T
         4RamRp2VBDts/H+TBYI7+E11ZhxtYDaMW10QvdU/jeg5iByoK4e7G9HF48i2xwE9jxhr
         PauYDH/SGP6F7yT8LfdfAumfVEb/17wGylipgPby0ySh53XhZwAfylXcz0TLTzUh8Jv4
         fGap4qK5c358haIjKJcUhM5bDsCqgCdGeBvYI1Lvw2TsLuehIqF6SPDVAY7WUzaQQo0E
         33FA==
X-Forwarded-Encrypted: i=1; AL+hErFIxytOtqduKqwBK3SK1TNtHMWvF8VJTk3d0mIxAHrtig1yyUw/P3XyTXHDqdpFKKBtnwF5cAHXngMIW8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9biBI6yMN3zqo6l82BlkAOpy7iK+zg66WDQGTSxUMApoJCVuIO
	lJdZ3ZaHcChKix1HsQ4GQFBOWdcIzWmitwGwgKVv3Ysw6jKyyeQ4uTRf
X-Gm-Gg: AZFdTZdq8QCHVPdnGDBhifc5xHEzF9XnocmaQUQPpIQh/BvcQvVa4oFEA7/MdHB4noW
	THKiwzgrqxSvlpWFi7Rfobuc1ZhH0uc7EU3wsy37e7P0boRMB+HsD12ggk9H/hd5mF9x27bkv5U
	vDTmB7CZpg6bJUuwDm8Z2H/0ieU6UuI7HrFIhP4XrLs3sBdsNNqLznfZ/EWeBYS30froBQrBXgO
	JZqh9X11EZSCDPKPsdB2E0JQX5qAmqLO/nQjP11mw02o03iZOTU3IsRPMmbgan+9vKLF8TK5IFg
	/2q84Ro9MtLp4sLnH/NUbVtu0QLfL+InrTyWJq36HQQ/fb20+9pzSRlTawGfaNpz9/6mnrFhmNQ
	ddz5JTExeBz4H1FgmOf/MfQDp8KDgVCkW2yKuThI7NH61dzFTann9UjIlPTwX0lGSCZgY4x0t4l
	ghxw0jE3sFZej7NjqcQcEQR5cUckXqHM6HDtKMyuJ1HlPU3usxHx1V4LxBkD+UnIAVRIjD/Sz28
	+0d/9Oe6r40b7i8cJvYCrJo+9yKuy5uaXnlNNPN1TTLZTG0OU0a3rNGusDhJZuBvjtE00skdSBs
	0opeigYwNla2Wmk6P+SZaRDb6g7AifQ/PcF8DNS4Nssrse9GFrQAICtXtA==
X-Received: by 2002:a05:6a20:244b:b0:3ed:bbab:9386 with SMTP id adf61e73a8af0-4014d35ab9cmr6017467637.42.1795272536129;
        Sat, 21 Nov 2026 06:48:56 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm3048343b3a.36.2026.11.21.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 06:48:55 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: "Ard Biesheuvel" <ardb@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	"Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>,
	"Atish Patra" <atish.patra@linux.dev>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Brian Masney" <bmasney+clk@redhat.com>,
	"Jerome Brunet" <jbrunet+clk@baylibre.com>,
	"Chen Wang" <chen.wang@linux.dev>,
	"Inochi Amaoto" <inochiama@gmail.com>,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: efi: Map runtime MMIO with device attributes
Date: Sat, 21 Nov 2026 22:48:45 +0800
Message-ID: <20261121144848.1277368-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <bb39f961-0589-4a3e-b649-888cf5edd3a1@app.fastmail.com>
References: 
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

On Sat, 21 Nov 2026 13:42:20 +0100 "Ard Biesheuvel" <ardb@kernel.org> wrote:

> 
> 
> On Sat, 21 Nov 2026, at 11:38, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> >
> > EFI_MEMORY_MAPPED_IO regions are mapped with PAGE_KERNEL, so device
> > registers end up mapped as normal memory.
> >
> > On Milk-V Pioneer, GetTime() reads the clock controller registers and
> > faults:
> >
> >   Oops - load access fault [#1]
> >   Workqueue: efi_runtime efi_call_rts
> >   status: 0000000200000120 badaddr: 0000007030012000 cause: 0000000000000005
> >
> > Use PAGE_KERNEL_IO for these regions.
> >
> > Fixes: b91540d52a08 ("RISC-V: Add EFI runtime services")
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/kernel/efi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> 
> I can take this as a fix via the EFI tree if you like.

Yes, please take it through the EFI tree. Thanks!

> 
> 
> > diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
> > index 2d3cc57b4535..11e85d0ebc91 100644
> > --- a/arch/riscv/kernel/efi.c
> > +++ b/arch/riscv/kernel/efi.c
> > @@ -22,7 +22,7 @@ static __init pgprot_t 
> > efimem_to_pgprot_map(efi_memory_desc_t *md)
> >  	u32 type = md->type;
> > 
> >  	if (type == EFI_MEMORY_MAPPED_IO)
> > -		return PAGE_KERNEL;
> > +		return PAGE_KERNEL_IO;
> > 
> >  	/* R-- */
> >  	if ((attr & (EFI_MEMORY_XP | EFI_MEMORY_RO)) ==
> >
> > -- 
> > 2.55.0
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)
