Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622159;
	b=OaoZVdjpLPOc2YxIXrxnr8DymIc9iDuc+GRoxQXSullIuXeLGYHrY+NLQTZkNM3Daj7G
	 sYGvNeQZYn1aETAXhFjA2lSGUKukFtiqcvK1g+HJxhu99pXFrNhUFph0UmLq7ajPRnCRI
	 /fWnh772Aly1KGD/rgENmrRTp2UT69RmjZziE+Uc9e1WZ6s1NP8cRnW/nlx/bINYlWRMr
	 b4SJYxfaqr2dD3arXhEN7jyuVFPxUysmqvhfokdej217+dhZ+r1CGwcpHYZRehMRDcovm
	 h4wrEk0EP783lDFSHQMPnDSLT1MB2dFNsG71NHrzNgZzmlkylDsRpYF0zOI9H3b9deA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 References:To:Cc:From:In-Reply-To:X-Forwarded-Message-Id:Content-Type:
	 Content-Transfer-Encoding;
	bh=ilZkP46cGSi8xAEGGltwn2YY6bly9+EZHVBMEUvniWk=;
	b=34Lxoh3vplJplKr9MDxjO/fqlnIAKMyXwtEMWODEvUEpV0u6jz3pg09WSObpQUmCC0cF
	 WI9r3+OxaBI+FdoZKWutFg7r8XN9NtVoIwEVY2xGrS3JUDA49OLU2kAv4Cr4TujlrLtq/
	 0+zOTV8mcpr5R4m41VytucULkRfNx2AXfTgHlqcKEE/oOU/63CeVS0LeJohsSkz6AZ0Re
	 lugj9jdjlbnTLM8WbmXLcjv6XN1QhsMqazdequXpJS3bv4tEGsIdf6JiDrWqcTdByIOEO
	 ilKNQlpLSS/1Wg8RaNdgYdjrY36dxNqNkdYBwefqUZyxiPZjm/NYLXGFjRURkPBN+dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uSlRORf8;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C000606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C000606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uSlRORf8
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so3661854e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795622157; x=1796226957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc:to
         :references:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilZkP46cGSi8xAEGGltwn2YY6bly9+EZHVBMEUvniWk=;
        b=uSlRORf8ExuxpyJIwcUhsRRH5J6QPUEbQQ99xTAREpbN0KtRfRaOaGC4PUDA7uHNBF
         S+M/De1+cqVSH0Ow0+7Ah+VOMRDUihHp6N4e+cUYVqyN+lxbixIzLo03PTkOCxsIXrPC
         1ODK12opotIo2lKXXoYVXvn4I+WDlh0UbEl/MOMQ1qRbQi4InMvOgCQ/1o4Q5uf5DzEU
         XWmun47m3RmqVCgqz8eFoW0sD6qE8Q3sIsRIfUZ+ofIqOpLYywBIBxb8VoY4V8jOgD8f
         uqqI3A7w/A/FZdJlLp2MP+z1ys3xbqcRO8lIx1r0Up0FFGE/IUdAGoJsuPG8F7HN2lGx
         msNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622157; x=1796226957;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc:to
         :references:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilZkP46cGSi8xAEGGltwn2YY6bly9+EZHVBMEUvniWk=;
        b=em0x9vrRxcc+eEtKO0ta97yvWkZt1Ut+OjQ2sVNZy2Wp9HJlDOOCuWfXiGchYsEx+W
         dsLjFDV/yUQoDorgChsQJlYPwVEZjkoCnxe0uArUJp9OLlBAN3dOzhSYvswqJL4CzUID
         36gZfjegMkfbxbXwG7vi7HAm/w6IKgeK6TycZeQf1qKiKJoQSIxbWYuXIPWnfK2+qwsq
         ljkoh/IwYqO8XU+/U3Em8sReeTgLQBnqdPTUlZDDrimbrLVZPmBvhruVuc1aUpyFoHqA
         MgabN6YYERzGCIl3Y4/HJJJY+xFRH4kd8BsTmWCedpleyoZpgrjBnj+oWlDHwM9RQNnA
         r/xQ==
