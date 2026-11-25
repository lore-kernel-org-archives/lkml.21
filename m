Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645513;
	b=XbqVeZtU0uu378nSaTzSfhd+KTMGIvCcOpTyHWHP35OL7ThHokUVCFmPaE/4NvYg/ljo
	 wgIpLMpff7Hj+SdAJtADuW8svT0+phnyIuvSOi99/mz2ZPCQAEmTdzjhNd51XjzRIGKGF
	 Dcr8neijK6vvBQszYXr15k918By7yLpDpExQuJ6mKtZzLpN3syUnBgC8J3HNNsWGlTAVB
	 fOqNAd1Gc+yHYXJiQymH1YbJ46qen4I92v4Q9I5OvKVP1SqOYYtDETmZQPcGAAuBSvwtD
	 WbcMfA3rE6k6SXfJePzij5OUZTxiBD8iAe6N7kPLCS/RmGmvOr6QaJKB72hQqe8QvWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645513;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=I1AusMUC5SVI2qUEpxi/1UNrj+udDe4h/+SkWD2K+8g=;
	b=OOEbR6LN5lwszoBzK0dpAH98+bIAKM4ZqInwREHri0M+oyEPdYVcr1QD5BQiVlAOgIwl
	 xWif64+MAfliL7abLtS11jOhywZBQ+20F023xKvbtN6ufwgZRRtlt7dOgZ5IHpk7vzKBH
	 TWEEUC1wSqHD5alhLyGKp3xYUJQ1OG002u8wGwQ44nJH6hxCDXjHMTD2241KFbnYKBgdh
	 JhKQ86w4aJJd8eSp+vWrvc6CasTU5vlsOCp79E8Ul6BBdCG2GClbbdSck7s0U71Q9l34j
	 5pO271rFRL97T972cLbOLmMnd/9OsjFCk7lmBxmzr1tV2t5tENjL+io5r2DOhM6o8/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PpUEJiEh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CC9606A6BD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PpUEJiEh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DCC1F000C0;
	Wed, 25 Nov 2026 22:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645512;
	bh=I1AusMUC5SVI2qUEpxi/1UNrj+udDe4h/+SkWD2K+8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PpUEJiEhaxHm71BmGcy8j2DD2paRvgrUre9mZ4vfD39lhWkNqqE+Ay7CI0FnpDiVy
	 5gSBE29o49g0UtGdECbxa7wFjNe/vLH447IdY6TNPfm47Wl3MtEPx50GIGHtiDzHQk
	 a/qm51EE9LlSAqJu8Gc5OzuviCQU8ixZnSl1JoMgYS4B/SgzlctixrJlaiVA32J9oR
	 3e6iKic+Pu1YdEruSHY9jHOFyJtDq/FbknaGgJZkRR0Q8fXjDQGEWS9wK5KgLVkFqS
	 HMBM1oK3TRO0CC82VJe/958BbzeVisdw96knjpEVMVrz6vKGtOWaEQwp8V8kz9Nrwc
	 ECvSyDg658+0w==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 42/47] ARM: xen: Move CPUHP_AP_ARM_XEN_RUNSTATE_STARTING and CPUHP_AP_ARM64_ISNDEP_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:25 +0100
Message-ID: <20261125222230.22508-43-frederic@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125222230.22508-1-frederic@kernel.org>
References: <20261125222230.22508-1-frederic@kernel.org>
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

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while temporarily stopping/pausing all CPUs
in the system. This doesn't mix well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

None of the states here have a teardown callback.

Move them to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 5c84a39f6f06..f1672902dd2e 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_XEN_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM64_ISNDEP_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_XEN_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM64_ISNDEP_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

