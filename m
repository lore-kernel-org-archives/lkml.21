Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722241;
	b=OAahGzpyuv2nlTId7Rz+wyhl/6Af9oVBajoQb5hXH0rPnd07EQBjwxXkbBHRGGRPoX4U
	 5eUHhkepi2wP+J33aqt9KATit5dclTJwRgGOm7n1lgQxPH5qGtc3dkdh9EbvwWP3nd/KT
	 JQRPnV9v2F8tqZUGSpGdDhjZI2WsdDWgpzX7a24Pd+cGtoFgPif2Hz1MYt9h7xKGFeVbn
	 yJ0/AvnCU+SdciOpYP2qVzqv03104DTW/1sTmk/zlavtizJq1NbSCZl5FrKsJmjjblMW4
	 MDWyOWoJaD5z/slFCMEEeenj2Uh4vCygawWYW6PgCOGyFJx8HONz4bOk/ge7XzUsfpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=flVppx0kRFMYxE8MCABde0wS9Ry07/Asx+8ob69Cr3Q=;
	b=sh0HduXtSCROpyHfumEZYB0u2t4tVQcXf0rBvy45bLCc93mxQW6SVQZbEOYhFfvnwHgX
	 tmuzvuCCQEwm90Zr5zcHg/Bp2f3/9Y2KajcFzjXN4zDaLaiJUNjPNHyrYaZcKKAx3yKCD
	 LShnTBwdMCYUUx9bhemXlFBkOBFUz+do1y0fkCI7iGeZzVcdo3Yh1PmH+a3F3Gy3M7Gfl
	 wwQRnn0iBbqMAvdqS45//tzalKvaj+j6lYQbPxlua0/X5a5BEBYk7eqwQQYMG6r7JIh6w
	 8b8JmgikhR87OSUWzT8Ex5Qmredh0Yjv4742UC6h8jfibdAgJzzjeSMou5UScbajp8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ve1amdfe;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C83D606A6B8
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C83D606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ve1amdfe
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so6235562f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722240; x=1796327040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flVppx0kRFMYxE8MCABde0wS9Ry07/Asx+8ob69Cr3Q=;
        b=ve1amdfez05VbyrTbnbkfDlGB6eqbuV2YRVktN1E3nJFBTY+vWxzxHg/apgbJ2FVbV
         IOsgA/iSbqD1jr4sRO6OwITDt5ebwxS7rAi1uWBXen35EmmjBK0lCoRsKM8OiUW9IDpC
         4pcE1RXZ4AaOu1YjQlwGzk1gt1wIAE78qnuivN3hSJv5BH6mUpiCWaeWk8ulzTLGnZAm
         kbJ2U/otb7Ys0kzn9ekVeCM2rcPw0iavB7Oj+9y10gFkh2xKI9deERr6Iz0+yb8RmfR1
         OSxd4lRnjtW35GKR+Tn0taq4V8eMsTcf+Xb+1FA1FUtOek+qfTUWKBJr+bKobV8mczmI
         RaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722240; x=1796327040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flVppx0kRFMYxE8MCABde0wS9Ry07/Asx+8ob69Cr3Q=;
        b=DV6dE52FS+0iz1SdiPZ+vEKzEu5ZCgZcQBrYPLEzlT7+ZDpqb/rag/fMs0KqsNWYoq
         k0nV2F3UbFVqVd3AzdXc3qV2+mHFfPcaqgmvF3Nqvww0X2YSTtKkV39XqUG9MKJHKo+N
         AgpdA0Ds1SB+bFY1gNMSmAIeL/qz1zYBPqfS1OvTLecY1ed3MVNhrvY2y1Bge8o8u1vj
         gqs0822hBX1PoE8wxnCWa8yY9VzlQH32Lf0+Wcy/rKC6SglZhQhhX9i1CVz7sVA9SW2u
         yI85lmrEasCnRnLVkf83avnv3xWH1qQf+eHj1aLD3QVKCUapm6ttAqpVQtgQdmkBksL/
         CyqA==
