Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163220;
	b=Cf3j6ZK8DYVT6m5HdnZfU8W6qax55GYPwSedBCEba58SxQFSMJSvHsxpCp5N6iFSh/OO
	 izE9jlfSLXjmiWULpYas/EzMllOLlWTmKJsmzluwXUYDlIXCJC5Qzn+4Xwgcjz/7jmg9r
	 hlOepHd0gT1MFmNlO0fR4TflC3byw5VqGIeMZDxPYQZ/VrxwT7C8p5NWkaH5xZjWqXKXU
	 I2AOhwPotzooRmRJqzzWIrN+P1V78eIMDKqUy9W2WovvRZO98NbFazd72AfMNv/tQYBzp
	 6rg8JBQ88lCl/gxLRH+N0zHNCenJEBlorAtTOPPRKC77NGGRc/KT6nrSS7nW2QJST4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163220;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=OOnGsAGVoEs5x1m+oAWfOlWtzdwCIzVoBKrtW1ml1LQ=;
	b=VYATK0B0F9t3Dv2bIKUt8CqFUoqp8ZxapUFGkxyQIIAMmHE270OqORIpZEkmZ5RBNxms
	 pL+4Y0OAJgssevzaUnhQV/rrgMO0TifMHqD5IW6vkE0z1adqObufkmDysrMyKc3WfdUUO
	 /O9Z3khYcjdMuYen/RurDgJlCvzRhALUFl4W4pvAciwD7bklCXZ/Ueolc161ddBXrTqoE
	 8ZuhCSYOp4KGCY+d24Mp2LTkzLmxP7VhcL9pgi0XSwIM9ZNiLPUepXBrf3v//1D7sxCuv
	 SZQh9qZdEuHmBq3uY4M1witfXtu1q05lOUCO2vu0jrrDiF1zeFZav+8xbeH5wLFTiDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C84606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01C84606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7cc013095d4so197706137.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163219; x=1795768019;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OOnGsAGVoEs5x1m+oAWfOlWtzdwCIzVoBKrtW1ml1LQ=;
        b=AjZtb+LFteKkcJupprjOnN4wzHcIKuwGresLWw7/8rux33hj3Qud1f2JyetiI3HeP/
         0EcqtOh/KIctoVDDYuAP1s0HbMEHGAVU3FH+d4WyZT5uYAy4fNVNaq/FhCE3eWqK7wDc
         MrYJXAIkNeYzeE8UHBzidv77ALhXt5PJJkYZrv63gcvaOnHScweCIbLaGlVa70rSRpgt
         bBpe10rkjBBm4MGig/k+mtt73BhpOpb/k4UeokRWagjYGv5QKAmXmMY+o7J+A3DFa1Yw
         JLGshktt5fVGkvkpXlAebhoKdTXDLRA8ExuONcx4g7uq3fSPvpnEBuMBBCdFh0j7aR9w
         okpQ==
X-Forwarded-Encrypted: i=1; AL+hErEW14/KDahNQZHF1xQgWMLZhye47n6qMxd+9Pqxi8aSfpfeRHhXsl0JlBt9ZSfp6+W0kHn6pJkCasWKqps=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/Kg5pM2hNB/5k1/euZ4G3WzxHR+Tfss1EFYPa+UczouSQg+wh
	gb4/CUGBrdKv4aAgfnErO6afm3yI7/2BotwhmJcEaE6BAiW4TkM6X1ps/gvX/w8r
