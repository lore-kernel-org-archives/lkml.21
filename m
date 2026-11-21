Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267235;
	b=VSG7xiv2zfCgM3KdA5EUlMUHhwr0xYfcmJo8+pN/+YippcwEFIQBp0nVsynAT83LDXpy
	 XeyxsaQuNK3UnmsK/a9XlZbafKwijCKcMPWYAAI4naJAwefOfj20BHAxJihY15b5R09vq
	 dWQxatpSqAg0IlJlO7HNSPVEaCishwPzs5wUsuyFOAmxPcMf4OugkvKVbMtoxiOMNhS4W
	 dEjNR+j8C/fhnRGllhOyKEeQrm6yGEHo2xzZW1+0IMd+vJIKhxxAyHYCZctDtzmTWmOZ8
	 5bgxzuOChy7OdpYLDFFvaGJKUAMQ18HUkLFPbbT4C7cwwSNKzBMZ8+xnDBwCfB+BiUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yYXjnQVpPSMLj7f5uOA7HPu6qPGK7Swn2BNPn8FKS1M=;
	b=ESau+EwWiW3k0+lGMVPnDZn0tIYVtEr1bt88QX6qLQc0HPJPJTOAPOZ86LK0lLnvqgPV
	 Q492DxFyzNa6GRJre6xxFhehUQwr3nlLXfkV9lHxZoEXtBYw2/bRhm5HH/fYO1u7x83HI
	 Hm6h2sAvrMFdcOkH2tZdY+T8tEpINqY+9hyIhuDIIHI0ZjYNQPrlVWX61Evz4zs6cymct
	 GI0p5qjzhRkNeB+JnjBKr5haQFJPVLehzFjdzIs1wqHouP8Zh8PXhbw/AFnHD90rCC7I+
	 KykuKE0zA3oszyVHEeQIVRievz+IlkocJhETELFxggufe04V1r1Q0ajTUcPvA+fhy4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uTiv2BYh;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8E0606A338
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8E0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uTiv2BYh
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso18526565e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267233; x=1795872033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYXjnQVpPSMLj7f5uOA7HPu6qPGK7Swn2BNPn8FKS1M=;
        b=uTiv2BYhIVALSebJza+/ccmqYW+ppUZ5CD2AFsis1za/c1NyJtTG8AGn2xPVwxlGt3
         nUdVY0wA66eNnijXsUppdE3dMI+XFyoZGnE4AOSgbbg5fQU7+ZTRFYmd0kRoU4ZM8VDn
         GzajvxX/9I4ZPYogJyq0wpKZcq7X4NiNQRwKxDSHibFqi0i+OVIilpdq/WCKHYcGxWVD
         f+rTFW64WIagn2xzD/rwD5Ovq+pBO6R8Q3C/kLEuwTk6VaucDtiZ6sp7jdWuNyYqntZs
         4yHwQAJJ07hH0ZETM/l6cEBOsKm/skgVsKHykEaF37x3u2OhiJzXRlDENpL73Nneh/pP
         YA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267233; x=1795872033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYXjnQVpPSMLj7f5uOA7HPu6qPGK7Swn2BNPn8FKS1M=;
        b=bQsu4iRLqhUGHz3JXxYh5YF08O2q+Bm+tr5/qwVn+SjkWdXbg/S6LW3E9o+qfaWAMh
         Hxk92frvtpvsWmd930MzdKWvlLGlKQSutBmbC6A4I9mm9jMdqg8mNeXMYT/z42oYAmZs
         6ukii+T5CzXu14BvhIcLcfSdSd38G04JgfLbf4YtPTxYLx0h2Yan/0XT7pXAFELOLcgk
         HkvPTm/FT4Gyd+JFH4x4mR+PS4P2ov6vvJVfu+csjZJBrYW50jwlOPM9/QfDzHIsSnkQ
         yKgd5YM1LQV5ldHLRm5lp6UF75zNP00xf3UTVxzKcho0Mx7saotUfbrOsOnf6w+KhVfU
         yKeQ==
