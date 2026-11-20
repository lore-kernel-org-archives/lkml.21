Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179999;
	b=MciSbfGJSHyGq7S7CCvFL20GGD6qhAJBUKfIPGvAV81bFcV33o3wud+Hvgl+H/pnI86L
	 kf6LrI+/JZosjJzX1MJkqKvn5QltUi6nEbLkMUlTUt1OWvY4WE4yDNAZo6LFRAN+sUjMO
	 K74mNG2oXVoGMNEVWkMzoPHDPDiPZkDd4m0BgKDqjzyu2m38AQOtP2XhpjtNeuc6eqGhd
	 16+PyEYwKlNivFyCCdK2506qMHM/FRYvERbu8WfquogL6vZCKTdKw5b/Ag8U977PHpowb
	 O5ekHJZwWPmy8a2FJi3gii0KP2Psjaceogl0clcKGD6C5tVg22c/ZD2ZK4TaZ7N0I6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aN9l8CDwOvjtRjMobYbC9T4AAnLVgaW+5jZeY6o9Xhs=;
	b=aEPd+Qxs9gsJz9wGBXwMPaFmMgXrerdJKPmc4/F2SCjTTliv6x+Sdkfl7xsdZvVaCdLY
	 HoEpmTMPUr7gxG58olYddw7y7LoLoIksjioGgm5x4bH/0zz4yOJtEQzx5dpmAYekw7oTG
	 IYWm7mDHcZitZeBRqZ3mh/E4v3sbmGzNzqPOCMRcud+aba30tKwn3Ggrf9rtCJyGgbMwU
	 eZu77ZU/Fl2Tj9DUCqzuYdi0D+abTZsTjF4vbqEJSRf7RpFG0+LJxdG2/AQLMTrT884K7
	 BNTSRmV9ro61zJ0zhXbJFUlUJ6mgxdQ+0nIDFW1tdqcoaUTMKL0frS/E7+SlBqVhWGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvTC3UWm;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D80606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D80606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvTC3UWm
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so7775665e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179997; x=1795784797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aN9l8CDwOvjtRjMobYbC9T4AAnLVgaW+5jZeY6o9Xhs=;
        b=tvTC3UWmisWdUSymmpATqFWpFz0OJyrOUWNGm6TBa1nwW+7YrCpulfv3UsMXJUSMJR
         FeB7jMc6J+kTNoXVesQNAldCxnQi8kdK+ZaN5Mx5QWOevM9xrRb4hqkD/xjgcCCQoPvy
         OQby+O/fPsqDUrWqGaLaD1pwZi2J+tzxhFFhn6F1FHpJansAs9Ltyg9htJqpl1gpkoS3
         D+7f8lP4Kv3T4bkgIrdlvAsEXbYF0L0BBktabQ/c7R5Etqv5lPQ8bznCTbM05xww9bRU
         +9rjZPf4Nyffh9azDCNgN8C9/4ZVWysYDqolHHq7nOlV35Bq5qm/k3C91Gxo8pxoi87E
         tw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179997; x=1795784797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aN9l8CDwOvjtRjMobYbC9T4AAnLVgaW+5jZeY6o9Xhs=;
        b=KlMqBQoKoycO/axXE8tNy+zwRqIH7vygEF1/wpTYG2YZW93t9NSIdiIWK1EXdkGMFp
         gWZ9AIMjbKlQAurLlnMq2fFXXwVomQa0fretm37LAnAAAN+FR2IAhxn4ip86XMlg6N8r
         82lInheGFI+1PA6ObxCjlpmVzu1QkKq+sORzS7VxFRMy/gPaSU8oxVixG8McuDRdxnn3
         BOUy/XV5g2WxUhIm0pJZAVP9E5UfswWsavT2i959+FmoGdIlvUmTJOUYaeENb83kskyO
         UQc6YbWTOacn2MhzxSfYvyY6vz72ob5xrcNIiM2lBvkZJg0UEffGe+PE0bZty4wKu9Xs
         41OA==
