Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358303;
	b=RO7GNLQCT6ngvlpGogc0vlLEN80hJLryI9XuvWeIyouOLYFwkCMubt+V+l/sWHiL3MS+
	 nmiOrjYYauwdQEAXKcaRA3eT+J+srKmlqQZVzcTuwqDPC7dAmMRyZPg33sLuUCx9Yx0Zv
	 eDaBE8V6mWCWeNOzaOIU0k+QethplsdD9096ZHS5ZKknAQltrygmLyQ4VJgAc7g56X5F2
	 S5ujRo7Eb70HxtJs+KLqzBhK5BXoYvUWT6BoOlxadK2IQz9bcfmRHgxZh/Dhrv7NHCZFt
	 y0ecb9MW2SKcG5hx4iBb0bL/Holevl3xZi16RYhk+ArIljJywktIs8jqWrqmh0TWJCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zR3wUD/INy/nbqIL6qlCIoQGBzJRNDMCQAEgHUUSukk=;
	b=0hq47eASI0aLtKb5ugjWLE9Hfpf/RHEXHZS5B119EcpTVLMq0CBO9UFFFbn9GVWbEBbt
	 dqWKb/ax6rLw2ePtnS8wCaWdxWSDn66w5Z2jbSVgER+FQek3pAs7ReVvO8HY0JesUtjLm
	 a6WQ7XIufOs/kruj/5jzecH6fMZOXM91oF9fYnDa2yorZ+m18gDYZoWHwCN6RJiWOLCy1
	 d5BaFXo7T0bPjjkiUnYk75vswKWIh3yXGKfHf1I1xEPbd5aZa24wJjk2UzoeajZ73vT5C
	 aN95Rhqfnxyjek3+Hc/8KRwff1O/eANZAlYPmgpgLaRwLQbrML2IEfOZulp5ANv1rLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ng0H2chT;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086F3606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 086F3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ng0H2chT
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3869b68caecso2694652eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795358302; x=1795963102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zR3wUD/INy/nbqIL6qlCIoQGBzJRNDMCQAEgHUUSukk=;
        b=Ng0H2chTucQOmqDOWc/deVu2zZkFiT3XII8uF41QhbU29FW2Z9mp4MOdWULdD4cN97
         8GgqbSZ5j0KN3mJbhbgWzl3wC8HiSMBCFlsbZoS4012TjpYOlTm8B6V4BxByKwgKhGWq
         UnOxo8Cnt/nZkjvtZXH5OFDCKTXopPB5ukAx/zFtnwh2PGrT+h0nmJx9WQh5NdL4yS7i
         3iXy1XqV8wUTXfkA2jEs6zOrk9rHgzCzoGwOD2lObxwtPrq+J23K5WkOwROj/+UCqMu1
         CUx+10DsnTJgI86Pglpo1YiP5fjTKiz3iunErCVabpjDs5vsN8GsPeDNzgRs0niZfbzu
         rQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795358302; x=1795963102;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zR3wUD/INy/nbqIL6qlCIoQGBzJRNDMCQAEgHUUSukk=;
        b=UuMR9rnlO6x9Jb/IZfHIMf3wE5Q7cma/HkJpTB7rqe+DYdTDlo3coekMn7LStAPuLd
         g7zDl+BfSjagSO+MQ1seDW3ypDziTKkwz1qD8n6BzQGOM/RkllsrDa4e8Romyzk3jjCG
         Cm85XIueBqAU5xyk5A8EnWjrcLsUgpsEhufPsL1EJ9qxwe+faRYbZsBxN4fEIx36thN2
         cbFnDp7KlXqlKZyFF8bBcMhlk8Rms4DY2QbrBJAsng26gRg5qqS3BH/RsSw/TganBwYg
         /nDAO05lcLsUNd3/jQGmb1vQlPd3WnH864PP5/HNw9aYleb/rDXiTO0bWTml41FrnpQQ
         E8+A==
X-Gm-Message-State: APuU4Z/nTTTaFGeMvxiVWzzh2FqFfaaAiuDPIdndL+MGgj/XCRzFpIUK
	K6FxUCQRo/yhS5QHVDuLJ0WH658FNNEuuYoiVLsUoJMXtZ4J6jlDKU88
