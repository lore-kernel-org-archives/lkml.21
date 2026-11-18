Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012918;
	b=MXu2tXG7RCqXZ2UJ18G1C4jogLo8ybhYdvoBNXJmpOboS1gPck4KAosqIMaPpjtFT4Je
	 qaXWrC7fAPc820ulFcaawPMk2OMtEGCMQ4oNO06B54aj7b0yWbjPVtG+OEqMRUvRn3E+K
	 Wd8VfiqiOiExxj1yqeUPlPKEyxCKCVhvm0cDXaSyuJAox6YZVEsakkjaG+zx6Nj9jKLah
	 VBguLr3oLKejX0GOItrwcRrS5MWlUPfquiocDWKLqI9LUQVBuS5kIs5jRlq4MAEWDzTgG
	 F5MJMS+dcwjZXFh9xiH09MLqwYbk1LS7O9rdokMujLO23iJ3k7VGyylDnXwYsyDQriA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WRSAwcPpVvVL9pia2YQzeThyWzOEL1AWKpkFwsSYKqY=;
	b=aLUQwHs8pIh1xDKO6zo+m/KmGIt/qNwNZH8D0S77J1G121pxQ2P0g+gotg77VzBTUKty
	 83VAOve1q3Jfe4hSf6l/S1MYOXKr1fhkScEHM5TMfUHbusf5gVeElufLIme6xrUcRJsVE
	 Dkadekwua9YLvFy3XBbJc6CsjjFRjjB6l8rkqpJf96KaZNB02khdExYRofHScg8YZosSW
	 ZuQvdgrUEYiWr0XjbPMtfhMk3S/OYVjGerKhQnpRNTPGXekZudlGtyYyuvQnqCYT5Gr3X
	 9nJwJMHEnr+WA+DP65kAlDP/LSr+k5MuUXL0iBzC+BIf2Ze+BVG7yiS4RbrzkRce4vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c7+eyrcC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.66
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6881B606A337
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6881B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c7+eyrcC
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so989782e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:41:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795012916; cv=none;
        d=google.com; s=arc-20260327;
        b=Sa57+ADxCmghAUZ7DHwvgWQM7ndTfysdFY03FnI3W+OoEZEMlqfMmIFxHILvSOluY9
         1GJI82009ca4di1awVIHREUZvbMFIazwA2obXCW2wPoX9DUgk6rn9N5DR3yrBWrZ1wKM
         IjUzxbSETiQS+i+ZtzAZlHSJ4mPDqd2UDZHQngJMKoAVZIh5x1sli8gmq+YdgHl9wvf8
         r5vaq/1FQIrU9A1xA+15NGn/2EMAl9Iv+nzoGv50yHE9tOMZwO5atwTCKOEpSXsMajV1
         XK0Cmmtni4guJcXvVZPhoM8ZwKNrPHlsRBjWHxe5kQclYOH+IFRlYS7RMA7caE/5C+fg
         DaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WRSAwcPpVvVL9pia2YQzeThyWzOEL1AWKpkFwsSYKqY=;
        fh=se4oWR1bL0d1C6NGH6EoiwtwwM82S+o3wIjpX9IJbB4=;
        b=USCXIa9oS2C58UXsnczMDeV6AA1HeU0WMeZmUsKqaLG23H57Jx0FPNmm8f6Zm1xC8Q
         XgP1R5urwdxi0yDvy0H1kC/Us+5Qavr24I13xI/vgPx+eSzeeu4tpa9lY6jf56On810S
         RLe5Ou3ZTqP1qjvjgi9t+xdq/B73UoBYTqT7agOY5G9AxUb52dWT9TRQF5zy21BZNaFH
         sU6Uh3UlPXrnzqrkDrqOM2QHMXqQF3HMXn88i58MKLMSj476zxCBX+JIYKPAsueFiYcn
         oqJjlOgN9YV6/LWDf2jQYWY+p9eoqZPSCIf9oS2Vd9VM5rRHmTg/Hk2JFZ1oMM26rWzo
         jWLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795012916; x=1795617716; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRSAwcPpVvVL9pia2YQzeThyWzOEL1AWKpkFwsSYKqY=;
        b=c7+eyrcCPVtSUQWEPiyBFza2kV+CTuG0CYzia9HuYEnrbJRjBecC0oApUOiMMJ0de/
         j1dJIEnJZAugQKEkMsU7yWgAlmSeQD2c10BBNSqGW3fbUN6UTLMXTMwzm/HOKc2NLXLW
         GXQ2yY4B2N/6r/wgaadoxPCl7J7+W7X53tkGx3LKH4ocNo4gPcQHPKkiDYAUOF6EYB+L
         RWavboIDzIw7hLEBczoWznRRf0OOBDJHCYkXup3S+s+oj7i3tP8niyqqtaAGSMFfVdTn
         F5bG0c5yNVvrMV3Y7RKnHjwSvJI4tSXlmleAfN4EeDrGbXmiYylBFOU9VXoUQDk8/SxW
         wIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012916; x=1795617716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WRSAwcPpVvVL9pia2YQzeThyWzOEL1AWKpkFwsSYKqY=;
        b=KBMTzpGqXNKiFaw8UNDwoJTWc9IbiwUMOpMt8yDaL1ujlNMO++BeITOf9NwRQzImO+
         3vKLQkt0ySXKXkJXfQHlHgeZSankhNzSKxBNPVtuVU5T6MEgy80+69gx3lyq2MLNbDSL
         drdewwF55n3n1sOZ6Ad1fggMv5+LR2kLQl/eFtdgnAp+a0gNhejOKeqOx1QcNmYuS5s9
         tcJtAQGjD4lcvzwJajUqrfLhckcDJNXMr3pO+IspAxpJTq5GOAtCGlXvwV88kkiN9H8r
         SWCNL7B0DjmtHjvbV2RMBLB2gLaoH0ta44aSOL8AoVYYC+r/z1JV3hYRdfaQBw1Ic6ze
         FM5w==
