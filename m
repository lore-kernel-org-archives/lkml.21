Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795635164;
	b=LvagOPoHwvi29TSgtziuS0O4jTChiOaJDy6Vk0GEpxJbRtsYusbI0cIUkXehC0dJ6+sp
	 GP3pjVnB0lhrKsKg9hhtyyMI8NBFaYEfLpzjwnXdsuSYCYQUvjJ05js125YOFKjNrASkf
	 636VAushLaOVFholIrB1i+ilduJQvqEMgPHme7pefr7irq3DsUBh6FSsVHB4AKCSHqLAS
	 UpFi+LBwJVwmBc0KEZU6UOmlUj3mNHTsDU579n4Sq5GdtJv2rb+54lh7nWHDrjJXIKNuD
	 I2CY5kgwEUoAo+NGTB4HhxZHAvseiifieSN+KvVFsAL+RuQbronGW2mQpm+ZvrrLxsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X9M4PV8SNdlzGSgquLvXH/wlU/lqxuN+YYGaruhCqiI=;
	b=jlwG6hxYwjuNoTQSVUkkyEkb4t1/eBOLxGTgrdTwd/qeY3YMBva4j5U1rcPtsc4WJYVs
	 ok3GaHhqLC07fgoH89onMuVjdA84tXvBU7QQOvBbjIObM4K03VkexcBOiQh64LVLkiLfA
	 E2XcgzZQvpIAyDZ2hgAp8SOZIckDW28kYIfIh0YVWv87vtkyva1pBNnV1PWJhfUvdBvAm
	 1ny4NsvRs20hjTF/FeTYVD2kQl3HzkEBolyC1Du6KmFLvZRZ8WA5vlaLNMwNIrTDaF9vk
	 ia1ZLKreYt80wqRJPO20SitSZ8r8kdVyzi8ctxwayg9Vfho7pb8dGrr+PbPfxf35BIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bGGc29Pk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E200606A337
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E200606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bGGc29Pk
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4aa5833c263so5954177f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795635163; cv=none;
        d=google.com; s=arc-20260327;
        b=LSyQIKQ0hRUBvOZBqdvnrBQJigwhQxx8q/EYdh/Aci/u+8uRvLaHFoBZkGLCcBDALa
         Er/V6Jo2KXiFuVm+6c3vF6AaEoOmE4wQ9/780+CLKB0ulLKIRiDf7w8wiU6Kfiq5As/r
         IvEKh+1G41PFFGBPp/Wp4OvK57CwV40R7TvocPbyehL8rm2Uwn2shYUg6irrbtGZGlko
         TV8Yeo2uyy8HTNcQvsZVtSZOWQI1+Zg8zV/sahBhZEdgnc5KYN8DY9LGpm59RUTj95U0
         5WREUmx2sUeUb3sRKSC8NuTKR7sWKPhtJAqVs6j3v9jwBrvGfXRk+PnKL3/MqGsyerjT
         Ax1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X9M4PV8SNdlzGSgquLvXH/wlU/lqxuN+YYGaruhCqiI=;
        fh=72X6CxiT/AF/b9rI/qLGmLa9T9n3/6dbxamrBAwaY0k=;
        b=rdsL+lOSuPVFe7jH81d5VruOuHPpDIo/mCxMmMCvlsGw3k+125PTOQr5J2HyleqvJI
         SPg7+7DQFLU7qt3IGw5IRTaQo8Myg4LlKDP1wB3F8b1wnPdXViB3GmPyeC1sOMPiRntx
         3ofBEbzkm+IMD5baqNYGaVFkeP2YHC7Xw+Pm3MkqJGGY0Ad8l74xLZ2mJ1g+STflfiVW
         IQniVY+aWoYe4A+ghJF5f7YjYbD9Zs7HFyinSw4WsW/7vu5d4p3h1Rm2B1f/0SxOfyeK
         AACW+WjyMPO6dm1cRiFSQTX89kTYTdlk/dD4ebuvBlnumHhA0sxBsOC49FXYk/gOKt/u
         W6fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795635163; x=1796239963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X9M4PV8SNdlzGSgquLvXH/wlU/lqxuN+YYGaruhCqiI=;
        b=bGGc29PkecU5bqRWEOkPd4+b4f8KEaLuIdujN4I50RP6BhsiSAPlpPTDbqrZt+H48Z
         mnZsDm44PVahA9C5cpsw4zAKuLSji/bOdsMFwAButV9RLV1Fqb5AbVWWaislnXeRjgQ1
         JaMwai1anktQmbljd1hNIsKg2DHy5BG4dNVPMptnvyXTpbWaEHDh7NyvbttSq6j7Y3eB
         5N9LbHUCfYlba9Q+EPcSMUTnCCqQWiCNwqRl3TZun1XTjutFJWbPkrzmLTiqGBB3LNCf
         9U27pVDGssOUyQFhBXdwpp1NS2qzp/O+Liz9x5iUXiN8KXHKnQb9QyoG2G+z/HAiffTq
         1fTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635163; x=1796239963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9M4PV8SNdlzGSgquLvXH/wlU/lqxuN+YYGaruhCqiI=;
        b=XRAbGv5vOCr2vzDfjdUkKwJKnWkrPUz/imUaLZgsSROGK8Re6yoHAGA44G8ZPSkPRR
         RR9XhqKDbrYe5QTKf4z5qZL7gFg/P/dwVbkckhW+xzuVyPQ/E/WPsegm7JTCEyn5ub/8
         zCBg3V4gqmrYuLqS3BygzfVhsTgwwQTJP3uSX5HeCBp58Sr3bxs+ToPn22OxcgBxBLf0
         idEWdUokY48VTRymIXKVDzgDuqVrRTIq1FDAFrSrTIjuFhYV1MeQErJ0Lwp3Dzb7OC03
         Gu61yP9UCMza4O8pC9aDHJXy/v9bZPYiAH0f7Cr3IgLRgRZM79qRURxtP8xURl4/tGo+
         AYnw==
