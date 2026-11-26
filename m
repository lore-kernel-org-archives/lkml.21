Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693592;
	b=UmM0tnCbzLgxei8RIMR475KCXMr7NQLy8FwXKirc/QJL2a5laVKXH1C7ca+EfVsIhkpq
	 7vHmrUo4STBTasetJkG5WhmMrOS4BlvYF0rCzu9Z7BPEskl9kXZHgFQOITKnGSPwYnNqk
	 AFfLGXanqG1/7L24XKYCR7DbfHnTNXh7Nd+HKkhQM3L+Gc6CUg3dwo4kQygivsN3/UeGu
	 nW+kQCAmv/YATnNwG4UuVxs19NVOfOk8/1JfGtR73Uhuodw/MKB/zPzkycYGpBL4KSNzL
	 MOR/RfA8AC05geid5Dk+ct/PW5Gm8bvMt6JKct0hx+gRm/nO5uIaxkGPB2B+jeOcdbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=vNP4LZsdFDfrrAnV6NklCZy4ZTC8v1aga8ARBfEVIKw=;
	b=XI4UBxVvnxW2f0zaBTEqqqGv+dXr48aBRHJ9+QhIF0RmjwAeGNkAQN/ZWldW5ZMswZ5J
	 uEDmX64mmZGbFYxDJBblrb6wXnL2VCatJojzFmulvceOXdHoRKFlxwl0uEpCtmchRK9xw
	 K2iPcQy6KR+p0JjzT/QCFogkSPdSdina6XSO0ucUgcA2V3mPO1VURTUeC6qjmkJL52Khh
	 0ZDD6uhzT8PLWyEmbA2eewymjqISx5BhkeDurut9GVBRd6NhGcl1XjL0T3TDPoZs/NMqx
	 P881OYnV7e8jKBrKa9kBEFg2QtKXNqywvSR2lvNgvpJzRgc7tKmE98bc+bsVGk+PWHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="w/apMCM2";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F50606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F50606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w/apMCM2
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso37294275e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795693591; x=1796298391; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vNP4LZsdFDfrrAnV6NklCZy4ZTC8v1aga8ARBfEVIKw=;
        b=w/apMCM2BKtRZIAnFXPplJXO3WuHV9vHFb0Ab/X8i7drFiRMTMJovbNQaIykr7/AJ7
         omH0oWhha62S6qLmToBq8KrmDiQzqtsdZJ2DUS8ecIkDdk2d8XfqNjMl81HSrUkeVMXj
         Qc4gvNHXg24reiEygkt0QfapGb7LaQMC1J//XGyHGApGDamtMujdDsHfa6ile8JSwUHa
         keLAPFKH5CfTejtScBeyqB9hfJYFa6AuuKi9dJrdKmXW/+isML+RJl/PV4q9BmU/9RoI
         KaNAiNBkyfL4PMdmILOfLVztTpfDsPcNNd5b/GRLQQOgxddvgXeqjNUMz6g7zTO4mdh0
         sEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693591; x=1796298391;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNP4LZsdFDfrrAnV6NklCZy4ZTC8v1aga8ARBfEVIKw=;
        b=pFIPtzD4lGcV9xuu8dU0UOYitQB/c3DQk7U4gJ78Z3rPGw80sJ9Fp1iYLWLUyX2nJ4
         0IDdeF/f/9t7nebKX/FJud7LITsPRuAX0AVcb1BeRh+MhbhN2dqrSC64VAFwP8/K0g8F
         4yI/QpSzHLXN76sXwwDNpWnLmH7T+zmDsKFHRmy3aBcnL6oj65YwDXSPhDxjZCi3jRL2
         bWI1kY4ppHy+VbKsq4qojdc1y/bShCBrmNHmBiJtE9+3yEwimQqErdAO5NdMUE6pP5te
         htauxEw4s+0dkI3s/QFF6yzFZKOSvgpjdBcFP4qVa7y3TdWFJgxG+3qYSnzaI+gvNo3v
         gF4A==
X-Gm-Message-State: APuU4Z9JVOKWh+6LqulJgNc3TK4ZpBpJb1CmIMQxBpmttrzUxrjbHXt7
	R5bG5uhDFubFyxN3538iJJo1inyj4Le2z/7Icqp+q8nWXN/9ReJeaBg1NYppwuGmWVA=
X-Gm-Gg: AZFdTZcfOufh5ayzwSvK/JhrQ/G7xl4GoZg+aNDGQPjvHYkSMay2CbSqVRqt+pcVXMS
	ILVxdnSTVD4qObGuGtA16FMku2Q3HunWuEbPl2lXPouyazBQf5F5+5jjoSheVtev5x0W8FtyJwh
	dqam+vT0hWbVuCe3DY5+XwxlQkfXP2h9Bzu3yASb+DjOzPmUT+55lqkJBxL1NZOoDuEePbASmkv
	kXZWUDo/8YwVdqPmYbyFvY8CAcy90h7NfY2LUZgSi2MSQT2ikq+xUIGVpDufBiv/PzUUB5VuHaB
	7rNt/hCkS/FO1zd9uWaYYT48l43P6e4vtsca1hQLVou5N4GT0m7ADmTc8oGiUVzJVp/Byrd5p4h
	YxVvtt3zIRsYWewB4rGM26FnWaz7PW0mz+0vp0JoaEg3gSAVRqJnm34N/jUALfd053bbj1pg3Um
	ymeCz+7sKACDHF6LNY+EMB4TaWNk8Hjmxi+p7VA18u3dCBg8XqymDu1iWgQp2bCTWLIPhOZF8er
	aHDMggAZDtzHdcOkOECUWFxRvmkAUhqgcID6fi2c/a4bzqKaO2cH6uQTBnkfetES9iN24j9vPkl
	JjI9q5A6aKN4nqTVlAlAeLIjpkveCU6oymiq1iEgCVyFx3BI2s7xdOo=
