Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343934;
	b=Dg5idfXdWx0YRLzVRk5Z9ag6e+uqN87T3+xiMkIoNB0IZCBuRd13VwJ5CS7mAZia2ypB
	 fREPj4iCAsa///jnhZzp+pbBJcrJowsUgrhH5tjXUiZH85vXEhp/LB7dUMnhsdq1/+eIM
	 qxTK4SmihhlSnciTUCtWZ4hxV3gElTS+7zE7415FWZWlfxjNUaz5Fc5t4fSkinoLGS3Np
	 MyCA7IL4ghrF7Fr2LKY3CNevNaP/Lwk7w/4iodIlIfNn+eF0FKTCHjZg/XmKIOjWnOLOf
	 eLdGrG3OVcmbp6Slt6RH/WaPl0Hs27JI5Zmeg4Nm25SaGR8k+o6/ccnc6yfKbNlhhug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jZ+9Hq7+WF35Ttn4sUCu8cTqno+NpMWFIKoNlp9zeYA=;
	b=jr12uw55zPVaGwDfLzD/Rap7t9Z3yNP7QscOmD9ikxhpjZFGs+iZJC12lfqtDgzoa653
	 kcCIgFVFwSNLQiIBAoW2c3QO3vUHhptU5K+SPI9Asn5NMKRnXlYTrSaMEABgUU3p1nzwX
	 6U4DEZAW3SU5m3drQVIg47HUzonQI0e+OIUiYHkNWG7V1yJvkhyW8XR0UfWh1eH7B+/3o
	 bRO9KSmBY/YtgDNRv18+p+7odkzFiq+MeHdJnCg+EqOLCr1Tzi8u2DdpH3fVdFFopTHiL
	 2i/JZiLla27l+iV9p4B+7HnQ2KgkCyoRbkqfEBgxLRy3HcfnU5XTJm3MAeT1CzREfaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6nT2KzU;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E80C606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E80C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6nT2KzU
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3869f03af6aso1205850eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343933; x=1795948733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZ+9Hq7+WF35Ttn4sUCu8cTqno+NpMWFIKoNlp9zeYA=;
        b=d6nT2KzUNaWfSImeOZ6TNlBqxf6TIqr/kOuK6VitnS+aE7+8AzPCHLpHgwpzdrb2k/
         OFM/IiOq8UTy2V1N3aFG1a34oKA8EfwcJL+C80QPuPzAw/J9z6NhKjVlgccTynF6w9US
         tNvWd4HUtWAaP6KLvNAYbUUtfKceFH86gwUWdsUGRR9rbWKB1+JaxHoYf6vsOeeCuF2R
         BhwZtfutPLGTZGJGW3PhH9R/zYQ1fCvw3OYJF685pxyMvmIS8FTYojloMuLLzp5wwSTS
         b9qGz469I/SVyTgb4NoYFdrzbzKsQFBGTBxg15E8x0Tp+03v3DCUS+XOrqrwtRbp4ptg
         EOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343933; x=1795948733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZ+9Hq7+WF35Ttn4sUCu8cTqno+NpMWFIKoNlp9zeYA=;
        b=lgIykLKFBW6wEo20RngltRr4iJKlbp6WVJ9PtCmUBE8bPfT9TqCaw8XuVllppeN1V6
         g0D164MHJtC6aEY6br5I5b9pAu0MjvAfE22QbOjuO8UNeYAAu8zVabPjgoMHFrc8msPm
         zEjqyBBEvcYe4dqFJlYG5LXL23rrRGv3Y/kpUegM3UiEtqkLTc/Wd1ob5pstSgOt1BIE
         35xk+b+jClgBL1miVyEdEncssUiwFbuJ3qemtbrxnO9x+IrCQLSlFs1cV+JV+d7oOoHX
         cpq27Jnu9F/+3ByjT8jbhX2NbmJ35XRCd5q/AHEr5n4Wnl35dTvxOfB5hiemLASUej7Q
         iWQw==
X-Forwarded-Encrypted: i=1; AL+hErHOrFVP4nS+WLMXHL023vrLNjbBOHeVniN54XFWnZd5AgoGPrM1nJdBCH3749z1K5Q7ufzWO/yBSbSvhZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vsx/pIgDE8QjsZhUpE6nAwUhG9VPbzmcZg9xc4bmnq9jmfRTi
	RpoIplarEJo//Xh86wxKwzgaL3Reuyw/roCSoJlr3RO+3/W+XZ5zEmX2
