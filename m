Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114356;
	b=KG7P76jOLTT0UEc++ft03n6btEX0yo0eQLhnam8M5pobDc4Zup1Py2sXykhzf53t6xkY
	 CjGJHVlgdEi9JzLS0kTEwP/UmtLB6riuqU3EmpxLjwlt1QIgdk2tiMBOnuZ5lADaE33VO
	 QVnMnPyyuvEBu4gaQT15c5cl4HoNIwN+t/MEewaU5ZvRi/xRHu+762zgvUMXXyTtb/5S7
	 fIfoVHARB7/OkEBL2mJ2dw8r0/qg9ADBuw3GJ/wcz8XYtD65b0WDSti9TaEJKgVR0aVZw
	 Sva5zGEbcxi/Gfut23HfeLrsne1jQh24XUMRPnVfcsiTG1SwiSQp3vq9ZWka40bIR5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tt34GVe7kBng/bcouD1dbLOnNpNCEkhyJnpoNOTfYBg=;
	b=bk6B5PeFva8fuYTWBKiKHXa4JF+SUaE24lsXQYqJ1zncO8emgKoB7p3+s6z2ZS5GHdf1
	 yzJGFX6s+I3CcmVbzPiVLQevopjQRUOHW/CrZJ2HP4CjeQ61T/9sHZR1e9Xrl/BTImGnc
	 m4ZNTI6pIznN+8aDqFWmiPuYdSiUDOGtWaOsux4lRtt3Yex0Q86N6koLMKMwB3BMH6yCk
	 /es3GuNPXIxyhK8ATIrfywfpfqLSloPZfUcMdsIQcKcoTUmjGeqziOCkN0klFXtmJmoDR
	 bRE2XCm49Axc9IT9o5AggxMmX43Gjt8rih4z0e29VZ0jIp6GvAvDBRyKmXRiLn96v+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AdFdvy8E;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042F0606DCA3
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 042F0606DCA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AdFdvy8E
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2d1eb484aso159333b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114355; x=1795719155; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tt34GVe7kBng/bcouD1dbLOnNpNCEkhyJnpoNOTfYBg=;
        b=AdFdvy8E4NZPVwkvjNw0tB2p0ZMpUTxqT2mUaqvzRf5p+o3fnEpN1MACjgez+MOIIZ
         Tm9AxDcyIo26JT2nI7KisaVoIDv11DBalhRt0gSsXtFIUGXSPqLLCl0sZltfjJW/TY4p
         WukB4Dod98M3ER9ZzhXP5QmFSnb6bX2EkyZtlgpbtU6kh4RioLfcALeuqz/EumT2raMV
         KFzgYEuiWElhGlqR3ikK2ujBEjYr1OlicvQAkvBJ/yhX3wMlPLXSPF9BNXhmHGKzK7dh
         P0RaXExlSyET4MDu3JBlxakAGiS9ajn86t+yl9xy7gd/Vx5KNxTQVHyMj1hgSjbcGAS7
         kBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114355; x=1795719155;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tt34GVe7kBng/bcouD1dbLOnNpNCEkhyJnpoNOTfYBg=;
        b=gf5nPSpZFVsHLlMrXOQAYWnM+9Wy7JeQ46XsU/ha2GpvO/Lln226hZ1KhMIEdNRVs8
         j0PP/F4LYOCyyWk/ZbyZgyaNkuQ9TwYmWJSQYsytQS/jbyri8jAQkWXnpPpnZajNNbQw
         uJvzPy2sBznPpf80LzcRjPaJWwZfYW10JhjRYOSulDY2OYITS+pD08Pp/HrHtZFprXJg
         1CvWmnn8dEXld/AR7U0K+NcT7O7aeHm/gNqpfFmh9aktffMymknDjQHVIi5d5Mzccvg6
         tccEx8xFpaJ1hG1l2O11/1QjTHRPC6V4g7eAfCoHlvLzvbhDhJa+Q/X8eQ2iJGFbpZ/d
         AsfQ==
X-Forwarded-Encrypted: i=1; AL+hErHhAYj/rLokU7oTPX6tQRyFtBM+RO8QsMpXtsPkR583o/MKvQBc7qPyMmda5sVnbDTo9SYvKqXWTGk57oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nNCv8BNBhXze3M4EXVp+Bpdy8w2NQZZ9QVgi8jWpGBBydYXq+
	tVynB3tQj3pPB0IUccmFyMI1qsFajVbD0pZKkVaC5TAGCntqK9jXwcIpSByKTXsQRBqxnA4EsAT
	sjb1BTVtILMdI7ReTjJ8ZkYUmdA==
