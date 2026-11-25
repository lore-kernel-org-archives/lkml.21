Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645382;
	b=mLJz8KDVhg1Ydnj+F3kk2GIy0T0tW1INbhzt82sZE+zY/eg6iEPaQQ6oy2jw81XbAgsj
	 LpflRONNo7WB8GgnG1XB8uqfJOFJo5tXPSSp5OZMB9ag0W2g2kQBlsV2ReUzzH1wdc2Bb
	 LpHr9F6/4Te2nEC/UJ/jfw+iiNSChWKXI9T6mQWsR14W0+zNoYi7LGkfTpfNXy/YGkb4D
	 mfx+UedIgttUVnxNoHmjNFk53hsyveO7znySsa+lmyILowHolXISWsD3kEmrwbbx2K3AA
	 E9XwAJE+ckz1Tl1zwMZmfTSyOAYFHaByBpt4jJAxnkbpu1MDuDu2SMRCXGg1mga5qgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645382;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=r7eUaTnWbW2BvWRMxbh7jxrAwYjypRP6/USaM3f8jSc=;
	b=v/SP98QnfF9TfNOP4HK7f7nBMJGfBLxWGib9NrNpju/h3oowyBuS5cHnBry5jUs+ri0z
	 h8Kx+e4HlMNAOEtVdBK+dRLHcRmZTsH7DnpG9PUwxK3eKexH+KZ5uVZerUxX10rshJsM6
	 d0qL/LpU9rYjW7bcQi/DQj5a+jNFGSvFTQe528zZKHvD8IQeBHl6CzQS5ZrYNf1okEeRO
	 Rt4lTZXLJs5Eo/yLk/myDag/Zt8UFoc+2Ua9Bo59caWE1CaUteakYqEfrkCKeUbpJS6vH
	 4yzjfu5nJ4sEhu3x6geCIj8FErQm/TSQlERhKxlEHqupVo7hW93c5qNOIQWknyora3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lE6b9s1J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA52606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lE6b9s1J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF201F000C0;
	Wed, 25 Nov 2026 22:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645382;
	bh=r7eUaTnWbW2BvWRMxbh7jxrAwYjypRP6/USaM3f8jSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lE6b9s1JOiMcuk0tl00ORQIVp/TqENoNenSc4MHhpzL1/mh/B9Fcex4T3YHvnwQVP
	 BsS9AOq0FSojdESCRxM4ohPebxnm0Y/4EjEsernBhblYeHJ7PpBl7aQ1Iy61vD+RW4
	 Ry6ZH7TPTSGhmv031pJrz5Pabp+TRRB3tZy1vFozj/gyCBteaSKPQ/V5vhs+XRh2V2
	 vUtGS1t630PkCAqfDRh+JStGxDwbllxj9wEAkkrjhLiMZs9RkuhqnHaXPgh4GLTZkf
	 Wp+9MFp/USt5oYoJWx9uyfy9dumWGlXK9LJd47LWvMEN3fEdYQkP5rnlBuLWP9uiGy
	 7+9+yfIaWHUHA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 07/47] irqchip/bcm2836: Move CPUHP_AP_IRQ_BCM2836_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:21:50 +0100
Message-ID: <20261125222230.22508-8-frederic@kernel.org>
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

The teardown callback here just masks the per-cpu IRQ in the chip and
shouldn't race with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index cb0eb71c27c9..2e162425bfc7 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ARMADA_XP_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_BCM2836_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_ARMADA_XP_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_BCM2836_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

