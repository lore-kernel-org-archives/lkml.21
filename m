Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645526;
	b=V+GRkPqjIRqFsI9eLr3ngTYoXakzkFsTcJc/v28YftYiPQjvaaQlnxbrZmLTLFbth+0R
	 0/BW9S7tpxBc+Y1cyIVWSnvr0NOjwnwuxAO3mQGteUSPEnYpSlBaWIdviHt7jA53KAym8
	 VoJX5FWZB0F0lf7br0juKtbB6kQtp2IMigE2HxQ2MVYB9adzE30fd9KpQu6IMF9+WQI9J
	 jRL1pHpEcFRRygCrhZNro/jOZWvYI2vOAJ2hQt8A2WaZIhM3j6T/q06zxVfUzVWBQM3Pb
	 kc+5YYQQeZkuMgXY06A6cxefoJHk7icz12VsDv05WEwXXFmPSDnhRAvYUPcEG4W5gLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645526;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uZqqyz4G+aHvGtB6OLCEgYUuHwXaWhovUjvOK2WiF7U=;
	b=ucNQ6iV6SoCHPdzisCfA7W/WBW9o+uOjbm7PgbOnpisdxRzio1gY66sGnEOBVyodwISc
	 1P+h7b5boLIbkfjMRcT/0iL48rGP+J+qzauirM2CQFoa1Or0hu4ciubp0EbRjOUUypTI3
	 /KLIl3qTkzMAoMuI1oXeL+udafvjfY0Q1haEfbIgIWcgBN2wIpZQHAdxO0qBK794psZvj
	 g4C/2QBi3T9oUqRhM9DgAyoNP9P6324jvWZeSelVP1nR92EHxqNQiAZQ3+pKZm2HFWKCy
	 AostW2iAH46DevJO8L7Ce35/VAzalu02/JH+Bg597mXuAOYUgyNRQvlTu1FHPQnFVIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BJc/f0br";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114B6606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJc/f0br
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7961F000F0;
	Wed, 25 Nov 2026 22:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645525;
	bh=uZqqyz4G+aHvGtB6OLCEgYUuHwXaWhovUjvOK2WiF7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BJc/f0brc7zMWL9zoONnTjegWWjo0k5kyd7qF52hzmaiU4L7frn1HAvW7mCH7N5cn
	 9C2yUozSMWF9mpPfUOmwTLXgHhB8jIIdbPaDJhrF0r8cM5sbDAZ7aL4kDyooRAKOAm
	 Kwf6p6zr7vXCVwfaYvPO6SiMJvRpEqqszpd80uF+Os5nGMK6M1GB7MwwYGx8hbCsfR
	 aC/IhrWjmZ6v2JKFQrPQ143Nf52I1sVh/6ockD8K402GAPVJ83zISf3X7fkSsP1xri
	 Ke1oFC+xj23ftQHmh7hoonESnUqA3/+deI2nPcxzFyOFk4s/otRr2vjVGhAYUXofUr
	 +XKtC5M2UrzPg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Ning Sun <ning.sun@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	tboot-devel@lists.sourceforge.net,
	x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 46/47] x86/boot/tboot: Move CPUHP_AP_X86_TBOOT_DYING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:29 +0100
Message-ID: <20261125222230.22508-47-frederic@kernel.org>
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

tboot waits for all previously outgoing CPUs to be in Wait-For-SIPI mode
when the last secondary CPU goes down.

Although the expectation looks strange because the number in
ap_wfs_count should only match tboot->num_in_wfs + 1 at this hotplug
stage, anyway the CPU can run this wait loop while the other online CPU
is running concurrently.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 82943ec3ba28..995b235da733 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_TICK_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_X86_TBOOT_DYING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_TICK_DYING);
+	WARN_ON(st->state != CPUHP_AP_X86_TBOOT_DYING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1

