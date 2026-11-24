Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491209;
	b=khH4TJq++Iv7RQPuqSv2I7MW2+zeZFJSqyMKc/vTPcfxUXDMDfma1PbP1zPa3kl3J2nI
	 yC6LrZe1ln3IDQ2CbcjnB9yNvI4J935uR1F10MPbzplvFV4wiW4A/R9FxR8GuAUKGIujP
	 zrJuCi8Enm0HC+MnWDBgoNLaCDDrDKTkP5AGXoRZRyr6+YOYA3Dft5HOI8GTQNQybXoOX
	 tDN7qg8hAvs6T4WZNPzqKLNpU+AlTEa9wPHkk/pMq+v4ptwM3wGzaac0cNB10RhGPFy9R
	 RDJW08KbioAuMxTOvZ0yOkyWy4hhp3YaWwU0H3LUjDmkPdrMW/cP0Wo3PQ3k5tXqc+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HtQGXmDLK1knncRVdCTkTy3fQnI6z6mdkboXAFgFAyA=;
	b=ChQ/A3v2ZjGrO5Gm/Fn274TPezuopYLA6SktHAIMCa2Z1AY7a6nxjsf67C/Jr4Jk+ZLI
	 s+0X4P04q8PJFpqy509Ut2tk2hIfwVA9si1du+OCP6NPPxsf752IFHo1aCef0PVFW/qyb
	 bW4y9I4vknHAHed1e4GznWWc2vgoYvRO5ep7SwYA3KjRNZl1qe//FlmGMEIlBXzK9nWjo
	 KSUgU5woOKFqDkddeE6KX1t/iHwIpDSl3fCA9MmXnGt59j1b87Ako3dS25e3qCw5zey0c
	 46eg+209//o7h3cQR4eU+26I0utL0eyTMFP16grDs1coSyIWnMZv1a6wP357s6Xkk5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7KAfRMZ;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94068606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94068606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7KAfRMZ
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3b3fb6d5edeso746570a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491208; x=1796096008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HtQGXmDLK1knncRVdCTkTy3fQnI6z6mdkboXAFgFAyA=;
        b=x7KAfRMZvLVFOXhMB2PcYGsAy4G7uaTxoKpMUzCfoSIe0xYloNEjewCI75s8aJNr63
         wb8qz19QiKmBPoFFzOGcGBcuyOmoUSj5X4HfEeMdTmFuAdFaLrFF3FQuypMadypOX+bl
         EGt5QUOnt6MWjQasSPVnZNdnFlTvc/LxIzWrR+ib7IW3mRnmKM7E0pAdT2460lUF76/V
         9C5QNSb+0nZ2D4BhU42onL/KOaDDW4dBewk2NtQO0LmdiUDuXM5JOK9HzsmCF41f9sql
         6QDlXoAa4rbCaAnSW/8JsAjEPSR3/Q+4uNw2VKp1N6RgPf+cJXZ8xEfxhmM7QbhQSyMf
         3Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491208; x=1796096008;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtQGXmDLK1knncRVdCTkTy3fQnI6z6mdkboXAFgFAyA=;
        b=EHnWdACclbi/QrIX7OKxRlzQx1DOZzyD0Bx3tfsTNUKXNdmYA5VrCNpubpogb2lB04
         RCbglAOFnq2Nms6gpdRN7Au7UUKNLdJmaI3M5qDac5HGKuY9BsItbc1cmi+EAj+zFW1B
         6Ehl8ImPeB5gIXJL6xYUFJkby8YlYAAvySNMw1cqNHrvJ1g4VviR36fFLjCYM+rqRHN2
         yFfLIHUCR9FxoxXh+0LR52tEsPz09YMGyHN0Ly6XXcjPF1Z9lhvqk5DRMmsBlYX6/RrX
         EH4ooJyBHg4LZhPpBpIVUHkuLnWZziF9vnY+NQRhIz3t31/T2q4WaC4spsO9bcQ6wf8W
         +SzQ==
