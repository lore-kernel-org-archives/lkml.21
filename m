Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876066;
	b=jfSUYFnTsofqOPN0nAoWjbI3Y9QEbJCLMjLlp4KtYb0GAQ9UyRJFpjgtj2RvhzbWdkm8
	 RI5C7uHZmKbX5R0w0C0Eqx/DpXwwiu8py9GVkE4kabEp/RUpaFumCR/JpdgyYTqle1S5F
	 we26GZKxQMiyBW0xiH2WMp8qdHCKYfsTybtbuGbgsJVUHF2XqvaCHKGnHMgWlIcz/l5ql
	 A6TsgRKPrBwWdiCaTpRtGEAoZnxhsKm4EdUI3cax8zu8aieNYQ/UEjTAMeoNnYzmLTaKb
	 l0Z3bQ3qORP82f1+1qpso8bpNeBrsznGqLR3r2D0JgwLvI9U+wuRAWv8wiz2lU7gtrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YxaWrVn6n33eWhiL/bZzA2e/NdKxWhMxiAZXgWJylYY=;
	b=TIFT5WX+aXrsCqVrnxoakBH7Uro7earJ0WrPE8iyA7liclWwAjnmvE4hVzpOrpMwFZoX
	 iQb8oyw/j5OFmgD4iLebbbnLRobs1zWWWG/HCeCRfHBTrIvcw7YPU2SPaCbtg+RJ3JmA4
	 B/F1yTTV5jxF3qQPyJPlOQNKiNkDJVl64I5dndpqqPp6QQwSCd4o5tAQnMzWayDvDCObz
	 0Y1qiwI6XvUGPKSEMYnPBv80WoqvrzWgSkC9mmkV5QJVhXJe7LCyjllflR+M7u/vxH70z
	 oz+h2khxOvRVQacuKU711YYKBM3qfJ89FNGPxoDk7e2UnQK91Ev9UKqzb32Q3J9ZbrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UqXgLHxZ;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64DE606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A64DE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UqXgLHxZ
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso12912529a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795876064; x=1796480864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YxaWrVn6n33eWhiL/bZzA2e/NdKxWhMxiAZXgWJylYY=;
        b=UqXgLHxZd1hm/r4ldhii3WGqA3vrRbdeuEi2fbZBysuaiXrKfeEfD/YJiPdTbvex4B
         a0eU+UFzIb94rHHXFahFNDd/nzk1uIszWKx2/WerqQGdpzPay994jv2YDXWqNhPxsRND
         SqNyT5abmomc06bb7/5MQCAVPvXXP0F/oyXOl0F5sxoBMdyi4+6oakgH32IWjTUiLAR1
         q5uLSKj0Tjnhm0QcB2EqQmxP+lCUZ2QT3a+0wUIXm+r3q1xZryUZLR7skNNa72uMtfJC
         vrCQsOtulrKVgiZvmcQrZIT4ww+WSCz+JwFh1EvMUNgDwImZ1IR6lBYBBoPCo0cABaHl
         5x4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795876064; x=1796480864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxaWrVn6n33eWhiL/bZzA2e/NdKxWhMxiAZXgWJylYY=;
        b=StyedrtlMGJSEcUjDqShVctigLrdo8BuhqpqGnQVqF1ntJavMnyzpaLvAPlatlqbJC
         JmwgxWFtNOiUaBiqerOaIh9XWYCHUa/QoeINdcRrRhMfAE4Pk9BviPmn7OjvS7Ux5YrL
         whOpU9YnsZ/kNpAwMx02bHQarzQVO2q6QyutpXBte5cHGNulggt4gqOsjUkknLc/ZWUp
         i304k5gRkVI05dhMhbHaQAck4mVbuc4YkVIJJyc/vsV3ubhAYv/fHSkMaEoL1IMBG4+n
         iRxrKfXXVhSKTxsOk/EICkqVCT0eWYE1aWZNA3AdY+1L5nao5FJcc7k4ak7aO298Lb6F
         DIpQ==
X-Forwarded-Encrypted: i=1; AL+hErFKz7gq45SGF7tChNZpHme2d1awI+XKGqegex81VpZAweRo5SYh4pzhr28JnERZMAhgKA9Ka5Cpit0kTZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KsRKmpmXNh5WNk5KTKFwcaq/TxGqqI98frQ21VVJzK2Z5FBto
	poxI+FnfKQla/lTc4DIUI6HcbG9JBOAvpuzn//iAkomSb2vPDGOx7G+5
