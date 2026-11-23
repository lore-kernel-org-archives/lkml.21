Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418367;
	b=utewf5CHPgCMdGdKkG2uqf0mAYw/86jOrEn/M+Vj+J1XG5o0+ZEZTd1syi9LdtFbk2Rm
	 xU7AbNEkO1K8H24QsB8MLrh20SMGLocY6r2ceD9jFDVFAudpISWYqlrs8NkdZLJZlTBL/
	 ASXa4xNPiCI1qXIsxG56+b5xzURkFYu7+Da2sldOClprzBTZ0lHMNQP2o1ys5xq0T3SfD
	 bYF6S/gv/rs3CNgyviUseEurYKzhG3JNi2EtaeF7UXoBPfxftN5NpY4UA3mzHzwGoBApc
	 TBKeyEseaJyywdSEAopSPwCusuoq4VEzm7VW/azS+1TMciBGumEGoIefrx6SctovzPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pjSuvkyG3ApE0/4uLY8VIDkZ8BkkdRf/Widf/DCRqj4=;
	b=N+485U+v0+hoJNGwCs4BVmzXm7NbnqbHCrcy/EJuiv22VbDBFKJFnGabX0gMMqg0J3IT
	 V/AAe8p8+NWLT/sVje7JG9GYFvoFRS+ftBzXnRJiHuryp3vZGLgdAu2Guxex77fEnykOU
	 rgkjxS94aN/nAm5vlV+T5F50vG3TAyLGPEYsnc27WOwoZ6VVSIL/i7dl0KjHhucz53JoR
	 R5GHwcRkEEWPGpw3w1Mjubs13c4kGrfeOHYOyZ1nYP9eLO9MqY4CAeTqgJHjZ+dcLnjyD
	 JdPAVf8tdtlXERQKDCGhcIowuxqJcdj3lKUDm8C6P2v587r67XCcOYOZVIoj4f0y6HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ic82nDw6;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D68E606A337
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D68E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ic82nDw6
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso4294585eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795418366; x=1796023166; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjSuvkyG3ApE0/4uLY8VIDkZ8BkkdRf/Widf/DCRqj4=;
        b=Ic82nDw6SXtwNow2QrzEjv2c2UPralvonAdxohHl9PYuZyS4hdkweqt9ImSxIr6W3P
         c0CEgs3kg7vw35v8bTPt4K6UCstQT6HP25XwEraLVj1vCVUWwNqCc60IdU+0EIx87fbN
         h5SrQ5rA8B6RazevCkEVs/Y4ue1k6gwJd42y7lj7c7KMBP+Ctm0nbLVk9WoBEf6jgHLX
         YzjNthi30Lqp6tXqoobJLE7kjGX4l9WPaxySGjY59t/VuGpgeCnh8Xe0/U9aoebvVJ6W
         XCUQeAtnSLq8uaDuEiVahkUSlYh+qQFaEkTQ1fobin6vJo6HiU3ipHShdqqsuGjDXnIN
         8wqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418366; x=1796023166;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjSuvkyG3ApE0/4uLY8VIDkZ8BkkdRf/Widf/DCRqj4=;
        b=j5QR6oSK584y0FHGOc4URgyELItP9kSBzCYRaUr1g6BXd5pFLuliC8fKCE6F4AjHlF
         JUqfWeXNynj/9UhrgLl6EVIEcqwZnd6wTGd3PV4Vkt0hZAM+qjrpYcuDpmcb4azqX3to
         cTqF9LVpv6onK8SrLquaM5Klu+V3QuXDFPML98d4TgSqJu1qThshW0SK55ZyKRk5Llhv
         35psq9slDeh231XzkpOq1aAv8cfdXMcmDCS2aFWVgC54hV34r2YMG8cArPLuw2WdoRZX
         38Ebd1BEfCOdA0a9B1o8B9FhO4Z1GE6aQWFfHRC0npbIwTCCwe2AfiEGGreWfoKRJX98
         ZduQ==
X-Forwarded-Encrypted: i=1; AL+hErHYpUmCoLZQciwbRFpOV7itkf62b0/mFCoxQ17EHuDGLrgmaGPXntigKuUuS3Oc/C60HJjhdm13EPXkzTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TIFIL928fTerx8PyLPZZS1BUOnqu1J6CBZJVa+lQchaGnOpxY
	cS/12rjk0rnRzWw7qwL93G1PC3fVesXA+KcnJRBPjbu1AAwdZl41bVIYmzFPGgYmzTYkys+9dtr
	IHMIcisPJbg==
X-Received: from dyvo14-n1.prod.google.com ([2002:a05:693c:41ce:10b0:386:b4f1:dab3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6408:b0:36a:270:ce76
 with SMTP id 5a478bee46e88-38570f2b27dmr11754304eec.33.1795418365162; Sun, 22
 Nov 2026 23:19:25 -0800 (PST)
Date: Sun, 22 Nov 2026 23:19:01 -0800
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
Message-ID: <20261123071913.653315-2-irogers@google.com>
Subject: [PATCH v1 01/13] perf off-cpu: Bound callchain length in off_cpu_write()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Song Liu <songliubraving@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

off_cpu_raw has MAX_STACKS + 5 entries and bpf_map_lookup_elem() copies
up to MAX_STACKS frames into &off_cpu_raw[i + 2] (with i == 2, occupying
indices 4..35). When a stack trace fills all MAX_STACKS frames, the
unbounded while (off_cpu_raw[i + 2 + len]) loop reads off_cpu_raw[36]
(which holds the previous sample's cgroup_id) and then reads and writes
past the end of off_cpu_raw. Zero the stack buffer before lookup in case
bpf_map_lookup_elem() fails and bound len by MAX_STACKS.

Fixes: 74069a01609e ("perf record --off-cpu: Dump the remaining PERF_SAMPLE_ in sample_type from BPF's stack trace map")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_off_cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/bpf_off_cpu.c b/tools/perf/util/bpf_off_cpu.c
index 71933a71c8d1..a3fdbc3c907f 100644
--- a/tools/perf/util/bpf_off_cpu.c
+++ b/tools/perf/util/bpf_off_cpu.c
@@ -399,10 +399,10 @@ int off_cpu_write(struct perf_session *session)
 
 			/* off_cpu_raw[i] is callchain->nr (updated later) */
 			off_cpu_raw[i + 1] = PERF_CONTEXT_USER;
-			off_cpu_raw[i + 2] = 0;
+			memset(&off_cpu_raw[i + 2], 0, MAX_STACKS * sizeof(u64));
 
 			bpf_map_lookup_elem(stack, &key.stack_id, &off_cpu_raw[i + 2]);
-			while (off_cpu_raw[i + 2 + len])
+			while (len < MAX_STACKS && off_cpu_raw[i + 2 + len])
 				len++;
 
 			off_cpu_raw[i] = len + 1;
-- 
2.56.1.750.gf70dc682cf-goog

