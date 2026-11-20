Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179723;
	b=KN95Cj7tx94kSwoeHAOx87tHsSoq3K19BntO9s+tL3/By9ueR0dJ+P3YrESLT0Ri0MQE
	 DWu1IVFF9pyUfiAx5DpPdZv0/iJS5crLAx4ar9zJYLvpkttqcRGlaOuvIrGevbCzZGN/d
	 qEnDBNCszK5DWkFm/WzULpkYmlY26OFqbTy6QqNfuHVqy0OkMxlQyuSacqdzAipUMm1qY
	 oV63VpkAzv0Sx6isUq+mmXJId1eEDROjtxg8n4N6QcgNPBFENySyZKANyks2+q0dnlqIl
	 v0ZHTmtcwSkvQIjRFQDIx6mWErkj54vnNuADUdhS6mIsmSTfLun1GXf5pt5oBulhhCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179723;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=g70Sw5KFtXeD1N+klFwavclKwEB2Fifoe4OTNieWl5U=;
	b=TtKz0ALbakiO6tnvzU/7sCK35Sw170iNKYnZ87Fs0BmLR04vjKJugzvkbIlITdDvfuij
	 FQrsxGbhLjSB0Nras0IBpeD0t49NCtwZ3bapW/BC8YusD0qxWWL6uk/PnykOjRXSYxe5q
	 z97huyNZuAanC2pyt3Nv0TLsetU96TlsBGkFjga4MvYfg1mHPGfvbMZ7lh5cAGFEPcORu
	 n2GugleULFRfMMUnenS/it5g+En5Y2ketTCcDQgO+jmQfmNxKAD1KTcMfiy23+u35dq8C
	 W/+T+g8xN38euRwpEP3L0IC91NpM7KG9JDxG81DRn5/W2HruWjlRMezwXoyQEWJDWQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NjDALcEw;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QGqGt7rk;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A5F606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A5F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NjDALcEw;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QGqGt7rk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795179721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g70Sw5KFtXeD1N+klFwavclKwEB2Fifoe4OTNieWl5U=;
	b=NjDALcEw6+ve3MdHzBzBABlg8UHY3+Ks/3Yt/FDAE8BGEPunSsm7mgcDhG/aqi76Sts7Rq
	8XSct7V4e6NFyoTxsQKNeUGT2D228EEwNSj8xYwfGLhr02L9W+9BmDWocGqVGrrX5HGASi
	f+e454nyZpHELDN4EK+i0miHdWT/0mc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-pdzLERwdPKGRxsV9Pwk1ng-1; Fri, 20 Nov 2026 13:02:00 +0000
X-MC-Unique: pdzLERwdPKGRxsV9Pwk1ng-1
X-Mimecast-MFC-AGG-ID: pdzLERwdPKGRxsV9Pwk1ng_1795179719
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e011829easo487019f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795179719; x=1795784519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g70Sw5KFtXeD1N+klFwavclKwEB2Fifoe4OTNieWl5U=;
        b=QGqGt7rk5Ng6JlAsaTNOvWe+J8Rgzi5PgGQtc3IWAnItrDhj5780oDNb76aTbg871c
         s7YqpOhKwWMxZGMw7sGNPNoI15yVR0kJkICC3CzE9fsodeUuRJEPcOdeDE6kekLrdSYf
         L+u+4qQgGkO2C33ADNlPgyrDV53+xlIVTDchB/r0j3exZl2P0X95UUN+b+NGD3kTglE+
         kFnxDo19biZd2w3WuM1CpVtiQyi0fJdpNFxQyZNBHzZ7huRP/kWVBflakONF0UpEktBR
         mXoYJvLmISLrgP2C6Q2ifqJRGNrpxxl+rPHZh+WJkZKKrAmU+bN7dasHWR9Qd3LyTQFi
         5Yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179719; x=1795784519;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g70Sw5KFtXeD1N+klFwavclKwEB2Fifoe4OTNieWl5U=;
        b=LZli0m0QrPl+yNevrEZbOkqMb8QKXJHenQaJRcjb3oJvdMWsg+9a3YK/kFNtWs4Oon
         m1WCWh2dovYz2qr424auuu64wvREnlbcre1PQV22jDH0ZW28NrtcwMK2SNY6O1do4L6V
         VxyKVIit4IfPjWd992VxLB8N7K58gTiITAbKt78CBmRSKazwnPgK2c49uaAq4Q8VygS3
         kmzTb3IihsjOBLO3VQCOVG8uEv3iiTUZ6QpqjZ3mVzBIDNCi8BJjHqvTZwpExfVLYPuR
         nPbY1GxwBaPdprbhhQl+wTYMYh11u99cTMetFQJwp083koutzuBxv79UDi66seEQFo90
         QCrg==