X-Forwarded-Encrypted: i=1; AL+hErEyDgu0heGWgB5wv8R7hmI7mdUbh+0fRLy2freePqb9rxa/zVVohnG3lgmzH5P+P7VYqNHHO9N62ito6Yw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T7voOx17Qz2wITNLmzWbp5Ulg8bRU9XvjKZoMY4ctmejNVg1A
	2nLy7cjS5POika4H2Z9hpB3iPDHOXtMjn/2DIbh9XAZGyaXyVcXxCTBz
X-Gm-Gg: AZFdTZcj9oeH6HQsHre3Mj03cvTeA/79+a0HhkkVT9Bj9nzCJxldAq1+sijcri18eRC
	Cucym9othQu98CEE0CWYjmcRQaPbyNllTzQBztsLqRv1ERd+6CF9JWrKx2oiPtKVyMh/0cY/cYX
	0o2oKiHb2bDOcksYzdWzk7RLijPuui78XFsSTCrlJTFN/P6CQT3JnWNoPfFqZRGFfkSnx719fti
	KpdtOcGeI86An3rBE0Lv3ejojCLLRgZGQn6usAiD1lOci2ule/p4EaEfEj2nwj2mpELRpLHUjZO
	1MOkH/ORuQtAQMoCfizD0ynO5LvcJQIkxIEvKPpUWIeru6qAv2YF0licOiIAQWByvi+9jc4u4pJ
	YjWwc8sH1Heb/VQ3KsZFru4FuNZfMH3kjd80LqCDGYsjXKIlmmOp7HWfBQqP3Ng6/lKK59FvtOL
	JUOFcfyCWDK60z+ng6VIzHxuRepRbzGDx+DM7HTWDYBwdrFGJxtxOU+skRTfIogLLhm52OEnQgu
	kAyQXoPowCBETkoU1Lt7yyIdvY8Ul3CNZRZDqNVmD7mhxI+oUqloNSWl5NQzoPf7B+iruFfI7jI
	wfOSTtBkgMTdFX7fudNQ84XghKg9pyXiAyhxWlLUPg==
X-Received: by 2002:a17:90b:2247:b0:3b1:83aa:5b53 with SMTP id 98e67ed59e1d1-3b41c98a1b0mr13226363a91.58.1795491207740;
        Mon, 23 Nov 2026 19:33:27 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([223.86.210.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm9122009a91.0.2026.11.23.19.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:33:26 -0800 (PST)
From: Bingyu Xian <shanbeeyoo@gmail.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] KVM: selftests: riscv: Test the SBI STA shared memory lifecycle
Date: Tue, 24 Nov 2026 11:33:18 +0800
Message-Id: <20261124033318.612773-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <av77j8rN593sxIDh@orel>
References: <20261115085457.889873-1-shanbeeyoo@gmail.com> <av77j8rN593sxIDh@orel>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Drew,

Thanks for the review. I should have separated the scenarios and stated
what each check establishes.

The enable/disable operations are used by the Linux RISC-V guest CPU
online and CPU-down callbacks. The selftest invokes SBI directly; it
does not run Linux CPU hotplug. Hotplug motivates disabling and
re-enabling the same area, whereas active address replacement is a
separate SBI transition. I have reworked the test to cover disable,
re-enable of the same area, and direct replacement of an active
registration separately (v1 disabled the old area first and missed
active replacement).

For dirty tracking, the intended property is that KVM's writes to the
shared page are recorded in the guest RAM dirty log. I have moved this
check into the common per-vCPU test path and cleared initialization
dirty bits before checking accounting writes. main() no longer needs
the added #ifdefs; architecture hooks select any protocol-specific
lifecycle cases.

The update checks now arrange runnable contention on the same CPU with
bounded waits instead of assuming every KVM_RUN advances the sequence,
with a small prerequisite patch making get_run_delay() fail explicitly
if schedstat cannot be read. The revised test passes on RISC-V and
x86_64, and a local control omitting the STA accounting dirty mark fails
at the expected assertion.

I have also dropped the MADV_DONTNEED case, since discarding page
contents does not model migration or establish a content-preserving
backing replacement scenario.

I am posting these changes as a 2-patch v2 series.

Thanks,
Bingyu
