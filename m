Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164716;
	b=mZ7sIrZkd0pb6hpZelmK5juxL7D2mVFBuHcg05WnhOzJ+Jw9Qt1hSITnycQ55dc4psOq
	 2B55K3vWGpykeWbvdmkdeIAX00xY7DXtpy0jii1ypGnk5y+fuLT0FuDPbc76mUb72i7Lp
	 umrqx+Qe+DO3GbRMFaGr6njY6VDsymHeKKR6iJ2PWAokzj5eNitfXwIMHQyfYxZkfVo2k
	 a1Eh9FwyIpzz3DtHV95IKNY5NRo37ijWd3al3BZpDXHAbyr8PWo8JGZyxdMj00cw4coW7
	 hU4sJL8UlVrMw0qQne4aX12EGhzKM0Kcm5pgNSMvGIaaywowxx8UJAJCqQHp0s3md/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164716;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=O29ozXrRa1nWnNxSLjjwsMRtxZK+i1ptmKe8i27enGA=;
	b=Jet9X4osq4BSUqSn8Oiy4E0Qp5RQSevwIjEepCCJR14xASBF3VWtxBruRTK0dz3+3Lja
	 bm9SK7w3RayhgoIKg9Tr02zOmQjvuvdxJHhVEPZsbCeRPdAbmIJJn6BcTlv7u8j0n0Orz
	 xPmmKwGbASqt954VXNWHxa9uYJcoXs9gtc6QCGCpxjNmrsVzqxeu22LnfGED5A7G89wCi
	 WZLZUgajaOobpYQTvSb47ds5CZjf8xhz6DdwdBhxh4gOzcwmF5n5JVg5CrjnlUqP8LHtn
	 80Lb+Iy4bWzDWHV4boXXEmE/bj2aClxunuw5/EbPHeWx+WQiETklwh/hI1m/gKlUFAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540A2606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 540A2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7d2db6408cfso427032137.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:51:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164715; x=1795769515;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O29ozXrRa1nWnNxSLjjwsMRtxZK+i1ptmKe8i27enGA=;
        b=Bqtfxr+6yT5RIrkyJMPZ3IPMol//w5aXhIX918lALIJ620GctZGaT0m4IZERBJZ3q2
         2D9EYwtkS52KknQ26Qlabv8yw2kR2+2YUFgScRBHYeWh/GmbdaI9xJ8BOrxRUR4ywTKR
         lW/kMnDUo+8QrnCuS48MYwHeUHrdboObX9CaRBV+1C4SWD8AxUxKwPIEVRVVXIWqVvJg
         f37TP/R0LrZeo+hXDctTc+nvSK+d6YhtwMq5g+YXtKPJ4HNlInCpJbWgXoan7lV34eZs
         GoJ3a0C1rE+85JCudu1ooI4H+2lI1MXS5aks/G1dHdEN7zWVsAcnpZ+x59CmoLqaAobQ
         j8bQ==
X-Forwarded-Encrypted: i=1; AL+hErHvoJ0p9mFr2JEsrgHEqpu6LyKuiCu95fMB6RHJpES4xgOBLpkENWhmCTy3Ev/HL+azVleMmC/F7WbMxDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bS5Jtn7pQp8KUc0i/geY90e6sR3eaEKMlKY+65bS9QlO/37vR
	Vx1lXQWwffPW2tz38NqPZsvVE1w7yeAnBnXfaPEd9m6d6aHjPwhHiJjWAitvj+Hp
X-Gm-Gg: AZFdTZco6wtJrJZNXRZOrnVLyS9kYrd1tbswORRXlAgNJjsjiDwGwYcLFAfPq4HGCJN
	4AqAlTVqHP+pmmzHuHZUmVha/rukQwbymB/AhFJp4DEsn16zORUcj8F/GVk9rURdeOPGrAeX3RD
	hyQVwF5LXSaxurplofyacGJnOyheKV4Op4t5AU0Nwk+JRuwNANMqjyk1+bcr8xfk/bx+eMj40Mg
	vbiQkifNDsXfzjhg6A13YJqhkvsrCkKMUn6YKgBbEnRI0PuooFYSJ5r0KP0SM9C06LchKIspLEV
	jq7AfhQMrPVAkJG18ekyJskNehL8j2nolka+6Y9o1/plvEYM6PZI7pStbbmYFOqXT18Oa6W5fOG
	q2aasgF+vFSq7Q9k4ah2SBJIMOtQkaUuEYmoG9LUlsEDFfAUouLs4fyWJFNUR+YXVa0S3SlVSfU
	Dww3TxacCQa4MbitzXUu6B65MhWPaZnqcLbNilXSw+l9PI8TN2tzkzCPBbNmfsYw+cfxHXIeYRv
	nIwMxJk9cG4OA13QBBMV7Od1ELLjm+cdEqvWLqVSsRS8vT45Pn4aPjOzbNVFbNqKQkWKuPddulD
	2ENU6ZeUdJ6RiYz27LfXbNIm0/kKUU5DES9Optwkq0bLKwfM2AfZXKBQwE6TRxXxYxw=