X-Forwarded-Encrypted: i=1; AL+hErGeiYnX/XAXQPZxwwC8f7jEctdPax5/CY6nHoZCMm4dHB3X1pGW7pR25HfcZf3QVVYy8MGtceSngbwbQdU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UOQwFEM2178CTqxrVmWv14xyuDN24UWIVoRFWjIKMrq13h6aI
	bt1+bXjftBTpnpHS+GOQJBlHnwVrhHlH1K4fupouuV0IiCs7FC4DUbK72cOe7vupDaufb1YzLRh
	CYV3FUTwVPqQS4Cu24ZSots/RoYfTAAq8olhBjLQ3XTxluAZlPtaLd7SJJEccLBvmng==
X-Gm-Gg: AZFdTZeIEfIr3pJkcizOl328u4C6GZIP4GXDnqHIIgg7LaLiHXV8SFTuKDwZevLZU5D
	WgaYIbfysoBdC1GXNKPtOnQJq2EuK8w9qJEO5kWadAZxERtckv1xZQ8bv855KahXgG1aNzLjx7T
	7Yh/mrpX+2rGGReP4z5hgFa6rSG/gfowKyMkYhUAa37FEltH2stjVHk9ClwwXkxLFV41E0ngiK6
	ZZ1mcKb0f5O5E/j8uCEZd+Fj5zSruzXJKdEyUPxfV18DxlYkkC53JutU3liJU67XQD8PG/QT/fY
	AIvV3WbxeImWR83s0Xm5e1+TP7rP+R0RHNI/MzR36hT5IW5IHdcZDezbBJykEyjpefk6iko6Skm
	CeDql0rCVk20YkJe6TGsUUwzrDniWcWJfsCECvI0cL62HODxsGpojZtJr2TUC0n/5vqTHfUHBkd
	rWHik=
X-Received: by 2002:a05:6000:616:b0:4a6:e1ed:771 with SMTP id ffacd0b85a97d-4abb5db73c9mr6914886f8f.34.1795179718869;
        Fri, 20 Nov 2026 05:01:58 -0800 (PST)
X-Received: by 2002:a05:6000:616:b0:4a6:e1ed:771 with SMTP id ffacd0b85a97d-4abb5db73c9mr6914801f8f.34.1795179718334;
        Fri, 20 Nov 2026 05:01:58 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm5512771f8f.56.2026.11.20.05.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:01:57 -0800 (PST)
Date: Fri, 20 Nov 2026 14:01:55 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	tglx@kernel.org, will@kernel.org, boqun@kernel.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	luca.abeni@santannapisa.it, mathieu.poirier@linaro.org,
	longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org,
	hannes@cmpxchg.org, mkoutny@suse.com, shuah@kernel.org,
	bigeasy@linutronix.de, clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v5 10/17] sched/deadline: Fix an overflow of the 0-lag
 time with long periods
Message-ID: <awBEww33F6yn0MBO@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1795115075.git.mathieu.desnoyers@efficios.com>
 <2be3813af9e997f5f7d9d3161d0b65b8d4ab917c.1795115075.git.mathieu.desnoyers@efficios.com>
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
In-Reply-To: <2be3813af9e997f5f7d9d3161d0b65b8d4ab917c.1795115075.git.mathieu.desnoyers@efficios.com>

Hello,

On 19/11/26 14:07, Mathieu Desnoyers wrote:
> When a deadline task blocks, task_non_contending() computes its 0-lag
> time:
> 
>   zerolag_time = deadline - runtime * dl_period / dl_runtime

...