X-Gm-Gg: AZFdTZfy8oIV4zIzZrKfnFhztNLbajDFTvU+btifI+/MxHQcCERkVtbCofE31vggWVd
	ZSr0PTzpuNuIBR8OfHoR0i3sIlVCYSz92dGLjxY2s42dZxOVUnEinZx8f1yv39X/4IfNn/rWclf
	827hE598V+9ZkGOAA5Yyl9I0APiIqLskwT/sjK0aUWSuJyhRJfjZ3hOhH71RC+vCm0QyuKZnqbS
	jE+TlGwjuK1hhrEJI/kQ0wg4F66tAmMpCEmaIW6cGVMlUL/T8tvatI514B+8l3c7b5n0xhaL5aT
	XE+sy/ZJm5PS8tInNHX2bGeVu+lHnhw+U4vr8sdn1rthQAeAideADW3ZZeOrPK2OmdudJafaiiG
	HjRzE5gV2tjRx13OKEhCfRB+eEFQsJNMrr8NKqCIShgbRRH4Uhj4YBDkzCwb2GuaLc1WWo4Izb4
	6+Lsg0VPaFBleMEtwC1l9DAoraxgTaW142A/8TEN26qTg52qReN/jMaUfGMCBoygmLyVcNJJMFR
	JxFeq74qGnudDLlFUbDJry8EmCmEcIjaFJ67SQepbDxhVZnf3X46vHJEz7ZKdi/bsqozHp2CCU7
	1/K9kgs4XN8UUs0CUTAcTy7TyMnW0koY9zIctqQI8FGJxrVyvNvBrbKLXkUa72jBnRWzPPR7JNA
	nHZHFdmIxiIpF
X-Received: by 2002:a05:6102:6f06:b0:7d2:8e49:f90e with SMTP id ada2fe7eead31-7d7395fe209mr558310137.27.1795163218885;
        Fri, 20 Nov 2026 00:26:58 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e80cb440sm2276920137.7.2026.11.20.00.26.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:26:58 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99e0d9b3438so175530241.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:26:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGmsAk6ZRwUk+AUOCafI8cKZf8lpOQbbtGxjV0mN9RbEdonUz7He2HqmSee1UEeZoPpGPIB7f9JapjKMrM=@vger.kernel.org
X-Received: by 2002:a67:e706:0:b0:7d2:7c63:5a08 with SMTP id
 ada2fe7eead31-7d739630203mr799846137.32.1795163218370; Fri, 20 Nov 2026
 00:26:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-arm-scmi-arch-dep-v1-1-514872e8ede4@iscas.ac.cn>
In-Reply-To: <20261107-arm-scmi-arch-dep-v1-1-514872e8ede4@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 09:26:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
X-Gm-Features: Aa3M54qI8mmq8jn4s299XQgo_FeZArEGNoWUlwaxQmcii1kzPDH4mMAcGfofjbE
Message-ID: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Han,

On Fri, 6 Nov 2026 at 20:40, Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>
> The SCMI core and the mailbox and shared memory transports only use
> generic kernel interfaces. Transports that need architecture support,
> such as SMC, already carry their own dependencies.
>
> Drop the ARM and ARM64 dependency so that other architectures can use
> SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
>
> Suggested-by: Michal Simek <michal.simek@amd.com>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Thanks for your patch, which is now commit fe87ede443a15969 ("firmware:
arm: scmi: Drop the ARM architecture dependency") in scmi/for-linux-next.

> ---
> This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
> now goes on its own through the SCMI tree.
>
> Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
> no HAS_IOMEM, failed to link devm_ioremap().
>
> Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
> and arm64. On UML, SCMI can no longer be selected.
>
> [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn

> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm_scmi/Kconfig
> @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
>
>  config ARM_SCMI_PROTOCOL
>         tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> -       depends on ARM || ARM64 || COMPILE_TEST
> +       depends on HAS_IOMEM || COMPILE_TEST

Please extend the dependencies to RISCV (from the link above, I assume
you are targeting riscv?) instead.  There is no point in showing this
option on architectures that have no users of SCMI; one already has
too many relevant symbols to configure.
People who want to build test on x86_64 without OF, i386, loongarch64,
ppc64le, ... can just enable COMPILE_TEST.

>         help
>           ARM System Control and Management Interface (SCMI) protocol is a
>           set of operating system-independent software interfaces that are

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
