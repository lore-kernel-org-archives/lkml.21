Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534169;
	b=gAy2ToW8Eyor3ZJFHqDKIhn4neB4yTZWuud98iHaTAlecry8KJKAX8mH2OvBjhT1ZlRD
	 erOz4OByFXA79io5PiRq7d2fjankVUjXmHGZP7i6LHiIvyndq7w4Vn8u2TsNYj0P+9Y6G
	 P4ufpEbku+/+naLuzzq1SK1NhE5521PAtfmpidpobsc0SbG9p2aoa0iKsGQXY5/pKY3XN
	 pBwXGhcs+zzgMh8VKG0fy336Yi5yn1wTQY6eBLEgrioBmBf9EIdvFghYO8XRtMbiE+ABE
	 zhGW+xSItGc8F0uRbEQmR82f7px8yyurDSYQPPDIkbunY39lf9hSx9NuWioE1tz0XUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=KCmmFYGZgx+JwvyRTb8zdRtAiUdIEZ77HMLwsBCfOrY=;
	b=Tv3r0zj4QoBRY8SunBW7R4v91TxfGDuAOJuFjaFyEDkrtg3ZcKlLszY6NX+RstKMpAoU
	 WYtEOqWVxF1Z+unj3yiTh+ptKKejvR5lZ7yoERRlqa6R6e3Gc1VKrZY89kdzIQcLCSAZY
	 HDGg9lZE7jT+rX6OZthkhvusMBWQlqa7UnirqvJ0J5E/YMd3PAiHROMv8Phm+NO3bZjp7
	 IWD62gcGYzhuHxCmFzKmdDzPAH5xQx5Bd6ajoUM/caPCZTGeHfH2Eg+9xcwLp2x4o17Nc
	 Z+t0uIsUUpfzfSgKgG+CVOvJIDqVJTnIwzvkUJBSH/xOBhNhetd5HFIzzz45lgQ4uUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P4vS2nwx;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D10606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D10606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P4vS2nwx
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49febef74e3so39420085e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534167; x=1796138967; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCmmFYGZgx+JwvyRTb8zdRtAiUdIEZ77HMLwsBCfOrY=;
        b=P4vS2nwxWayRhsGlY+OO6p/RgeHfIxKhAUOwXiD07f3eXx9VKtPq5mh7WlX39CiwhR
         rkBR4YrFTIuiXqxclJoUcvCjqGE8f5eJ1z471DDG3IJN78O4iJ61Di7mB8bxj1BieAEF
         Ler1nwXkrPA6WQcWsT9vekISkWvJR1gPERxcJP+ewyfRnyiQyNERPQUIM3RVsLLqw0IJ
         htO1uByQL6abgc2YHFqSsQctNMjzhriWVUQirDNALRoZzzxvOnTqnRFEpX40UhD80pEb
         t9SP085/H0+QdasXEgANuSmzmbeaIrNzeuWawdqiV83Qelrn/m0A302lhygOQR38D92W
         lCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534167; x=1796138967;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCmmFYGZgx+JwvyRTb8zdRtAiUdIEZ77HMLwsBCfOrY=;
        b=ISw20dlPzU7Cx6zIWHyuV26X3K4F5RAbnFfzEg3SysMQq0e7Mlf5YqJ9LN60L06nov
         o+wIUV7D7wQBkUHxw4Z6nJOnxIySlslcjz6WK3RVYgPbzk3xSFTdVdaUlWT3xonOWPiG
         PGhUHtprYcJfqs7NJCQ4jLKYZ25i/XfEkN8W5XWt1nbUHu3N/XEkWfwWhTdQNLWIlBT7
         H9KBVrJS9lgA12/Y3Xg0QIbxzpF5Q8B/vVPi3DRkCiJPxA9V86vIJsxpzIN2OgHewCxP
         t+CSFNRUmrwQ946mN95CL7ghil3ckiHIjUppVsXLcN1Tq2EGsybTHpWo0W1AutVgQsgF
         MhXA==
X-Forwarded-Encrypted: i=1; AL+hErEPJndLKZlvBGM0p6wDusbTwJzv8M86L2tyzkI24xSj6VFhyETd2zFlyxO3CN/20agaEy1nUdrHmROlbNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z++OJ5UoMWOknc2vDKoPfd33CN7xTDgCCPCskS0l2J1jilv68nm
	Gp89xXn/eGeLnkTzkYX6nPNjj3niRUGzLGmZrvHuvxX5SBgCRzRkzKp1u1MKi61+CDUAmTNW0KG
	0acuocPmfkUsW/ApsAgJLlw==
X-Received: from wmmr3.prod.google.com ([2002:a05:600c:4243:b0:4a3:5d77:a650])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr307171115e9.11.1795534167302;
 Tue, 24 Nov 2026 07:29:27 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:34 +0000
In-Reply-To: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124152845.2233401-11-vdonnefort@google.com>
Subject: [PATCH v9 10/21] tracing/remotes: selftests: Prefix hypervisor folder
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename the hypervisor tests directory to "00hypervisor" to ensure they
run first. This prevents the hypervisor tests from being interleaved
with other remote tests which is confusing.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../test.d/remotes/{hypervisor => 00hypervisor}/buffer_size.tc    | 0
 .../ftrace/test.d/remotes/{hypervisor => 00hypervisor}/dmesg.tc   | 0
 .../ftrace/test.d/remotes/{hypervisor => 00hypervisor}/hotplug.tc | 0
 .../ftrace/test.d/remotes/{hypervisor => 00hypervisor}/reset.tc   | 0
 .../ftrace/test.d/remotes/{hypervisor => 00hypervisor}/trace.tc   | 0
 .../test.d/remotes/{hypervisor => 00hypervisor}/trace_pipe.tc     | 0
 .../test.d/remotes/{hypervisor => 00hypervisor}/unloading.tc      | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/buffer_size.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/dmesg.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/hotplug.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/reset.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/trace.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/trace_pipe.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/unloading.tc (100%)

diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/buffer_size.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/buffer_size.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/dmesg.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/dmesg.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/dmesg.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/dmesg.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/hotplug.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/hotplug.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/hotplug.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/hotplug.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/reset.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/reset.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/trace.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/trace.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/trace_pipe.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/trace_pipe.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/unloading.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/unloading.tc
-- 
2.56.1.809.ga0b61035b5-goog

