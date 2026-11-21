Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795235730;
	b=TmDUO/cRb5JIVie8S0kS9dfNZBppmBVuj3koItcZJKs7/LZ4Xs/4nCcD8dddwvu37VXZ
	 dDl8hkjFpBdHTIzur7T3nsC15dtJEGUPZYOl8YCT9pI3ohQq1BkSP7rKUYneIr6cHXdlb
	 Fu3PKgrrihWtTsNST7kqhVWmQ8XQodP0oliae7mi0WGh38/arJSn+poiJUBsOHff0eQkH
	 zZ6pSpimflGXhR5CKwRGKy9Wx04gZEOI+0moA25qQTvHdpPnQJdTazT2kXRILknNegywb
	 9zaXnRm20i23NRVBRPjUOLNI3yZMo3f3GcKkAAZwGDqTS9nfer7heB6WuLPRQcu+4UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795235730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9R6zaVIvtgH5jzl+qiEpRbTjV5svwtDU6V7VCAEyGSE=;
	b=d1Ga8KrfaljidoiTgQ5sMDmslFUnEKkvsobhadYBJq9nyTLYl1j7pSk5YXkToZIXNfkD
	 wRzZEufK26l9N/JBrTqa8IOFiwhZQ5EG8+3imrvPOKUnCHhFzGBTjIhAOZVrHiU3woGar
	 4hIS9ELL863mtOZIzcGOtUx82k+83rRbJ5p0IG5avTqFUyTYy3JSRn3ur89C4x5xpcZ1a
	 xW4OAf026q64phvhBJ8c0yyvOf0uKx8/RaVQTQiExac7WyPG/jCeZH14HmImNXmDWkj8R
	 BILvzd1cR2wPsHPZxXDLnr9qhqxK7HTbQ21T+qc2CXWm+R7TrZSYXP8wS3kCBk9nJmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJ0c2FQa;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770E0606A6BF
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 770E0606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJ0c2FQa
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e47347279so878581f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795235728; x=1795840528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R6zaVIvtgH5jzl+qiEpRbTjV5svwtDU6V7VCAEyGSE=;
        b=rJ0c2FQaY85mIEKE24XBYeYjXwakqGKvCspyEqc+nGoiqY9yc0PAHhZJRYpl2fKHn2
         O50f1TU4idsNGR07JZbjcZU0laQtv6liqd+7rrLCV+8p6QmcHXK/IVrFnt3vTLbQie85
         3woJ9AHBJldjrKS+CSpG61enN7z2T8GquENXxfXDL7z6l0JP7DLMBsLx9HByvehXn1AH
         g1ts1UUBeoOhhEcjHszVysVxjIwWNKF3IwPiB3N3AX7UxwtVD3UGs50Gq/00NVq6a9uR
         N7vGunDQWZxzaArUXcroPjo4CKWW+yILZSW7N/gIWXLga+QzSNAgq9FwAwNexgFdkHdS
         wxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795235728; x=1795840528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9R6zaVIvtgH5jzl+qiEpRbTjV5svwtDU6V7VCAEyGSE=;
        b=vp08EowCfxHkN2dXWbdFEZznfmww2g3VjM+mwUzbByFaMDU7MkTllc1DvlBGsv/DMW
         9LeEXOhh5Z2I6VDHCh1SQS+A7+G5ksnz3D750qhaGg96t4SHbw2j25Iyx+0ItgyzIikj
         3O3P1LeTsRpDTIgNkohS8C3EX6ySyIn4kUfH8Fn8IawuOiz7KPCwnG4VjMEVrxr4ENkD
         PH2itkpkjp7E9WaPMcPSx0seLMo2a5O2ATmbexzcrzgwgeeSFssHv3fX0nH3TWc5dD62
         oa8WTaqRjd+ytGDIgHtXoT5luW9F2ZO9qTTMhVxsvV/GTc2C46vpoze3MDMIwD9FLW+s
         JWcQ==