X-Forwarded-Encrypted: i=1; AL+hErFTt6/fezc1nUuryE3TKhoXLGzBMgjQp2oFSd0iTCHj20ZFxq8fwYhSDOO1mzQgV5mNBCf7Hl7nOlgbmIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KERLqyG1BJc29XsBByw5BQeL9pBc8R2A0iwrHVu66/8gkciqe
	P89o2RX9auI90wg0ZO0eHIsiqjLDGNy87lZNwfGKhbrHYBkbF3HiG3hI
X-Gm-Gg: AZFdTZcVDze6QJD5un55yZjptNnCuKOqTq3STke3Ig4+SN9psDAZpycwHZR3RPdOSDU
	mQGD6OewDIwHjcoMKtFTaLe7TVSgcLLpPboTGguVTOs0rzaKL+tBZ7YVWoya+Crl+NaIVtwsFuk
	doYfDYxVC5HVrDFnoST6Pwi6axwWWuoqphU2MH7QYsWsUdg824s+HtmXpcG6FGsEAk9sauxWnfJ
	GWgHdk7jL1QmtRryFHHrIU67bZkwTbQvGhXpUk7XVd6/pTlYZ253qlYWoSsoAbRkFG1U2Io83aF
	J0gRfP6OYdHanv19yK5VTgDcASOZZdhVXd7eUd+4CGiF8895xeWWL8aVK/tGdztgI6SPqDCA5u6
	+ssfuADT10H286wRY/bxWEMdQcEwmXyjNEvrxO8Mh8HyqbyA4wB/qqhR6cWIH4vMxLSInd4AgMH
	WwiJO69DarrIYz+gB6D/z/o5CYZFWZ3oOhnGGgGLoGqwl7gWIiusC8sS2w8n+G0AqI8CLLkCvCf
	Dl9oJo9hoI0sXqoeTjsVZiKWGYQ5bgZPSzAJBjbBPVBnbi2VMglrkfUcWMgbEw0hLHuKB77MbXp
	zimzjbVE//v6KVhBOb/B5feE31vg7v8sUZxebJr8/zFvi0DEunGRuyH7DfQnW35Onqnh0DZN+8z
	I4KNSDAU=
X-Received: by 2002:a05:6512:3b08:b0:5c1:b29a:1ba3 with SMTP id 2adb3069b0e04-5c1bc7d5ce5mr7526450e87.29.1795622156730;
        Wed, 25 Nov 2026 07:55:56 -0800 (PST)
Received: from [192.168.0.103] ([46.8.6.187])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0776edsm4838279e87.73.2026.11.25.07.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:55:56 -0800 (PST)
Message-ID: <6c943754-05b5-4017-9145-0d145766909a@gmail.com>
Date: Wed, 25 Nov 2026 18:55:55 +0300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] percpu_ref: make percpu_ref_switch_lock per percpu_ref
Content-Language: en-US
References: <01612865-faa0-4fe5-8184-a177f104843f@gmail.com>
To: linux-mm@kvack.org
Cc: dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
 akpm@linux-foundation.org, zhengqi.arch@bytedance.com,
 linux-kernel@vger.kernel.org
From: Egor Shalashnov <shalasheg@gmail.com>
In-Reply-To: <01612865-faa0-4fe5-8184-a177f104843f@gmail.com>
X-Forwarded-Message-Id: <01612865-faa0-4fe5-8184-a177f104843f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Qi Zheng <zhengqi.arch@bytedance.com>

Currently, percpu_ref uses the global percpu_ref_switch_lock to
protect the mode switching operation. When multiple percpu_ref
perform mode switching at the same time, the lock may become a
performance bottleneck.

This patch introduces per percpu_ref percpu_ref_switch_lock to
fixes this situation.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Signed-off-by: Egor Shalashnov <shalasheg@gmail.com>
---
I would like to revive Qi Zheng's per-reference switch lock patch
from 2022 as a standalone change.

