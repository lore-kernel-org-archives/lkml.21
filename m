Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006365;
	b=LIogA57veISJh++/PLj23UTtAfEMx2eKw1o8PKU4O+wksqqI3zW8fPwxJq4LTLNR2z4U
	 UbM88wfCuL9yKihaEdpw6FDWcrnVdwxSTC2YKCYnnAN/wKkGS+2FgHm7674ivF16WrhVM
	 38hsw5o5SqKkJjypM9bOf8EMmLzP7aUEpBoMOHuFE75JTvWr5eiiaDYeQDO4czisM7UAR
	 GrmF/yRtQ5isI7upsDirsgXfycmCX+Kr/Qj5GTbli2yb4FNGlBq2ZR4HGoDTb+/6h7+ak
	 0rJBNXy2B4ySVtEhGSnrlqLFpHpSONvxy47euTA0momssw+62Iw/cE1/Br/blUWLDyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BhgEwCmJA5JaHJI0YWFMAKzEoAUJXIL6e2X/w05i7kA=;
	b=tZ0iFTD8v+x952ml6vO/tJOh6ELrxDO1AIgx4lHDJnXnJU619OZqas3vf4Dkx5lEkVAO
	 G8jPnA3DoCmVTBp+QEO0JxPMo7HKtNMJKDJnaSDtidWqK2a9pd1czNhsswHTbl5oM4wkw
	 FngjHPF5GLjE8EFahxi1j0EvB3TsB8X09jRALPWgVDOtBf7VKT5lISGZfMDoznfbapORk
	 0FvtAAGuTi7q8btJMGuIWgUz4VKeW5Rn4LyXzs1B5yYcYLnmcPxTlg1haPknzpUx0Q6Zn
	 djxUc2/ixulbl31UEvOu3x8N2ABIsrgGKhrZ84ZxTJtDQP4kxhJYlLPGo39ra7V3vLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RIgNexRz;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFC7606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFC7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RIgNexRz
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so776975f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795006362; x=1795611162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BhgEwCmJA5JaHJI0YWFMAKzEoAUJXIL6e2X/w05i7kA=;
        b=RIgNexRzfzTq7wQZV3jQh8Twg5+Lsm4oxq2hoqZKHUJ6aAAiyj3qs/MIrmcE9KOWp2
         gkVGA4ERksMxtNS//kq8p9Hmlt5EfJ4PgygFx2WrZbv8LhoOVIvUVzOeBysT5YBI1SU4
         oGCNmeVBTgM+pUoiWsslSZCXMtG8D79AxuVjJ1Zp7pqiDZ+AjnLsUdjDuu+eJYkj+m0y
         9cT9egoXy28DMiGhsYsoPbLmz/ffArc/3n0W0uP5W8bPYHwpYQnTQbEZb1JV4UEw+TIL
         XN4uGu/mIp4ah0o0I2bIISLeQblbT88xuKjwEOE1AREYBSzWk3iv3t54RC2j/9ZWWblA
         lbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795006362; x=1795611162;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhgEwCmJA5JaHJI0YWFMAKzEoAUJXIL6e2X/w05i7kA=;
        b=t53JztDO46mPzr8UKv32M+rzSBxoGNcmGxoqQ9QTnxVwgV+PbOV1+ROzwr7VYmfgV3
         xj4bTv93bKG6+Ji1QQO5t9Sh6qX/+OVlATSvgj1TL0Joh0LNX8BJyyJ24FJ2EBy3WkmK
         jQ04D8wfKr1sturJPXoo1QsBrZ2JGo4/BfTsZfPYqLNhO2T0y0u2glEaYIMkdPrYeRyp
         YUiYtuw7Kz4bg/cAopiDTz3fed8Zmu0bItME3mUXqBtBrun6bumuvBxgTnDWdsT7XSAB
         wpTJhRlppW0oWMMGBO6xyxWmmjjvR4GNZZXVTWJj/J9556x6qmlke79mZ51cr0kahFgo
         h/6Q==
X-Forwarded-Encrypted: i=1; AL+hErEfOUIoVyP2VmPtb1T4HuNa5ktFD8Wl4kuVh+QDlPqFb8qFV/4XyR4CSh78TydwyO70/zfPFm0d7EXREaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9quemmIl9wbEt6OJm5CHyUpAoG48vsiyOo582cqWZJsft1pKKZ
	hGsereC4JkCNHk8RYvJadxECVvurNqoCm4JAz+hFxdWoj/9HGuIwz6PFjW9DAHEntAQ=