X-Forwarded-Encrypted: i=1; AL+hErFJchAF9tEUJwTHm4X/fUHsAeuysYLg3lIxuAPVUe21Rca4hBe6MgZDt4Q7XJ5dhXmcxkTtKQVlLfiBXdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BFhO+W04RsDXLk0oPX/PqB45l+0Cg5wMDRUoNlXSbPjERMoHb
	Pn7UXO6FH2P1xNGTvUuvZzzg3j6QXrBbZhc71toBb9BigSUNyZlR+whb
X-Gm-Gg: AZFdTZdEBqGQp519a/ue14znai8/4ZKS4wkEN36Ho4F5Drlj7EhBrNC2N7qWecyz38i
	+swsVwEYCoAIgOOLK6x5hu/cpi+Sjh2zBS64Pls+tedqDCZTzB5NCLzpm7/T0SL2Q1WCVxs6Jsx
	BNvuZsIUrShwRAJUr7RjaJj8g+90mls3Zz1yqIkWCpnB/SgFsKD95PD/wF65gnk6scJQvCxi6Dw
	ki1TnJYnVnyRzbbmvMArH7HSrynaZntz4O/HgQSHgQUCrwR0IFW3/Z5GpAT6AXPOzUgGUnaoFsB
	a8n26SlzVu6T1al5Ub/dlokZ2OvH8HdPl9ZTpQKMHe2VnQOD3TpsT7zBwJEvZC+YNQXpphk0MdO
	gPpeb8U/hgGizMlQ6vitNpTFYrXFwJlyQ1vll0HfchezTy0/2gRqOkjcGeFnW3OWWM2dqpOGL6d
	/B3Wqpt+1UKzjiyQQgpvkqWbEbDiTLzvSMMqTqbExhT0E3fjpsDTkV7vKkj9hJ0G+1vAlmPiH+H
	/EjNq2hQsjEUknbZRjUgo1pMXl7NyKmgwByruL+imeq1ouTWaueOUPjqISDYyW5E2DjmXcXpNiw
	3b45Vo4fLteKDQovqe3yizcg096uUTPdlLIEWE7H+GR4yO/NKGiZAfXLWJOe65EThf5BCCDxZPu
	GiSh44/x0TaZF1sl4XLPeslf53CMC2zGQATzWKSawe3eMa5uO/2P3HzCXKBJ98qckJg/l5EPXTf
	98qSBvs+rNZSUXvrWfOW8koK8lDKaWw9fmJUATR5dStDC9CkM=
X-Received: by 2002:a05:600c:3b94:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb8880ca3cmr163969375e9.15.1795267232948;
        Sat, 21 Nov 2026 05:20:32 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-aeb0-6801-ad74-bca0-dc5f-7242.310.pool.telefonica.de. [2a02:3100:aeb0:6801:ad74:bca0:dc5f:7242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm12397707f8f.1.2026.11.21.05.20.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 05:20:32 -0800 (PST)
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
Date: Sat, 21 Nov 2026 14:20:23 +0100
Message-Id: <20261121132023.41237-1-kmehltretter@gmail.com>
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
>  		if (task_on_rq_queued(p)) {
>  			update_rq_clock(rq);
>  			rq = __migrate_task(rq, &rf, p, arg->dest_cpu);
> +			if (rq != cpu_rq(arg->dest_cpu)) {
> +				struct affinity_context ac = {
> +					.new_mask  = cpumask_of(rq->cpu),
> +				};
> +
> +				do_set_cpus_allowed(p, &ac);
> +			}

do_set_cpus_allowed() updates the rq clock a second time here, through
sched_change_begin() without DEQUEUE_NOCLOCK. With WARN_DOUBLE_CLOCK
enabled:

  WARNING: kernel/sched/core.c:881 at update_rq_clock+0x4c7/0x560, CPU#0: migration/0/22
  Stopper: migration_cpu_stop+0x0/0xbe0 <- __set_cpus_allowed_ptr_locked+0xd1e/0x19c0
   sched_change_begin+0x14d/0x660
   migration_cpu_stop+0x5f6/0xbe0
   cpu_stopper_thread+0x25e/0x3f0

Seen on v7.4-rc3 with this patch (RT and non-RT) with sched_setaffinity() loops
while another loop writes off and on to /sys/devices/system/cpu/smt/control.

Thanks,
Karl
