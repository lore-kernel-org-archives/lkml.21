Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795350877;
	b=w+MbxJIfCQWgbFkD1p5IHqTtTxlxTK3cLOjyw/4GCgP/PAmeY6Hz5XJqBFfwEAWHlCTs
	 CG9qPYJzEk9eNkG7LhYzrFbjmEBnN3pyCPkznFhEBdGKXDxxsP1f2vHxlUY0qe4HcuGX6
	 xzZL1BITDDd5+YslCSAfuUaPUYmFve04lqD4o4ODUDTxmUOz+vGgdNyNz9zijTMj6Bli0
	 UWHjqWnVjJBJD6wJ744t4hAZwX+dKRb6gX7y74FGhMsye/G9vrkXEEx5pK1IR1N5sz199
	 1KnnOd4QC//W6FUXtbBWf7MCtHvPmLA4mmNKgq0w+VwBMsXiAW135KN0Q15dO/t2y5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JAwbBVLQ5Qw0WIo34F/0quqwwlp+frY0Yma8iuDK49U=;
	b=Y6vTPM4dLl2LHFziP35o8859L6QFXHQ0jC84PuWAUrr1cGiYI3jHCanDjJeg1HjWLOOc
	 CSaaZEh9RtH0KyKJYnGCYLy0SnPBqHmFCjxXwmNAzy/OHKxRQMtS67P4fj6pU06DUWbG/
	 8Pq3x9PtxSfKPD//RIGN5NwyM4iObS0KJEYfBiePAfZKVsV33rpi7RyDuSnMo0azlgXfn
	 TV70i07nI2M1TNWqnNeWDTRXSpQ2izV39siYqd1Pw4c4znkGsLyCWGLSxHX+DI0sNE/xB
	 hU8Sg6/247FMNVYOjA7FBWpCXbkTNhjOk4LxT8C8cDDLMrBVd9gLceWrGiBuec3mBiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znXeNDjO;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F94606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F94606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znXeNDjO
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-382f4710a17so4126274eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795350876; x=1795955676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAwbBVLQ5Qw0WIo34F/0quqwwlp+frY0Yma8iuDK49U=;
        b=znXeNDjOjC1CP3HbL8FdUyoqU+9GbcvYEv88CJsguyC0EYyeproOqZ4E9kyxXZhPOZ
         u0iuaNaFdDArEJC9W8YpggBe9H/fQH11Nvt/ebEWuW8wkeyAgYGwuSs+Ylh8pumR2zQ6
         yJNWSkcDYnTgJLfMi7q7TUnJwXWxB3QOPRKHndCF7kiQzwgkl1sZC4nqs+mrjeFBNO2K
         Zq7ESD+jpCB8hqVo3dLiEOiCdYvVlx6eTfEKkJNIkGYxvustd9LdJJlDEaz/MEGWHA/E
         AWRftIkr62icpY4ZSdMYt1C5QwGuRJ0evrYDNG3/2tnw480anZThBNkWvKfXa+QG7b+6
         VoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795350876; x=1795955676;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JAwbBVLQ5Qw0WIo34F/0quqwwlp+frY0Yma8iuDK49U=;
        b=yZ7chQGWOy73REKeTf7NPBaBS4iaI0cYQw0a3aO+Dr+HtU8LLRFPnBKBeGxiDH27GQ
         9mHborOB3ckL4Su6Q9g6xxKCR0YOCKdoopcAqE3X04gE46V6X2R1+r3b8uRRYH1EFaoY
         yExxeyHk3BiogtX8H8pi7Zir46HZ3k3kIdVq6VoAY5lPbjmL+4hF8Itn43zUsSreQjrx
         2hA2v59OkNUo340ugJcvBdIigiuHDXkRsi4kWOh370jaV9R8Vdc/iuAvuRg6fB36RiFn
         j6RpMakb6/lMT7I/QMycgIO9nTcsyPpIjCcxWmVTsRsshXZKEYHPY54OWw0gkKkL1emR
         4n6A==
X-Forwarded-Encrypted: i=1; AL+hErFnFaO6xqd1njaBA4qDYE52RXCGfH5bzbV1wxw67ZEZiMqmGgDQ3SOfRF/reO7Vm3GIp2Xg64HN0sCcpHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c+RyCCNESQvyRKcae9WIX7Mecq2zGmomz34JWja9vhfFB+dtb
	5TptQSRBc+1Nae4Aebv0tFdl11ZA42YOAI5cqMuy7JXa1LQpv6U7LDX+
