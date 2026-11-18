Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991938;
	b=ysMXbNhlfGS7+s1gRmjJ+swA+XK+CMrN15n9KgDIyOXKwojmpfksy/c8+oyiMnJi3gN2
	 +4DYjd/ntjsujk+8kemIthyhyYlPJsvS0OSUzBfsQsi8Hap5yEshjFrpAHWE3TlvMIZXk
	 5uJ8gufJ6WKSM06G4Vbb1DfBpWgDJSxt1Wg/qB/eN6HbTbxfInj6a6/Voc+9cJnrT4FJU
	 sUPm0KoaG78iu0M5gPABTU7uzxoLuABxvEksuMCCm24x4rO9/EH7NBfpVoz06mSt7gqwS
	 1Zzyw8wRfYUC6eSMioG/4vYHH13FSNcHVj4y1uvRucQSiOav20VFwDstxYdjW8LrC9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1WgGB0H3hcDggQb2lPP883pQXAgEMa/uaMUXMUun2LY=;
	b=hXxj26WK8zBaBkKJNgNay1IQbCpY3CyigAQ32t6e2r5K7pVmJK1gkXXEVrSRVWxt6CgV
	 oONdPeH6VIYSVCyjvoFPRcUdPv9IgiWHC73YuBved9ExBCrg1Sgc8hlssktMFgMphrfeN
	 eYuyWeVjhoQo2dAmide/mZMa9Obhli5ClqIq/PUnHpzWRb6wWRLtq3WTMoMjb5WEt6rXy
	 O460YTyAo+N9JbsGgaZCZRLdMBvKHmmwkLk0APeegDSZP3v+r+vPF7oz1bby2YqGXIMNO
	 wo/n3e0SyESOdyz5Lp1pqc1LKiizSuIHvoBmUocxqMYqZgQkcL+9KWUSHsL4QCZvfsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yZAa9UMj;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3B6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D3B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yZAa9UMj
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so101427566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991936; x=1795596736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1WgGB0H3hcDggQb2lPP883pQXAgEMa/uaMUXMUun2LY=;
        b=yZAa9UMjhDpG2TGaelaJuE/Na+kQoKQBM9+lmtZCW+GUegJ+lTWRsrqFSVCz6r/agu
         ZSVsi9W6YPJ5AuqzSuefmYJVg47Xjyzo+XVWBq3/NAGc6BIh7SwnrbTsv3GJ0T5F/Cza
         i33nf9jxedKGqSaG3G/PupuTkiS5Iig1G+YghTu/jshQ02LEf7iZyNEFWrDGcPx/FpjR
         gUoZao4NRq6M3ckuq/2dHvCxXnoGIn+U2K8hfeku67cVeowUiooGIYJRvsjpLTKi+LfX
         QeNkxAmIeSvAbFyvYFh8JyuTQUm3xs5PyCwOEdNzqgMRcluyvhfO6aZQGxMC7LCk+uAk
         j/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991936; x=1795596736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WgGB0H3hcDggQb2lPP883pQXAgEMa/uaMUXMUun2LY=;
        b=m8iKQXeJURB2nc+Y7peEbILv3Ybg1m7ciLPf8YCECa9D7s2WwX7mZhxOKQ1h04y4WY
         DZJ+PPUOu2w6Wv27mch4+2aGpUXzQyeIY09clGnegPGTkMKUTqMEPKRrmalozTipF9ty
         lPOK4B4+N1YtP5b+FdW9B6tOkPGxDYYmZGINv9CRUxay8ioOi633zBNL4/NnTWLw8LJr
         ZOWAllK6tBCrQFr1zPuLdOG7UGQz2BMwFkTOqq2/qqjOKbOR3B0WyG8IjoUcUXNyL+QH
         EZqGjuFCjwR/TBiduLVmKFY4ZUzDpVHTAgpnVBVS9OiEshwW/y+iyZKD3NQP4UpBe5N6
         N0Eg==
