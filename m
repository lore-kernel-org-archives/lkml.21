Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476523;
	b=R+9Shw97HocMAQRj0vP//Nr5StWvC9juQIUQwTi/K7qo4NncmpNkB7+PyM+OG2Qk6vIl
	 BAObJY18qgtRxqvMIu199QAfaz6nN1i5V/Ofmm+OigqsxPKer5GDpaFBBWeZi/Rs4bhas
	 7V/1YLxNcBoIMOSJ8lgUjArGn0HdwNzKy9b95Z5AGweEYm+4zmstAxAEe9zVxY7OAp62W
	 G4GXrIPDPJNe7QB5REle+WbIBeOP0OxdL0MIlAhzOtq2Lvu9gVPx9WvOOxNZ+mX1uqAtE
	 X96ddoDUhGShK+V3HGogUyBUEECQpO1vfkg2j9Es0xyP41ZzER5BtD41WJl/+luuy6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L9JyOQCk4ptyu6RbQxU+dboohfD5AUMkdLfi1iuTleU=;
	b=J7PRcEdcttRjc25+NqNIFp1kOrKLIptnvVcU8uJRmG1G5D7uFmFGCOpkYVRwMuPLVSVK
	 Hh88942ctWq7dVTV8LhvKmH+L4kI1hK2NKDehAlPydy3pelSliqT/tQinqJAh21fycko8
	 +I9BDemex7ibF88w/9PZ9mWFaNAyXA1aukvuz9y6rotV6fd0B1t4+s0McyMX6rF+9ZKkA
	 sjHVNOUe5cXY7JsnLJHc1J07MiLoCzauIM7DVqtiJXTmyif6wSDOO/VFdbHMstIhpc1hE
	 sa/5f1JzqqHZcesz9G/vh+AGthu3QBTrHz/LKuSr+SRWZr66AolpP4wBU4k9XOfHe4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DaM0vGy5;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D01E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D01E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DaM0vGy5
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c515319dd89so448562466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795476521; x=1796081321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9JyOQCk4ptyu6RbQxU+dboohfD5AUMkdLfi1iuTleU=;
        b=DaM0vGy5teEoXFpFxJnj0el7sOopE/UtgSxsoV0X+63o68kaJuglNXwnm++mQfUv/A
         Zblix92qflJ0fs4v7zSiMnsdAVFDY2WIVjxOraOEmFwXzinBBKZmNUQuxkEyZ/xQbBDs
         lu6boBaLdELBJWmNzkdR2maTjISux6/ldn9X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476521; x=1796081321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9JyOQCk4ptyu6RbQxU+dboohfD5AUMkdLfi1iuTleU=;
        b=llxOPo7fT2yYM9Bj9y9F9sHSDFLxv5xA8GXC4fDse3SEnFKxZL9CXIDDgaejFJt4aq
         jdwelcc7Lab27gkOWWj/cX0AAAEzTQ2g73aQXBET755WdBu8MwoFRFrgrn4R33/4JTq2
         mgWNZophgVL+vYTrB3rKVB0GngLhWkPyYxiANYXGhIdPAaKyyLMWEQBydaldlY9GbFgp
         ZViQiG1fhKTCbj60CEiZsXYp6/+P/it9EuiLkBgKnASwbolMsQ6KwB/cgZ5kSGaEXY/g
         zretgrwgCweuDC9necXsWu6Xz4DaHDY0tNhEOj+hIpHd3aPevu/X5bmrduJKr+5JTK93
         nrWQ==
X-Forwarded-Encrypted: i=1; AL+hErGOnereBV/X06gidyaeYlZtfPmO7QuGkp5TeFTQH+RRA2ViZt2oN250Cqe4UVavzaXEXUeLkfHSY4Gfb4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PX8/YDDq2F4IFbL/PnGSWDC4ffM47TmK2Gwo1y0NSTqc3Ezzk
	YIfcCa0JkXRFtPaLb4oIshGp5QbiZ74SlVxJhgoXdHzXCHJkwvFWnS0R7fR7Ze+95yaMlQ/muht
	OUaDVVDi5
