Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738719;
	b=P0aEawwkWz0n4uEkJdz/J03D2G0clDkiLkA7Sj1LtoivcJ1RiSTgP3PtU/d27KEpU5Ni
	 wyr7YxOEqMt3HqELvBc6BcE2+Euf1YR94oT7xdFHQs1S76gmEz4z9/OJ1/Y7bpXTq6inP
	 ygPOrnVo2pPGAk/GA2bQePPR5ikTueCXJ26KmqcD1sM+O+PJS7z7hrQ6X0KcAV9EAQvpf
	 JxPJQf49iZPO3N53QH00fkwkDMW+zqLJaDHYb5mVukI7nH8VSC0DZXAvs/NuRrEwAk6QM
	 EHmO6uf6rqE5GuxapDRcknCJ5V6L2dXdoyOO3Dah3Cj8UiKx3VlSPK2R0jXU4k3lcrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=jEQoUDUHXfe47VJ+kLpzPaj5h2l+/kTai5BVTBPq2W4=;
	b=jsLTT1FowFYJ6IIRvFEx/dyG2Bi/yguh5dcQzwx0akIqyd3Y9I4aR65a8hFo8J2jmRSe
	 MMV1zeW9Yz1J5JJFBqNZCBaHXwPEnQMqGLrgt8Crn1Mu/wc0H1o2vr47ySUTVWVgOrDqU
	 WXScSQSDMZD6eNfXsfxPB+EKPm+k6xBnh3BeO1FcFM3/D+rucDxsCWh/ucPXigM4eIZeD
	 bONRYLf67CiH9ySHHZjlYdRM70HS7fAO2gGIvoiyAzlX84pF9UpnjRulOT51a+T4qobAc
	 XhmtdHgttWvFN319zK9P8qt9bonhaFz8UE+X5MPxIKKoeHNnmW4KhDddS9u51UuXIVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RFUT+IRS;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B88606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62B88606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RFUT+IRS
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc758830601so5554018a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738719; x=1796343519; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEQoUDUHXfe47VJ+kLpzPaj5h2l+/kTai5BVTBPq2W4=;
        b=RFUT+IRSg/juX6qTvxJ7Ac7jOoqAHJkDITQUBthK9OscfT8CSlOOyHthdGZKs/Wd5c
         MrQz3z4eQMDLCLkflKukQ9fynuNaE4beSAb7/QUHmLaaowidTgzHCHQoIZLSUa8MQ0A9
         Dw71Zhruay3Tb1PDcZKZnZB92oT7HWAq+hb1mu6Cv5ROrnaeQOz17uktFdkNS93qHJ+o
         5Z0LYHJWwdt5TAeLQGpg0cCQRwedLLZBs5gGZHYgN178OknMv5Jkd30BSN+GhPhTdF09
         33V9KEHM/6ixQkh4bcrp9MpvnJ5XtakDKt0rbZthbDt6tqP3WARno32UriQapTVjWAfy
         yh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738719; x=1796343519;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEQoUDUHXfe47VJ+kLpzPaj5h2l+/kTai5BVTBPq2W4=;
        b=nc1mJCcee+VhQeB57g+Nw0xLQj4GqbBHprVuilVNw0++kU0S4PxWJYvc8/8OKDFyI1
         3LrYpe9b7QcjWwP3ENkaSh/kIUAoPggcAixGiGo3GVEUPYrN81TYhJcJa2nDw5GJTSU7
         ZYQt422in8P2xZRUyT5WQpXFiZCVNfTzx9l8dM7E6JvscozDzjog1i92NUku590pw8wt
         PoGqykbKFD+Xc0zmzxroHdSylM+HtpuIJnuFl1r/iL3ERVS4ZH7jY53OTjth4JeCK0ar
         mcRpfD9nIkOiVDW5S67FKXvWoSmX4FW7n/qGEDy99sB2WgdeIvP1seIiUh7N2ARJFJJK
         b7vA==
X-Forwarded-Encrypted: i=1; AL+hErEaQcb4GChzVcuKDj+xrjCxytu3VeGrFdyW8tgBvxI/AbDUa7ok/y73bEMEf7VXdvOTN7n8rYPTg2ViB04=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XGUVRU20ILJhERy1NPID28vycb/a1skH4lGsyeQ9LNeJHNTld
	LEwFOnB2GQQFrNuArTDekMosaq7cZtlBMmXKNCltxhQBA39TPEO9HGlW