X-Forwarded-Encrypted: i=1; AL+hErEukrTk+KMzyrE25WI2hpEQAVG3ZnSq7iqjg/sk6AZH0mPVSYYSSQQUlPfoKwiEel8MXjqsl5LgzyKDfzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LTzeGGAJtmS5GLsdH0FNVKiMWXprCNfP3Or7fPjp67XXdk7wd
	Bi0DW8CVusEle1ugx6iNKxmAP42OuLbi8zxnrZwJBV1KpXtJg/lnWbrk
X-Gm-Gg: AYBFou3Q6QzwE77kx3afBKcyX1dkWpBW+HOuzJmwnhZJ6DjnGpldhGgkUfrQA6R+sX/
	OYSn0gs7M0MYGk8AKZIJDJu4euPys8T8zniQ9QNVk7bSN8XuQutDB/eIM148IEuAKJJZ1zX5ldi
	G6LU5VE6eD5cbVWRMQen0ZKwHN74qcjSTrvM7OfhDb7Wz7PkfTWONeDtgZ6tNyE8O/oPUIcKRe5
	wlYERxW96A+X0LaQbhG2NhhZGnsSmQBfgmv3JN5e3W4f8pv4E7aXHmhgPd8ppCbLOAjflWOc3IW
	zhaIUMGfo5yaFAZdIkHEXA2jLEPBY7Rjn+yQ/fOFzdGrqr9rP+w9qJYOdmvky068aZ1tqpB4SOd
	XC4X47eHedaR/rfYAE0Bck5Z14wybRLDrrxt08tro6FSFtF5XCzeb5+CHsopnVSeGuNmsyA6duw
	kmg7Co5ZNckPQELkfSK/z4TVnMPuZHmJPNbepC94Vie/T7Twre0wE0kzyYoVrWl6XA6PtBfcLxQ
	XRC9nQ7JZpnwKGaYKavNlYEgyKOfUzPJRjxE3mtyWDI1HO70mhMhZ2vFORCEe6leOinMfngBoYM
	y60M1iUqhSWx7txg8YPDml9CpBt4PssFexZ8
X-Received: by 2002:a17:907:86a3:b0:c29:f5d8:9c78 with SMTP id a640c23a62f3a-c510e36c026mr129861766b.39.1794991934985;
        Wed, 18 Nov 2026 00:52:14 -0800 (PST)
