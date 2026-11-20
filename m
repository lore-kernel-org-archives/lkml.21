Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184087;
	b=IcEgxi+NCa7jxdeh/HXDzVmmehnMLX7n09twj8fczWDXoL8fJGFhXA+XFrqeHXTMzcR4
	 ImLQlOKIer7qbjh8ctC97nKwWlpmQnRrhiuGe2v59xloF1g1WIlvzLypQ77t3s3AZHPvT
	 GBOYIUijrrylx22XU9Zt4O55ZugrUDRI0Dk6RCt5wj3G3zTuFoOhtmi1izVnRm5U1FLJW
	 0wFbqJtTBNIMTmHOZtIe984L9T0p4JlswMuw4VGF4zlojW2Jn+Hay5Jg+wVeMvCunRw8z
	 Ib8xXUA9es7pUQ50KnWBOK39Bnipl5m7cmFQikwak4YquGtIa9wyxLMSAZvvPqWpnIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184087;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dnxxg6F3YNHJ5tIqJyZzkJIccsYuMgcijR/B79RROuk=;
	b=HYw8Nylp02+UsABHPzyiLdwh7VE3iAoO1FaNToLwOFrNBx6Q6l6cduN0bPToDq/eNaG8
	 RZ80v8IIaUqfgdPFvu37F4gAEtsvTnpJV2OPnTygb4b7DQyooho2zDuMbqAFcuAimD5wf
	 YSGuW2TCelH5vdLRIkYtIzh7QCm+jSHIaajbJvotz4/Ogy1IRJW93ULS2aT5Fn/vC9Tw7
	 aOTYCJicunPtwmCKAMzRK/n/9UFuUEeGl2x+BrE8skEuiwSxzJ/8l+KLDRorN8MzW2zp7
	 3mVNxnNbn8uB9VHg+ji1puxDSTl7ee3XPg+n24nrqciRpLW3n0Jm8CF0A5m9PPx26yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORAykmni;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF95606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORAykmni
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD5D1F000EC
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795184087;
	bh=dnxxg6F3YNHJ5tIqJyZzkJIccsYuMgcijR/B79RROuk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ORAykmniYijHZOkADhSgjU/fzDOyv635wEHseBSrT0A1ZUxMWlBJdqiiOFfmN6Ply
	 HCTx4JjbJ8va3oS0rVBfBb8cwVHf2SHlCniQpHV/ZoDQPOmyP7SZ5ukRuxK73EftUk
	 pAQiFLAsgF8gWfFeiotXPHUU9fVZZUABNlOAsMUpWQuU8YNAQls22v+4TdEAzDQH/s
	 nPdexCO518PlATtSx20PyrFPdq3jYOEQ21e1g7u66gpATMSJ/s24gkpoH+1tTjBcj5
	 iqC1S9g5zJ6ACmq6sBOhlCRxHixpygM5Eixj7JfLEakEto7QS6iplmdX91UhwIHuhq
	 ++Lk4HcRHZ32w==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae81ae52ffso5924141fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:14:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEYJ2jRhfdwPsyC2M6sq4Sv9g0Z7rPdzRKEwGhb5iWsgd0FHEiMcBNeZdnzLhIJ/kC1bEhu0Yq2Hz0L5ng=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j/eqIzge4ZBX447GTls31IXOHneSzZPEAQQ9hu09Gbjg1EBvC
	0xXPUl+1aI+4OkkzavXMfzi7zffqzSDG6Io6LDL9lC4eWOvKLAQ2L9GHJWx7tgTCbj5B5tTryjD
	XawO1BmZZf+UB1dT8uqiQDcWiUFSfTrE=
X-Received: by 2002:a05:651c:a1a8:b0:3ac:48a0:e253 with SMTP id
 38308e7fff4ca-3ae7fa1a13dmr10878491fa.23.1795184085597; Fri, 20 Nov 2026
 06:14:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117091534.895868-1-christian.loehle@arm.com>
In-Reply-To: <20261117091534.895868-1-christian.loehle@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 15:14:30 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gXd-ks65-GxuzvSfCtsHcAetsFe+ofTsXSCOjqtox-cg@mail.gmail.com>
X-Gm-Features: Aa3M54oLq-mWMU5TZaipZN5wQVcszTvM9H8NHBYEr4LkukbKHEN3x4kqPnPmul8
Message-ID: <CAJZ5v0gXd-ks65-GxuzvSfCtsHcAetsFe+ofTsXSCOjqtox-cg@mail.gmail.com>
Subject: Re: [PATCH 0/2] ACPI: processor: Restrict unsafe driver removal
To: Christian Loehle <christian.loehle@arm.com>
Cc: rafael@kernel.org, lenb@kernel.org, ashwin.chaugule@linaro.org, 
	al.stone@linaro.org, miguel.luis@oracle.com, catalin.marinas@arm.com, 
	Jonathan.Cameron@huawei.com, gshan@redhat.com, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:16=E2=80=AFAM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> Hi,
> I've had the ACPI CPPC lifetime issues on my list for a while, but I've
> been hesitant to restructure the code again. Looking at other users of
> the same removal paths, I found independent failures outside CPPC too.
> Do manual bind/unbind and processor module unloading need to work, or
> can we disable them for now instead of fixing each affected teardown?
>
> Manual unbind and module unload can tear down state still used by the
> acpi_idle cpuidle driver, processor_thermal and cpufreq. This series
> blocks those two operations.
>
> Patch 1 suppresses manual bind/unbind. A second unbind after a nominal
> rebind dereferences an acpi_idle device freed by the first unbind; QEMU
> with KASAN reproduced the use-after-free. A separate test left a cpufreq
> policy capped at 1.6 GHz after processor cooling was unregistered and
> bind reported success. Manual removal can also free CPPC descriptors
> while cppc_cpufreq, amd_pstate or intel_pstate access them.
>
> Patch 2 removes the processor module's exit function. Its cpufreq
> notifier otherwise leaves QoS requests attached to policies on unload.
> I can also reproduce a use-after-free without CPPC: unload processor,
> destroy the old policy, reload processor, then remove a replacement
> policy. Module unload can also free CPPC state used by cppc_cpufreq.
> Keeping ACPI_PROCESSOR tristate preserves late loading and load-time
> parameters while normal rmmod returns -EBUSY.
>
> Ordinary CPU offline/online does not call the processor driver's remove
> callback. Physical CPU ejection does, and is outside this series.
>
> Christian Loehle (2):
>   ACPI: processor: Disable unsafe manual bind/unbind
>   ACPI: processor: Prevent unsafe module unloading
>
>  drivers/acpi/processor_driver.c | 26 +-------------------------
>  1 file changed, 1 insertion(+), 25 deletions(-)
>
> --

Both patches applied as 7.5 material, thanks!
