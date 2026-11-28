Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834784;
	b=VaEf3/AQLecgYGCWj5ujlQcEkVJKNl1AQS5C0DWV4pc0hN5+XkNqQwz6S2lC2qONAwKS
	 c9yrFKFXFyzs3UdRF+rpq5Mz6tIwwlueJDiYx+ox9iHMXFsvWg5lR8//1j0iDSzeB70wz
	 uAxrxHeSj0cyUT1mWadb28dHfyBebG6g0niod1pctnPqUeeGbUN8twBMBbYRDrAslVMKe
	 hWLwT7adS1k5WeWXhiineI+tkO78U3h7s11M3X461PtZCeyG+q53vpID9USe3a1jCq/h/
	 ykDE4kQ/S5HukbYiS64i9jHwxoJGEjDJJl4vASkOH/ilQsHRhBt3fSuZbEVDiG/BmIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=B3XjVPGi1d0sqXZUZmpjBaglDj36IEF4UV/CSJOQiR8=;
	b=jJKeeq95cikAF8jK3m+GWlyezw1TlUXS0Mgurm3WINYYyI4WXX9ix34cJz4en/XE06S/
	 Kg3XAGTglanNiHlEPw7zppkNf57Ngh8/pDqi9XfUtlmJkxp365Elzl2UwF0FQQJJz4VGB
	 o/FRCLm40FgClHrqhmmvKu21Oew14EvGylxV844DBWX/HiSU2CrEBRSDYThfzs+BpuA5K
	 gpkss94Vz17TLsXbRXjDm6CSBB5sqDCFOug7JZNdnmZ17OR3/cXatC8PVkFxZawmxftzp
	 C0k3VlXNVeivMOQA7b8TvOI6Nt1Zu6ir4ZmI6li+CQ+WmazVP1frqolGsUFieTorCaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=Cr+VyVUk;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9ED606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E9ED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=Cr+VyVUk
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f04b676219so47432015ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795834783; x=1796439583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3XjVPGi1d0sqXZUZmpjBaglDj36IEF4UV/CSJOQiR8=;
        b=Cr+VyVUkagr1zC+gj5lZErmLf5XArrUd08mF03ewcdXumJg3FG/J3dkMjgpAfjlg8/
         3KE25aEOk5gv9uxUi4bpZo1KB+2kEVWAz+23FciQrixoY8x18qeFKoTdfJIzetF7C6kV
         Yi0nJtts5yHZq5hI0jwIukVwgNUGYfsnzcUjhylbfvXNFaI/j9T13XT4s+5qy8rEevUa
         2Ck8qHh153GiblCyCIbtT6QWX/ZB+qloRCDFDz+Btqn1Lq5kEwZI9UGB2xolxq8BDHZr
         2l0FBrf9UYweVAjxGgfRwljBo8WK/6+Vfu1y0IgzLdLkdJIcCfKsJrzUUq3IIwaAkUEG
         4iGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834783; x=1796439583;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3XjVPGi1d0sqXZUZmpjBaglDj36IEF4UV/CSJOQiR8=;
        b=KDkwwjQsi0qls4blqtBLgZEJUog2PMV0us6XBV9eD8P+yC9f2bxJgSEjD2zHsIN5Na
         wmWxrO6PMZAKHtK56ODGOAnk+7UnA6jtIAt6G5ggz7vMzdr15ElF4g5gfYahSN8KxvXj
         F5NI3zh2Q+MwzJ3Bmp0szK33cY8DWa1Y/Pq0t22X86NnU3C8eI5qEOhNhGrl5iEgYiv1
         ZTDgOoVSNmeowyKNvgFW7Xjr3fT7UEyDMB6nP+lBAj5Cq923MyEmuJIIp5ttTQtomk/g
         lZJdTIQ+HzlCR/997kYSdRokG1A+XY95XRs9v7Fsi6PU2EPL9+yHKcsmhGgM4Fk5Eq5L
         eLbQ==
