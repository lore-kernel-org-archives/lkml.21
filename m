Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696839;
	b=Eug1oRn0na5jAf69oauwp54t2ChyoQqaujDmwrqIOZ+66xjavbRhdIl01PBNrMHCK8xP
	 hpnfTDOsWNF7ndPu5W/7g4CM+BWOQKBF0pHS1UonpVX7cckhEXl3eyT1phjDOCvuHO/4c
	 gc/tqiZtxOeeo9STa/P1ydEBdKniG2pOG8w++X7Mgeh1yCybfUi71RwqxeDf9WoVKLSU8
	 +EkiTbHU5qtYpiPlETHk43jxCLq5qA9iIUITit7z+vYs85pkxMcLb4thHFUl7j1VNED5m
	 TtLkTydIqjGrDk8uiPHqEg4R3LSiA8/xATn8ZvuPDvlziR2dbj5ojzKK+JhHgV4j1dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696839;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=nftPNhHACaAjmrWyLnFiFxg6dPd//Ubc6ntdo0W25Vs=;
	b=HD04+8vH7YK7HYNbK2uR/Lu4U8TTcw9H4Cv/mk24RD0iWwFDn4zmsGzFYw7qaKMiC4l2
	 1zU2IC+ImLk+GdCSX5qcyec5ksK1Wh0DIsGu4fuKVlYLsKdFDnABYlFGwAZ3pdo2zqv0/
	 zfSe4/Thh9MKvoNk+cl+M8JHWzANT2nFiOXR67BeIIZXuZfWuFUwHf3wEjbN+8Sr//QNi
	 ghjoZfH39ulvsSJkO8wcPAndSdEwm9hbOgEp/dbfiGeMSq9TnKWZ+ikt3sQZKd9kS0ug9
	 DetaC59e0fIOGhKN2HgKJnKPehrT/mf85Mb7I/qTMKJQxzlGIuAGgOb8onw2jiu5qww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T3K91SGr;
	arc=none smtp.remote-ip=95.215.58.121
Received: from mta1.migadu.com (out-121.mta1.migadu.com [95.215.58.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8B6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A8B6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T3K91SGr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3S+tkRDlt8mmbrhI28toVD30bvDmGMUv8PKIjZ3+uC8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795696836; v=1; x=1796301636;
 b=T3K91SGr9uPQ6tsLbShoCNZimVFwrcxDMb6T7D992o7GM4DnUcS04pOO/PQ7S6R00GfCEoGr
 UvW0EpRyGCuB/QiN2BaZ/v1SreU7D/st6BqQ1OMO3+pb5DT1Kl+9Ze1hl1Di682mJIHEfY0PR1p
 1L5zq2ir7jLZOYS24/LfVjhM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5a2bb7ccb1a9379c;
	Thu, 26 Nov 2026 12:40:35 +0000
X-Mizu-Trace-ID: 5a2bb7ccb1a9379c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so36944e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:40:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGMZlQrYfytBz5vL/ccZvcmuQt4yVi2B43g9NcVT2LeU5z/N1Ed/lVsJqA2aSxdTlIlxRuYiZMgdTFjUtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Yu/mVsa11nUqiFlHiHjj21I9wL4SL5ttzRLs0JAgKk3U+bunl
	fLyFc0o166srpx2It5XiynNCxizmbm5thTlDxglWlJJ94waanKqzMvqaE9uewYnXcM1b/B8/b8J
	rj76YkoIIfOlsFPYoZkB+5mdb5e30Te16ueVhtvbm
X-Received: by 2002:a05:6512:3983:b0:5c1:ac33:5a4a with SMTP id
 2adb3069b0e04-5c21a27a14emr850306e87.14.1795696834316; Thu, 26 Nov 2026
 04:40:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126100023.1286902-1-fuad.tabba@linux.dev> <06effdad-0a76-4d73-9542-cb628a40d887@arm.com>
In-Reply-To: <06effdad-0a76-4d73-9542-cb628a40d887@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 26 Nov 2026 12:39:58 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwVzRPi-cxH4jbvpm2P5x9B2kvBUeuWyX__i9nHZpPmew@mail.gmail.com>
X-Gm-Features: Aa3M54rSvorHaYPxJpGhhECQu83ycbJnsMQoQINlgHkxCOdeEgWdWCtjoCL7aJ8
Message-ID: <CA+EHjTwVzRPi-cxH4jbvpm2P5x9B2kvBUeuWyX__i9nHZpPmew@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: gic-v5: Reject an ID_BITS too large for a
 linear IST
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sascha,

On Thu, 26 Nov 2026 at 12:28, Sascha Bischoff <sascha.bischoff@arm.com> wrote:
[...]
> > Reject an ID_BITS for which a linear IST would be larger than
> > KMALLOC_MAX_SIZE. This applies even for a Linux guest, which
> > configures a much smaller IST. Userspace writes to IRS_IDR2 are new
> > in this cycle, so no release has them.
>
> Thanks for catching and fixing this issue. I agree that we shouldn't
> allow this to happen, and what you have here is a defensive check.
> However, I was surprised that this was reachable in the first place, and
> now see the mistake I'd made.
>
> In general, we limit GICv5-based VMs to 16-bits of ID space in both the
> CPUIF (see vgic_v5_reset()) and in the emulated IRS (see
> kvm_vgic_v5_irs_init()). The userspace write path fails to enforce that
> limit, however, and only checks the hardware capabilities. I see no
> reason to allow a vIRS that supports more ID bits than the CPUIF.
>
> Maybe something along the lines of the following in
> vgic_v5_mmio_uaccess_write_irs()?
>
> /* We limit the CPU interface to 16 ID bits, so match that here. */
> if (FIELD_GET(GICV5_IRS_IDR2_ID_BITS, val) > 16)
>          return -EINVAL;
>
> Are you happy to add this (or similar) to your patch, or would you
> prefer me to fix that up separately?

I think that this is the better fix. I'll respin with that.

Thanks!
/fuad