X-Received: by 2002:a05:600c:a087:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb887fe887mr420312015e9.8.1795693590384;
        Thu, 26 Nov 2026 03:46:30 -0800 (PST)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bbab390cf5sm75579325e9.7.2026.11.26.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:46:30 -0800 (PST)
Message-ID: <f8cc38f1e2b6f4ca5d8f504b100c41d11fc25f76.camel@linaro.org>
Subject: Re: [PATCH] sched/topology: don't claim sched_domain_shared twice
 on the same domain
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Breno Leitao <leitao@debian.org>, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot	 <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>,  Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>,
 kernel-team@android.com
Date: Thu, 26 Nov 2026 11:46:46 +0000
In-Reply-To: <20260810-b4-sched_shared_leak-v1-1-3eacd249d0a3@debian.org>
References: <20260810-b4-sched_shared_leak-v1-1-3eacd249d0a3@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Breno,

On Mon, 2026-08-10 at 04:46 -0700, Breno Leitao wrote:
> build_sched_domains() lets the asymmetric capacity path claim a
> sched_domain_shared object on the lowest SD_ASYM_CPUCAPACITY_FULL
> ancestor, and then unconditionally claims one for the topmost
> SD_SHARE_LLC domain. When those are the same sched_domain - a system
> whose single LLC spans CPUs of differing capacity, for example an arm64
> machine with one MC domain covering every CPU - init_sched_domain_shared(=
)
> runs twice on that domain. The second call overwrites sd->shared without
> dropping the reference the first call took, so the asym blob ends up with
> a refcount equal to the CPU count and nothing pointing at it.
> claim_allocations() sees the non-zero refcount and clears the per-CPU
> slot, so __sds_free() does not reclaim it either, and the object leaks.
>=20
> kmemleak reports one 32-byte object per build_sched_domains() call:
>=20
> =C2=A0 unreferenced object 0xffff0000c02432a0 (size 32):
> =C2=A0=C2=A0=C2=A0 comm "swapper/0", pid 1, jiffies 4294667436
> =C2=A0=C2=A0=C2=A0 hex dump (first 32 bytes):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 08 00 00 00 08 00 00 00 00 00 00 00 20 00 =
00 00=C2=A0 ............ ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00=C2=A0 ................
> =C2=A0=C2=A0=C2=A0 backtrace (crc f4478cb7):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kmemleak_alloc+0x44/0xd8
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __kmalloc_cache_node_noprof+0x344/0x5d0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_sched_domains+0x2f8/0x2110
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_init_domains+0xec/0x160
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_init_smp+0x48/0x108
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel_init_freeable+0x1cc/0x2b8

This is still an issue with next-20261123 - I hit this exact kmemleak
report on Pixel 10 Pro (Google Tensor G5 / arm64, 8 asymmetric CPUs
sharing a single LLC), both on boot and on every CPU hotplug rebuild,
and verified that your patch eliminates it (0 leaks after boot and
hotplug rebuilds).

> ref and nr_busy_cpus are both the online CPU count and alloc_flags is
> 0x20, SD_ASYM_CPUCAPACITY, identifying it as the blob the asym path
> claimed.
>=20
> Only claim a shared object for the LLC domain when the domain does not
> already have one. sd_init() zero initialises sd->shared for every domain
> it builds, so a non-NULL sd->shared here means the asym path already
> claimed this very domain. Cache aware scheduling still finds a shared
> object on sd_llc, the same one, covering the same span.
>=20
> Reproduced under QEMU/virtme-ng on arm64 with two capacity tiers
> (capacity-dmips-mhz 0x400 on cpu0-3 and 0x200 on cpu4-7), where the MC
> domain spans all CPUs and carries both SD_SHARE_LLC and
> SD_ASYM_CPUCAPACITY_FULL. Leaked sched_domain_shared objects reported by
> kmemleak, with a kmemleak-test module loaded as a positive control:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 before=C2=A0=C2=A0 after
> =C2=A0=C2=A0=C2=A0 after boot=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0 after 12 rebuilds via CPU hotplug=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
>=20
> That is exactly one leak per build_sched_domains(), and none once the
> domain is only claimed once.
>=20
> Fixes: 9e005ed21152 ("sched/topology: Allow multiple domains to claim sch=
ed_domain_shared")
> Signed-off-by: Breno Leitao <leitao@debian.org>

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org