X-Forwarded-Encrypted: i=1; AL+hErE00RGqNoSKhg8RegIY901p1AXr0oNA6R9v9anrjwA4rnSYHjODNtgThkoPQtRfTLvgVEWXpHvyR6dmNMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CMCg9OAdKUP12F+sAijv1pR1U7gAsS5Qjql98m4fLWDMyWjSF
	CBFLcE69iivoyI3nGMOMVgvXQabrjhqKCSK/HwO5Vh4VSrqfEi0nfTwS3zL+2uLHcRa0QntA6kx
	uu0r2MGsYYi/b0kfD1n2s5T11HlncemoUiiC0X9P77RaTqF8=
X-Gm-Gg: AYBFou1ngz9lJbCqCmx/HqV7iMNGnjOcvZmvp+yUVs/rwNp2io/BQ6lt2ZAFAu0Qweh
	xNd8gEqJGSWgzLITXq+IEJuP1aV0r8GiMzZUpEeuW2/hUzRPPRihSBnJn7aQj/UYNLIuBnu7c9W
	Oar+EM00Q5N4mDUIH9B/CxhLtJfeExn4e5GqZJrz5DieERR+KV9/4fbf6EnMxZR8MEy2/zSmptu
	fE3dlFYSWWmJK9f8Gy0T2YoLUHV986Pn1U2cc6qMi1qoDnDDf/ePpvobRS8QzNOhQoysIJnu0EQ
	w5KUmKI8WK4KCiPKIwqnKJDZGmvR4CPp7CHTNmKfqTJMD+tiYTUlL8N4pgGYl4D4Wh7v1Id2pGX
	VQ/HITcTXpi7CzLcIpU4AIRf9vzKHlT8O/qUScQ==
X-Received: by 2002:a05:6512:3f28:b0:5bf:a34f:14ce with SMTP id
 2adb3069b0e04-5c1a0ef79e6mr1989965e87.11.1795012915416; Wed, 18 Nov 2026
 06:41:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112134942.288831-1-shlomojune6@gmail.com> <DMTHXFS504S9.2BU4PDLEWG3PX@gmail.com>
In-Reply-To: <DMTHXFS504S9.2BU4PDLEWG3PX@gmail.com>
From: J4f J4f <shlomojune6@gmail.com>
Date: Wed, 18 Nov 2026 22:41:43 +0800
X-Gm-Features: AclHuK9QDHo1yz09H2q8rKyDe22fgjuz0dzQ2yBYPTf4oQjXMD1IbeM927twSjI
Message-ID: <CAE_LbwmtogEFvk5jDUcYhjSaX7_5bsHy-OWxCKPxmiBVDcjj_w@mail.gmail.com>
Subject: Re: [PATCH] bpf: Fix cgroup link update after a failed effective
 array rebuild
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tadeusz Struk <tadeusz.struk@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 03:57, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu Nov 12, 2026 at 1:49 PM UTC, Shihuang Liu wrote:
> > replace_effective_prog() uses the position of a cgroup program list
> > entry as a physical index into the effective program array.  When an
> > OOM detach falls back to purge_effective_progs(), the detached entry is
> > replaced by a dummy but the other entries keep their position, so the
> > list position no longer matches the array index.  A later link update
> > then writes the new program into the wrong slot, leaving the old
> > program pointer in the array.  The array does not hold a reference, so
> > the old program can be freed while it is still published.
>
> I doubt you managed to reproduce such scenario.
> So wont-fix until there is one.
>
> pw-bot: cr

I reproduced it on f66469d9905b39 (7.4.0-rc1).

[    4.307527] BUG: KASAN: vmalloc-out-of-bounds in
cgroup_bpf_prog_query+0xdf1/0x10a0
[    4.307589] Read of size 8 at addr ffffc90000073050 by task exp/74
[    4.307593]
[    4.307597] CPU: 0 UID: 0 PID: 74 Comm: exp Not tainted
7.4.0-rc1-00536-gf66469d9905b #3 PREEMPT(lazy)
[    4.307602] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX,
arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    4.307605] Call Trace:
[    4.307610]  <TASK>
[    4.307613]  dump_stack_lvl+0x53/0x70
[    4.307622]  print_report+0xd0/0x630
[    4.307628]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[    4.307633]  ? cgroup_bpf_prog_query+0xdf1/0x10a0
[    4.307637]  kasan_report+0xce/0x100
[    4.307641]  ? cgroup_bpf_prog_query+0xdf1/0x10a0
[    4.307645]  cgroup_bpf_prog_query+0xdf1/0x10a0
