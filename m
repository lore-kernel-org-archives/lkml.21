Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768036;
	b=IBg5EviImGNxqC+mwDZNNX0WIgGxKqxE/DjNxgbtyCvEOFpEG12O2a0DIykm0rnQoEMe
	 brOfZz2YHwxgNPqp4Lq/jcmhE4HxclisJSZixs/jUrdFnyk+eVR4bRDjKwtmrdifSzkFp
	 k59SS9B/k3eze6dazAByphIwyBYHPh69fWrHFBiOSBj9/KxNFoBqWg4DIX1cHk/t/vrOd
	 1vMDvdOZ2FEJ0Tkfd2ueoBvhyhVJXEEau374ahibSnuwghoRu2M5+zpFgLKMzqkcqp4gH
	 5kTQ3OGIkxp+g2YNPVD6JIYS9S+1VI3Bk7427TsnRA/5e+/8uLhz8ZRtVjTkI15rNfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768036;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=0qdXfgFbrt8cELQOGisVmBrQ50jtAJGNxPG8ew5/7vY=;
	b=M9tm+5V6mTr4I5H4UTEiq4QORk4q0sJEtI9QXzmwjSk62Q04Jy+EWRHlW5CQsZKJSG2Q
	 4axiq+vS9N3TFl9LN1Mnp0AGOJDqkNR2eYzAm+L5IZZFbHnfSQ5phHXoOHKdHiqBn5e2v
	 Kfr/AxT7LX2DIpEn/y7gqRac/Q4VsxjTk8g6Pl6otewR0Tg+eEjc4oE6qRS8aY4vBg9Er
	 MAGf3boD6Y2TPt3WVvkDowwVqeogalVANQENQyG3CpVwAr9Nc7xSF/qPkFV9oO060tvU8
	 Nt6B11QmBYd4cX+guOV0pEL3GH/lZ86klTCLrlu5oiQwZPnSQLBdiaQbqSe3/zg/fJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JFc4cP7j;
	arc=none smtp.remote-ip=95.215.58.121
Received: from mta1.migadu.com (out-121.mta1.migadu.com [95.215.58.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1036D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1036D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JFc4cP7j
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P7zTh4ysMCYZDF5Ib3q0oR+g3D93VzbkeVMGD4akERA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795768033; v=1; x=1796372833;
 b=JFc4cP7jslkxQxCuhwTcRBbebMpUhUtNpG78hXZW0r4J5O96mQMKupB/btDzuXoPHDT5oFhk
 VmaXRvBF4EFEHeDML0N10AGnqP0ltb14x5+XZi8fp6zNW9TiKXog5NZdRsKRNULHibSEujOYw10
 dWgoOWQgNonlMs3VavxVIao8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 91d9130bbee715c5;
	Fri, 27 Nov 2026 08:27:13 +0000
X-Mizu-Trace-ID: 91d9130bbee715c5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so53324e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:27:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFPlp2xCxuJAvuXfi+AMTg8uDkAFg1uVXPCcJTEFTC8I7vdA+z3QOF0gvXw9d+YYb34O9m2ntHMZmrQtmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gyP/ZqbIviK+neMoxmcZYUlXDZ7cnAIU8QKbfsfmBQHiNO1JR
	LANZoRp8n0W8X6/RJs1oXURmYllQXxmKHcnHDin9dLuQVRQ/+uk8YJDo886Yzp4FA1MJ3u8jfBY
	0p0AnZQKIKfd/5AirfTQVwZQasektpXotSczXjW7h
X-Received: by 2002:a05:6512:3041:b0:5c0:7c6e:4559 with SMTP id
 2adb3069b0e04-5c21a2490b8mr800282e87.9.1795768028694; Fri, 27 Nov 2026
 00:27:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009072147.474952-1-fuad.tabba@linux.dev> <awV15Rv-caDclC9K@arm.com>
In-Reply-To: <awV15Rv-caDclC9K@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 27 Nov 2026 08:26:32 +0000
X-Gmail-Original-Message-ID: <CA+EHjTw_T_HhfNUytcqf6xefkOoOHgpFq3=J7bgsZSMyu1ON-A@mail.gmail.com>
X-Gm-Features: Aa3M54qBZ_c98t9Ayo9A6TeJjo0TeideV9tW7aQLWPW5qkPop4MRVlx3am7GbX8
Message-ID: <CA+EHjTw_T_HhfNUytcqf6xefkOoOHgpFq3=J7bgsZSMyu1ON-A@mail.gmail.com>
Subject: Re: [PATCH] arm64: Use symbolic constants for the ccmp NZCV immediates
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	anshuman.khandual@arm.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 11:32, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Fri, Oct 09, 2026 at 08:21:47AM +0100, Fuad Tabba wrote:
> > diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> > index f7dc5fb9427d6..15c381ef7d2c2 100644
> > --- a/arch/arm64/include/asm/ptrace.h
> > +++ b/arch/arm64/include/asm/ptrace.h
> > @@ -30,6 +30,10 @@
> >  #define PSR_MODE_THREAD_BIT  (1 << 0)
> >  #define PSR_IL_BIT           (1 << 20)
> >
> > +/* CCMP NZCV immediates that make the named condition hold */
> > +#define CCMP_NZCV_EQ         (PSR_Z_BIT >> 28)
> > +#define CCMP_NZCV_LT         (PSR_N_BIT >> 28)
> > +
> >  /* AArch32-specific ptrace requests */
> >  #define COMPAT_PTRACE_GETREGS                12
> >  #define COMPAT_PTRACE_SETREGS                13
>
> One nit: I'd place the definitions above (or below) the
> ARM64_S390_COMMON block, the generated s390 header shouldn't need them.
> Otherwise it greatly improves clarity.
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks, I'll respin it as you suggest.

Cheers,
/fuad