X-Received: from jaho5-n1.prod.google.com ([2002:a05:6638:67c5:10b0:621:d005:6f2c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3c47:b0:4b9:e65b:8c33 with SMTP id 5614622812f47-57a09212719mr1036647b6e.33.1795114354568;
 Thu, 19 Nov 2026 10:52:34 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:01 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-20-coltonlewis@google.com>
Subject: [PATCH v10 19/33] perf: Add perf_pmu_resched_update()
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To modify PMU guest counter reservations dynamically, the per-CPU
available counter mask must be updated while host perf events are
temporarily scheduled out.

Introduce perf_pmu_resched_update() to update PMU state while holding
cpuctx->ctx.lock in between scheduling perf events out and scheduling
them back in. It accepts a callback invoked between ctx_sched_out() and
perf_event_sched_in(), accomplishing atomic counter mask updates with
minimal perf API expansion.

Refactor ctx_resched() into __ctx_resched() to invoke the callback at
the appropriate point.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 include/linux/perf_event.h |  3 +++
 kernel/events/core.c       | 33 ++++++++++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index e1e11500df097..8140457939658 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1242,6 +1242,9 @@ extern int perf_event_task_disable(void);
 extern int perf_event_task_enable(void);
 
 extern void perf_pmu_resched(struct pmu *pmu);
+extern void perf_pmu_resched_update(struct pmu *pmu,
+				    void (*update)(struct pmu *, void *),
+				    void *data);
 
 extern int perf_event_refresh(struct perf_event *event, int refresh);
 extern void perf_event_update_userpage(struct perf_event *event);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index e870f12c3ad81..dbc42ded5f698 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -3010,9 +3010,10 @@ static void perf_event_sched_in(struct perf_cpu_context *cpuctx,
  * event_type is a bit mask of the types of events involved. For CPU events,
  * event_type is only either EVENT_PINNED or EVENT_FLEXIBLE.
  */
-static void ctx_resched(struct perf_cpu_context *cpuctx,
-			struct perf_event_context *task_ctx,
-			struct pmu *pmu, enum event_type_t event_type)
+static void __ctx_resched(struct perf_cpu_context *cpuctx,
+			  struct perf_event_context *task_ctx,
+			  struct pmu *pmu, enum event_type_t event_type,
+			  void (*update)(struct pmu *, void *), void *data)
 {
 	bool cpu_event = !!(event_type & EVENT_CPU);
 	struct perf_event_pmu_context *epc;
@@ -3048,6 +3049,9 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	else if (event_type & EVENT_PINNED)
 		ctx_sched_out(&cpuctx->ctx, pmu, EVENT_FLEXIBLE);
 
+	if (update)
+		update(pmu, data);
+
 	perf_event_sched_in(cpuctx, task_ctx, pmu, 0);
 
 	for_each_epc(epc, &cpuctx->ctx, pmu, 0)
@@ -3059,6 +3063,29 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	}
 }
 
+static void ctx_resched(struct perf_cpu_context *cpuctx,
+			struct perf_event_context *task_ctx,
+			struct pmu *pmu, enum event_type_t event_type)
+{
+	__ctx_resched(cpuctx, task_ctx, pmu, event_type, NULL, NULL);
+}
+
+void perf_pmu_resched_update(struct pmu *pmu, void (*update)(struct pmu *, void *), void *data)
+{
+	struct perf_cpu_context *cpuctx;
+	struct perf_event_context *task_ctx;
+	unsigned long flags;
+
+	local_irq_save(flags);
+	cpuctx = this_cpu_ptr(&perf_cpu_context);
+	task_ctx = cpuctx->task_ctx;
+	perf_ctx_lock(cpuctx, task_ctx);
+	__ctx_resched(cpuctx, task_ctx, pmu, EVENT_ALL | EVENT_CPU, update, data);
+	perf_ctx_unlock(cpuctx, task_ctx);
+	local_irq_restore(flags);
+}
+EXPORT_SYMBOL_GPL(perf_pmu_resched_update);
+
 void perf_pmu_resched(struct pmu *pmu)
 {
 	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
-- 
2.56.1.708.g77570a6a1d-goog