X-Forwarded-Encrypted: i=1; AL+hErGxYbC1ayOLVX9HKkSKojxOSUljEYWuUl+/+/3oSg88a5Apa81qnCy19FOaoZQyt9aD2zeUJeGMo8othfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UvlK0zYS/fCF8jbBOyjJNLR7HMGj06+pIgMCYqduDl+IAoeBR
	V3dR88PIZdQlthtJLK6/ZsdAINkyu2HLPA7I4/+4a9mChZ+vMcELNLfhPcHPGdnDc5CA7gxwfP3
	9qKCbp2qTFJ9pz3rlN9xoly2s1qRKabcy14G5agSD
X-Gm-Gg: AZFdTZfN5XJ2MIbH5bi4heCZjBkc4ysr3phGguZarJ0O9yZzGtHHtjbBoPJDVRM9qWz
	4M7dlq0yXgnZ4ywBL4lDljuv0J8bClxwU62k+dStzF7Eg7pEz1zdZs1mnY1E45TV90WVIWpHY0j
	IU4Q6AoMfPVlgJiY5EDj0D37/URBpewHz/5QUnlLJO1KCIrbLyeO+bBvcB27rRmt3yajc1LPBTp
	a50G9ycNe6MXGzFwf39J+T5VL3V3VWCsx96J9rjvkCeQ3VM+iW5Pw/BSdlp3A8LoKQc0BDBz7tw
	MQXCcRuJxvnR99GKuiM+Nt1cLs/RllOeqSM1gdh64+iHKso5V2Zy63zjjgYQ3dJmFeEy40SOfTa
	EIejL83iRZ5u5SV6pf/HuLJiEfp8hZ/C3GvRWizNsHtWcAlhDct2kkpMby4GEbeohHVv18082hk
	GDBHLyPHkL1QWHJN+Z7/j8enfx29rdY0b/Wq/33YvVEEspLgS88WsSEd+NzBNkyOWiLq9vjixTu
	M6VefzoapO8Hp41HNqDBG3SaXnDW9D6lCckBA==
X-Received: by 2002:a5d:6f06:0:b0:4a6:8d5b:7338 with SMTP id
 ffacd0b85a97d-4abb3a4d35fmr38121765f8f.37.1795635162216; Wed, 25 Nov 2026
 11:32:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-topology-wunsequenced-v3-1-efa3db7e0bf8@kernel.org> <20261125094643.GY2668804@noisy.programming.kicks-ass.net>
In-Reply-To: <20261125094643.GY2668804@noisy.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Nov 2026 11:32:31 -0800
X-Gm-Features: Aa3M54rVQ8eJKNwIoeqgCfcnaPCAwUQ4sJvYenMtBURouDlRSqpiVSf8nOBT24w
Message-ID: <CAKwvOdmyGdn4ES6Ku+Yovd7a5imzmtmYtd7KB=OMCqKpv1X8rg@mail.gmail.com>
Subject: Re: [PATCH v3] sched/topology: Avoid unsequenced accesses to jiffies
 in sd_init()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:46=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Nov 25, 2026 at 12:23:35AM -0700, Nathan Chancellor wrote:
> > Clang's warning is ultimately pointing out that jiffies may have two
> > separate values in this initializer because it is volatile and accessed
> > twice and the order of these accesses is not specified. This could
> > result in unexpected or inconsistent behavior depending on the code
> > author's intent and whether they realized the variable was volatile or
> > not.
> >
> > As two separate accesses is not necessary here, add a local variable to
> > hold the value of jiffies before the designated initializer so that a
> > consistent value is used for initializing both members, clearing up the
> > warning.
>
> None of this tells me why we should not just disable that warning and
> get on with life.

Nathan has provided you 3 different ways to do so. (Could also do ugly
pragma's around this code; disable it for this entire source file via
-Wno-unsequenced-volatile in the Makefile, and finally this diagnostic
was forked into a group; it's now -Wunsequenced-volatile under the
-Wunsequenced group, that could go in W=3D1).  Pick one?

I think the warning has value generally across the tree, even if this
particular single instance "isn't a bug, per se."
--=20
Thanks,
~Nick Desaulniers
