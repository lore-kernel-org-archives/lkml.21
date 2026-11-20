Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164223;
	b=VvFNSWK9ojuqj0zBBGrEy6ePyjE8pfyJPVjn41FGG3aNrSIQkiQHg15baWXv/4Ej2oR8
	 /Sp9PPUidzz9L3dZ15jZn3b9935IflRdGJ6FepwsaPNpOMluH/o9US5VNdXj7zf7DK4CF
	 b7mp7dUnlxyKby+OuX2S1S6RPHjACM4f6oYGySre0IkUIE0h9VvNgh2DonTqPyguHnXTl
	 rNyO45UPQ425ioHKscpBbIDxwYM9sViojvn/glr1BFpDs+BLvZpAOoYcf/PRt2lt6xYEi
	 4b7o7jAP68+ritBlHxJLO8GauiO4LxGmox7jhNM5qUg4Q74Lj2rJL34gcVqK6LcSQxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=an9c/AwHDCpMgy31fhAcNA3Rgkyae//mKDjGvqRP4jw=;
	b=K6w4uIIwdw7djB7uU9T5g3dNy8wTdPYZstwEuNaLKQTx/x1R4SJBrJxb7ZYUrExetlAT
	 WlSs6j8lm14KGbOaTQOEjz8GvbmAxlP+5zYdEGJsEM9GvgBE0/5N54X/sUx6U74rUgNUr
	 BLNLj+l1EnbxYEoBn90+SWVuMb2BboE9GpAaJZxGtDOcyPlcuvw23FnyeJu73TlPTPra/
	 XOuJNuTP41GlXjtZY9PoyS+r4rN4oCDnTzW8RRLrGhRZTzUYc8kabU4niKam9jgDvMmO+
	 52mfxP8GUb0KBLhFnIg+4/ldrlgEXCsyMX4UALhBPrrcuGRWbyci/PnsLTUXLNn4wWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJr9NmRc;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD508606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD508606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJr9NmRc
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so387020b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164222; x=1795769022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=an9c/AwHDCpMgy31fhAcNA3Rgkyae//mKDjGvqRP4jw=;
        b=MJr9NmRcBq9CNM82yR1kqIG9ac5QZPSSDghjUod3oyQsEpX6fnUUnwPByqiXhrKhFE
         xtWEqJo+Apvs5Ywa2gCp9vtyszK7nxJHleaxw+D5hA0T7UvbmzWC52exvqu6DYVaTG5M
         jslEUCXj/UttQbtulnB6VM7+KEa1ywlV68USklHzDLrrBxPRdtJtb6sbSADnSa476/VU
         qHdzpDQX0KdibBJjr+Ijx668XWMGOmxKikg6+G5DoAhLmciHI1KQuAeXnsTl2gQAQ0DJ
         FxcKNo5PhX5170z5l0tO05vgmtRmO3olL/Oc4sBW+A2t2D/Y/HThP2RNgeNhpgjRkpr1
         jxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164222; x=1795769022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=an9c/AwHDCpMgy31fhAcNA3Rgkyae//mKDjGvqRP4jw=;
        b=dDLQrXlEg38O9VK8vNWCAidQ/3Kcxq1ExxUMOpH/yOdIKqCKalz9X2GQq4SrrbcgXg
         8Nrd3yT79UyMA4EPKkPBpQRq17fKWKtB3l7Nl7iCoHejJmm+cptM3AWYRjrX29KH0LK9
         xXSCsvoMt0TjMT/1GWsz4g/t6caDezpa9j2u+NNxPFSZvQf06Yj+lk32GPZ04s+vN0ZN
         0yvny18zUKYvtWN/iLXB0athdTw+5JbHKkbD5wa4fCQCDoi/5CqJGieDg0jLn+OJ4Xcw
         m0alJQ2AhupXh1qxi4LhYMztWvanE3GTJ+zDi4shoyVvAFqyAAEdOvmcYNbAs7j/qjti
         EWhA==
X-Forwarded-Encrypted: i=1; AL+hErG3knM2TjRuufqJrpEPdEZbsh9mnYIBOMyolZHicVlFlRh4+ZtHZ/thLxXd7yOzWxukrnHE8hUOGK2EHj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DGSTdpryhsdwAI0sV4HaK3brSrq+tcK1YHxHRpjn3rNDTFXl9
	iLtkqT3cLatn4J2d1ghS5ezolEBO+Vm1IpzVMXCKNJGUzOHBQhCsQw85