Our workload maintains many independent percpu_ref instances and
repeatedly performs kill, waits for references to drain, and reinitializes
them. Multiple CPUs execute these cycles concurrently on different
instances.

All these transitions compete for the same global switch lock.
Reinitialization also clears the per-CPU counters while holding it.
As the number of concurrent transitions grows, this shared lock
becomes a significant bottleneck.

With a module-local adaptation of Qi's per-reference locking change,
we observed approximately 2.8x to 6.5x lower operation completion times
in the measured workload. This motivates using a lock per instance
so that independent transitions can proceed concurrently.

Original posting:
https://lore.kernel.org/linux-mm/20220429133552.33768-4-zhengqi.arch@bytedance.com/

Rebased onto v7.4-rc4 with an explicit spinlock_types.h include.

 include/linux/percpu-refcount.h |  3 +++
 lib/percpu-refcount.c           | 30 +++++++++++++++---------------
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/include/linux/percpu-refcount.h b/include/linux/percpu-refcount.h
index 1e3212e..4582e79 100644
--- a/include/linux/percpu-refcount.h
+++ b/include/linux/percpu-refcount.h
@@ -53,6 +53,7 @@
 #include <linux/atomic.h>
 #include <linux/percpu.h>
 #include <linux/rcupdate.h>
+#include <linux/spinlock_types.h>
 #include <linux/types.h>
 #include <linux/gfp.h>
 
@@ -109,6 +110,8 @@ struct percpu_ref {
 	 */
 	unsigned long		percpu_count_ptr;
 
+	spinlock_t percpu_ref_switch_lock;
+
 	/*
 	 * 'percpu_ref' is often embedded into user structure, and only
 	 * 'percpu_count_ptr' is required in fast path, move other fields
diff --git a/lib/percpu-refcount.c b/lib/percpu-refcount.c
index f8d9068..5d46602 100644
--- a/lib/percpu-refcount.c
+++ b/lib/percpu-refcount.c
@@ -36,7 +36,6 @@
 
 #define PERCPU_COUNT_BIAS	(1LU << (BITS_PER_LONG - 1))
 
-static DEFINE_SPINLOCK(percpu_ref_switch_lock);
 static DECLARE_WAIT_QUEUE_HEAD(percpu_ref_switch_waitq);
 
 static unsigned long __percpu *percpu_count_ptr(struct percpu_ref *ref)
@@ -96,6 +95,7 @@ int percpu_ref_init(struct percpu_ref *ref, percpu_ref_func_t *release,
 		start_count++;
 
 	atomic_long_set(&data->count, start_count);
+	spin_lock_init(&ref->percpu_ref_switch_lock);
 
 	data->release = release;
 	data->confirm_switch = NULL;
@@ -137,11 +137,11 @@ void percpu_ref_exit(struct percpu_ref *ref)
 	if (!data)
 		return;
 
-	spin_lock_irqsave(&percpu_ref_switch_lock, flags);
+	spin_lock_irqsave(&ref->percpu_ref_switch_lock, flags);
 	ref->percpu_count_ptr |= atomic_long_read(&ref->data->count) <<
 		__PERCPU_REF_FLAG_BITS;
 	ref->data = NULL;
-	spin_unlock_irqrestore(&percpu_ref_switch_lock, flags);
+	spin_unlock_irqrestore(&ref->percpu_ref_switch_lock, flags);
 
 	kfree(data);
 }
@@ -267,7 +267,7 @@ static void __percpu_ref_switch_mode(struct percpu_ref *ref,
 {
 	struct percpu_ref_data *data = ref->data;
 
-	lockdep_assert_held(&percpu_ref_switch_lock);
+	lockdep_assert_held(&ref->percpu_ref_switch_lock);
 
 	/*
 	 * If the previous ATOMIC switching hasn't finished yet, wait for
@@ -275,7 +275,7 @@ static void __percpu_ref_switch_mode(struct percpu_ref *ref,
 	 * isn't in progress, this function can be called from any context.
 	 */
 	wait_event_lock_irq(percpu_ref_switch_waitq, !data->confirm_switch,
-			    percpu_ref_switch_lock);
+			    ref->percpu_ref_switch_lock);
 
 	if (data->force_atomic || percpu_ref_is_dying(ref))
 		__percpu_ref_switch_to_atomic(ref, confirm_switch);