> +	 * The 0-lag time is the deadline minus the runtime left, scaled by
> +	 * dl_period / dl_runtime. The product of the runtime and dl_period
> +	 * can overflow s64 with periods of a few seconds, so multiply on 128
> +	 * bits. Compute the 0-lag time relative to now.
> +	 *
> +	 * After a change of parameters, the runtime and the deadline stay
> +	 * those of the old parameters until the next period. The 0-lag time
> +	 * uses the new dl_runtime and dl_period. The runtime left can then be
> +	 * far above dl_runtime, and the quotient too large for 64 bits. So
> +	 * first compare the runtime left with the runtime that the new
> +	 * parameters give until the deadline:
> +	 *
> +	 *   (deadline - now) * dl_runtime / dl_period
> +	 *
> +	 * If it is larger, the 0-lag time has passed, and the bandwidth is
> +	 * released now.
> +	 *
> +	 * The runtime is negative after an overrun. An overrun lasts at most
> +	 * about a tick, unless the CPU stalls. After a stall of seconds, with
> +	 * a long period and a short dl_runtime, the 0-lag time can overflow
> +	 * s64. It would be centuries away. In that case, release the bandwidth
> +	 * now.
>  	 */
> -	zerolag_time -= rq_clock(rq);
> +	left = dl_se->deadline - rq_clock(rq);
> +	if (dl_se->runtime < 0) {
> +		u64 room = S64_MAX - max(left, 0LL);
> +
> +		if (-dl_se->runtime > mul_u64_u64_div_u64(room, dl_se->dl_runtime,
> +							  dl_se->dl_period))
> +			zerolag_time = -1;
> +		else
> +			zerolag_time = left +
> +				mul_u64_u64_div_u64(-dl_se->runtime,
> +						    dl_se->dl_period,
> +						    dl_se->dl_runtime);
> +	} else if (left < 0 ||
> +		 dl_se->runtime > mul_u64_u64_div_u64(left, dl_se->dl_runtime,
> +						      dl_se->dl_period))
> +		zerolag_time = -1;
> +	else
> +		zerolag_time = left -
> +			mul_u64_u64_div_u64(dl_se->runtime, dl_se->dl_period,
> +					    dl_se->dl_runtime);

Nitpick-ish, feel free to ignore: the logic is right, but it took me a
while to see which inequality each check stands for, and I fear the next
person looking at it (future me included) will have the same problem.
The multi-line branches also miss the braces the tip bracket rules ask
for.

How about moving it into a helper with one early return per case, and a
comment in front of each check saying what it compares? Something like
the below, on top of this patch. I don't think you need to respin the
whole series in case it makes sense, maybe just an updated version of
this patch will do?

Either way, you can add my

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri
---
 kernel/sched/deadline.c | 117 ++++++++++++++++++++++++----------------
 1 file changed, 72 insertions(+), 45 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 63890866dd0c7..eab354e15acbb 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -377,6 +377,76 @@ static void dl_change_utilization(struct task_struct *p, u64 new_bw)
 
 static void __dl_clear_params(struct sched_dl_entity *dl_se);
 