X-Forwarded-Encrypted: i=1; AL+hErGLuKZkzK/41C49QSih8yAuzmy1tOEgG5ZyK2TQYQaO4DgO6gLjEvePIPTKPWGSh39L32F89Vyfx+VAGjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qQK+WQYR2pkSo8SveehBRNXf1nHmKmQ5ooXTzFqZdRWaeMrV8
	sz3l6nMlB/TzAKYoU8XLXr0/Kxo6L2Ijre2kwTIgFknZCBGFh13mZYY=
X-Gm-Gg: AZFdTZd67ec43K4VVwLthMjKsG8rmzwlf6G258G1wWiqxKem45tFZ1vS9wc66pd+m+2
	xBG4JAmuuB6j07dOGVhIPFKFdDzEZE96Aabb1cafydocE8KfBO9hHBzIAlKmBkVjTR6wUmsjKcN
	zgkrlaQH1m1+2dn7B3acKLkTmOw9o9Ov6fYldteVNKbvolWysKXxAyHvkNk/p2LLgB0NQzzpd2S
	NCfMqSW8HWtoU1UAjm+o5NpxOwvgw4TvWjNbfXH7NsqWXgWRz26rYteQyLILb8ttLgoCs3oTCtn
	zECOQGW3ZkpOVkQW5gus5dH+xZr5sO2N4COGooswl2PPkAH19NDIUjU+vB2kqr27t5gCVJ9ci5j
	tKF6EWi5e4izeXQkOwoO4Z15OBE7V+MJH4joLGXjNzEy9A+ukgvij6khYlScGfo1c6v09E6v4U/
	vpCRc+2Goxv1Ratf2mbFwl3izL70TuYqTnvl9Fdq8IZipl2AYXreu0CdlVjM08/aDusF4wpXL1B
	qNj4wmv+4v7GSg1fwMoaxp8TdjwmhxJAe2dH7PcEGnjijUk35fZ87DSMpqUXta95DYaq4gp5e16
	H7rURYLJ0OCy/lw4lJbLNLVGNkDEZPVYlocY/b+J40AVn5epwzvAFc9JiCmG7w3OrI91xbjWSxZ
	BspMhCd+uTGBQIbOwD04PrJ91FC6CjS1Q8BUh3Ewe6ieg5QSSN1qaR7xnouNi7qYJiai86M4crP
	T/rxRT1wAWHMJx2xW2Nvv+97jR55q7O5HZ
X-Received: by 2002:a05:6000:2f89:b0:485:8cc8:1f5f with SMTP id ffacd0b85a97d-4ae0a0b0809mr37498634f8f.42.1795722239670;
        Thu, 26 Nov 2026 11:43:59 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2317-a900-4811-d431-309f-6626.310.pool.telefonica.de. [2a02:3100:2317:a900:4811:d431:309f:6626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm43663924f8f.3.2026.11.26.11.43.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 11:43:59 -0800 (PST)
From: Tobias Philipp <tphilipp@gmail.com>
To: bpf@vger.kernel.org
Cc: Tobias Philipp <tphilipp@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks@slashdirt.org>,
	Stijn Tintel <stijn@linux-ipv6.be>,
	Daniel Mack <daniel@zonque.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 4/4] selftests/bpf: Check that map values are 8-byte aligned
Date: Thu, 26 Nov 2026 20:43:47 +0100
Message-ID: <20261126194347.42466-5-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126194347.42466-1-tphilipp@gmail.com>
References: <20261126194347.42466-1-tphilipp@gmail.com>
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

The verifier assumes that map values are 8-byte aligned. Add a test
that looks up an IPv4 lpm_trie value, a BPF_F_NO_PREALLOC hash value
and a devmap value from an XDP program, stores the returned addresses
in global variables and checks them in user space.

The program does not execute any instruction that requires alignment,
so on an affected kernel the test fails instead of crashing it.
Without the previous patches the lpm_trie and devmap checks fail on
64-bit architectures, and the hash and devmap checks fail on 32-bit
architectures.

This patch was written with the help of an AI coding assistant
(Claude Opus 5.5).

Signed-off-by: Tobias Philipp <tphilipp@gmail.com>
---
 .../bpf/prog_tests/map_value_align.c          | 51 +++++++++++++++++++
 .../selftests/bpf/progs/map_value_align.c     | 48 +++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/map_value_align.c
 create mode 100644 tools/testing/selftests/bpf/progs/map_value_align.c