X-Gm-Gg: AZFdTZd190xpxxLrcVwd/FPG0d/VWylF3OW442d3jdeBvfQHfA3/+Cw0XuDST9eWrWZ
	/EWGQDrehTNyY3eqtnKAUUfTZ1qeySl8IILkSv7mwW9z0y1AnOhs22WaM79QAqkSFfNoNdCF0dl
	aO0Z2x3pgPBM/CYOGKNHY3XutxZieoVBidN47qIZabopPjY22OW948BZ4Yj7VoiMct0GY3mDA0p
	zh5KHV9Jxw+3eQD7fw0n80hzl7hJpbRLgOTivO8phUwfpLetMTOXuHiaKpsTo/flzE4GPh6qwjA
	VTdN2UMzOv0dQLCo5Cng+oM9NiOyMWuhfuDHbKtAiQxzjMy3nLhfg9biCc4/jvAzbH/TP/CdPvi
	zPn3lGtF9oxW6ALo29R66Xtk0xxS1QRORo68s+O2TroqIb0WKlJ9GMjiDXfiFkokRJxMqIPQt/p
	wmBus07iCM4oszEJfpr3Mifxu80ydTcHBBRoLB8eAxQKuNaHrwDtW8/j2iprPQqZ2Ge8XDWyT3G
	AMBMVvBZ4Sex4HKe8GFEmbR+l+YLdDgR8LqF/qnLu/SGcY1HKD7HofQ+4m7J5mf9MubI3nzopfq
	VwnS+FB2acetgne8oz8abrXby8TwJyXJZBphsaRhMgH3DNz8hGQxyWc/xf8GT7R7YWEbNBFK++P
	S2/iUqZhIKnEGHWU/
X-Received: by 2002:a05:6402:1941:b0:6ba:7b46:78c3 with SMTP id 4fb4d7f45d1cf-6ba7b46833cmr16806864a12.22.1795876063386;
        Sat, 28 Nov 2026 06:27:43 -0800 (PST)
Received: from kernel.. ([191.40.25.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e35ca6sm12448436a12.4.2026.11.28.06.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:27:43 -0800 (PST)
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
Subject: [PATCH v3 0/7] rcu: Record callback enqueue stacks and add torture tests
Date: Sat, 28 Nov 2026 22:27:22 +0800
Message-ID: <20261128142729.3756679-1-kunwu.chan@gmail.com>
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

This series records the enqueue stack for RCU Tasks callbacks and adds
rcutorture coverage for duplicate callbacks and KASAN auxiliary-stack
recording.

kasan-aux.sh runs the auxiliary-stack self-test on existing scenarios
and checks for the enqueue caller in the intentional KASAN report.
Patch 6 runs it from torture.sh when both RCU torture and KASAN testing
are enabled. The extra builds follow --configs-rcutorture. --no-kasan
disables both ordinary KASAN torture and the auxiliary-stack checks.

Changes since v2 [1]

- Rebased onto Paul's dev branch at 68dcfb0e34ee. The previous callback
  stack and duplicate-enqueue series is already in dev. Joel's Tasks
  RCU barrier debugobjects fix is included in f9857faffbb2
  ("rcu-tasks: Detect duplicate callback enqueue").
- Dropped v2 patch 4/7. Zqiang's 6abf78ac6a2c ("rcutorture: Make
  tasks-tracing support duplicate call testing") already sets
  debug_objects for Tasks Trace.
- Adjusted the torture.sh patch to keep dev's NMI boot parameters and
  QEMU arguments for ordinary RCU torture. The dedicated aux-stack run
  uses its own boot parameters.
- Added patch 7/7 to accept the expected KASAN aux-stack skip in the
  TRIVIAL-PREEMPT scenario. Codex found and helped fix the checker
  omission while comparing the rebased series with v2.

On the rebased x86-64 tree, I built the RCU objects with Generic KASAN
enabled and checked torture.sh argument handling. A 30-second QEMU
run of TRIVIAL-PREEMPT skipped the KASAN self-test and reached
SUCCESS.

[1] https://lore.kernel.org/all/20261118085147.1668598-1-kunwu.chan@gmail.com/

Kunwu Chan (7):
  rcu-tasks: Record callback enqueue stack
  rcutorture: Require debug_objects flag for debug-objects test
  rcutorture: Test duplicate call_rcu_tasks() callback enqueue
  rcutorture: Add KASAN aux-stack self-test
  rcutorture: Add kasan-aux.sh aux-stack checker
  rcutorture: Run KASAN aux-stack checks from torture.sh
  rcutorture: Accept TRIVIAL-PREEMPT skips in kasan-aux.sh

 Documentation/RCU/torture.rst                 |  46 ++++
 .../admin-guide/kernel-parameters.txt         |  11 +
 kernel/rcu/rcutorture.c                       |  54 ++++-
 kernel/rcu/tasks.h                            |   4 +
 .../rcutorture/bin/kasan-aux-check.sh         | 158 ++++++++++++
 .../selftests/rcutorture/bin/kasan-aux.sh     | 229 ++++++++++++++++++
 .../selftests/rcutorture/bin/torture.sh       |   9 +
 7 files changed, 509 insertions(+), 2 deletions(-)
 create mode 100755 tools/testing/selftests/rcutorture/bin/kasan-aux-check.sh
 create mode 100755 tools/testing/selftests/rcutorture/bin/kasan-aux.sh


base-commit: 68dcfb0e34ee3a9628f6b5ce7e06931b5248bb9e
-- 
2.43.0

