Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476515;
	b=je5+ND1qQX/QbTMQYtiLyHpHEQuVwDuOsBnGn67u6THYagzWxD8CMjFZa0tgq4c97Bpl
	 8YvSpH+Aut1RDMhqZWUMy1Dms+dnqE7oU+1v9XSJmmjTM/1HNrCw+WMvG69nHXlxz7lqJ
	 6RIaDg3vYl3tosr7OX/eia7gvcf34W4SH/FINniwNBmzI+TQ94NTO+vRNOcuTrlbTjCBb
	 PpBLUCxj4w5WI1xTWqvxVxi7Fx/v5q65acFJpiDflvTlkJJa27QlNmGHtAPf6usMFy4io
	 pX6jFiLxCdD9wlTxF6fGRR9sLFCatZVM+TLsNtwlyCuZMtXka275BlAMduOUWTnDluQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9y8eBhUOHRLpdlPNcmQfoTOPtq1wEw9bOFKY5UXmjUM=;
	b=Z/Y+/PwUeApLUUrbPf66RHkMslj08hRzFAaVKrXM7cpzAAdIOXZVYZCKt5sCK7gHwwUi
	 HJ4HacUNmW3qvyeTDMoLrlqEyeqYKAjoE4IhGWTF29m59V5nEY+uu4pZbocU0HSkY15xI
	 8hZag3gTImxjFUy6tlCBSKzWX7mBtQEq8R1Ysjb7ev1xypsd10G7iYS/hpnn8jMUrr+d2
	 vYhoseXFrsuSmqIRjien7BEI5zK9ApSBqCDvbU3HT246kUXygeVzQ8rVvGG8R1YI8/tG1
	 +lF9CvUZQilSbmGq/n4BmQnkjdvy45xjvoOIKJP3gkuFqFU+djTKu0d5IoANOCoVv7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aSOc9tsW;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52FC606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E52FC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aSOc9tsW
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so4848124a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795476513; x=1796081313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9y8eBhUOHRLpdlPNcmQfoTOPtq1wEw9bOFKY5UXmjUM=;
        b=aSOc9tsW2YexUcqWbYtbVIAVJm5KMJESy3z3Cs88ZSaAqTV8HvAzj93YxI+xXhYfia
         ZCqh0Q0MI3JhyOCcPRzP4Kjb0frf6bfEZwtJMUypKJYhCQONA9YU2VmRgYBwDDCuEis2
         9AKiK+Bw0Q4tddDX24K+ufjZWIuliq2PxylQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476513; x=1796081313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9y8eBhUOHRLpdlPNcmQfoTOPtq1wEw9bOFKY5UXmjUM=;
        b=MpXuoewLcQclEwoyeLICemQGrCfJ3eaZZdLndNTTyl/k4EioP1Ko16F2jr7ZqwFRPZ
         QA8/AScSyfxREhBkXVfdG1/V4dRmJC4Pdu9YV7ih21ymsVeta7kOiCVKWuiiE6So1hd4
         uTclE+lLqUP9Ril/hya3m2C9EAq/oWrf6rPfoyEIiWRQPJ1IYqnnc15LSTr9/c06GIrE
         M/pR5BLgcnZsayXVV4x2VmpgDD9XCzlK7wL3wbLGaEb9MGzplpZ0r7ty/rLHHdb9HpoI
         PPWzwoqjnU+KHQUKu0uFMTvoxZx/jSCiA+Mdm1879GoltBTrLrMtdzeEho/kIzha3DBG
         M2fg==
X-Forwarded-Encrypted: i=1; AL+hErHvMMT3RNU7J7hQoC2MCUA6TlBQP6mlcXKkVmbM4lC7GbB1SZITlmFk1gQMSqZrpBFRCwMLqP0ymtyDPr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KUOnj7bfmDZtGbncCSkY3XsYXKJUde2QtDmx28poD/SLMg82F
	hr5oi4jbe2ynCUupldy9wondGGSCYHFdeVJi5CmttIRt9EDt4R68VFTWJwUKr02FwaBKGd/xzKX
	i8xt+8oi3
