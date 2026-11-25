Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605986;
	b=1A9Ygs9+P4O6fq9lWgNnqxUkh/gNqt+G7Oveh2CjdEf9Voz51bZzY8CbLT/Zg0QW3hXg
	 qh3UaAB7xJE6Llqmp9Dz+M+2UBiPOUGHd4nDbVXDKB4NL5EYHtwuPXWJsc9ToDhTEfdio
	 wrnTrZmcTb5YO/ohpCb1UZZqdZZe1t50qKW3qC+HRTq3gjuRZjXCMRmrMcE9I9ZFINEzD
	 vCFAVt0dQkQZWsbVs8bRKTbcUXYoC7OD/hapndLGsWz5Lh43BAWLlNNta76OIlS7yRshh
	 B4+ExH6LQXw19D9RN3P3fTY4A0dd2p8jN3pf85Hz/8J7WZGjeg4Z9Q0X0TGhXEe4DHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FPpoQE6KUvyWN2jX7u+574bkZWMVb7HlyPTqHT4GBCQ=;
	b=3rh5vyhb/6zu5GKZhA/kTIqU61zXa7AO/oyBH13ZiWpaVyNA56+Ad8x8TROHv1D3Od9+
	 if2MGG3Vp8KyS2Y8M8Fuk5l4kIz9j2uPurTLdwb70meWY42ruVERJk9CgsV3gbKz350Gs
	 wU2D55X8HPdc2eq7F5pwdl5xNhC2zaXYfzHekgQpur7Buq7bqriaxew/pDj46cD8XsyqB
	 ELaAZl8Ac/aG/Xh2asrpq1k8Of+OLlqW+wHjKii+p2bYTuHcx5DNInLTZtiXDq7qKJ9KA
	 o2OGpR44M/F3DRWud7YbinUs/QsKb6fQOTNxmNm5yLKEBMevBl8sNfecsITuQYSd5Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Puer5IEp;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF2606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EBF2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Puer5IEp
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so14339373eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605985; x=1796210785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPpoQE6KUvyWN2jX7u+574bkZWMVb7HlyPTqHT4GBCQ=;
        b=Puer5IEpNe0hOLhrLAeFd7whyqwOxFxxpiWI3U7+E/Q2K7E/uVVcVStw0QGs5LlI6V
         iE+TvplTmpuiBQBLcHL8UyWaKNhW7ZGcbsEZqzbgn+U7MQ0NxykCdSCDplTY8VTz/Sap
         4i/LbTNWu0dE/qU5izHWHeXUzJ7cOsyXNUsUJDssYN+eNgOk1Jg5qCBMGEWGiLAIJe5k
         4TrpvX+bNMsvmlCYe+VyLf+wcoSt+8rJ8NlLLiqj+rSccHyDeqRsHZt8YLMddTKR44W8
         3FrORcJUC58mNzHxxHQ+nVCjoasdhf/2ekrzHq+zEhvUzCT4P7FNbjEwvGQoYVICDnxm
         y5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605985; x=1796210785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPpoQE6KUvyWN2jX7u+574bkZWMVb7HlyPTqHT4GBCQ=;
        b=akw66Eq6JELVgH8K78QParmzzvpUjpuMLoXvIT4y9PUbUOYj1NmVzeuWXGYeedBuAD
         Nvew8dVqQe2SRT2QDB78mvaLdnsMniAJITzPmNTHf0dOAqhQ0AqSJIOGx3O0iI5h5ogK
         buMlj/QSE2F5FmBYMu2yRYvP2NLTY6epgeRvwxkOh0R9i8eDLhWRsLg2lFJcNgyjdFl/
         tZMzhO6OWypZn1KFZZ+0ZUem80hCjM/4zG3r75U3AJJrOS4BIhsi69c15fY2NN4zjhlT
         16sMmr/r0NAEFal1Uxpe6JgB0apjyrYZxiZJepVhqsVDub6ZxyXwkqEjdJiZPA1PJosy
         Qacg==
X-Forwarded-Encrypted: i=1; AL+hErGwOKrNldd+OLHyHaMAJgCs4Lvyf4YoOJ1zfLuPZbDST1h7PdLCb+3zQk9302coSCXi8Oq4rCyJnbvCTS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Jb3/VHwkK0p2asrdHf97eHWYvkeuOTAgcM+rKc3dA5EPGZFwZ
	Z1H7xxyxWPvCxKWbcNAO+r1ansZgzFUbyn25dsFCzg1t/aJ/TNdqs0eo