Received: from kernel.. ([191.40.25.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f31csm71077266b.10.2026.11.18.00.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:52:14 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v2 0/7] rcu: Record callback enqueue stacks and add torture tests
Date: Wed, 18 Nov 2026 16:51:40 +0800
Message-ID: <20261118085147.1668598-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series records the enqueueing stack for RCU Tasks callbacks and
adds rcutorture coverage for duplicate callbacks and KASAN
auxiliary-stack recording.

Changes since v1, in response to feedback from Joel Fernandes,
Paul E. McKenney, and Zqiang:
v1: https://lore.kernel.org/all/20261106143913.3627722-1-kunwu.chan@gmail.com/

- Dropped the RCU_KASAN_AUX_TEST module, its Kconfig flavor choice,
  and the five *KASAN01 scenarios.  The verification is now an
  rcutorture self-test that uses the selected flavor's callback and
  barrier operations, enabled by the new
  rcutorture.kasan_debug boot parameter, so it can be run from
  kvm.sh --kasan with existing scenarios.

- rcu_test_debug_objects() now skips flavors that do not set
  ->debug_objects.  The flag previously guarded only the
  ->call()/->cb_barrier() sanity check, so torture_type=trivial
  with CONFIG_DEBUG_OBJECTS_RCU_HEAD=y and
  rcutorture.object_debug=1 invoked a NULL function pointer.
  This panic was reproduced before the fix and verified fixed
  after it, with identical rcutorture arguments.

- New in v2: kasan-aux.sh automates the auxiliary-stack checks using
  kvm.sh --kasan, existing scenarios, and the existing checkers,
  ending with a single kvm-recheck.sh pass over the filtered logs.
  kasan-aux.sh can run and check the auxiliary-stack test on its
  own.  The final patch also runs it from torture.sh when both RCU
  and KASAN testing are enabled.

Tested on x86_64 with kvm.sh --kasan, kasan_multi_shot, and
rcutorture.kasan_debug=1 (30-second runs, built kernels reused via
kvm-again.sh to select flavors):

  Scenario Flavor         "Last potentially related work creation"
  TASKS01  tasks          call_rcu_tasks_generic
  TASKS01  rcu            __call_rcu_common
  TASKS01  srcu           __call_srcu
  TASKS01  tasks-tracing  __call_srcu
  TINY01   rcu            call_rcu
  TINY01   srcu           call_srcu

kasan-aux.sh checks for rcu_test_kasan() in the auxiliary stack.  
All runs reached "End of test: SUCCESS" with one intentional report, 
which the torture summary flags (Bugs: 1) as it flags the 
intentional warnings from rcutorture.object_debug=1.

Also verified:
- tasks with object_debug=1 and kasan_debug=1, 3-minute run:
  the four intentional debugobjects warnings, then the KASAN
  report, then SUCCESS with barrier: 633/633.
- Direct kvm.sh runs of trivial, tasks-rude, and busted with one or
  both self-tests enabled: clean skip messages, no splats, exit code 0.
  kasan-aux.sh expects these flavors to skip.
- TASKS01 without KASAN and kasan_debug=1: test skipped,
  exit code 0.
- tasks with both self-tests disabled: no splats, exit code 0.
- kasan-aux.sh --check negatives: a TINY01 build with
  kasan_record_aux_stack() compiled out of call_rcu() fails with a
  missing auxiliary stack, and a non-KASAN run is rejected at the
  configuration check.

Keep this test out of runs intended to find real KASAN bugs:
KASAN suppresses reports after the first unless kasan_multi_shot
is also supplied, and the report taints the kernel.

The seventh patch runs kasan-aux.sh from torture.sh on the scenarios
selected by --configs-rcutorture, so the added kernel builds scale
with that selection; --no-kasan or dropping that patch avoids them
entirely.  Feedback on whether that default is worthwhile would be
welcome.

For example:

  tools/testing/selftests/rcutorture/bin/kvm.sh --configs TASKS01 \
    --kasan --duration 30s \
    --bootargs "rcutorture.kasan_debug=1 kasan_multi_shot"

  tools/testing/selftests/rcutorture/bin/kasan-aux.sh

This series was tested on top of [1] with Joel's RCU Tasks barrier
debugobjects fix [2] applied.

[1] https://lore.kernel.org/all/20261027070923.3054462-1-kunwu.chan@gmail.com/
[2] https://lore.kernel.org/all/20261104153046.965890-1-joelagnelf@nvidia.com/

 
Kunwu Chan (7):
  rcu-tasks: Record callback enqueue stack
  rcutorture: Require debug_objects flag for debug-objects test
  rcutorture: Test duplicate call_rcu_tasks() callback enqueue
  rcutorture: Test duplicate call_rcu_tasks_trace() callback enqueue
  rcutorture: Add KASAN aux-stack self-test
  rcutorture: Add kasan-aux.sh aux-stack checker
  rcutorture: Run KASAN aux-stack checks from torture.sh

 Documentation/RCU/torture.rst                 |  46 ++++
 .../admin-guide/kernel-parameters.txt         |  11 +
 kernel/rcu/rcutorture.c                       |  55 ++++-
 kernel/rcu/tasks.h                            |   4 +
 .../rcutorture/bin/kasan-aux-check.sh         | 158 ++++++++++++
 .../selftests/rcutorture/bin/kasan-aux.sh     | 228 ++++++++++++++++++
 .../selftests/rcutorture/bin/torture.sh       |   9 +
 7 files changed, 509 insertions(+), 2 deletions(-)
 create mode 100755 tools/testing/selftests/rcutorture/bin/kasan-aux-check.sh
 create mode 100755 tools/testing/selftests/rcutorture/bin/kasan-aux.sh

-- 
2.43.0

