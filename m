Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476540;
	b=XUt1+1aWVZJtC+xe3Tj/7rSIb2hRCvMCusz9R3EsFBXvZDo2AqXm12T3x8ZTQsZf92lA
	 5/tL4kt8rPPjTSWEt/AKfBbtJNmrdt3nmMJ4M1JBWuSdTIpBT2qAvTl0l8rp5hXIGNZwo
	 qcnSNn4dXMsZpjFOk1siamNf110KNrFszSaRPFFAKJhu5e+29R8Ptk8QMPIpZnbP/+gal
	 3Zd/zRrx6X06S2pBpz1/zTXtfCmGfHMWQWkXKibPm64NRUEY2+r7mIcODE00ZE2J2pi+y
	 a1rUEk9e6lmHdsOK8LrDVNo8joruENKMCgqwinYJnd7XbyH6gclg9vAqOIjAB2qXXVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rpYvPmxHqeKMEWXcXjP8ETFzglI6N3DO0hpa9d/C1iQ=;
	b=VtwOBxW+stMs8cFLa3M+IPvFglXF577FTf02lhkS/YuvDAs4kF5fFlrU+l0EBxAqxmIZ
	 bCEbzZsfDaNQc9iETxetUA9utEtUytv8gf8bBEFUHv5F9VMI6/2J+6R8FHEc6xtd4wrAw
	 O+BBLb7VWy1fzTdZtPGTB5+gsAXZR9NmLLRvvGwApZoBOTzsE0aH0z32q5c0VOTZ2205o
	 dV1mst3YjReuEKszp9Ku689Q07i4lyYQmICZQjEj+GeW+QCd/O9xqgOocnLdkyXY7tzVz
	 wUdPUrN+Cv330PtHAzgir91lsVKx+uf6bQhkMe5zsYbHJCnIslMMfZslcWDm7p/q6Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YjnyPR7Y;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97E606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE97E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YjnyPR7Y
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so5925917a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795476538; x=1796081338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rpYvPmxHqeKMEWXcXjP8ETFzglI6N3DO0hpa9d/C1iQ=;
        b=YjnyPR7YVly0s5R4EIOAOSrlZqToBo6tlCbIW7tEFfNO8XxT+kAql+AcVaCHqX8Djv
         +TPIaDD/OrWeK6+xp4GGl1PcwY2AgorPwv7WPoZCJEk3d/mwOr+hNeylYg03a9XKXtGm
         Nye6IMMtXFUt71NOxSeCwoELF4NXtW02hF57U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476538; x=1796081338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpYvPmxHqeKMEWXcXjP8ETFzglI6N3DO0hpa9d/C1iQ=;
        b=Xp2vbzlKXZ11MIIxd67QZlmejPV+TFplM3DhnsDlT7CYQa5g0PL9dClW7pgKynxHrk
         vI5PZiAdWzKYukEiLZQas3QjzMnITWvBG7HaSz/pFlpwJNKODX3fxIESa/9JDnOHEaxE
         nYxwaE3vCpGES3EOAt+ln2xVZDNdxvIuL7h0Owj6l6W1UbLchEjGe5A/ACzYlBnibIiV
         lfRHKXlnT/Bsc0Rphvz1Cgf5qgweNT9VbxsE14Xqvg+TmnDxbxv6DE7JANbIyjXR6s/c
         /PxUT+k4CFXMF+fFvd52fPc8/8wyHyKO2k/0t988CiiBdqpq/c77XXoBF9LKxAXLah7z
         92DQ==
X-Forwarded-Encrypted: i=1; AL+hErFdq4B6cDPwi1gFTVwxZSb5bn62x8VQ+egEemU6//OAy0Pe9U1nXFVPR69vCztZIVmVUx4cF1QIchX5bEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R67bXYP/UmS9gIol/MY43P5aKiDuDvxrcgCKwOw3JQf0qPoxv
	ZxExnxdjb8bNmVgJD/tPwcQLp05YSkufDBJocq2GBgKt5I0vBCU9KHjzsTqTERjbyYRz/aTBMYi
	ABSc5g7Lp