X-Received: by 2002:a05:6102:3911:b0:7c3:2b19:6267 with SMTP id ada2fe7eead31-7d73968ae33mr921971137.32.1795164715193;
        Fri, 20 Nov 2026 00:51:55 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0686b1sm2395735241.10.2026.11.20.00.51.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:51:54 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-99e740a7131so162561241.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:51:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErES2sdhE/moWdz3wCVAqFw9NMq+TX/pIcC3kpQKNR0S9j1HI+sGx0LPm1s5ngf6lV00v6z3N8HObulmZcw=@vger.kernel.org
X-Received: by 2002:a05:6102:1a1a:b0:7d2:b348:6355 with SMTP id
 ada2fe7eead31-7d7395e01bbmr694434137.23.1795164714287; Fri, 20 Nov 2026
 00:51:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
 <20261120084335.3492524-1-rabenda.cn@gmail.com>
In-Reply-To: <20261120084335.3492524-1-rabenda.cn@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 09:51:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUrCkbjJW3Ld1nFbfj_Dfa4YwhUoK5g7rAn89yz=bYy4g@mail.gmail.com>
X-Gm-Features: Aa3M54r6LC9IQldUg86oiQcyOqnhN_8FdF1As7xILWU1aB_YhbizNGLY-xXfwEM
Message-ID: <CAMuHMdUrCkbjJW3Ld1nFbfj_Dfa4YwhUoK5g7rAn89yz=bYy4g@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
To: Han Gao <rabenda.cn@gmail.com>
Cc: gaohan@iscas.ac.cn, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Michal Simek <michal.simek@amd.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Han,

On Fri, 20 Nov 2026 at 09:43, Han Gao <rabenda.cn@gmail.com> wrote:
> On Fri, 20 Nov 2026 09:26:47 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, 6 Nov 2026 at 20:40, Han Gao via B4 Relay
> > <devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
> > > From: Han Gao <gaohan@iscas.ac.cn>
> > >
> > > The SCMI core and the mailbox and shared memory transports only use
> > > generic kernel interfaces. Transports that need architecture support,
> > > such as SMC, already carry their own dependencies.
> > >
> > > Drop the ARM and ARM64 dependency so that other architectures can use
> > > SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
> > >
> > > Suggested-by: Michal Simek <michal.simek@amd.com>
> > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> >
> > Thanks for your patch, which is now commit fe87ede443a15969 ("firmware:
> > arm: scmi: Drop the ARM architecture dependency") in scmi/for-linux-next.
> >
> > > ---
> > > This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
> > > now goes on its own through the SCMI tree.
> > >
> > > Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
> > > no HAS_IOMEM, failed to link devm_ioremap().
> > >
> > > Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
> > > and arm64. On UML, SCMI can no longer be selected.
> > >
> > > [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn
> >
> > > --- a/drivers/firmware/arm_scmi/Kconfig
> > > +++ b/drivers/firmware/arm_scmi/Kconfig
> > > @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
> > >
> > >  config ARM_SCMI_PROTOCOL
> > >         tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> > > -       depends on ARM || ARM64 || COMPILE_TEST
> > > +       depends on HAS_IOMEM || COMPILE_TEST
> >
> > Please extend the dependencies to RISCV (from the link above, I assume
> > you are targeting riscv?) instead.  There is no point in showing this
> > option on architectures that have no users of SCMI; one already has
> > too many relevant symbols to configure.
> > People who want to build test on x86_64 without OF, i386, loongarch64,
> > ppc64le, ... can just enable COMPILE_TEST.
>
> Following Michal's suggestion[1], I'm dropping ARM/ARM64.
>
> [1] https://lore.kernel.org/all/3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com/

Yes, I read that.

For reference, other firmware interfaces are also not exposed to the
whole world:

$ git grep -w ARCH_SUPPORTS_ACPI
arch/arm64/Kconfig:     select ARCH_SUPPORTS_ACPI
arch/loongarch/Kconfig: select ARCH_SUPPORTS_ACPI
arch/riscv/Kconfig:     select ARCH_SUPPORTS_ACPI if 64BIT
arch/x86/Kconfig:       select ARCH_SUPPORTS_ACPI
drivers/acpi/Kconfig:config ARCH_SUPPORTS_ACPI
drivers/acpi/Kconfig:   depends on ARCH_SUPPORTS_ACPI
$ git grep -w "config EFI"
arch/arm/Kconfig:config EFI
arch/arm64/Kconfig:config EFI
arch/loongarch/Kconfig:config EFI
arch/riscv/Kconfig:config EFI
arch/x86/Kconfig:config EFI

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
