Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359223;
	b=Sb18pTwIk4HESJU0Me4qM+nHuhA3Bq4Huk1USGLkCxJKckVkUsmCQrdEfy+Cn8FzMkxQ
	 1CYntM6dYyOHp+HQ1GQOLyvan/7npXYLBQU1r57gDiojIt6BW82g83ffmFYxwZlFEOhf2
	 zM8r6JRHjGT3TVuYcTj2njT7XINIuWs2nysC/iC99xz273qrYingMlPjn6RJ5pHQ2Yzdq
	 BhAddjVyzePwo2JR3zYbxv26HUA0aG3CyBu8vudXdthmI2gpHoSBb3ji33qnCQk6/UEVR
	 dtP4B4d+Yb7n93sL6Ii3gqMxWWAhis9t4/yIyZABLAy0tQbwF0/45qQbbE9tPskFNhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=RMgj1FiPWOfcno2Rg3daraUU1yDv6jWsUnElDClVHG0=;
	b=Dj9PfnfW2gDDEvX3MxwPrQacshzbOxd8qkNVRC6F9BhrN+L3PYAs2wVDcz3TLdeRLDKN
	 fOepgsjlk8lAstXCasUEih4I4ZEPyBhuojDzNh8plKFSnrwC4R6EfRQoWnDRvV1x1dLut
	 Q67g02n23L6IGjH29HOnlzBy8sEFBH0gNIc0dFnZdd4ITOaFljbjFnB5eq7pRDEdPXdth
	 cMivXoFU4D2YFwR+ngXr9CXqjg813jB3FT0z0JCx+M+7Lr39rNOgadPGBxYHdcc/M6iEl
	 3kF4A5qSGh96aMLv2IzKRPfe86hG4rSo8uWfpt408CWZ0wnB5k/BijF6Mkq9TZs7YmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rB+Fu4J8;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F97606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F97606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rB+Fu4J8
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3b497279c25so39638a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795359222; x=1795964022; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RMgj1FiPWOfcno2Rg3daraUU1yDv6jWsUnElDClVHG0=;
        b=rB+Fu4J8PRCHdsRpQdHo3CD3HVntEncnLqumTBmdgp9V0ixAvzirDoaXw6nsGK/Sz2
         dx9kPJNY/9Ubx5IxzgdR36DPnCBSbgewi33uYn3ihJT2LD1kALU3hRP/IJKAB4X9EUrf
         IGNwACUVWwQ0YAEUESnCB+QG6LWn0B33+3K+Q+L5q3rEZB53NE9f9D7qI6DE6+LlPCME
         3nY14TLtlUW8EwFT9GxwGjuq+MnE8zXcgWGNHxlannh1OhNnHV+LWuhbUMSG6R4ScOJu
         xJ/JHsIKm4SpUrO7nzE6eAfa0ZJQNvcYNPg0r1buJIBc2NlhC5/n9qtpq9VdwzRqNy/0
         8jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359222; x=1795964022;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RMgj1FiPWOfcno2Rg3daraUU1yDv6jWsUnElDClVHG0=;
        b=ZaT36Nqqc/RHrAUv6su46ur+ZtEazDcpFIeDaSlYmJT3ytkAFkVVYxR5mT0SVxSikU
         OFnEU4nhgXIir8bYiUQtX1wxu8Zu6wjMSFfldYomB/KVuxN6ilg91m9JzNVyXVO82fmh
         ge9dI/ICTJD6F6UMDXDF8EC/+OKxkMXTk3Q7HgO0q1JtUiiR+NXwhhUfQT44p54AbgFZ
         fzu/YestmEytba8jvSzyeuZWyyFKXofvo2ARVlSARKx8qDobGKirgDtfqNioBtdfIkvb
         cKnLJYTb1UPBDPQ/wg2LbgkXaas/bumknZDLpLdEIV3gAkPaJLGBMjTb0gMall3HsUEA
         BW4g==
X-Forwarded-Encrypted: i=1; AL+hErFrKpmQ6tDQY7GXFd6m465P0U6MfzJJ6mg43ENm/441i56qMMOILng9YMUiyf+E6/PcnqTMIgj+CmsUq0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sD0PZVAWUtDrjvGId/7tvdsISwFxVLp6oVrZqA4cF5n/vtqmi
	yynrpL3p2iM0lrPU0KJrRvvKdPs6PaIp1Xorn6qUEobilawmSXBz9pF0
