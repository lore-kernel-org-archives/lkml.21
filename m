Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795068705;
	b=Pd1zOB4P6A/LjvGuvMOnHj4CWy6hci05LbR/Vr4HuoGnCmNRcUBxX9JplL4fGYQEPlKy
	 uoj5aFjrUqtimdffmBv5JpaWsiZEu67AvFLIZkEm+rEW9vYxJioaNxgMBA2d0uXc9/15Z
	 HOBC9OqIhwXXsp74fNFvQOB9yuPUKCORFEH7aXfo8mZt7bG6AX2Lj05brtloKwEdRS1Ea
	 +4+w4OxCnObMFleh65GcVp5k2/A4ezwgviNoVEPBFT5RI5Run/mGgYOEH08hJ/UN9b6VP
	 5tk+ahS/hSJv3p5ddPCJhJuP/Ev3QuC5lfwHrvo9g7UwpNGqvUv1KeCglWl2cyE5JbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+i7fLpQgbGWXsa4bKAmBMh9yPr9gG6NW6Mco48SKmuE=;
	b=mEyo5HGMlh1NtrLdM9yCiq3J+r85dPGFeV8kMmHlx+8jzRvLiufqpnvDR1A9K4WB8mG9
	 ictuIxpYOWwU68rd2Xm46XpdCRehaHBxIDEY302M9Q9SNwxK5eO5Qea+hEMQjysYcSd9E
	 1ydoW9aFKbRCDiMInDU9CCZ7CY4eJtf4RygCgTrezOMJbSj7ESQeF3obSyvS4pEzETh8H
	 aDKoxKSsUL3Q+01aM8E20y+2T+CQRMiI5Vi59Q5JWX8n8vbrn2BohFlPhuRt14zUggNes
	 NzS0eynQLQhGpP6XclWOOqpGIWCg2HlfoAfWf0cS7gib12M3DmJFos7V4jCM9HaW58w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U4mnEIRn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B0606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688B0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U4mnEIRn
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso2085494d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:11:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795068699; cv=none;
        d=google.com; s=arc-20260327;
        b=VLx2EsZry6oIkE/oS3dXpEovNpl4eNRic6jt7Zb3+gnufoZHHCiBFicsVut2PhiIcy
         4VRXjoPT3qALp2JgEtk6bzjQzIOyRBKDxDrQoquiO+iC66euBd+2ACHjQqlwFXTVsS7d
         l9J/scE9t72XAvLvjEgb3621dEqADwKdvtoKiBTjce94L3u/44Jx6gECWMSpfAxvfah7
         XwXCvS6f2kh2YLUvXQBVly5N6VSCXf/X7KHTMlAT7yAfISjhif5vNj7OM5WlFHnreTg3
         FIDTZOkFNUFSi9kTrnmCeyHkSCiv8HX07gaYM4KyYXhnYazoX9tvU/kga8zfflvTloMi
         s2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+i7fLpQgbGWXsa4bKAmBMh9yPr9gG6NW6Mco48SKmuE=;
        fh=ReLNxTqPC4P9JJ6ZK3DTJj8tKWbrMc4nEc3JYeCVNlU=;
        b=k8dMqoc40MKDeNTs+Qlj3PN7SLD1ViMioK+LLCNVm38FDyl4ny+KAI2Eod94qwHI4f
         6dYrWIId2NxWukkWBi9uFLN/1ESlDeQWYzcj0GoGS4GBElga5x4kHYY2vFdWIFTvNFu+
         lI/BYrb6ZwAOQ7hhiAYcP2uCgPXn2ebvQfiuYQd1YEfbrkKlPhMFntcs+YDOVJUwfjj2
         MIr0IViQt2JYFfNJiAlUrIvzTtTJL8F16UaVlriM7eV/8yYibfpo47GtD6C3dLoBPGsi
         /B0OykqxysciFr1LT3ivklRI70QZsg6SqDmEkZTvO8qOAyF6pQ2P/p+FTidadv8GvbaB
         J+hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795068699; x=1795673499; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+i7fLpQgbGWXsa4bKAmBMh9yPr9gG6NW6Mco48SKmuE=;
        b=U4mnEIRnOIJzuc0QmHuxU9tV3N4an/q6D1UgnsUgZemoxg1Q88SL1yGGAlc/jmxEMq
         7kFSMRpo4TnTvtl6trNPHFRR4ABXgRNScK+szwWRTISaA4ejH08dW+QLHc1umkXoEBGr
         uJs9+lwqVd9qAXrYVi92Pf9eiaHyX/40a6Odb0LtGWI6MqEu8q3Qy9PZkIO9nf8pOiYi
         CQcI84dqINbjZk7l1aN0pMYFSZQSBL69onhtNlz5LSOhG7D1NfVhISitmaw4SqlP+MMp
         fGqTQ9HuHZv5SCdk7+DSLFuok7GFgjD0TErBfWJMZe2odqBSiCJR23eUNB/6wAMBmRNJ
         mdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795068699; x=1795673499;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+i7fLpQgbGWXsa4bKAmBMh9yPr9gG6NW6Mco48SKmuE=;
        b=Pbt58UB9cosj4Jmx7aVas4LtNLqApdo/ZkNBhzUSlqiNnaaL4JNI1rCZQJRm1aGvTm
         k+TDr+cqLxwoiBEml3295peebqAJ6QS2XaftTc26eMT9TNf8VSkM2U2okMPFZE2QhfYl
         W7V1MlzvEIvMh1NtxHZ1FIiOoLAV/3fZb13JGFMLp386139oAfJPI+uApIXYVmpmpJCc
         7Jq1+l/QdTpSi/RpqiPT1eMOHYLondRn2ic9VK5VV3G9Vg7S5NEja/VrxymQvagEPePM
         xTauTLw2vCksI+VhypxpgpAh/0RlB2hAGoeCbpQSe4BN+kGLWuKcDa3cDjYCAcqW2p28
         If3Q==