X-Gm-Gg: AYBFou0KEzZzUMmLTokchD9yBpxm0KD1+7IIW3S4dlEsjK8VuXUA/EtjJkw9LtNF71Z
	h1OZVBRBeBEn3tlUuORNtZdKpN7rusZsmRae7+he+C/c+ipm2K5NuQbwVSKrmZKFtWtI0m3ON7s
	HK8uLrsv165Zj9hDmYWdgO2yeoe+SqKft1zCFQK3DIWH0FL6CbJMLJvEv9CgWF5jmNT2MRuWLIE
	nPbhTPoqPO6fIRYyOetMCCyukSCMsmKjUCqsCd73NkSF0I/jKlCMrvg053G4bq1CF9FXt3QtP8D
	s7m3ulqmQTDN5lNmNSEEj88Fyyrk5wMyEhQueL24xAqiaB1if2bBAydJzUDtFIzTreWM89bsDLc
	H3IMcZTam84LR1bO3slqvOJIHWwMZMnXXucNRLXdqtbWcBxFwjS6xi+0RJg1EFMx33beVd/vi7j
	KMW/Fq0fvsnwf2uu5JyrdtGokey0gHxod16+HzrspN/dXoEqaABJ+rmsDX/VViJ5yWAYWeb5K9E
	66AT/lo5DRf3a0/ekoXOxasDSWtQ8HYaalGnKF2fAHxZyjb7ZgcbuE1Lsp+6nr0vqyPa099j5k/
	J3zXv/GhEtgM7cnJjNjk0vFAQNZ+F+Wb1lIAivszSFMl1CoXrQiZKWcVWO4=
X-Received: by 2002:a05:6a00:2eaa:b0:8b5:fbd0:cb49 with SMTP id d2e1a72fcca58-8c7dd9d6a22mr2795672b3a.21.1795164221763;
        Fri, 20 Nov 2026 00:43:41 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f83dsm1163978b3a.39.2026.11.20.00.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:43:41 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
Date: Fri, 20 Nov 2026 16:43:31 +0800
Message-ID: <20261120084335.3492524-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
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

On Fri, 20 Nov 2026 09:26:47 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Han,
> 
> On Fri, 6 Nov 2026 at 20:40, Han Gao via B4 Relay
> <devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> >
> > The SCMI core and the mailbox and shared memory transports only use
> > generic kernel interfaces. Transports that need architecture support,
> > such as SMC, already carry their own dependencies.
> >
> > Drop the ARM and ARM64 dependency so that other architectures can use
> > SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
> >
> > Suggested-by: Michal Simek <michal.simek@amd.com>
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> 
> Thanks for your patch, which is now commit fe87ede443a15969 ("firmware:
> arm: scmi: Drop the ARM architecture dependency") in scmi/for-linux-next.
> 
> > ---
> > This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
> > now goes on its own through the SCMI tree.
> >
> > Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
> > no HAS_IOMEM, failed to link devm_ioremap().
> >
> > Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
> > and arm64. On UML, SCMI can no longer be selected.
> >
> > [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn
> 
> > --- a/drivers/firmware/arm_scmi/Kconfig
> > +++ b/drivers/firmware/arm_scmi/Kconfig
> > @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
> >
> >  config ARM_SCMI_PROTOCOL
> >         tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> > -       depends on ARM || ARM64 || COMPILE_TEST
> > +       depends on HAS_IOMEM || COMPILE_TEST
> 
> Please extend the dependencies to RISCV (from the link above, I assume
> you are targeting riscv?) instead.  There is no point in showing this
> option on architectures that have no users of SCMI; one already has
> too many relevant symbols to configure.
> People who want to build test on x86_64 without OF, i386, loongarch64,
> ppc64le, ... can just enable COMPILE_TEST.

Following Michal's suggestion[1], I'm dropping ARM/ARM64.

[1] https://lore.kernel.org/all/3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com/

> 
> >         help
> >           ARM System Control and Management Interface (SCMI) protocol is a
> >           set of operating system-independent software interfaces that are
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Sent using hkml (https://github.com/sjp38/hackermail)
