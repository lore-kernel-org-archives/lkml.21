Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795231915;
	b=TbY/4zt4mnCgYdcNJhFglWUfGPFg3eU8qj5wNx0Osd8Ts7plqDKy7+ieKZ8A3jQxLg+K
	 T13bHcgbUraK3MyJLB9CSRvDoeCxNxpGEFd0xKhIqx/WHrctS3szxJk/UXmjLMbrP7AW2
	 dD5Z1sy7egAnFAtyy9XwMAgkrlC6VF1inryLQkGh2T0F0nkoGBCx/0yWXWI5V0qzx4UGJ
	 3Nz1D2C9MMx4EnoQSTsSKFpM5jTxhysacOsWWnnhuLCxph7Om3sHaCBU3DL24VaVGSJcv
	 uMQXYYM8vTdrwl4CyrjQPTQfj7CTIzkoG37DUmqqStvvn1GG/dzwkr7P6gnUvy+26mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795231915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yK3YzNJOcaQryEkHMlVlkCljfMMPLk0sVjUD9ogarBQ=;
	b=tD9CkDJ6mVSRgwTAf0wO9hN4JbFn+ejSuSZ93eWG4nuIugcfYHgBRtCh49O2VEMxA8rK
	 N2BjIuVbx7q0SW2lBUebNRJuIdx1S7GknXi4e4gyTaSHVtg2+dBW+sSHCCqL8ATE3Hmke
	 dTOqRWkZEqcwVhrWr+gC2+q9UIbO+EZ00Xt4YH+c+IN1dvc9N09T/aFYE4qjnXsj26jB4
	 wHd6y8S9jcqoEaQYIVR4DQMp+z8Z1TDoURwQAIsSSyGG+s9KlVYPhcCNJVcqgyGtDts1o
	 +nT05GXn7PU+Xl14yEcL7BLaGqD+OP1kpuHgZ2c28iJes7lY+N51DpqfRVlVI1JY/tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SZzIGECD;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E276B606A333
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E276B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SZzIGECD
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7d2da1667b2so951947137.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795231913; x=1795836713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yK3YzNJOcaQryEkHMlVlkCljfMMPLk0sVjUD9ogarBQ=;
        b=SZzIGECDB24BDr48Lq/DjCuCBiOjqqQLs9gJuSzllplJD4NmV2JWE0ts6vzT1LVMJE
         r3UGfmH/6yR77poN1fWHsTjI4CMOEswcDAgdUurIRyqy+PTz1OeXhM3TO0UZ+0p3R4tX
         VmH0vSP/ooe7OxMaPTKDOT6pWPhBzS27SyVsz+XwKD7lDRE62ggAyJdqLNas+3k6wZ6z
         ihvZis5sidfj4HpHL3QdAuDqq7p9J37oGpDtNQudkkmXpl1Dn0EnpKJoJ7xGdSrXuF20
         0xDdj1vl0SsA0WhhqycD7zJgh0cVJprYM8jp1q6DR3AydKaOKB7X5XUpQ/wjycwBK7tS
         gSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795231913; x=1795836713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yK3YzNJOcaQryEkHMlVlkCljfMMPLk0sVjUD9ogarBQ=;
        b=B/WaXKGCmYAKEUX5l1i/C305IXqX/1SIWA+DA/AC5UHnFTWjNeDCvGfIKgNUKcLAKo
         28y3nB50fzPJl/YjJZlqoj1iVGjq/s/pUu/3F3vjmt3BjYkzEqp7v1Ih6RNvywrwO138
         rZKIsX4R/941HGu5Jh1wgv8HTgCVRsrOJs/yrohqnb0yVlYW7r6lY7XOnp9hI6jmOvmx
         Mlb4AE1ly10zXNJaZLy7SDV4pKYqzitUXwWl+3NmyKhzNqyZfH9wjQ5L6F5oAGXe2YGr
         ZLsC5XJHQzPPioaSSsulfyRQL6BEnYK8Eqzv5bwx2im8YSSiyT7FzMjuOl0/A9UlDjAo
         9qmQ==
X-Forwarded-Encrypted: i=1; AL+hErFW++TKOFG4BRByPyUUmVUM96DQ5mcdxxzH1QGrbucrN5m1SqZPR6Z+Br1/sbBLgH6kx5GqIqYHVXFk2o0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TWGFSiHO2PMDap5BebMeMkzRJbr56qko82ne0069cMD6wpQ5V
	PFmv55j0Y4EhsGRsTUAWwIAfzncGIqAsW6PayS/5OFS/SzRtgeisIjMo
