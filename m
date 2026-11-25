Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645529;
	b=ySUJGZQM2Nx+Cbnq72Fme+9rX9pCI4dqAeJs8rEdxNMTiz7aOps2jYOgr9hJr5M7sbFm
	 XJ4R16A5eEYk4dakSHPzJ04YOOKOjNpLnf4rTy1YfOL0gCho7AfPjyluiQ6g9r9F5cHwC
	 HBXrOjnzj6RvM+v8fbHbbivNDKYrEXV5JCDnRut9KQp8AMHTdpmKN+Zk/juqH8EXuX3tb
	 W0llxYC0+Tai8S6eTJgvSZ5nypI1HCZFiccK6uJGFiOgqlU42pkiIOM/6+fdnK010+ITl
	 WeLoe7vLXD88qUsLgbToOw3utknxpCf4dZ6dqvpPUfipoX5ymnXZJ3DnEfSB+cUkzTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645529;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lHoHk2U63tuVbXYVJ6ly2MxEK1hCYOE/OpziBb0FweY=;
	b=wSfsjHh8siuCxsKh8xlZJGp4HnsEQB6Y+563nudOg/uADqHl7wY80scHuUQw2OHKJCrO
	 bGBZIPlkx2qLoeXie0Y8w6it0okfhJ1cD6PTy6Ja2lNuuwdfEBCKKgxuA8z5cjkpnNG26
	 33OkWKEHY9j1km+oaXHSCtA0JktVJjePVzzLeDsJLP5XNWGN+nyS4dIf92NCqSZV0icBD
	 ivd8zBFotrCSobuaLnHR/QE2dS3RjUGyF4pSZZJKZsRvkkvf8+2PhWKMtU7LOh3CZRzgb
	 KstBl/DCf/A2/XWmvcvpe9l2XHWIVcaJV4Om48P5Is/WRAEfz0oCGBWTEq6q+z1PKnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYBKCfKf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8900560A262E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYBKCfKf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E411F000D2;
	Wed, 25 Nov 2026 22:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645529;
	bh=lHoHk2U63tuVbXYVJ6ly2MxEK1hCYOE/OpziBb0FweY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eYBKCfKfaB6+Jw0SP+uE5ZH9HWmAXlnysG9i1EjfM3nGu+Ox6ulhJ4C5tBnITX90h
	 S+f0r6bsxxW31cwcW01LRUQWm3Gd5DBpyX7jXgy4D6+wopeGuDq9B74mKLqeV4xar1
	 fU4ofX7AZ3UdGnGDt2A60ivupXemQ/ThzhRRF4j8ilqSCh/B64CjyBTQFAZy+hS3kl
	 oIJGpGILhqzRb7/eU8Vv/OYYt91kK2lpMChP/yAYm63fneXcjahtfcv2rc6e8x2Ein
	 YtOyiIgLYNfqNvmnZ0sfGAeF6bnT7Wqe2RcLJCbUyX85f3AnfUKMLxCsvyiYVr0S6t
	 78rp3Plqw0DsQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 47/47] ARM: mm: Move CPUHP_AP_ARM_CACHE_B15_RAC_DYING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:30 +0100
Message-ID: <20261125222230.22508-48-frederic@kernel.org>
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

It *looks ok* to disable the cache readahead globally while the other
CPUs are running.

Move this teardown callback to post stop_machine() accordingly.

But please double check.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 995b235da733..b6d7a8e70fe5 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_X86_TBOOT_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ONLINE);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_X86_TBOOT_DYING);
+	WARN_ON(st->state != CPUHP_AP_ONLINE);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