X-Gm-Gg: AZFdTZdOl+aQSfNRXOlt9sDNsQR6rMPZZMJdWTS8nxlHH/xvWJkQZ1BWvmY1/ZpGom6
	UCjIRIvosEkVyzQ2V3w2hGiH0/0tzxCbZ33BXR2kVTI9VAd7qvNi9niEQCsDm1piGko2Y/4gnrW
	nCuCWnZZPpAQpoE+dJ8/KlnDhrLw0nP0tDE4+63tnM9xqR6zD/OAKS4BjBvCA+gGHUikQZTa2q0
	oo8Uxzcm9w59TB/5NrDn5SGz8CRhtRVVEL4DDg0qqn8g+8TTzd26N1nxOvsneHiAVNEx8jbEqeo
	mhwRI/n7DXpO4bcv8C4LUumfrIRMsQTUlUqCvjHVhK5Ii/cicoYoz5hhRUF0LXTENdzZpq/Ndzm
	ZFLWu7hUlMZiBpMTHLvxlrlkh1T2JxOdrAFEFE1Hgfua3oUOM6Ns/yt+iilG97Q7K0LDjaneNwQ
	G49v7GMpkLnV1Xp8Xbpg79f0jgY2+p7enYLtxy+CEQ8El11RUbJ833Ba1ACM/6Z4Eb2PmbTzRyB
	Xpvxt0XO2PAplnW/ECsDhLuAINBqwnbDYU4jKGyI40lK5fqo+Se4Ov/OMzxOAf1sJsMPBaZQcU6
	lwpvBz4akqF9OVRyS2Kl2CpJoPyqTTpr/ZoDOWS7+fYStfnzhFiakFNP94nvxrb+65p9DnDhlEs
	IB3r3hix9zRo+jvorVU3mQya+CpzeFail8w==
X-Received: by 2002:a17:90a:e70c:b0:3ac:9df3:6b07 with SMTP id 98e67ed59e1d1-3b41c9234b2mr23726357a91.24.1795738718594;
        Thu, 26 Nov 2026 16:18:38 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b2156c2sm15510580a91.0.2026.11.26.16.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 16:18:38 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 00:18:37 +0000
Message-Id: <DN5K8Y9824AE.3GPOE0WP9ELFN@gmail.com>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups
 for user address faults under SMAP
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Andy Lutomirski" <luto@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, <bpf@vger.kernel.org>
Cc: "Puranjay Mohan" <puranjay@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Emil Tsalapatis" <emil@etsalapatis.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, <kkd@meta.com>,
 <kernel-team@meta.com>, "the arch/x86 maintainers" <x86@kernel.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>
In-Reply-To: <03275761-8de2-41be-92fd-8e3012a87eeb@app.fastmail.com>
References: <20261009024925.3169077-1-memxor@gmail.com> <20261009024925.3169077-2-memxor@gmail.com> <df69ab5d-bc97-4651-8668-a2b3e4bb272a@app.fastmail.com> <DN437OYZ5FGP.20VLV7ZEXQ5YY@gmail.com> <5f46d1c1-fdce-4f3b-9d56-675a822b2d65@app.fastmail.com> <DN4X9KVYMONH.VHKD1QED1BUQ@gmail.com> <03275761-8de2-41be-92fd-8e3012a87eeb@app.fastmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 26, 2026 at 09:30 AM Andy Lutomirski <luto@kernel.org> wrote:
> Okay.  So maybe there should be a nice patch set to *fix* it.

In a perfect world, yes, it would be nice to fix, but no one stumbled
on it since the probe_read_kernel appeared in 2009, so it's worth
fixing only if it doesn't kill tracing as a feature.
Kernel observability is a mandatory feature.
Looking at 3 options:

> 1. Walking a little list or table to validate the address (which may require some sort of synchronization and obviously needs to be NMI-safe -- for systems that use TLB-flush IPIs, blocking interrupts could probably do most of the hard work, and otherwise a little flag set while a read is in progress that can block the change of an address from safe to unsafe would do it.

walk and the synchronization makes it unusable due to NMI,
but we we can give uncached ioremap() a different range vs vmalloc()
then it might be practical with a single range check.

> 2. Allocate a PKS key for the purpose and use it.  (Only works on systems that have PKS.)

My research showed that the effort to get PKS into the kernel stalled years ago,
and it's intel only feature.

> 3. Use an entire mm for the purpose and treat it as a user access.  This is probably the cleanest solution but it will be slooooooooow.

You mean like use_temporary_mm() with direct cr3 writes ?
If every read needs mm switch that might expose intel HW bugs.
I remember div bug and I bet there are more lurking in the hw.
I'd rather not push the hw limits.

As a summary I don't see a practical improvement for probe_read_kernel.
Maybe there is an option 4 and 5.

The main point that it's orgonal to this patchset.

btw I'm planning to explore PKU for other bpf needs
if writes to PKRU register are fast enough.

