Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418372;
	b=uAR/EyXh97xO8kaBB4PYXQimInLWkekIt5v+UjdOskICALEMspZvmieXIq2fgzsTzqZf
	 RkfL5j5QCa49yHP7OKvfUhsDxVDAUiYI1RBnk+egOTODxhgyjD1vNmS/02+Bj/sx4EsJZ
	 xoXxkZd8z3WZY8blx+nOSOsbn7Y5quSliY56u4b5qrLDtiDUi5aWqZL3Mbe658SI1V/WU
	 ROSBC3Az5Qp2taHnpWTbTP79p76CgIDCtXfcs0OQsEdbLhNexbpOzBXzL4sqK6ANhvln2
	 MIJ4zJbgi69sjnimSkpP2ikRMqYY8F0Fvi+6GzKUuasVy0nGb3AvTcsRm63hReqGuAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qPfESMdrKb/MeidmJhok80X0fJ4udHOxnwEwH0xvgI8=;
	b=UKWCYgVTC1vhQNSkoxtUFO7Z8prYwQcFuj1223B+rfxd2qQY4ZvWZ9XDXKmfWkfLI4Hp
	 70com9jKsRXcaMEsd4Rqu6WCy4zZscYEHvK7V6rG8D0d07vT2/hWpJGLzqw32yt6TRbAN
	 93RLVOf3nw8mDX8QGJj7QnJlLiW7C2w4j4AfBr6zkqGAgzIYR1a/GWvEJ5VZPbojqgSQ0
	 QwfhJON6UPcoRXN0CjFWbsu3+hZKKTrA/hzJ+OQ4muuelo5BFnKzByIxnlXhNIhKistEC
	 YDDwflfUWwwsPxjK3aH6o8MG8DVKg+6mHgNfztKIZU8WS8jQjzZo2mLLuOeEFQpkfHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ceGSKPT6;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9107606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9107606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ceGSKPT6
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869accaac2so1485418eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795418371; x=1796023171; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPfESMdrKb/MeidmJhok80X0fJ4udHOxnwEwH0xvgI8=;
        b=ceGSKPT6Ue64iZGfrcLoQAQP9W9jwLkrL8EjeWSuWGCZ4pdN5LJPLjWF5o7BqzLPjc
         WQftEtSuUhXBZuseZ1rRJgozYSSWVIFf2uUBU2C9O2QCSquu6RzForlIZCV6lTGfMerY
         qEE736z0hQTTCkXE7VHHQWLP7qVTrpy4U0BisfiB5DyIRYOnGdhHUVZ2+AI8Y8QwVfQx
         xRR9sXkN3FV5euFUnliXFOk25Am7Y6FgbPCPjgjXcgU/cIW+nDJFM4M9mc4BQTyN8bVX
         pJf1UkQMbq0l0k9pWEc3hRqM4nCm6QnDgVHpUXg9cHzVwcIeyDIOZGQk8HWOZc/4gE/U
         y1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418371; x=1796023171;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPfESMdrKb/MeidmJhok80X0fJ4udHOxnwEwH0xvgI8=;
        b=rGrY/LpeD5aWKu1BiEBq0FAByF8+vdTdajXORHs/sPTbBK+ZR2Bxug3X4X3MzfyQAN
         08CJz9lWonnvHHPfq8oNUx5nYiPpRV4UAbsWKjrl466xXg1dYkw2FvTidZdsGISCsl6I
         YWXN8VU1BM96wimnvs4AvdHv2hj9zmMMM+RqCTLZZOoeOGV6ni/2mFSnkB7lcsYJt6i5
         SzRFzKNyFjPX8P5C4rd4fK9YYWTvK4LuiRLSi6iNJaTGvYvNOTnt5LeFK049aGukVbtD
         UDzgz2f5+f8PGzZLLsYqAUtHPMhtClFtUA7LOfHzmtA7CilMLawLwcZhEMJ2+l04hLEz
         mS5A==
X-Forwarded-Encrypted: i=1; AL+hErHZ63zneiWLZm0GyWvbmrNCjnB6g/rzi1KTo+XlVWzkSyrDxhOel7dki6R3wkKuthVdt1NZi099bIvvpbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RSRmEen2ng1K0jRTaKOj0XCegxISDuQXqL8kasVljIOLiMcBl
	EVJkWJhbLgASRQitGiSArLHGGe9LObxNbzuiICY+4adJMNSDDPC91NZSbDW3ETSgBMXJVA1EmnY
	iGbalBiPzxw==
X-Received: from dyls11.prod.google.com ([2002:a05:7300:6a8b:b0:386:af9c:96b6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:51f8:b0:375:85ac:d14f
 with SMTP id 5a478bee46e88-384b3e786bdmr14639447eec.14.1795418370446; Sun, 22
 Nov 2026 23:19:30 -0800 (PST)
Date: Sun, 22 Nov 2026 23:19:02 -0800
In-Reply-To: <20261123071913.653315-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123071913.653315-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123071913.653315-3-irogers@google.com>
Subject: [PATCH v1 02/13] perf off-cpu: Fix swapped PID and TID in direct
 off_cpu_dump() samples
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Song Liu <songliubraving@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

__set_offcpu_sample() unpacks the first u64 of an off-cpu raw sample as
p32[0] = data->pid (process TGID) and p32[1] = data->tid (thread PID),
matching off_cpu_write() which packs (u64)key.pid << 32 | key.tgid on
little-endian hosts (and kernel BPF matches host endianness). However,
off_cpu_dump() packed (u64)key->tgid << 32 | key->pid, swapping PID and
TID for multi-threaded direct off-cpu samples exceeding the threshold.
Pack (u64)key->pid << 32 | key->tgid to match off_cpu_write() and
__set_offcpu_sample().

Fixes: d6948f2af24e ("perf record --off-cpu: Dump off-cpu samples in BPF")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_skel/off_cpu.bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/bpf_skel/off_cpu.bpf.c b/tools/perf/util/bpf_skel/off_cpu.bpf.c
index 72763bb8d1de..eeb2cb8ac0d8 100644
--- a/tools/perf/util/bpf_skel/off_cpu.bpf.c
+++ b/tools/perf/util/bpf_skel/off_cpu.bpf.c
@@ -236,7 +236,7 @@ static int off_cpu_dump(void *ctx, struct offcpu_data *data, struct offcpu_key *
 {
 	int n = 0, len = 0;
 
-	data->array[n++] = (u64)key->tgid << 32 | key->pid;
+	data->array[n++] = (u64)key->pid << 32 | key->tgid;
 	data->array[n++] = delta;
 
 	/* data->array[n] is callchain->nr (updated later) */
-- 
2.56.1.750.gf70dc682cf-goog

