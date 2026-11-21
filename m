Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795271966;
	b=LRyXNa5io1ILDW99zo5tD9yguGbFSHa9f/ZaGfy7Y+jcQnD2cvmD2XVOr6AfL6Fv8xu9
	 edNP7XZY/PTpeznPmzcXFtDkAoVvOWSlKEIsg5G6fQRDDAuRgff4KtyqS9yOgQ328f1u5
	 w0i4peqVETiGAIfkPf1RE+6Yr67TaWoOvHIpQLkmDCwztMv+huQh5qowHNiLv3qnpCtn8
	 +07mnpm2xF9KepXZxK9pMvuDkyP6g5/P5gW8+PcJvN5lJSspoHJl1fdKjyyxieYtTO84N
	 oWgs+8BJfPb4JgpfjaNU7xy+ZbrYIHIgh0QBXYRGUAkxWlrPEP1jJv5mLR9L2g+wQKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z4b7mrxHTRiT8L39imv+QYqgNurRv1KfcfNr9nDzjTY=;
	b=nQ3yU7p18YwoXgHi6tfhcMZEw6KpBaQ50Fz60FOL7343UmoMT4I/NlLE1PLb201HM85L
	 zgX6Q0h0pYOgCQ52q1itWej33bF6X0sJFz1lxk3dtFW5/znv08FudmpzYb9dKkQYhlrsu
	 ARCEMnMb7WrbQOD5Ejgj1MB0i1HN0gJ/6LUufMRyW/GE1H2qJ1hWME+TjQaUDxo2Mzcl9
	 2BvNNAEiN3SRlYun4AtygU8Pz1ywUARSTlhs4zmPAH2VJBkJ4v4bQMCU+xSvRDo27tur4
	 HOQMPRCb8f8E1kzZjbKl87F5gvhQ/45bi2wZpgRAu4PtdhkKlrlANFAEoaTX/JhM+Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yr0k2Obs;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE586606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE586606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yr0k2Obs
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so13978015e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795271964; x=1795876764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4b7mrxHTRiT8L39imv+QYqgNurRv1KfcfNr9nDzjTY=;
        b=yr0k2Obs7Y2Tc3wCygNmLo0ewjZpzP7s21gOkNDKRwHf4INUscQ5oD57dRW+ICgogs
         uob3gDCpRx1nVaR1UiZqMfbERSvVYt+/xeP6bj8LKipuHWTRONfBh1psKQxAq0AsAlVu
         aze2wA8j+l8xAiSkA74jwzPC8OU7vlA9iLe5NND85WogUlllOfkP0IKqdquOWVlZLgOB
         b7HLOhhcZ0i0LmpIO2tJt6BkWXGFtgzsB9dRB1s/rwS8g0vtZ5m2FHzTlfOu7wI7+Qz1
         p3Kna8LD7cwtO4bHrxO+Qcn2LmoXeDbckRhDsGRd2DAfcuJMYBwixP6a71VkpKWofvh/
         8tFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795271964; x=1795876764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z4b7mrxHTRiT8L39imv+QYqgNurRv1KfcfNr9nDzjTY=;
        b=MEgD+hISMHq+WuSkIMhVeIRxjL4OZiJTRsTxsbxoV2kSeBNoRNOY03+zND7KIjT/yY
         9TLLO3igRfLQoYSDKR17GtNRm8xKrWbDJYcK/G8rHjXoLdCFGujThwOV+tsSfZwSxisa
         QhV490KJ5GS2oIyh4G5XbuHXAtBeCR4MK/RHMchbAXLVBmFJaHOpRMY1FRTxd7pjzKJt
         nvhrIdkt5Ebz6nxDi+1OZd9HdOpENJW5GVyyXEjCEH8IOgpdg/YdssYD7LRQu5N3HMAZ
         fBtcO87Uxye7Gt9KL7oUffZtxzWC/uKeZMa6znQzR+PKsm8Rbn6+TFz+cuagEOW1Nvj4
         sXQg==