X-Forwarded-Encrypted: i=1; AL+hErF5wGOZQR0QI0GXdsOCllcZ/DzWMPy0SOsafID8g89PqvcJ9eIL5q6w+NAMB9KwVpTpHk1AkBGeiFveikY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vmamd9MFUyxAPAXLA8Lti7kgPJi1sBrIYFQA0OLvI86f8DA58
	ILS1VAoZd1HPxMeHU/+bn0FY5+Ztrh00xCsSyY4XDzGcWUebOGRo1zIThUAjCS53a5os/k6GXi9
	gPxtiDd6k3hTc4H8O5ylzMze0yWVh2YoRlk2UinnDMQ==
X-Gm-Gg: AZFdTZfBFxBjKb51A0vbUc/sSGb0DKHKB+vdnlKetmOvrzKzeq0IL99MyjqEqE6UBfN
	rRu+NyQ2aY0x365JEh1aJ/In7CR5rn1DPHA6Na/ZyPH93epBT6E0+GzP50Xp4Ey7ymD7TxT2Y9F
	peYnwi80ypE/sUJQOgEHAKzryPQni92gV0nj19NwcSCXnSRfZUrSo8ttfj+6VYstKezULpb8Kyh
	2hytAqexAzrgYEx8EI0dduIsXnKIBUN4Zc95998+M0jRQsNCBW/dHV1hkc4clU6VJ3GxCOwoYtH
	ziN71ZgdnMtzde2BTXkJrcp4cvuY88cR7T6JIz0o1lVSC0m62xHf954bjRsd4xwQK2g3DZSYzAi
	BwjSlAWovA8I0gIi+0qFhq2aXo1AE7+4culN6rvjudzgCVK7pa8vlmmueev3QUAl7ygDs1nzteK
	pu3Wg9G6bdRsyrsuHTxJQ53kTCf1lYlb76xRToonqlJbxNqhlImJisEPnHIfN247c1xVWYGoKTT
	NWPwK8gE6tBGTG16JejTHfkCXRzL4wLzGjZMZym7KcfYyzEkzsGP3MDqNk1U56pDXUs8fal0ZC8
	pqeLEXc6XHxRHZBqWcvN8XCQW0pRnWiu6KwoIQWnuRIOTPmo56xp9SXwAG/rqwsFF2y12iDilNb
	n/KVV0lFQD0Da1LVqpkdxNG9IwheQTRKYV2Mx3G5WipXk78jYxXCSNP/HSepC+/UQ/UmSITKXzT
	iIqvNE/Hb93CFKzLHqLqXlWqFS6/s0l0WJZq3yyQHwhcrmwy0QRVQFbLiY7lCHQzI7suFp
X-Received: by 2002:a05:690e:158e:20b0:672:9f72:7c0b with SMTP id
 956f58d0204a3-67dd404ae39mr1379048d50.109.1795068699305; Wed, 18 Nov 2026
 22:11:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1788259938.git.jasmeet.bhatia.us@gmail.com>
 <a9e23066-aa75-44be-ac3b-9a15f4cf6047@app.fastmail.com> <DL6NCV1KQ9F9.6K6XZQCS4AF3@gmail.com>
 <c3ca811b-a6eb-4f4d-bbb2-4feef02e3db2@app.fastmail.com> <CAC_iWjL9jDsRaU7kEemYfwk292Nxa49cK0Rq=81pC=FWNRDhvg@mail.gmail.com>
 <b66f68b5220ddcadddb41340d3ea3388@gmail.com>
In-Reply-To: <b66f68b5220ddcadddb41340d3ea3388@gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 19 Nov 2026 08:11:03 +0200
X-Gm-Features: AclHuK89rr8JCP4LjUM9lxwdzxvtIWH4RA9tyZloAfhEcmTE7ZH1lrQpq4myxc8
Message-ID: <CAC_iWjJ1L5MYWy2vHG3AHYcfqx7urJmaTYP7vuyvZm8GSnWCDw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] efi/tpm: Preserve event log without changing x86 E820
To: jasmeet.bhatia.us@gmail.com
Cc: ardb@kernel.org, rafael@kernel.org, pavel@ucw.cz, 
	linux-efi@vger.kernel.org, linux-pm@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jasmeet,