X-Forwarded-Encrypted: i=1; AL+hErHkDuYULRFlGXCUF3hr3NyiyFeMn22e4FCdrFEK3G+nmMwC3JseGeTiBSgtgk/zBi9mlw6P0Cl1r50S+Ak=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kM/A2aeyA4/AOm/Tq3+5/ETlwCYip2p2KiHxGKwhO3heGMCAY
	ANkfFmNgKyBv9r7VXRw0w1heW8fE+tSMneZbLtFSJ649d3BfI7RuUX9F
X-Gm-Gg: AYBFou0b5brUA9itw6mu39nxusBuvDdlDQJU0roA4W2jCkeRGELhGnGVkStlrvc4hwf
	inC9Uy/nL6dRCRN9YKFsKOEeLmk0FhP2d5qq13lR5yZvTjKLUnEULhUyeUzOBm9Dr2iyMv+CKcb
	iZRF7IR9TVdRqOe+qxSQwerfheXpbm9BFQrksIFAR71SruUd+IsXITOdj2e0SQBp4KsPB8m/v+m
	V610w5mzlm4zBPnH3UMG43DcENDAzwZHdSQLrKb4IyQB3h3IDZ/GX0tiLXWk07MOaXPZ8oWHO5p
	cM9tQxR+cHi/JQ8GGWtU/W9aNoS/EVGUsXf9Lpme7YUBP6nzFeRuZP2dTCg8kQsZ66gvubpV/u6
	bHacCh4cji93s8Alg0r56hCF27GP4lHHGKM8Fa9+SStR2hvS6pwlnjU4lMwRzoqQNKBF06uhr4D
	SIp5cYbZgnD7l7qyBnS85DTQz/qNrIY7kGUfI7O9OVG3Ztpndivhy1DknDuMHg3BQ4fBd1CAyHE
	o+PqLYnIs8jaD3ngvxe8PBOdyKXQofBZBnZPKDSqT4Qk3JLxTO1skORzT9KMQYri49OVPqUkKpL
	lhiJYkFIZApw0I8cuFXysNVInhufmJMCVoKYdqymjnDUaagcmB2q452mXhY31I2B4rQxGCyJoEE
	T
X-Received: by 2002:a05:600c:4e0e:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4bb88938dc9mr73795085e9.31.1795179996992;
        Fri, 20 Nov 2026 05:06:36 -0800 (PST)
Received: from ubuntu-nuremberg ([2a01:4f8:1c1b:70eb::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm133317135e9.11.2026.11.20.05.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:06:36 -0800 (PST)
From: Reza Ghanbari <ghanbari.reza94@gmail.com>
To: Keenan Dong <keenanat2000@gmail.com>
Cc: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mhiramat@kernel.org,
	oleg@redhat.com,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	andrii@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	ming.jvle@gmail.com
Subject: Re: [PATCH] uprobes: clear extra_consumers before pooling return instances
Date: Fri, 20 Nov 2026 13:06:19 +0000
Message-ID: <20261120130619.738336-1-ghanbari.reza94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408100247.2065245-1-keenanat2000@gmail.com>
References: <20260408100247.2065245-1-keenanat2000@gmail.com>
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

Hi Keenan, all,

I ran into this crash on my own and can confirm your patch fixes it, so
here is a Tested-by.

I was seeing it on an unpatched 6.18.63 (kernel.org source, built with a
Debian 13 config). With libfakechroot in /etc/ld.so.preload and a couple
of "setarch -R ls" loops running, I attach entry and return uprobes with
bpftrace to libfakechroot and to the same functions in libc, detaching
and reattaching every few seconds. The kernel oopses in handler_chain()
under krealloc() within a minute or so, which is the extra_consumers
path your patch is about. I haven't pinned down exactly which probes end
up sharing an address in this setup.

With only your patch on top of 6.18.63, the same probes ran 20
attach/detach cycles with no oops, and a fork-heavy variant ran 40 more,
also clean. 6.12.117 doesn't crash, which fits the Fixes: tag.

One more thing: Keke Ming's v2 for dup_return_instance() has a hunk that
clears extra_consumers when cons_cnt <= 1. With only your patch applied
the fork-heavy runs were clean, so I haven't seen a need for that hunk
for this crash.

I can send the reproducer and a full splat if that would help.

Tested-by: Reza Ghanbari <ghanbari.reza94@gmail.com>

Thanks,
Reza