X-Gm-Gg: AZFdTZduWYN6W6s/xk6wFu5ewF48i/G+kUwFW0CF5mH1IS61s20VctI6XA0w5c+GG39
	JGDEGlW+iv7zX5vp/vG+FK/nzRTOYa5KFE6ooFCKUTEnQH1EHyXtp4mNQ3JwUU4SFmglHsQnYqr
	xIl+Jl89W+QinwZAYyQMZmdyRTLEYI7Ahcy1BurDWuju/7GDL7r1pMOayKf1UCzEcRgI6pUNOoV
	o1eAu2mq6rw+IcjShi2SUE3nWNZ9MX0y2BXBrcMeZOjPqa5AE4DCU/KzLi+qIJ//r71OPT4U6Cy
	Td1Bj8vEeJHWxASz1II3S5ClfjoAnV2Fj38LhyClK2JKa88k5N94bMlJhyb3wVZ9PkiXqqFIrM3
	BAMuaZCDK9nu4C7y5P1vjOaWRkEo5cOc1QJs31F7Bw1bca8RWUDpDQghNwkKgsvBdD+JJdHxkf0
	I9a6gbg0qmMD8FaZY5GZINHSQUs1Bi8uw0+86o9NhVfwwEYI2MTyBugM+KjkkNYrxm7fYfIpLOB
	oD/FibaHNbaJiF4fzVTP9JDlvV2XOVuqkcJlskqJylBU5SP1CMm5Po7G37ovYUeER+vjbUqkkms
	q4NXIueGtlNsWZYIwl8PzZuirs7brHtvqHLswwrVzEEyIJ/61WYaEeU5s7jSZASQVabJfjr2/fg
	50BoY+PkgRj0/ym/VlUQeWBjGZTbc2bNYjzpfNf4xMEvD5BSyuOm2cX4VJoJpf4KXbDit6/I=
X-Received: by 2002:a17:90b:3d4d:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b41c90329emr8542890a91.30.1795359222086;
        Sun, 22 Nov 2026 06:53:42 -0800 (PST)
Received: from [10.131.38.181] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b75f2a4sm4545959a91.2.2026.11.22.06.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:53:41 -0800 (PST)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/hmm: account for subpage offsets in device-private
 PMDs
From: Aveline Noir <jm5905938@gmail.com>
Date: Mon, 23 Nov 2026 01:45:21 +1100
Message-Id: <179535872126.34.4789080961796247940.b4-reply@b4>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: airlied@gmail.com, apopple@nvidia.com, balbirs@nvidia.com, 
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org, 
 jgg@nvidia.com, jgg@ziepe.ca, leon@kernel.org, leonro@nvidia.com, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Matthew Brost <matthew.brost@intel.com>, mm-commits@vger.kernel.org, 
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, 
 Patchwork <patchwork@emeril.freedesktop.org>, Shuah Khan <shuah@kernel.org>, 
 SeongJae Park <sj@kernel.org>, thomas.hellstrom@linux.intel.com, 
 Vlastimil Babka <vbabka@suse.cz>, ziy@nvidia.com
In-Reply-To: <20261122015246.d8b6b98ff5a8157168156339@linux-foundation.org>
References: <179342234355.4.16705453209886955762@gmail.com>
 <20261121160037.1a479f3c8b4e860bc23c106d@linux-foundation.org>
 <36be0904-168d-4813-82ff-27ecced464e3@redhat.com>
 <20261122015246.d8b6b98ff5a8157168156339@linux-foundation.org>
X-Mailer: b4 0.16.0

Hi Andrew,

On Sun, 22 Nov 2026 01:52:46 -0800 Andrew Morton wrote:

> Store the corresponding RAM backing page instead.

This avoids the oops on the first read through the second descriptor,
but leaves a stale backing page pointer after CPU faultback.

Since the mirror XArray entries don't take a page reference, they rely
on invalidation.  When the CPU later faults the page back to RAM,
dmirror_interval_invalidate() skips MMU_NOTIFY_MIGRATE for the same
mdevice, and dmirror_devmem_fault_alloc_and_copy() only clears the
migrating descriptor's entry before the backing folio is freed.  The
second descriptor still points to that freed backing page.

Reading the same page again through the second descriptor in QEMU
triggers a KASAN use-after-free in dmirror_do_read(), and the read
returns the stale data instead of what the CPU wrote.

The second descriptor's entry probably needs to be invalidated before
the backing page is freed, and it'd be nice to cover a second read
after faultback in the selftest too.

Thanks,
Aveline Noir