X-Gm-Gg: AZFdTZdyGfkNDfW0+cb5zZqPw9NLv+Hdjl/70vazeZu0Jv533LGGNYaQV2gWQZRrwMw
	Uzww7QATTD8PuUePzhZkIuEkYfxytJ7BtTBtsowN753nPLz+7qtnK08TUBu4IympRTJb4/UiaL0
	P2IpsNMeNnqL2J9zG8EYAgeZDULciDoLhs/gM3LVNNkKBE9TBVfKxQ2d66MymitxEPDvkv2pUrT
	SGRrdGf4+yi3zIkymOUKOQzptLMR3hyrauoyN4y+VbpwYJ2pwxe9KOPijpw9q8elqcTwfHiYiG7
	invWmQ+8Zl/5CxdkG1oay3R7mBBakIf5pz3eix1fJyLj7mlFXg8bsH3WYm0GSPtQf1dEKdR7hST
	3nA/B8bY4INXN71Zvabjke2JLhkZDnW7uevJi/VSj6dHVLgkSa/2vIVT6HVk8DfO6xXNl8rHbNO
	tNPdNMT52ZDMqjU2JnmDUHELyHwvdz157D/xD/xLOFbGLm1f0w7bFNye9mgtni1Nolw16NmDwJZ
	YLUMl7WU4X9Ln9FDd21mAhFqBSVSYcGXLXqozeBE/wJ5ouhvqlsKpDb3bFb2KM5PNXvUmX4LgwF
	h/7XADt5sPsNxmuw+s0lUD54vu6wVwyw+QirnmWCy7SGXrchphTIM8DxSXOxMXEnGDeL
X-Received: by 2002:a05:6402:2745:b0:6ba:9d0c:cca4 with SMTP id 4fb4d7f45d1cf-6ba9d0cced2mr4379061a12.33.1795476538111;
        Mon, 23 Nov 2026 15:28:58 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm6067134a12.31.2026.11.23.15.28.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 15:28:57 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1796175f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEP3sZQgC3spnx9P2mUqaBRGqxvgb4xXqtN2KpzKpPMF5ZWjZnrBtPKV0EV/TTHkL28fBXtpDhnU7On52s=@vger.kernel.org
X-Received: by 2002:a5d:5846:0:b0:492:e1a6:90f9 with SMTP id
 ffacd0b85a97d-4abb3c37b61mr23717515f8f.18.1795476536084; Mon, 23 Nov 2026
 15:28:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com> <20261112031629.396819-5-mrungta@google.com>
In-Reply-To: <20261112031629.396819-5-mrungta@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 15:28:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U65s1rzG=VqbRur-UdcMf=6rcjMfoXbOBtyiw1jAyPgQ@mail.gmail.com>
X-Gm-Features: Aa3M54pAb5UUWg8n7puuFK8qjUeDvkCKqsnby00WFwsuj_cqspTt6STuvC8TlBQ
Message-ID: <CAD=FV=U65s1rzG=VqbRur-UdcMf=6rcjMfoXbOBtyiw1jAyPgQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] genirq: Export NMI APIs for qcom-wdt
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A . Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 11, 2026 at 7:16=E2=80=AFPM Mayank Rungta <mrungta@google.com> =
wrote:
>
> Currently, request_nmi(), free_nmi(), enable_nmi(), and disable_nmi() are
> restricted to built-in kernel code because they are not exported.
>
> Export these symbols with EXPORT_SYMBOL_FOR_MODULES() restricted to the
> qcom-wdt module so it can register and manage its pretimeout NMI when
> built as a loadable module.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  kernel/irq/manage.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 073fd3595d2c..ace4d2796382 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -852,6 +852,7 @@ void disable_nmi(unsigned int irq)
>         if (!__disable_irq_nosync(irq))
>                 __synchronize_nmi(desc, true);
>  }
> +EXPORT_SYMBOL_FOR_MODULES(disable_nmi, "qcom-wdt");
>
>  void __enable_irq(struct irq_desc *desc)
>  {
> @@ -919,6 +920,7 @@ void enable_nmi(unsigned int irq)
>  {
>         enable_irq(irq);
>  }
> +EXPORT_SYMBOL_FOR_MODULES(enable_nmi, "qcom-wdt");
>
>  static int set_irq_wake_real(unsigned int irq, unsigned int on)
>  {
> @@ -2189,6 +2191,7 @@ const void *free_nmi(unsigned int irq, void *dev_id=
)
>
>         return __cleanup_nmi(irq, desc);
>  }
> +EXPORT_SYMBOL_FOR_MODULES(free_nmi, "qcom-wdt");
>
>  /**
>   * request_threaded_irq - allocate an interrupt line
> @@ -2455,6 +2458,7 @@ int request_nmi(unsigned int irq, irq_handler_t han=
dler,
>
>         return retval;
>  }
> +EXPORT_SYMBOL_FOR_MODULES(request_nmi, "qcom-wdt");

The patch is fine and I'd be fine with it landing. That being said,
looking at this patch with fresh eyes today, I think it can be
improved. :-)

I think we could make disable_nmi() and enable_nmi() simply
EXPORT_SYMBOL_GPL() and then only lock down the symbol for
request_nmi(). This means we don't need to update 3 separate places
every time we add a new watchdog driver allowed to use NMI. People
can't (properly) use the other two functions if they can't call
request_nmi() anyway, right?


-Doug