X-Gm-Gg: AZFdTZdOebbuKkz3cV/O9QjaU3D7Uv95FSQP3DTr2APWGkZXYJg3absvICt6FhGxBay
	BlRAR7xzjh7LbJbaEmjWMsDfcWnjNM6Q/Fis/ImcojplXYyJPz+uMupQfNvnbPcGVC0PfMFFjbE
	gA87TQqNGt6rBOGo0mXtuucnjqpClbmuAdX9ipd34MT0XBPahWFvdDFEOB9MZCFDWscH70Tj+ds
	imyPW8b2NWhSBeAFvydp0uoYoWlpgW0qzSr9cNbKI5VJtRgONXC8dv6/3CrGwoSOLas/QmHTew/
	0mpxqHr1G9aAtTGZAut/1N7UAd5Jmf7Xc+eWbZPwZwNBLpJcaCnydLaerFF83cPXNCWKmhKXwHe
	9DE1aVQ8wTfPUfWde3xc19bPCFkdXs5AVs/9ubs6eBK1vmFyzBwGHo0XE3ink8SkV82FOpFaklV
	1nsfxha86OOEepLGd2QnZF6dgaKh5KurFLfXO1Z7pVNGFe41Qc6QA4NHPIKifSZaPRxBJvEkHG2
	WsEX10IP5rn66cUpcylNrogIQJk620HV1rGZzWskE2tjrXQ7dbZkEFQduS9G/kMqpmbyax66Ba4
	s7Ss7K7FL2yTVxR+e4IfeRyBOXHtER2/7pclfYge9Lv2JJYsbPPkShgME1OwBeSDkqiaSw==
X-Received: by 2002:a05:6402:1d4f:b0:6ba:95c2:750e with SMTP id 4fb4d7f45d1cf-6ba95c27ab5mr4206204a12.16.1795476513310;
        Mon, 23 Nov 2026 15:28:33 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbeb0sm6062067a12.10.2026.11.23.15.28.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 15:28:32 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a32576da88so2245133f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHKuJVN6/yqC7KcE/VAy4WLq3yO5a9rzGklywZwuxaeOtvkzyn1v9mk4GvpMMhOM88YDqHBRA6CzZ34qa8=@vger.kernel.org
X-Received: by 2002:a05:6000:18a5:b0:48a:f0cd:8712 with SMTP id
 ffacd0b85a97d-4abb7f3e149mr24759404f8f.50.1795476510904; Mon, 23 Nov 2026
 15:28:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com> <20261112031629.396819-2-mrungta@google.com>
In-Reply-To: <20261112031629.396819-2-mrungta@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 15:28:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wbg2NrVkRcF5tmkCKCaO68s02DSioZrh0Kef20bgoidA@mail.gmail.com>
X-Gm-Features: Aa3M54qxqk4ye-nzMXd_3z06vzEcZgIhi2oG8UCPyVLsWcK9JJNpK4as0MRwgIg
Message-ID: <CAD=FV=Wbg2NrVkRcF5tmkCKCaO68s02DSioZrh0Kef20bgoidA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] genirq: Synchronize in-flight handlers during NMI teardown
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
> When freeing or disabling an interrupt requested via request_nmi(),
> __cleanup_nmi() and __synchronize_hardirq() currently do not wait for
> in-flight instances of the NMI handler on other CPUs to complete, which
> can lead to use-after-free conditions on module unload or driver unbind.
>
> Regular IRQs and NMIs require different synchronization mechanisms:
> - Regular IRQ flow handlers already acquire desc->lock, so tracking
>   in-flight execution via IRQD_IRQ_INPROGRESS under desc->lock avoids
>   extra atomic operations in the interrupt fast path and extra memory
>   barriers during synchronization.
> - NMI handlers cannot acquire desc->lock, and querying hardware
>   IRQCHIP_STATE_ACTIVE alone does not cover handler execution after EOI.
>   Track in-flight NMI handlers locklessly via an atomic counter
>   (desc->nmi_active) in handle_fasteoi_nmi(), paired with a dedicated
>   __synchronize_nmi() helper that waits for both nmi_active and
>   (when supported) IRQCHIP_STATE_ACTIVE to drain.
>
> Because handle_fasteoi_nmi() runs locklessly and cannot mask lazily
> disabled interrupts in hardware, force unlazy disable
> (_IRQ_DISABLE_UNLAZY) in request_nmi() and mask the interrupt in
> hardware before setting IRQD_IRQ_DISABLED in __irq_disable() (matching
> irq_shutdown()). This prevents a level-triggered NMI from observing
> IRQD_IRQ_DISABLED while still unmasked in hardware and livelocking on
> EOI, and is safe for regular IRQs because __irq_disable() runs under
> desc->lock and no chip disable/mask callbacks inspect
> irqd_irq_disabled().
>
> Update __cleanup_nmi() to serialize teardown, shut down and synchronize
> the NMI before clearing desc->action and NMI state, and warn if
> free_nmi() is called from interrupt context.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  include/linux/irqdesc.h |   4 ++
>  kernel/irq/chip.c       |  35 +++++++++----
>  kernel/irq/manage.c     | 111 ++++++++++++++++++++++++++++++++++------
>  kernel/irq/settings.h   |   5 ++
>  4 files changed, 130 insertions(+), 25 deletions(-)

This is a relatively big change, but IMO it's a problem worth solving.
I'd already reviewed this ahead of time, though of course that doesn't
mean I didn't miss anything, the Sashiko feedback being one example.
I'd be happy to add a Reviewed-by tag on v5 with the proposed
resolution to the Sashiko feedback.

-Doug