X-Forwarded-Encrypted: i=1; AL+hErEyti4+MM4To3llmARCr1T9v/ynA/FDKhhbwKJOpoi4V0CRfZ7EAKM/jEyq/QrDnZLWlVMzrdCT8UV81oE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mpswnNZ27m01Y0QCnWJtwZ6x2F85NIqza5uQeI4Ue6lAR9J2i
	0qHb0wLlJZJ0ynzuuZj2hx80HyMT7V6VxJrViE0moYzcDXBB5MnaWFFu
X-Gm-Gg: AZFdTZftmmieqVFjwbn1/37o1RJ3eg/TPDppUkwsVMJKOv5rl/jkIfDVOumyLyn9mIV
	uIWLDEyFR9RKljdEYkrsCC8KL0wQF47C7agaHG9iZSqdpPb3vNUK1vYUwr/inQShpL3AxYgw4LT
	yuPrNLm0RHoRURzK4izO5/0hj1np521HRIgu2C9brdgUr8cyaWNR2mFkSQoa7qvQH+0lyttIOJE
	C6p0IyENX+Ot3JlhydhgcR/iS3D3wbIPQnfT5u9BsPaZCezqfrum3OGzXux8uVBGSUD68kBx/Y/
	kICuBHL/geTJ2OzaoIAcX390lBCTcMRVsdw0jFiTUCk0vug+807jG2q8d9dWAd3ColHiO6p/lC8
	RsDo4kisEsoAcHueDhFasPeX1LF0L3GmmxZXrTZ6KM7Q1dIbibeCKmF8llvM3uD35nwMxveNMgr
	FgW8Gu7YSyBBq58Ln4mLdiz1s1FsU6ccS6SosNO6W4ZId7pJpywiNv7Wl3VX96anOB1XGodq2F7
	yGk4L8sx/595r0oGu1pSlS0f1U0AF0OU2M4JJ3S3MuTzHS20F2L0wY2ujAYmo7nPR1WHys+GcLK
	9GGSLdURwvOV0nw+hkG2SLkY08Nn51ESR3OnYX/59TkiyeLNR1hfKwZWipkxzIh37+L3A9s2MNq
	XL6Ezc3eHlNt+DGYdJVjXayFMGgNSKogIRZXaoJu5lfSdR6db7DKSyvLeQEA/iX6z+E0ocpLjSn
	ogI0DcMk2sOWPC2LL60kLxnyJvPoePoa7D
X-Received: by 2002:a05:600c:19d0:b0:4bb:65ed:b55c with SMTP id 5b1f17b1804b1-4bb88824b18mr141350775e9.33.1795271963905;
        Sat, 21 Nov 2026 06:39:23 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb0-6801-ad74-bca0-dc5f-7242.310.pool.telefonica.de. [2a02:3100:aeb0:6801:ad74:bca0:dc5f:7242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm261003955e9.0.2026.11.21.06.39.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 06:39:23 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH v3] sched: Reset cpumask if __migrate_task() failed for migration_cpu_stop()
Date: Sat, 21 Nov 2026 15:39:12 +0100
Message-Id: <20261121143912.70448-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261120171658.Cf9qIU-Y@linutronix.de>
References: <20261120171658.Cf9qIU-Y@linutronix.de>
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

On Fri, 20 Nov 2026 18:16:58 +0100, Sebastian Andrzej Siewior wrote:
> syzbot reported a race of assigning a CPU affinity during CPU hotplug
> operation.

I tested the patch on PREEMPT_RT with syzbot's config, changing IRQ
affinities while SMT was switched off and on. The warning is gone with
the patch. Without it, every boot warned, and one also hit a BUG:

  kernel BUG at kernel/sched/core.c:3642!
   try_to_wake_up+0x85f/0x1320
   irq_do_set_affinity+0x42c/0x5d0
  RIP: 0010:select_fallback_rq+0x1f6/0x200
  Kernel panic - not syncing: Fatal exception in interrupt

> There are a few spots where set_cpus_allowed_ptr() does not use
> cpus_read_lock(). In the IRQ thread case, there will be an update
> following if the CPU goes offline so it is not really needed to block
> CPU hotplug during the update.

sched_setaffinity() is one of those spots, but a user task gets no
later update.

With the patch, a test that changed the affinity of user threads in the
same setup read back a CPU outside the requested mask in about 1 of 5000
calls, on RT and non-RT. Without the patch it never did.

Thanks,
Karl