+/*
+ * Return the time from now to the 0-lag time of @dl_se, or a negative
+ * value if the 0-lag time has passed.
+ *
+ * The 0-lag time is when a task running at its reserved bandwidth would
+ * use up the runtime it has left:
+ *
+ *   0-lag = deadline - runtime * dl_period / dl_runtime
+ *
+ * Example: 30ms every 100ms, blocking 10ms into its period with 20ms
+ * left. 0-lag = 100 - 20 * 100 / 30 = 33ms. From there to the deadline,
+ * 30% of the CPU is exactly the 20ms left.
+ *
+ * The product can overflow 64 bits, so mul_u64_u64_div_u64() multiplies
+ * on 128 bits. Its quotient must still fit: on x86-64 it traps
+ * otherwise. Usually |runtime| <= dl_runtime and the quotient is at most
+ * dl_period.
+ *
+ * Each check compares against the bound scaled by dl_runtime / dl_period,
+ * That quotient cannot overflow, as dl_runtime <= dl_period.
+ */
+static s64 dl_time_to_zerolag(struct sched_dl_entity *dl_se, struct rq *rq)
+{
+	/* Time to the deadline. Negative if the deadline has passed. */
+	s64 left = dl_se->deadline - rq_clock(rq);
+
+	if (dl_se->runtime < 0) {
+		/*
+		 * Overrun: the 0-lag time is after the deadline, by the time
+		 * needed to pay the overrun back at the reserved bandwidth.
+		 */
+		u64 overrun = -dl_se->runtime;
+		u64 room = S64_MAX - max(left, 0LL);
+
+		/*
+		 * overrun * dl_period / dl_runtime > room: the result would
+		 * overflow s64. The 0-lag time is centuries away, for a
+		 * negligible bandwidth. Release it now.
+		 */
+		if (overrun > mul_u64_u64_div_u64(room, dl_se->dl_runtime,
+						  dl_se->dl_period)) {
+			return -1;
+		}
+
+		return left + mul_u64_u64_div_u64(overrun, dl_se->dl_period,
+						  dl_se->dl_runtime);
+	}
+
+	/*
+	 * Runtime left: the 0-lag time is before the deadline. It has
+	 * passed if the deadline has.
+	 */
+	if (left < 0)
+		return -1;
+
+	/*
+	 * runtime * dl_period / dl_runtime > left: the 0-lag time has
+	 * passed. The runtime left is more than the bandwidth gives until
+	 * the deadline, as a wakeup would find with dl_entity_overflow().
+	 */
+	if (dl_se->runtime > mul_u64_u64_div_u64(left, dl_se->dl_runtime,
+						 dl_se->dl_period)) {
+		return -1;
+	}
+
+	/* The quotient is at most @left here. */
+	return left - mul_u64_u64_div_u64(dl_se->runtime, dl_se->dl_period,
+					  dl_se->dl_runtime);
+}
+
 /*
  * The utilization of a task cannot be immediately removed from
  * the rq active utilization (running_bw) when the task blocks.
@@ -436,7 +506,7 @@ static void task_non_contending(struct sched_dl_entity *dl_se, bool dl_task)
 	struct hrtimer *timer = &dl_se->inactive_timer;
 	struct rq *rq = rq_of_dl_se(dl_se);
 	struct dl_rq *dl_rq = &rq->dl;
-	s64 zerolag_time, left;
+	s64 zerolag_time;
 
 	/*
 	 * If this is a non-deadline task that has been boosted,
@@ -450,50 +520,7 @@ static void task_non_contending(struct sched_dl_entity *dl_se, bool dl_task)
 
 	WARN_ON(dl_se->dl_non_contending);
 
-	/*
-	 * The 0-lag time is the deadline minus the runtime left, scaled by
-	 * dl_period / dl_runtime. The product of the runtime and dl_period
-	 * can overflow s64 with periods of a few seconds, so multiply on 128
-	 * bits. Compute the 0-lag time relative to now.
-	 *
-	 * After a change of parameters, the runtime and the deadline stay
-	 * those of the old parameters until the next period. The 0-lag time
-	 * uses the new dl_runtime and dl_period. The runtime left can then be
-	 * far above dl_runtime, and the quotient too large for 64 bits. So
-	 * first compare the runtime left with the runtime that the new
-	 * parameters give until the deadline:
-	 *
-	 *   (deadline - now) * dl_runtime / dl_period
-	 *
-	 * If it is larger, the 0-lag time has passed, and the bandwidth is
-	 * released now.
-	 *
-	 * The runtime is negative after an overrun. An overrun lasts at most
-	 * about a tick, unless the CPU stalls. After a stall of seconds, with
-	 * a long period and a short dl_runtime, the 0-lag time can overflow
-	 * s64. It would be centuries away. In that case, release the bandwidth
-	 * now.
-	 */
-	left = dl_se->deadline - rq_clock(rq);
-	if (dl_se->runtime < 0) {
-		u64 room = S64_MAX - max(left, 0LL);
-
-		if (-dl_se->runtime > mul_u64_u64_div_u64(room, dl_se->dl_runtime,
-							  dl_se->dl_period))
-			zerolag_time = -1;
-		else
-			zerolag_time = left +
-				mul_u64_u64_div_u64(-dl_se->runtime,
-						    dl_se->dl_period,
-						    dl_se->dl_runtime);
-	} else if (left < 0 ||
-		 dl_se->runtime > mul_u64_u64_div_u64(left, dl_se->dl_runtime,
-						      dl_se->dl_period))
-		zerolag_time = -1;
-	else
-		zerolag_time = left -
-			mul_u64_u64_div_u64(dl_se->runtime, dl_se->dl_period,
-					    dl_se->dl_runtime);
+	zerolag_time = dl_time_to_zerolag(dl_se, rq);
 
 	/*
 	 * If the "0-lag time" already passed, decrease the active
-- 
2.56.0