X-Gm-Gg: AZFdTZfZGSd+QuKDwYasTemSAOVmVKdxYZT3SvA102uOqnFWPhc7yTvQbzkykzYUtwk
	i5uTa4ZY5bFnqE8ph0hb/W54HZ2yx2XQoWBUgSfwVCBQS5+JcA/HsEAWrFrocgXHmRXjjA2KDzd
	MKF40eBH/JfzvPSSpzVnNRlUZv9N/WsLN2MKBIxN57bYfTOrSt1WoOr1+G/3Eho5tYo911dllD4
	PxqLU3WwoBjkormrDHoDnWvszs0zFa9SMAhyVMIwCqbEJCIO2jL3FQWt726GZtQvwVfKLOchaXg
	KAlwL797byoP+1pdLAUqEviaJ5QxOkDFlbEWYx+Q5ACwIC5CoBeGuzqwaVSRlI3GW2gGKAFbVmz
	GeKJXRcKrzi3JW2oEi3iRAddOxnfHrBfGd/2IadVbxKyUrk1Vx6VlNI4qgqXrIsEJ343w0u9DmP
	NLXjo2Tb93aBDpa0cZi2tyPZp1LjEs/qv5M+dzYQpR8kRZHxoys8hqzqklTJcAG9LWrJsgF7Toq
	WJ3stu3QvEruP5VIi6DW0NFABU3M8XHBQAdGKZVSSGVZjgO4LIXcJftHd7cUU9RnKJY4tD8Q/Ki
	g/QiJIB4VFM1NNXek/u21w1MWX8/Drj6bOTLYTdOcZ10SeRrzNi7xbHNjDEK3RhxnehFWA==
X-Received: by 2002:a17:907:3e9c:b0:c41:6de7:7dde with SMTP id a640c23a62f3a-c513a41f0b0mr1072989266b.4.1795476521093;
        Mon, 23 Nov 2026 15:28:41 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2579sm436092066b.52.2026.11.23.15.28.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 15:28:39 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb606491faso21609815e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:28:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHIXHSzjsv3tFed3fUR91eY7g5cU063mSApfoy4Oi/Bk1zHqr+4jKyiZ4h4eoeepqzUC78iRQe7kM49djA=@vger.kernel.org
X-Received: by 2002:a05:600c:1c1c:b0:4a2:1364:252b with SMTP id
 5b1f17b1804b1-4bb8892ac4amr288126295e9.35.1795476518196; Mon, 23 Nov 2026
 15:28:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com> <20261112031629.396819-3-mrungta@google.com>
In-Reply-To: <20261112031629.396819-3-mrungta@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 15:28:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WfqqTp8Bue35bfnHXiegqVbHxtDf0UPjg1JnXF_o_3ZQ@mail.gmail.com>
X-Gm-Features: Aa3M54rsKLWqkESys1duLI-KqFGibQ4RK6Ckuh_aN7G37_7JSHexELC5Pm6FEBc
Message-ID: <CAD=FV=WfqqTp8Bue35bfnHXiegqVbHxtDf0UPjg1JnXF_o_3ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] genirq: Allow global interrupts in request_nmi()
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
> request_nmi() currently requires IRQF_PERCPU and forces
> IRQF_NOBALANCING. For global system-wide interrupts (such as watchdog
> pretimeout SPIs), forcing IRQF_PERCPU sets IRQD_PER_CPU and prevents CPU
> hotplug teardown (migrate_one_irq()) from migrating the interrupt off an
> offline CPU.
>
> Now that in-flight NMI handlers are synchronized via
> __synchronize_nmi(), drop the mandatory IRQF_PERCPU check and stop
> forcing IRQF_NOBALANCING in request_nmi() (existing per-CPU callers
> already pass both flags explicitly). Also check irq_is_nmi(desc) in
> irq_seq_show() (matching kstat_irqs_desc() from commit c09cb1293523
> ("genirq: Update irq stats from NMI handlers")) so /proc/interrupts
> emits per-CPU counts for non-IRQF_PERCPU NMIs.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  kernel/irq/manage.c | 9 +++------
>  kernel/irq/proc.c   | 6 ++++--
>  2 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