@@ -308,12 +308,12 @@ void percpu_ref_switch_to_atomic(struct percpu_ref *ref,
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&percpu_ref_switch_lock, flags);
+	spin_lock_irqsave(&ref->percpu_ref_switch_lock, flags);
 
 	ref->data->force_atomic = true;
 	__percpu_ref_switch_mode(ref, confirm_switch);
 
-	spin_unlock_irqrestore(&percpu_ref_switch_lock, flags);
+	spin_unlock_irqrestore(&ref->percpu_ref_switch_lock, flags);
 }
 EXPORT_SYMBOL_GPL(percpu_ref_switch_to_atomic);
 
@@ -354,12 +354,12 @@ void percpu_ref_switch_to_percpu(struct percpu_ref *ref)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&percpu_ref_switch_lock, flags);
+	spin_lock_irqsave(&ref->percpu_ref_switch_lock, flags);
 
 	ref->data->force_atomic = false;
 	__percpu_ref_switch_mode(ref, NULL);
 
-	spin_unlock_irqrestore(&percpu_ref_switch_lock, flags);
+	spin_unlock_irqrestore(&ref->percpu_ref_switch_lock, flags);
 }
 EXPORT_SYMBOL_GPL(percpu_ref_switch_to_percpu);
 
@@ -385,7 +385,7 @@ void percpu_ref_kill_and_confirm(struct percpu_ref *ref,
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&percpu_ref_switch_lock, flags);
+	spin_lock_irqsave(&ref->percpu_ref_switch_lock, flags);
 
 	WARN_ONCE(percpu_ref_is_dying(ref),
 		  "%s called more than once on %ps!", __func__,
@@ -395,7 +395,7 @@ void percpu_ref_kill_and_confirm(struct percpu_ref *ref,
 	__percpu_ref_switch_mode(ref, confirm_kill);
 	percpu_ref_put(ref);
 
-	spin_unlock_irqrestore(&percpu_ref_switch_lock, flags);
+	spin_unlock_irqrestore(&ref->percpu_ref_switch_lock, flags);
 }
 EXPORT_SYMBOL_GPL(percpu_ref_kill_and_confirm);
 
@@ -416,12 +416,12 @@ bool percpu_ref_is_zero(struct percpu_ref *ref)
 		return false;
 
 	/* protect us from being destroyed */
-	spin_lock_irqsave(&percpu_ref_switch_lock, flags);
+	spin_lock_irqsave(&ref->percpu_ref_switch_lock, flags);
 	if (ref->data)
 		count = atomic_long_read(&ref->data->count);
 	else
 		count = ref->percpu_count_ptr >> __PERCPU_REF_FLAG_BITS;
-	spin_unlock_irqrestore(&percpu_ref_switch_lock, flags);
+	spin_unlock_irqrestore(&ref->percpu_ref_switch_lock, flags);
 
 	return count == 0;
 }
@@ -465,7 +465,7 @@ void percpu_ref_resurrect(struct percpu_ref *ref)
 	unsigned long __percpu *percpu_count;
 	unsigned long flags;
 
-	spin_lock_irqsave(&percpu_ref_switch_lock, flags);
+	spin_lock_irqsave(&ref->percpu_ref_switch_lock, flags);
 
 	WARN_ON_ONCE(!percpu_ref_is_dying(ref));
 	WARN_ON_ONCE(__ref_is_percpu(ref, &percpu_count));
@@ -474,6 +474,6 @@ void percpu_ref_resurrect(struct percpu_ref *ref)
 	percpu_ref_get(ref);
 	__percpu_ref_switch_mode(ref, NULL);
 
-	spin_unlock_irqrestore(&percpu_ref_switch_lock, flags);
+	spin_unlock_irqrestore(&ref->percpu_ref_switch_lock, flags);
 }
 EXPORT_SYMBOL_GPL(percpu_ref_resurrect);

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