X-Forwarded-Encrypted: i=1; AL+hErENYBgIYGq5MMLep5iYJl/aShC7sEOWm9xLFQLWVRHcXeliNPf7Fzn6TjMC1tWI3KRxOTwcTWhtgYyKEQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rk3ijWgKy3jiHB92QtD595KK9p6sMmefWBg7ROGbZx0p89efu
	kFjRW3dufatAeia1oXYKpx0h0DNbXn2hAZd2nm56d0N1sVwvcCkbgE2f
X-Gm-Gg: AZFdTZf+qiMKPcpF681N6ODKHp3LeswDtrnzm5iGOssiWQPRdjF7AeMuHVNf6oOeiJ2
	mbU+MVffD1xjShIoa3OjwdbvXUMwi5iMbAv5CfbOXQ92t34w+BMNWcueTWAOlii57pAZbPvVzeD
	MLzXcZYdftTYBNhpJHxS19vAeBXsDKe5iuKW+V8LHzuETok0WJJC2GLUhxDdhpaNLx9RnD0++Ae
	BtKHMroCHcBM3MbrUtdF+V5i6XfXfw9LYU8/LCJP7DpzfELxlrVvzQlxf0C63cLh3j4YFLJIkRg
	8+6fn3IFbwKdZWDJGD9yFQzVbEuVdwb4oZgBBdWc0EBq9OGBy/+DTpIp4RvEx1yUWFQaiM8Y+Rs
	TXInQaI725tY+6p1yXKE4migW7i/ek3wStPEd24BVRGXfiuM9/QWNTnhadrcyTgQKW1BZwoafef
	84wpRqnFla5r691eFMfvlR+Xj6qMqmJWPNWPitaYiVFAZ3+Ay/vB4tYSJ3ZJV+vngKGm3K3cP/D
	By+4jV1a6BE7WuXPnoSY2Y9LnJcmvIkd9S78ZT5BBCo1LTqnpYeptQ7LRAjtOks2hFewlLrJvOo
	hakgk9dVcdjSEvy0g+bn17yl0xavsnBiAvBdhhRp8CMHEG/w9hraQVOu4Qeov1ojtMGfvO3AFrs
	L982zjOFTR5uqi1b/BVrIv5ts6jQfLy5LB6UqryCXRd6k/p3fc6uVRHFicSII4TWmf8ErzbnJr7
	nrQl75sfRQnfH/qTqRsyOFITqXGYJgbcnv
X-Received: by 2002:a05:600c:820d:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb887e21c6mr111271405e9.3.1795235727586;
        Fri, 20 Nov 2026 20:35:27 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb0-6801-ad74-bca0-dc5f-7242.310.pool.telefonica.de. [2a02:3100:aeb0:6801:ad74:bca0:dc5f:7242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm214023515e9.0.2026.11.20.20.35.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 20:35:27 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Stevens <stevensd@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Amery Hung <ameryhung@gmail.com>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] locking, mm: Add atomic allocator trylocks on RT
Date: Sat, 21 Nov 2026 05:35:13 +0100
Message-Id: <20261121043513.20538-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020152708.3atPlnSl@linutronix.de>
References: <20261005070625.8871-1-kmehltretter@gmail.com> <20261020152708.3atPlnSl@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 20, 2026 at 05:27:08PM +0200, Sebastian Andrzej Siewior wrote:
> What is it that you try to achieve and why. Why is !PREEMPT_RT not
> affected? Half of the problems origin from PI-boosst.
> Why has the nolock an rmutex-backed allocator.

The bug still reproduces on v7.4-rc3. 

GDB caught n->list_lock's unlock re-entering try_to_wake_up() under p->pi_lock.
kmalloc_nolock() uses normal SLUB locks. On RT they are rtmutex-backed, unlike
!RT.

> can_spin_trylock() skips hardirq and NMI. There is a trylock on the
> local_lock_t.
> Why do we have this mess and couldn't we avoid having it?

This was IRQ-disabled task context, so the check passed.

> I looked at the patches and there something about hardirq-atomic waiter.
> Wen don't have this. I don't think we want.

OK, I am dropping it.

I plan two patches: move range-tree allocation before arena->spinlock, then
restore the RT check that rejects non-preemptible callers. Does that sound like
the right split?

Thanks,
Karl
