Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183975;
	b=Y6wuH4tX28zB6y+IMRWHncLPuo/HzHzWQ8ZKRNnafEqKi2XuU1MRqxv06oUiMerewoC+
	 Trd6f7lkPIk3+Q3patTOtfP75KZweNw5SS5lnodUV7mYgHRiMC0AahzX8m9J6TlefDr3Y
	 wq2rAA4oMs0bEQC+M/s4S973gt8UvyzIMaXE+cGiaSvthfYGBpaILvfPy7+QRs09HRBMf
	 ECQognA5qp/B1KvEEUheQ0SZJwlNoYURH3c2YjoIAUrJVXFgtqeziyQrFdfJBPFX7NImA
	 tY3wMUhOmLXvydG9vrIPUQqNfU/XPSEkIs042eNCFdXFuAD1IC9FijdKyH1126eKg1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XnW30PHUXx79kYX2nANpqvm3liTJckFdWjtFkWjjHcM=;
	b=jhbyAWC/H6BWscPXljNj4GElbPk190Utaaqjs5Ova9xV9ttBT0T1yLE7YOmJ8U8L7FNg
	 f6GoEbpjhCDa1It0vTApdEZOvZTaj3nrd/Ki1WRMX+5VG5BxoA3a6LJwfMcj0WiY381jj
	 AQa9mO49FaTjuO+MzJyvTUKRQ+ungTMQL/V+NGgrXVYxztZXcw+9zfwcZ7Zvn8EOQbB7y
	 Cfa+ilbJIwHpQmNGEQAG/DLPSMHeO6OZOfMzj/dgP5kSI+Wtb5qQ/OYVupWfhtdr2WjtO
	 SdRZAoLJ/XxRoE9o9SL/QO+pGaiNgDgxa18GnxOxDfoMEFrznZlKuZJqbg28rpx/iaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=fbryqM8l;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C64606A339
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C64606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=fbryqM8l
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-380b40319bdso1181749eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795183974; x=1795788774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnW30PHUXx79kYX2nANpqvm3liTJckFdWjtFkWjjHcM=;
        b=fbryqM8lVgQDXFExdhQngfUbxtvj5ahnnA5Z3NrzcGWbdqu5q0XEgvZz0n65X4+V8R
         vilpZRagp4FlP8ke00DKCTne9lRiJ23lJEmlFhfUZ62zokbUlz4qodmXScg82FL9eN6R
         YRAiL7w0Ee2ju+i9MkvnM02l2B9sKVhQizPms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183974; x=1795788774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XnW30PHUXx79kYX2nANpqvm3liTJckFdWjtFkWjjHcM=;
        b=VeO41EN+iKvjF69DADWmDoXDGYrunKuZBMBqQCltc7U88bFXT6ryqkVu5jE/b/RH89
         7QuYxVc4GbSmm8+PEqsBZEH7sqWF2qKyJUSLMoBy2pSxsv2FzM09YvLHP7pe0hsMrHe2
         OTtQZxD74yZGsU4lvwMZhG3KKwJDTOXD88DmLuZObvD7+XMFNtjphVJQeycyRD2WlNjj
         pl3aLwMb9+EAay1nUYFP7MyTIcAsoxZr0l+UAW6aOqzrV6Zt6Je/TlcyXW2uyxC8MhYg
         Va4R56fIbHCYJ4DSzq71UyVq/GdGVrIngyCLP6mk6hypNj7NFboRvmzCCyrKiBySie4s
         wTrg==
X-Forwarded-Encrypted: i=1; AL+hErHZLq6T8nX5HYpQZFXK/5Qu/MjBDB0cgUV3sUYpq8nzWwa1DFoFprxsNcPG71KWp8N4dwqgs9dU5THwIDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nMImLsKNxawT4YPk5VKR43O7eGxND3KyoU7qilb16G2inWCK3
	0y5fhyG8GHGPngdNrJbKtqKVTMW/KCxy3psIpwZeNrK5irq/15GDYfOizwg5WMkozELQqxQRsOD
	53vKJ7q8=