X-Gm-Gg: AZFdTZcVAQmPkA3obZtzufo2jHl9WeOYzO7VdPRk3hlINLPOHWUAOSvWac+PQN8FfkV
	ioSNKhrb09feK69Y5zdfAfUEhCkv9RJdtRp1nTIGhgb3M7TUnbUIafPeMxUdJDTH322Dd2dAs8L
	XfKC7pJ0FHhVxRcdDV3a8Ms1092Tr0KFSv2iwujmP5Yz+HqG/5FbMZmHGtDF0p69vnxE5O/YBRA
	fZmxfXF/zG/1PXQWyfmxjWagcl0fjMiKuiSt2VWUNp+YnvNZVr+zDD1zn3XlWmBqvGMJDUtU0jq
	6P8Ei03qft3/UfVK4dr4Fj7jZ5WbNZAnMCmWjwagafzlqVYkPSTE2F+bLMCMmGeV21+tDnTD2uA
	JvfTftBou8HvuNkZHKQlYT4V/MVnND2sD8maL8MeS0Ygqjg/bgw/C+mhpEH7kCO5cRhYCNkZk9r
	XYSsxWxLsrZvotH94uAW2CRFW1vyURylPqeNRx6KJ3MEDBP9Ev30h9jad4nLjJusPflTvBYHNVc
	FmP10IY6Cn8w72Vl06+mO6ncPiHQKQNrZnUeQqb2Du0M1Tsf9/tKRf9bxlPIOLSFNoDyqM78L3r
	NCTeYLl221J+0q83UyL91UusiwTd7kKxlYRp90fwFvGNYyPAUk9XqalBAmrKSNFqCQ==
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr10713871eec.9.1795343933223;
        Sun, 22 Nov 2026 02:38:53 -0800 (PST)
Received: from boogieman ([182.66.218.119])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm27124771eec.24.2026.11.22.02.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:38:52 -0800 (PST)
From: Abhishek Khade <abhishekkhade69@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	linux-kernel@vger.kernel.org,
	Abhishek Khade <abhishekkhade69@gmail.com>
Subject: [RFC PATCH bpf-next 2/2] selftests/bpf: Add selftests for bpf_memmem and bpf_dynptr_memmem kfuncs
Date: Sun, 22 Nov 2026 16:08:38 +0530
Message-ID: <20261122103838.244974-3-abhishekkhade69@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122103838.244974-1-abhishekkhade69@gmail.com>
References: <20261122103838.244974-1-abhishekkhade69@gmail.com>
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

Add automated BPF selftests validating in-kernel binary byte sequence
matching for bpf_memmem() and bpf_dynptr_memmem().

Covered test cases:
1. Binary pattern match across embedded null bytes (0x00).
2. Match at buffer start (offset 0).
3. Match at buffer end (haystack_sz - needle_sz).
4. Single-byte needle fastpath.
5. Non-matching pattern returning -ENOENT.
6. Multiple candidate occurrences returning the first match.
7. Overlapping candidate prefixes returning the correct match.
8. Exact match where needle equals haystack.
9. Needles larger than haystack returning -EINVAL.
10. Empty needle returning -EINVAL.
11. Invalid flags returning -EINVAL.
12. Oversized haystack (> 2 MB) returning -E2BIG.
13. Exact 2 MB boundary full scan.
14. Zero-length haystack returning -EINVAL.
15. Dynamic pointer (bpf_dynptr) searching across embedded nulls,
    start, end, not found, size boundary, and error cases.

Signed-off-by: Abhishek Khade <abhishekkhade69@gmail.com>
---
 .../selftests/bpf/prog_tests/memmem_kfunc.c   |   9 +
 .../selftests/bpf/progs/memmem_kfunc.c        | 259 ++++++++++++++++++
 2 files changed, 268 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/memmem_kfunc.c
 create mode 100644 tools/testing/selftests/bpf/progs/memmem_kfunc.c