X-Gm-Gg: AZFdTZdOvignVTf2VCLzFDPLiOqP7VgFy5yEy7sChWbeZwyvXjSU/hwtxNRC8DtR9IH
	8v4gkk6MfYlq3xeshXVxdHjwQ6L1WCEyE6HxRAe3mXniN2rWGqPlWrxxHL7rQVOgqprjc//RkS4
	/trppvMGw91Oc5groWPYLkQyV9Jdv0eZRGo8Rx6AiPBgMoPgzm70mKJ2x6jrtjeEGQMtgi+1BUx
	B0qHVoOTLKrv4naJLctmZlrgZVog8hs1Ar3LE3y7mdq/iIAkaEu9b82dCW3n/JjJKBz5tl7j7zW
	DmdQ10SO/QvXry1leGmSyS6ZNCGG4jtfT76we2FDRbJQeLjn+dcNzX75zMe3AA0S/r8pclfAeD0
	2KmNQwUQANgk9NlptOT5Cv9QOMOTcusgdjlflB+eIiaFjy16lcYXlC+a92ySEpNh7BTfhohw+aq
	OiHi9PU4JWeJm8kM+tiq7nzmUbHglZZXGxazQ7XT7V6TRRy2pu+48I3MACYGDpMYTOuNnA2t0lg
	Z0PvvyydShgNngiKNcVkFsHofxUNc9bW+HmR2U0XzL0osUJzxsLCTX2wWg7LHwmRvQ0anWE5caI
	4tOT9DZCoIJ0mKWmgRxaKtWJMKrrd1qrviGYrDwRivqR3T+YVyjXwIA=
X-Received: by 2002:a05:7301:618f:20b0:386:ad3b:a48a with SMTP id 5a478bee46e88-386ad3ba7cfmr10073158eec.5.1795605984884;
        Wed, 25 Nov 2026 03:26:24 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm11778380eec.17.2026.11.25.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:24 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCHv4 2/4] powerpc/watchdog: Disable preemption in arch_touch_nmi_watchdog()
Date: Wed, 25 Nov 2026 16:56:04 +0530
Message-Id: <fb07a250216a733b064f8eec672f9e682c3660d8.1795603946.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795603946.git.ritesh.list@gmail.com>
References: <cover.1795603946.git.ritesh.list@gmail.com>
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

touch_nmi_watchdog() can be called from preemptible context, e.g.
sysrq-w via /proc/sysrq-trigger. The powerpc implementation uses
smp_processor_id(), so with DEBUG_PREEMPT we get:

  root@buildroot:/# echo w > /proc/sysrq-trigger
  sysrq: Show Blocked State
  BUG: using smp_processor_id() in preemptible [00000000] code: bash/238
  caller is arch_touch_nmi_watchdog+0x3c/0xd4
  CPU: 0 UID: 0 PID: 238 Comm: bash Not tainted 7.4.0-rc2-00029-g7664547149ae-dirty #126 PREEMPT
  Call Trace:
   dump_stack_lvl+0x138/0x150 (unreliable)
   check_preemption_disabled+0x120/0x158
   arch_touch_nmi_watchdog+0x3c/0xd4
   show_state_filter+0xf0/0x338
   sysrq_handle_showstate_blocked+0x24/0x38
   __handle_sysrq+0x134/0x3a8
   write_sysrq_trigger+0x178/0x22c
   proc_reg_write+0xf4/0x150
   vfs_write+0xfc/0x71c
   ksys_write+0x8c/0x150
   system_call_exception+0x310/0x590
   system_call_vectored_common+0x15c/0x2ec
  ---- interrupt: 3000 at 0x7ffd01755b98

Unlike the generic version, which only sets a flag, we update the CPU's
timebase stamp and its SMP watchdog pending bit, so a migration in
between touches the state of a CPU we are no longer on.

Disable preemption across the update to fix this.

Fixes: 2104180a5369 ("powerpc/64s: implement arch-specific hardlockup watchdog")
Cc: stable@vger.kernel.org
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kernel/watchdog.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 44f178e07531..1a8514b2d853 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -459,9 +459,13 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 void arch_touch_nmi_watchdog(void)
 {
 	unsigned long ticks = tb_ticks_per_usec * wd_timer_period_ms * 1000;
-	int cpu = smp_processor_id();
+	int cpu;
 	u64 tb;
 
+	/* Callers may be preemptible. Stay on this CPU for the update. */
+	guard(preempt_notrace)();
+	cpu = raw_smp_processor_id();
+
 	if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
 		return;
 
-- 
2.39.5