X-Gm-Gg: AZFdTZfWbvhiwTjCggxScDBfa84QYACymtED53Xab24zT7ip3lZqr0nydBWkaPmOqIM
	/twnIx8nDTMIUda9iZZWIEGp8adxXhGuhuFE+OuXcEesGTBwwTs6cMSYyasb8wtSgqgwDs6qUnG
	VGgNcb2H2ig4PCussaYfc+oH6lJIjSivB+kP5V9IYMvzGFFaUnL1u3v+hdYwknMupatMiHkDGyj
	LMrDarpAtKmZ/rjsjsQcIgVgutve9Ip6QFUBpWAOLEKa/d20UxNVR/gxjsck0xYYfXzoVxBH2ai
	zsq5fUyLLLOcYWz1JMFlNkPqj0fCk2F6Xi6Dn1H9A6XaEBM0dl78Gea19S4evI/JeHl7QDjIe3d
	hmOUYtyXrcR9uIjw4aXmI8YFPI/bu72rbUVJRkxxv0CKW2qDqGm/qEkclpGCfE5F4MC2atwbmBn
	1jm89o4kmGA/wskcjQNM5yukeoHAwDMUhatqe8coYzlTBpJxesFCOEGymFfjqM+ma6JODmigvdS
	QiYBO+b8f9+ChNh+vpTBNl7Q/zH2ItBSFGfqC+5hyev+Ax9BMuKmBlBVtv5DNfprsGwSGi30P9r
	hYWiamKoWFI6MT0BsArdvPGlzfEka/U1LtjG6I+jVDefYMsEVFmz9OHUe/XWW/j/xvhUiIK481r
	geo55erIJmkA=
X-Received: by 2002:a05:701b:4306:20b0:1b2:4c54:d976 with SMTP id a92af1059eb24-1b55ff0e104mr6523208c88.31.1795358301950;
        Sun, 22 Nov 2026 06:38:21 -0800 (PST)
Received: from boogieman ([182.66.218.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm21265456c88.8.2026.11.22.06.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:38:21 -0800 (PST)
From: Abhishek Khade <abhishekkhade69@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	Abhishek Khade <abhishekkhade69@gmail.com>
Subject: [PATCH bpf-next v3 0/2] bpf: Add bpf_memmem and bpf_dynptr_memmem kfuncs
Date: Sun, 22 Nov 2026 20:08:13 +0530
Message-ID: <20261122143815.330528-1-abhishekkhade69@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series introduces two new BPF kfuncs for binary-safe
substring searching in flat memory buffers and BPF dynptrs:
- bpf_memmem(): Searches for a binary needle within a memory buffer with
  verifier bounds safety.
- bpf_dynptr_memmem(): Performs substring searching across BPF dynptrs.

Both kfuncs utilize an allocation-free scanning routine based on the
Crochemore-Perrin Two-Way string matching algorithm. By computing the
critical factorization of the needle in O(m) time and O(1) space, the
Two-Way algorithm guarantees strict O(N) worst-case linear time (at most
2*N comparisons), preventing quadratic O(N*M) RCU CPU stalls without
requiring artificial comparison budget counters or risking premature
abort false negatives.

Buffer sizes are capped at BPF_MEMMEM_MAX_LEN (2 MB) and needle patterns
at BPF_MEMMEM_MAX_NEEDLE_SZ (4 KB). Verifier bounds safety is enforced via
the standard __sz naming convention and dynptr type tracking. Both
kfuncs are registered in common_btf_ids to allow access across all program
types.

Changes in v3:
- Replaced naive loop with the Crochemore-Perrin Two-Way string matching
  algorithm: guarantees O(N) linear-time execution (at most 2*N
  comparisons) with strictly O(1) space, eliminating quadratic RCU stall
  risks without artificial comparison budgets, premature aborts, or false
  -ENOENTs on repetitive patterns.
- Expanded automated BPF selftest suite to 29 test cases covering all
  boundary, size, zero-length, periodic, and pathological repetitive
  patterns for both flat buffers and dynptrs.
- Formally verified all 5 safety and liveness invariants with Z3 solver.
- Verified 100% equivalence against glibc memmem across 50,000 differential
  fuzzing iterations.

Changes in v2:
- Moved __bpf_memmem(), bpf_memmem(), and bpf_dynptr_memmem() outside
  #ifdef CONFIG_CGROUPS in kernel/bpf/helpers.c to fix build failures
  when CONFIG_CGROUPS is disabled.
- Removed direct access to 'ptr->data' in bpf_dynptr_memmem() to preserve
  the dynptr encapsulation layer, delegating buffer resolution and checks
  to __bpf_dynptr_data().
- Fixed 64-bit size truncation in bpf_dynptr_memmem() by changing
  'u32 size' to 'u64 size' so dynptr sizes exceeding 4 GB cannot bypass
  the BPF_MEMMEM_MAX_LEN boundary check.
- Registered bpf_memmem and bpf_dynptr_memmem in common_btf_ids (instead
  of generic_btf_ids) so they are accessible to all program types
  including KPROBE, SOCKET_FILTER, NETFILTER, and TC/XDP.

Abhishek Khade (2):
  bpf: Add bpf_memmem and bpf_dynptr_memmem kfuncs
  selftests/bpf: Add selftests for bpf_memmem and bpf_dynptr_memmem
    kfuncs

 kernel/bpf/helpers.c                          | 247 +++++++++++++++
 .../selftests/bpf/prog_tests/memmem_kfunc.c   |   9 +
 .../selftests/bpf/progs/memmem_kfunc.c        | 299 ++++++++++++++++++
 3 files changed, 555 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/memmem_kfunc.c
 create mode 100644 tools/testing/selftests/bpf/progs/memmem_kfunc.c

-- 
2.53.0