diff --git a/tools/testing/selftests/bpf/prog_tests/memmem_kfunc.c b/tools/testing/selftests/bpf/prog_tests/memmem_kfunc.c
new file mode 100644
index 000000000..d27c9a2a2
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/memmem_kfunc.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 Abhishek Khade */
+#include <test_progs.h>
+#include "memmem_kfunc.skel.h"
+
+void test_memmem_kfunc(void)
+{
+	RUN_TESTS(memmem_kfunc);
+}
diff --git a/tools/testing/selftests/bpf/progs/memmem_kfunc.c b/tools/testing/selftests/bpf/progs/memmem_kfunc.c
new file mode 100644
index 000000000..8abd06e97
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/memmem_kfunc.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 Abhishek Khade */
+
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include "bpf_misc.h"
+#include "errno.h"
+
+char _license[] SEC("license") = "GPL";
+
+/* kfunc prototypes */
+long bpf_memmem(const void *haystack, u32 haystack__sz,
+		const void *needle, u32 needle__sz,
+		u64 flags) __ksym;
+
+long bpf_dynptr_memmem(const struct bpf_dynptr *haystack,
+		       const void *needle, u32 needle__sz,
+		       u64 flags) __ksym;
+
+static char bin_data[] = {
+	0x16, 0x03, 0x01, 0x00, 0x02, 0xaa, 0xbb, 0x00, 0xff, 0x00, 0x55
+};
+
+static char needle_null[] = { 0x00, 0xff, 0x00 };
+static char needle_start[] = { 0x16, 0x03, 0x01 };
+static char needle_end[] = { 0x00, 0x55 };
+static char needle_single[] = { 0xaa };
+static char needle_notfound[] = { 0xde, 0xad };
+static char needle_repeat[] = { 0xaa, 0xbb, 0x00, 0xaa, 0xbb };
+static char needle_sub_repeat[] = { 0xaa, 0xbb };
+static char overlap_haystack[] = { 0xaa, 0xaa, 0xaa, 0xbb };
+static char overlap_needle[] = { 0xaa, 0xaa, 0xbb };
+static char oversized_buf[2 * 1024 * 1024 + 1];
+
+/* 1. Flat memory buffer tests */
+
+SEC("syscall")
+__success __retval(7)
+int test_memmem_embedded_null(void *ctx)
+{
+	return bpf_memmem(bin_data, sizeof(bin_data),
+			  needle_null, sizeof(needle_null), 0);
+}
+
+SEC("syscall")
+__success __retval(0)
+int test_memmem_start(void *ctx)
+{
+	return bpf_memmem(bin_data, sizeof(bin_data),
+			  needle_start, sizeof(needle_start), 0);
+}
+
+SEC("syscall")
+__success __retval(9)
+int test_memmem_end(void *ctx)
+{
+	return bpf_memmem(bin_data, sizeof(bin_data),
+			  needle_end, sizeof(needle_end), 0);
+}
+
+SEC("syscall")
+__success __retval(5)
+int test_memmem_single_byte(void *ctx)
+{
+	return bpf_memmem(bin_data, sizeof(bin_data),
+			  needle_single, sizeof(needle_single), 0);
+}
+
+SEC("syscall")
+__success __retval(-ENOENT)
+int test_memmem_not_found(void *ctx)
+{
+	return bpf_memmem(bin_data, sizeof(bin_data),
+			  needle_notfound, sizeof(needle_notfound), 0);
+}
+
+SEC("syscall")
+__success __retval(0)
+int test_memmem_first_occurrence(void *ctx)
+{
+	return bpf_memmem(needle_repeat, sizeof(needle_repeat),
+			  needle_sub_repeat, sizeof(needle_sub_repeat), 0);
+}
+
+SEC("syscall")
+__success __retval(1)
+int test_memmem_overlapping_prefix(void *ctx)
+{
+	return bpf_memmem(overlap_haystack, sizeof(overlap_haystack),
+			  overlap_needle, sizeof(overlap_needle), 0);
+}
+
+SEC("syscall")
+__success __retval(0)
+int test_memmem_exact_match(void *ctx)
+{
+	return bpf_memmem(needle_start, sizeof(needle_start),
+			  needle_start, sizeof(needle_start), 0);
+}
+
+SEC("syscall")
+__success __retval(-EINVAL)
+int test_memmem_needle_too_large(void *ctx)
+{
+	return bpf_memmem(needle_start, sizeof(needle_start),
+			  bin_data, sizeof(bin_data), 0);
+}
+
+SEC("syscall")
+__success __retval(-EINVAL)
+int test_memmem_empty_needle(void *ctx)
+{
+	return bpf_memmem(bin_data, sizeof(bin_data),
+			  needle_start, 0, 0);
+}
+
+SEC("syscall")
+__success __retval(-EINVAL)
+int test_memmem_invalid_flags(void *ctx)
+{
+	return bpf_memmem(bin_data, sizeof(bin_data),
+			  needle_start, sizeof(needle_start), 1);
+}
+
+SEC("syscall")
+__success __retval(-E2BIG)
+int test_memmem_oversized_haystack(void *ctx)
+{
+	return bpf_memmem(oversized_buf, sizeof(oversized_buf),
+			  needle_single, sizeof(needle_single), 0);
+}
+
+SEC("syscall")
+__success __retval(-ENOENT)
+int test_memmem_exact_2mb(void *ctx)
+{
+	return bpf_memmem(oversized_buf, 2 * 1024 * 1024,
+			  needle_single, sizeof(needle_single), 0);
+}
+
+SEC("syscall")
+__success __retval(-EINVAL)
+int test_memmem_zero_len_haystack(void *ctx)
+{
+	return bpf_memmem(bin_data, 0,
+			  needle_single, sizeof(needle_single), 0);
+}
+
+/* 2. Dynamic pointer (bpf_dynptr) tests */
+
+SEC("syscall")
+__success __retval(7)
+int test_dynptr_memmem_embedded_null(void *ctx)
+{
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_mem((void *)bin_data, sizeof(bin_data), 0, &ptr);
+	return bpf_dynptr_memmem(&ptr, needle_null, sizeof(needle_null), 0);
+}
+
+SEC("syscall")
+__success __retval(0)
+int test_dynptr_memmem_start(void *ctx)
+{
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_mem((void *)bin_data, sizeof(bin_data), 0, &ptr);
+	return bpf_dynptr_memmem(&ptr, needle_start, sizeof(needle_start), 0);
+}
+
+SEC("syscall")
+__success __retval(9)
+int test_dynptr_memmem_end(void *ctx)
+{
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_mem((void *)bin_data, sizeof(bin_data), 0, &ptr);
+	return bpf_dynptr_memmem(&ptr, needle_end, sizeof(needle_end), 0);
+}
+
+SEC("syscall")
+__success __retval(0)
+int test_dynptr_memmem_exact_match(void *ctx)
+{
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_mem((void *)needle_start, sizeof(needle_start), 0, &ptr);
+	return bpf_dynptr_memmem(&ptr, needle_start, sizeof(needle_start), 0);
+}
+
+SEC("syscall")
+__success __retval(-EINVAL)
+int test_dynptr_memmem_needle_too_large(void *ctx)
+{
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_mem((void *)needle_start, sizeof(needle_start), 0, &ptr);
+	return bpf_dynptr_memmem(&ptr, bin_data, sizeof(bin_data), 0);
+}
+
+SEC("syscall")
+__success __retval(-ENOENT)
+int test_dynptr_memmem_not_found(void *ctx)
+{
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_mem((void *)bin_data, sizeof(bin_data), 0, &ptr);
+	return bpf_dynptr_memmem(&ptr, needle_notfound, sizeof(needle_notfound), 0);
+}
+
+SEC("syscall")
+__success __retval(-EINVAL)
+int test_dynptr_memmem_empty_needle(void *ctx)
+{
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_mem((void *)bin_data, sizeof(bin_data), 0, &ptr);
+	return bpf_dynptr_memmem(&ptr, needle_start, 0, 0);
+}
+
+SEC("syscall")
+__success __retval(-EINVAL)
+int test_dynptr_memmem_invalid_flags(void *ctx)
+{
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_mem((void *)bin_data, sizeof(bin_data), 0, &ptr);
+	return bpf_dynptr_memmem(&ptr, needle_start, sizeof(needle_start), 1);
+}
+
+SEC("syscall")
+__success __retval(-E2BIG)
+int test_dynptr_memmem_oversized_haystack(void *ctx)
+{
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_mem((void *)oversized_buf, sizeof(oversized_buf), 0, &ptr);
+	return bpf_dynptr_memmem(&ptr, needle_single, sizeof(needle_single), 0);
+}
+
+SEC("syscall")
+__success __retval(-ENOENT)
+int test_dynptr_memmem_exact_2mb(void *ctx)
+{
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_mem((void *)oversized_buf, 2 * 1024 * 1024, 0, &ptr);
+	return bpf_dynptr_memmem(&ptr, needle_single, sizeof(needle_single), 0);
+}
+
+SEC("syscall")
+__success __retval(-EINVAL)
+int test_dynptr_memmem_zero_len_haystack(void *ctx)
+{
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_mem((void *)bin_data, 0, 0, &ptr);
+	return bpf_dynptr_memmem(&ptr, needle_single, sizeof(needle_single), 0);
+}
-- 
2.53.0