X-Gm-Gg: AZFdTZdKnOZLoThRiLqZtiEeaabBYor71AGvSP4XscpJc8V9T8HiLtiqEgjrx5ndPEE
	/6K1Kt8yckBjIhvm//mFvXXNSC8+3vwyGFPhPX2/A6S0nMMTkEguvuLA8j53xCAlwlf/PLxEi57
	8WxIODn3jn/9iTpNfHxl79M2gK+7B2/WU9NWdEO5FQsoK51ekDoC4IUFKxiRBTxo5Jd1ETezPrc
	/Ks5Z/TiYWILTY4Zf7OtyVZVkZN1Qw8iNaPwTwwolV3CmUzexT+ExekrldDl+StLLsuDOxgHKiD
	G1GFzB5pbZYv22EGw0DAIseDrTkb7SfbE1xt0FjIkDywt8zUjYyDHL6FiYslD0pYO2ElSa/Tf+r
	5GQG+YMrsKTfL+Ubv6iM1fD3L9Dga3EJMsDSHGBIH2yR2SpXlL+kmuBsH7ClV3MMLvHlM6RK61e
	T4ucWOuNY2aVbFPT16/cxVq6a51X3uLcpLVWxCqxL8YGv4GSi0q+HRgfB6cv5vmnSavk6dzgdVl
	J8u0lnjWWH+f3u33q/jFiH6iqsUMspSpqLnf+Aecosl+rCeWtzGYowOA4ilflzUxZpQHuWdZHA/
	DAwEVrzro9sxxAYXZogZ/wB/PhNIAP1pL3x9v6QwSelhUzjT1BjoNABbwYP/AZjC0EfLE51P62O
	gUfHqjNQwlBY8
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr3279535eec.32.1795183974401;
        Fri, 20 Nov 2026 06:12:54 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm11244434eec.5.2026.11.20.06.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:12:54 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
	mcanal@igalia.com,
	Heiko Stuebner <heiko@sntech.de>,
	Gyeyoung Baek <gye976@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6 1/2] drm/sched: Add drm_sched_entity_get_runtime_ns()
Date: Fri, 20 Nov 2026 23:12:24 +0900
Message-ID: <20261120141225.789350-2-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120141225.789350-1-sidong.yang@furiosa.ai>
References: <20261120141225.789350-1-sidong.yang@furiosa.ai>
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

The scheduler accumulates the time each entity's jobs spend on the
hardware for the fair policy, but drivers cannot read it. Export it so
drivers can report per-client engine time through fdinfo without
keeping their own counter.

The stats object is refcounted and held by the entity and its jobs, so
unlike commit df622729ddbf ("drm/scheduler: track GPU active time per
entity"), which was reverted, accounting a job does not touch the
entity.

Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Acked-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 25 ++++++++++++++++++++++++
 include/drm/gpu_scheduler.h              |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 03e68b4102d5..9b059914556a 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -238,6 +238,31 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
 }
 EXPORT_SYMBOL(drm_sched_entity_error);
 
+/**
+ * drm_sched_entity_get_runtime_ns - Get the time an entity's jobs have run
+ * @entity: scheduler entity
+ *
+ * Returns the time the jobs of @entity have spent on the hardware, measured
+ * from the scheduled to the finished fence of each job. A job is accounted
+ * when the scheduler frees it.
+ *
+ * The caller must ensure @entity has not been finalized.
+ *
+ * Return: Accumulated runtime in nanoseconds.
+ */
+u64 drm_sched_entity_get_runtime_ns(struct drm_sched_entity *entity)
+{
+	struct drm_sched_entity_stats *stats = entity->stats;
+	ktime_t runtime;
+
+	spin_lock(&stats->lock);
+	runtime = stats->runtime;
+	spin_unlock(&stats->lock);
+
+	return ktime_to_ns(runtime);
+}
+EXPORT_SYMBOL(drm_sched_entity_get_runtime_ns);
+
 static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 					  struct dma_fence_cb *cb);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 3b0978fa8cf0..ac632e272499 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -730,6 +730,7 @@ void drm_sched_entity_destroy(struct drm_sched_entity *entity);
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 int drm_sched_entity_error(struct drm_sched_entity *entity);
+u64 drm_sched_entity_get_runtime_ns(struct drm_sched_entity *entity);
 void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				   struct drm_gpu_scheduler **sched_list,
 				   unsigned int num_sched_list);
-- 
2.53.0