X-Forwarded-Encrypted: i=1; AL+hErHym4NlrYom6hMdr+CsjSJkUCcMSuOLhWblSDpmmn8LfwAWLiDB6Jb4sTSZuKWNTr5VIoy/DaFvV6dAk4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z871oxv+G1yOoqSHdVgIJIfyPnj1haqFGdZx9OIXOPpysk0SBcZ
	Jj1G/JpGiZXJ4RBJVJuED2ICqF2MC+KaFHGD0yPZW6JCoMJ8ZQy1AxrHFSB3uz8pU6I=
X-Gm-Gg: AZFdTZe3uVJ0I6pDOviypxpbeM2iTBxts6W75kIfVHYww0Lwe/6QgUl+VjxEpwz+UHJ
	X1W9md9CHAgy4XBc/p/wCgKg21q6KHvgp9BnkzxqOeNIrY+okM7R5HdY7XYq4thFuj9YQnCVf1E
	j8rZKztMvtdpaNvwWbeU5SdCoKJi0z7Xz2fTGTbU/BOOk2Tu9vBDF39sMbHUChxCWHb57LopYTr
	mrRZRhbVEeeGsgZvWyuqLawY7ooB0CSTmeCri0UGGpqStu2IjbpKW7OqfFneqdv4wdsW5ORlsnv
	nuolb49YqVT/ENOMn2bLbqBHNwG+lTg3y146zPmy66ES3iHohOP4HFbK5M9ri7/vTY/S589XBoF
	hDvjDxCd8bp9pg6MtKAV43wnG25uV0WzRXjSI8rvetppUk5/pahABVco/1H3zcJQIimJ6aO2bxe
	jzn+kCqB+qaYrsVQKFd4CgTIN8GcTBbrAZCK99d99eic1BvTWxLAcXSWy50QtnW5fijm0PFpQ0m
	KX0GQvx6rMm8xYVocW8yeYZEKyZRlJkKdl/eJ1iZLsAn1hzbFfHsbxkdtq2/VqY8O86Ry1eS7Ca
	Ew0g2ItKfvPNlA9tMFG/b1UsPYvSuk4BdZf41HWht0Nsz7Nd5N7P8xQo2F2ItfAAvePG+k0cUH3
	8lY407gvwkqkv+CvwbniFaIfu5JLTgTLmxVR9lhqJmf4pjy+XSuyB9sddCb51oA98LVFhdg==
X-Received: by 2002:a17:903:1c9:b0:2ef:fcd8:df75 with SMTP id d9443c01a7336-2f03f18847fmr296857175ad.36.1795834782691;
        Fri, 27 Nov 2026 18:59:42 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0d537a522sm57771515ad.47.2026.11.27.18.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:59:42 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, 
 Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linux.dev, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261126145257.592085-1-christoph.boehmwalder@linbit.com>
References: <20261126145257.592085-1-christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH 0/4] drbd: assorted fixes for discard limits, bitmap IO
 and resize
Message-Id: <179583478160.90611.15435460552982220308.b4-ty@b4>
Date: Fri, 27 Nov 2026 19:59:41 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Thu, 26 Nov 2026 15:52:53 +0100, Christoph Böhmwalder wrote:
> a few DRBD fixes for for-7.5/block:
> 
> - Assume a capable peer for the discard limit before the first handshake,
>   so devices stacked on top of DRBD don't latch the 4 MiB limit.
> - Fix a lost bitmap-work wakeup on weakly ordered CPUs (seen on aarch64)
>   that froze application IO until the connection timed out.
> - Two resize fixes: don't silently truncate the device after rejecting a
>   too small peer, and refuse implicit shrinks on resize unless an explicit
>   size is given.
> 
> [...]

Applied, thanks!

[1/4] drbd: assume a capable peer for the discard limit before the handshake
      commit: 69fdea8a039d6078609e0aaa7efafed4b34c7251
[2/4] drbd: fix lost bitmap-work wakeup on weakly ordered CPUs
      commit: f2d3c2a06548aed8def25c16e772ace4774a3896
[3/4] drbd: resize: do not silently "truncate" the effective size
      commit: cc547179b6fdb93dac3cb8813b57460cdecef9e2
[4/4] drbd: refuse to shrink on resize unless an explicit size is requested
      commit: 86226accf58873f70163e34820423ced87a8d980

Best regards,
-- 
Jens Axboe