X-Gm-Gg: AZFdTZed15QC84jfckfe5TfwrNtxPlY5Tkyhm9TBiurqJGwuNc3XlLvmaTFVKTIdnBx
	qSdbxDLh3fg16HoJ+llOWDhO3Pt052aNKmVeH44PSShVqTqp2puvEGOb200qBU6zvOSNRPBSAur
	S1M7Cybq6RrnzrbW4iEjoTq+l68ye5gn75vlHXgvukkaFcw57kZT5Bax/tHs3Vw6EM9aZ+HvsQ2
	YqbWPeOqqoa0UgwgG1Fq3fMN2J2dabvqs2raO4HPoz7sT93/d8iADGeIuz9INY1LPYF+KlPdZlX
	gLz6n5fZIYWXnyvVIcMTWq6sPOSCkVWV6qxHzFvnuThestFCCYpX9Jqsqfu+847Yl5sAXRQy+KE
	knh5VESGD/wS/FQjESGejHUt4qKF/OU1f6Frjjr+CYkkgQ7S84QhpptjceYVmnQMHr3YLb00I9k
	905RS/ePfx7qt1bhslzLEUdpieb36uCkxk59hC/xAzYpkulWcFDChM0nxLTP4Gx1fOBN6XP9jCz
	R/A9iUtoOKl2MejeH0a09EyY/6v56MIRmcfu4G94yOdSDKYJCOoeDynHgh7gW/nlmZ5bHrALIYP
	mqNMbeqmhbTmmpRhPJqIFyZOUeASJ+fXEE8AUdTsr3kJqw==
X-Received: by 2002:a5d:5f41:0:b0:4a7:1fca:e52e with SMTP id ffacd0b85a97d-4a71fcae77cmr3550530f8f.50.1795006362539;
        Wed, 18 Nov 2026 04:52:42 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11f1csm5095252f8f.53.2026.11.18.04.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:52:42 -0800 (PST)
Date: Wed, 18 Nov 2026 13:52:40 +0100
From: Petr Mladek <pmladek@suse.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	John Ogness <john.ogness@linutronix.de>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	kernel-team@meta.com
Subject: Re: [PATCH v3] lockdep: Move the emergency section out of
 print_irqtrace_events()
Message-ID: <av2fmGFra8di7Ir3@pathway.suse.cz>
References: <20261109-kcsan-irqtrace-emergency-v3-1-6d62e3406b8d@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-kcsan-irqtrace-emergency-v3-1-6d62e3406b8d@debian.org>

On Mon 2026-11-09 05:44:30, Breno Leitao wrote:
> Commit 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep
> splats") made print_irqtrace_events() enter an nbcon emergency section
> by itself. That was meant for lockdep splats, but the function is also
> used outside lockdep (by verbose KCSAN reports, the soft and hard
> lockup detectors, etc).
> 
> For KCSAN, as print_report() runs with the raw report_lock held and
> interrupts disabled, so every verbose report writes out the whole
> console backlog under report_lock. Other CPUs that detect a race in the
> meantime spin on report_lock with interrupts disabled, as the lock is
> taken before rate_limit_report() gets a chance to drop the report.
> 
> That causes this type of problems (as seen in Meta's fleet):
> 
>   BUG: KCSAN: data-race in mlx5e_poll_tx_cq+0x5d8/0x998
>   ...
>   irq event stamp: 28975074
>   smp: csd: Detected non-responsive CSD lock (#2) on CPU#35, waiting 5000000052 ns for CPU#26 ipi_mb+0x0/0x18(0x0).
>   smp: csd: Detected non-responsive CSD lock (#3) on CPU#65, waiting 5000000020 ns for CPU#00 do_nothing+0x0/0x18(0x0).
>   watchdog: CPU71: Watchdog detected hard LOCKUP on cpu 0
>   Kernel panic - not syncing: Hard LOCKUP
> 
> Drop the emergency section from print_irqtrace_events() and enter it
> around the call in check_flags(), the only lockdep splat that prints
> the irqtrace events outside of one. The other splats and __warn()
> already wrap their whole output in an emergency section.
> 
> Fixes: 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep splats")
> Suggested-by: John Ogness <john.ogness@linutronix.de>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

I could take it via the printk tree. As the original commit
59cd94ef8009 ("lockdep: Mark emergency sections in lockdep splats")
went through printk tree.

Or Peter, Ingo, would you prefer to take it via the tip tree?

Best Regards,
Petr