X-Gm-Gg: AZFdTZcEoCuZBG4iV8aUPDfVltRWVJCvojmhuQ3scSq8cOJuZhBlIX0j8gdU5YmU9mH
	5cn+Nx5L2/jIie1G7giLyzlf6VA7PFwIfodCbCCvhuxLG2/hSxEPzJrGMFHO69HjQoX2afhJkGj
	CkB9KQH5riiIzHFYwTCn7SbQAiyd55idSD4CuWABD8NI9zhW5snwU/0rbfgqjN569TObMwp9JDX
	6ukepWvYoEby5z1ojLzbZ65IW2BkHtAjyhaXM4tCLIwpdDwrXhQnkBA+GvNvDpxNdHzu0oga6v8
	lujUacku0VQVia7UF2JYkGE/GmlaFpUUErYj3nJ1ILyAZmc6svOcTYbIgzCypP2DDWOSRGvMhuW
	oGGHL/tjuqoqBw9PLTvhZfQEBdvGpmDj9aatO04bOl2Tfkz6698MZ9tpit1+ZzmUSb5waUzAfhR
	iW7RfL9yuVhgcK/iPJZmsTA52FyppysyP9FgzvBo0iY5E2yMlEJJwSWJ8qqYE3kr4Dw120RtC3W
	ypjD7KiJ71U8xRhhnGgRu2X7/WKM7Jy9NVf6TISuQ++NL6Qf61EZeYbWYyjH3OYp/YxgwhMqB/k
	SSBCf7h1b3xp/xZLfv9XcPDRt5kTRHDP
X-Received: by 2002:a05:6102:f97:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d7396157a3mr2140380137.36.1795231912793;
        Fri, 20 Nov 2026 19:31:52 -0800 (PST)
Received: from shine.local ([168.196.221.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f3d7bcsm4871081137.4.2026.11.20.19.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:31:52 -0800 (PST)
From: "Andrei A. Bykov" <andreiab9019@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Bluetooth: fix bonded LE peripheral reconnect completion and holds
Date: Sat, 21 Nov 2026 00:31:02 -0300
Message-ID: <20261121033104.441146-1-andreiab9019@gmail.com>
X-Mailer: git-send-email 2.56.1
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

These patches fix two consecutive failures observed when a Windows
central reconnects to a Linux LE HID peripheral using an existing bond.

Patch 1 prevents an asynchronous command reply from completing a different
synchronous request that is still waiting for its terminal event. Once
that is fixed, patch 2 prevents encryption confirmation from consuming the
hold owned by asynchronous LE feature discovery.

The series is based on bluetooth-next:
  029d11a1a6e4c414eb87ed965ed6bc09f36322ee
Both patches also apply to mainline:
  5f22fb20497f4983094131f00a734362300d22d2

I tested the series on Linux 7.3.5 built from kernel.org sources and on
the Arch Linux ZEN variant, using an Intel AX210 peripheral and BlueZ
5.88. On ZEN, I observed successful operation during a session whose
process duration was 3h13m11s. I also tested application restart, Windows
Bluetooth off/on, Windows suspend/resume, and concurrent physical mouse
and Bluetooth audio use on ZEN; these scenarios worked successfully.

On the kernel.org stable build with this series applied, repeated
application restarts also reconnected successfully. An HCI/ftrace capture
confirmed that feature completion leaves the ATT hold at one and that
explicit test teardown releases the last hold. The same capture contains
48 outgoing ATT test notifications.

On selected files from the stated bluetooth-next base, extracted-function
checks pass 121 dispatcher and 30 lifetime assertions with GCC and Clang,
including an ASan/UBSan run. Unpatched negative controls fail 13 dispatcher
assertions and 20 lifetime assertions. Dependencies are modeled; these
checks do not replace a full-kernel concurrency test. Full kernels were
built and booted for 7.3.5. A full GCC build of the stated bluetooth-next
base with both patches also completed successfully (kernel and modules,
including Rust and Bluetooth module BTF), using a configuration derived
from the running kernel.org stable 7.3.5 build. That upstream build has not been
installed or booted.

Separate unresolved observation: after suspending the Linux peripheral,
the application and bond survive, but advertising is not re-enabled in
the captured interval. Restarting the application re-enables advertising
and permits reconnection. Its relationship to these patches has not been
established. This series does not claim to fix suspend/resume.

OpenAI Codex was used to assist with the analysis, patch preparation and
tests. No raw radio captures or pairing keys are attached. A sanitized
trace summary is available separately.

Andrei A. Bykov

---
Andrei A. Bykov (2):
  Bluetooth: hci_event: keep event waiters pending on unrelated replies
  Bluetooth: hci_core: keep the LE feature hold until completion

 include/net/bluetooth/hci_core.h |  4 +++-
 net/bluetooth/hci_event.c        | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

base-commit: 029d11a1a6e4c414eb87ed965ed6bc09f36322ee