X-Gm-Gg: AZFdTZeMAxolGTd2/c7NYtYViQiCk7nZurcsXlbMp7v4t5SqMMSm3ixiPVGD2j3U2FL
	gE69/3GjcH+/VI02JmqSUoRiAL1A7EUygVyov7RXW4V9bwWwT9GV07KrO4rg2kjFBGv2dfTzB3o
	jVQF7VwZYd58Kc2YuHPGBMOfBz3FH/Ahk1LAEdoURuOMNfDGomZO7hMXxdI2uBo9ylf1EyCujE+
	sqjCz80Yl3bvt5mnX7UTfRG6GutXsI2NvXC5MzvDP0U7/PAejHKl83bt1TUhsfYiZ/YCWVJ0BFS
	unC4ZEPL27zbHwOuEA5A4sfFKh66xEVVn8xX4EhpO/nkDPfajRxjjnwr2fo2RbtO1V0ZcAlm7/h
	e0gcL/xaJOgU5EgXTUT0V3KLydHHjGgyyfRhW64vIOx/Mq3Np09U03ZBMedSP4hmgxPIH+7MhtN
	9BXFlgRlekanedzLV1Q/h3ytWca/rhos+HAJnBwMSul7qidjh5XWb9htzz6XYKOK1gfmZp4ex9S
	SsVrDGEDAi9gTdzM9jR8LLmvR/dwy0ibPIEzDKjRSEHVGGT1dHjfJUReE0j9HXCCd4NWe663C47
	KEUTl1QCvARKSFRX/Z3hu19lQ8NwQXHIn8Xvmh1g51IhpRieUOHd7Z5W7EaI2xHwfw==
X-Received: by 2002:a05:7301:4281:b0:386:a193:9afa with SMTP id 5a478bee46e88-386a1939c38mr3959805eec.11.1795350875844;
        Sun, 22 Nov 2026 04:34:35 -0800 (PST)
Received: from boogieman ([182.66.218.119])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm33372330eec.5.2026.11.22.04.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 04:34:35 -0800 (PST)
From: Abhishek Khade <abhishekkhade69@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	linux-kernel@vger.kernel.org,
	Abhishek Khade <abhishekkhade69@gmail.com>
Subject: [RFC PATCH bpf-next v2 0/2] bpf: Add bpf_memmem and bpf_dynptr_memmem kfuncs
Date: Sun, 22 Nov 2026 18:04:25 +0530
Message-ID: <20261122123427.287521-1-abhishekkhade69@gmail.com>
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

This patchset introduces two new BPF kfuncs for binary-safe substring
searching:
  - bpf_memmem(): Searches flat memory slices for binary sequences.
  - bpf_dynptr_memmem(): Searches BPF dynptrs for binary sequences.

With the introduction of bpf_strstr, bpf_strnstr, bpf_strcasestr, and
bpf_strcasecmp in Linux 6.17–6.19, BPF programs gained solid support for
substring search in null-terminated C-strings.

However, in network packet inspection (TC/XDP, TLS SNI tagging, binary
protocol delimiters) and security monitoring (e.g. BPF LSM hooks
inspecting raw memory or binary execution buffers), data buffers are
frequently not null-terminated and often contain embedded '\0' bytes.
For these use cases, existing string kfuncs terminate prematurely at the
first null byte.

This RFC adds bpf_memmem() and bpf_dynptr_memmem(), wrapping an internal
allocation-free scanning routine based on the kernel's optimized
memchr() followed by memcmp(). Buffer sizes are capped at 2 MB
(BPF_MEMMEM_MAX_LEN) and needle sizes at 4 KB (BPF_MEMMEM_MAX_NEEDLE_SZ).
To prevent pathological quadratic O(N * M) RCU CPU stalls on repetitive
inputs, cumulative byte comparisons across memcmp calls are strictly
bounded by BPF_MEMMEM_MAX_LEN. Both kfuncs are registered in
common_btf_ids under BPF_PROG_TYPE_UNSPEC so all program types can call
them.

A comprehensive selftest suite of 25 test cases is added covering flat
buffers and dynptrs with embedded nulls, offsets, duplicate patterns,
overlapping prefixes, boundary limits, and error conditions.

Changes in v2:
  - Move bpf_memmem() and bpf_dynptr_memmem() outside #ifdef CONFIG_CGROUPS
    block (reported by Sashiko AI review).
  - Register kfuncs in common_btf_ids instead of generic_btf_ids so they
    are accessible across all BPF program types (BPF_PROG_TYPE_UNSPEC).
  - Fix dynptr size truncation by using u64 for __bpf_dynptr_size() to
    handle 64-bit dynptr sizes (e.g. file dynptrs).
  - Bound worst-case search complexity to prevent quadratic O(N * M)
    RCU CPU stalls: cap needle_sz at 4 KB (BPF_MEMMEM_MAX_NEEDLE_SZ) and
    bound cumulative comparisons to BPF_MEMMEM_MAX_LEN (2 MB).
  - Safely retrieve dynptr buffer using __bpf_dynptr_data() instead of
    direct struct field dereferencing.
  - Expand automated selftests from 19 to 25 test cases, validating exact
    2 MB boundary scans, oversized buffers (> 2 MB -> -E2BIG), and
    zero-length haystacks (-EINVAL) for both flat and dynptr buffers.

Abhishek Khade (2):
  bpf: Add bpf_memmem and bpf_dynptr_memmem kfuncs
  selftests/bpf: Add selftests for bpf_memmem and bpf_dynptr_memmem
    kfuncs

 kernel/bpf/helpers.c                          | 116 ++++++++
 .../selftests/bpf/prog_tests/memmem_kfunc.c   |   9 +
 .../selftests/bpf/progs/memmem_kfunc.c        | 259 ++++++++++++++++++
 3 files changed, 384 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/memmem_kfunc.c
 create mode 100644 tools/testing/selftests/bpf/progs/memmem_kfunc.c

-- 
2.53.0