On Wed, 18 Nov 2026 at 04:57, <jasmeet.bhatia.us@gmail.com> wrote:
>
> Hi Ard and Ilias,
>
> I wanted to follow up on this discussion after a couple of months.
> My bad at being slow, at keep this discussion moving.
>
> Has there been any more considerations with the preferred approach,
> regarding the EFI TPM event log reference and kexec?
>
> This issue is still relevant to Framework 16 owners and the temporary
> fix has been confirmed to work for other users despite not being a
> proper fix to this issue.
>
> I'm always happy to prepare and test any patches once we decide what
> direction we want to move forward towards!

Ard suggested we discard the EventLog on kexecs and I agree that in
its current state it doesn't offer much to security. Is there any
specific reason you want it to survive?

>
> I appreciate you time and patience!
>
> Thanks
>
> Jazz
>
> On Mon Sep 7, 2026 at 8:57 AM -07:00, Ilias Apalodimas wrote:
> > Hi Ard,
> >
> > On Fri, 4 Sept 2026 at 19:39, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > >
> > >
> > > On Fri, 4 Sep 2026, at 17:45, Jasmeet (Jazz) Bhatia wrote:
> > > > On Thu Sep 3, 2026 at 7:18 AM PDT, Ard Biesheuvel wrote:
> > > >> Hi Jazz,
> > > >>
> > > >> On Tue, 1 Sep 2026, at 13:34, Jasmeet (Jazz) Bhatia wrote:
> > > >>> The EFI stub currently allocates the TPM event log as
> > > >>> EFI_ACPI_RECLAIM_MEMORY. On x86, this becomes an ACPI data entry
> > > >>> in the E820 map.
> > > >>>
> > > >>> On a Framework Laptop 16 (AMD Ryzen AI 300 Series), the EFI allocator
> > > >>> can place this allocation at different physical addresses across boots.
> > > >>> Since x86 hibernation validates architecture-specific data from
> > > >>> the firmware E820 map, this causes an otherwise valid hibernation image
> > > >>> to be rejected on resume with the following error:
> > > >>>
> > > >>>   Hibernate inconsistent memory map detected!
> > > >>>   PM: hibernation: Image mismatch: architecture specific data
> > > >>>
> > > >>> Allocating the event log as EFI_LOADER_DATA avoids changing the E820
> > > >>> map, but doing that alone would regress the kexec corruption issue fixed
> > > >>> by commit 77d48d39e991 ("efistub/tpm: Use ACPI reclaim memory for event
> > > >>> log to avoid corruption").
> > > >>>
> > > >>
> > > >> As I replied in the other thread, I am not convinced preserving the TPM
> > > >> event log across a kexec makes sense to begin with. This is the firmware's
> > > >> view of the state of the TPM PCRs when it handed over the system to the
> > > >> first OS.
> >
> > It doesn't make sense imho. The only thing you prove is that you
> > kexeced from a 'previous good OS', but without knowledge of what that
> > OS did before kexecing.
> >
> > > >>
> > > >> If the first OS boots, loads a kexec kernel and then boots it without
> > > >> measuring any of that into the TPM, the TPM event log will match the
> > > >> TPM state, but this is meaningless because of the missing measurements,
> > > >> and the attestation chain is broken.
> > > >>
> > > >> If the first OS does perform TPM measurements, it would need to record
> > > >> them into a log and pass that on to the kexec'ed in some implementation
> > > >> specific way - it cannot use the existing TPM event log for that.
> >
> > Hrmm, that might be problematic. The EventLog needs to illustrate the
> > state of the TPM PCRs. IOW replaying the EventLog in memory should
> > match the current TPM PCRs. But that also means we'll have to teach
> > kexec how to properly extend the PCRs and update the EventLog.
> >
> > > >>
> > > >> TL;DR perhaps we should just discard the TPM event log reference from
> > > >> the EFI config tables after consuming it. Or add a special case to the
> > > >> kexec code to disregard it.
> >
> > I can't decide what's best here. IIRC we don't expose the final event
> > log config table in systab right? So we won't break any user-space app
> > that depends on it.  We just copy it in
> > /sys/kernel/security/tpm0/binary_bios_measurements. In that case
> > getting rid of it would work.
> >
> > Cheers
> > /Ilias
> >
> > > > Ok, honestly that makes a lot of sense I see what you are saying and I
> > > > tend to agree. I'm treating the copied event log at something that
> > > > survives kexec in this patch because of the corruption fix so I'll look
> > > > at dropping that LINUX_EFI_TPM_EVENT_LOG_GUID reference and rewrite this
> > > > patch. Hopefully, that will avoid that x86 E820 instability as well.
> > > >
> > > > Appreciate the guidance!
> > >
> > > Please don't send any patches yet - I'd like to get some input from other
> > > folks as well.
> > >
>