diff --git a/tools/testing/selftests/bpf/prog_tests/map_value_align.c b/tools/testing/selftests/bpf/prog_tests/map_value_align.c
new file mode 100644
index 000000000..91898a052
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/map_value_align.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <test_progs.h>
+#include <network_helpers.h>
+#include "map_value_align.skel.h"
+
+#define IFINDEX_LO 1
+
+/* The verifier assumes that map values are 8-byte aligned */
+void test_map_value_align(void)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts,
+		.data_in = &pkt_v4,
+		.data_size_in = sizeof(pkt_v4),
+	);
+	struct bpf_devmap_val dval = { .ifindex = IFINDEX_LO };
+	struct { __u32 prefixlen, data; } lkey = { .prefixlen = 32 };
+	struct map_value_align *skel;
+	__u64 val = 0;
+	__u32 key = 0;
+	int err;
+
+	skel = map_value_align__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		return;
+
+	err = bpf_map__update_elem(skel->maps.lpm, &lkey, sizeof(lkey),
+				   &val, sizeof(val), BPF_ANY);
+	if (!ASSERT_OK(err, "lpm_update"))
+		goto out;
+	err = bpf_map__update_elem(skel->maps.hash, &key, sizeof(key),
+				   &val, sizeof(val), BPF_ANY);
+	if (!ASSERT_OK(err, "hash_update"))
+		goto out;
+	err = bpf_map__update_elem(skel->maps.devmap, &key, sizeof(key),
+				   &dval, sizeof(dval), BPF_ANY);
+	if (!ASSERT_OK(err, "devmap_update"))
+		goto out;
+
+	err = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.lookup), &topts);
+	if (!ASSERT_OK(err, "test_run"))
+		goto out;
+
+	ASSERT_NEQ(skel->bss->lpm_addr, 0, "lpm_lookup");
+	ASSERT_EQ(skel->bss->lpm_addr & 7, 0, "lpm_value_align");
+	ASSERT_NEQ(skel->bss->hash_addr, 0, "hash_lookup");
+	ASSERT_EQ(skel->bss->hash_addr & 7, 0, "hash_value_align");
+	ASSERT_NEQ(skel->bss->devmap_addr, 0, "devmap_lookup");
+	ASSERT_EQ(skel->bss->devmap_addr & 7, 0, "devmap_value_align");
+out:
+	map_value_align__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/map_value_align.c b/tools/testing/selftests/bpf/progs/map_value_align.c
new file mode 100644
index 000000000..bd0663a13
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/map_value_align.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+
+struct lpm_key {
+	__u32 prefixlen;
+	__u32 data;
+};
+
+struct {
+	__uint(type, BPF_MAP_TYPE_LPM_TRIE);
+	__uint(map_flags, BPF_F_NO_PREALLOC);
+	__uint(max_entries, 1);
+	__type(key, struct lpm_key);
+	__type(value, __u64);
+} lpm SEC(".maps");
+
+struct {
+	__uint(type, BPF_MAP_TYPE_HASH);
+	__uint(map_flags, BPF_F_NO_PREALLOC);
+	__uint(max_entries, 1);
+	__type(key, __u32);
+	__type(value, __u64);
+} hash SEC(".maps");
+
+struct {
+	__uint(type, BPF_MAP_TYPE_DEVMAP);
+	__uint(max_entries, 1);
+	__type(key, __u32);
+	__type(value, struct bpf_devmap_val);
+} devmap SEC(".maps");
+
+/* Addresses of the map values, checked by user space */
+__u64 lpm_addr, hash_addr, devmap_addr;
+
+SEC("xdp")
+int lookup(struct xdp_md *ctx)
+{
+	struct lpm_key lkey = { .prefixlen = 32 };
+	__u32 key = 0;
+
+	lpm_addr = (unsigned long)bpf_map_lookup_elem(&lpm, &lkey);
+	hash_addr = (unsigned long)bpf_map_lookup_elem(&hash, &key);
+	devmap_addr = (unsigned long)bpf_map_lookup_elem(&devmap, &key);
+	return XDP_PASS;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.54.0 (Apple Git-157)

