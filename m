Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560674;
	b=HrmqlXo1RIE2uehURMniFHG+u6+4rlA2krlKnSebfkjOs53lg+fw7Mhg9RpwShqLIVrK
	 JzJIRv7jzIKqnLTnZ839XAusu3eJo8lz83il9dv68KzRt4munqiJv3OwyQBbXitGF9ShW
	 1nz1SODCAws7usNnXYc/5bZStPta2BmyrBe1D1uSDd0dWQkAyaHfRjpbKF9bBPCg8h7N1
	 eEA/DPWweXl6IW+gaBVYOwGf7zBwvFRtlN+b2mCBUbh24lmtLbv4m1SICjYPkivntYBjn
	 SU47FKJCCxOp2gXEm2CepzY69A4cxP/zRnetLOCS+FBDcsR/gbqwQCs3UMQ6fuuw0XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=flVppx0kRFMYxE8MCABde0wS9Ry07/Asx+8ob69Cr3Q=;
	b=lAIHNhu5VZ71j3m+KI00mHZNT9UDV/zFywcfL2NkxSyzLspm1dXZw3eZSrfZ3Uv6f5Wa
	 W+rJto1Z/nteJSMKWO/enGSYxEbqLBgQx8R3gNcFSQyohmTiJil9uFF9h5eFimLXQujTe
	 XrBpwS76I+DViVULcl3/vFPOsFe+CGbTLl6gAON11YWQ/JwmyMjxKKcZ6xOI5NF8MZZiX
	 SGrcZk1LQFXAC//T4jLrL9B2ycE0pwzV6rLDqTnK+gbnpIFQoNwdUQae/xWZYhThRAiAk
	 oPE2a6821yjrkaKRe4qNrCVSMBmuCe3tviNb1fHwMsuBZYsiAyqkVKbq3f+1Igla7tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VeY9yGWs;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8D4606A337
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E8D4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VeY9yGWs
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso40735415e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560672; x=1796165472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flVppx0kRFMYxE8MCABde0wS9Ry07/Asx+8ob69Cr3Q=;
        b=VeY9yGWsUyLWfVDkEClul5rCYaCp/GGHKnbGE224WHpXJv2yEXHvlKDtdmbLtI8t93
         eMEpUx8277T1FYjlBztx0zAgO6PqAb/7wOz2qGUAooVRYaUCGm0mXwRoudGd2mdvBhUo
         8EQ03E8cmbY09e/tzsItyYTBem9/gkr6Ky7y2j5eTix5raUYKLGmQI3Naut5J/Z5GKR/
         sBQ4JIVkRZn16jpX4k0YUkGJvUel50S+3vkoI6x3fJXlSNIkeNFNyk62321Mn/xUua7J
         wdxRRHrq8lWLvt7khmLR0VmKJ0YlSnaj686jiXHuEFCBh040zDOoFTtZwhK1ixX2+hGu
         nllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560672; x=1796165472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flVppx0kRFMYxE8MCABde0wS9Ry07/Asx+8ob69Cr3Q=;
        b=A3Qz9h3sas6GpetwcHz4Lu2T5FkavljVmD2zieYkqc44kX8F/yobG6epVKrlGG4nS7
         658rRqkdFBE4orqYlzODOKe7SvJaHNHONp9vgukm+xHvJsN/TP1NpynX/lhz0rWtkPJZ
         YBxxLNE2FoS/+1Rl4Atmp6+gL86ZX9l8o75iotuos38mRnStBOeV7PuythzRHnrYqX7L
         ecZ4Se9MbHuOoNCRgiSxUIdVL2MSBXFcRuxVvrpyBKykLDmphR2Fxxg3dLMiInoIruyF
         IpwOUAwrGEQUbB6TiNhsdbtEc0+3Ax3M8D4fJ+f2mDAw1EujDOP6DDJ3gy+g+jSay3Qi
         ysHA==
X-Forwarded-Encrypted: i=1; AL+hErFNZcukNRR5CWVrU7kAfcMP6YgNxX/SVlevQOaOpnTXAgR6v7rvOlT0Zxe0TmFiAnsmq+fHrUFojusjtdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QNOm1E2PZaqT7WzSSDK2ZxkI2HWr9J1nHbtntoi1h/bTimif8
	HnMrRW/AJbf9ePYsBDAGGP/APfPh8QUVufe3imCpBHBNx9Jm+VLWCwQ=
X-Gm-Gg: AZFdTZe1opU+PxrM/uWn2BT0jvpI90MzCX0JAE/14NTmnJo+tD3FklGLJaSehKQEQ/f
	PPXVGkuXZ9fXWo3BGkgg0xqlT6GvRXx0hOLQBjTbR4YxAg8cJCIBUsiR20gx7TPo+0PlYTwsknV
	e12ZlGDvIaHpdZMnRe0zVqXvExjjYak6Dt+VauvBfGRAOm7o2LHOmBY/5LhFFAadRMK34JXw60g
	w74WrhBDpW3Xmydn/vaE02YBF5+cw7BBdbGrmJeWhkyjzC4PWNwfS4SKawqp9bJHIzIJxzRExpw
	enzXHTgyO5drrul7daBLkEKatRZk2YTJ26zREGaMgWcmjJONTHvfoOoSbB2JtFS51F5oAAJa3Ms
	rlDxM2hRxiW+HPwn4RQWFYcR7mUGSv/9+rYQtmJof6bv9xQVXSgBxfWx8GOo4Mx6/fWAUPLWSlK
	5o4jYS5nbzijTB/o60GM8AVrJ6Qgxf4A6OkWc9MYZEMPd9J005OwoOJfVUFBWSl624ziY+aAUVQ
	kwF1HLXz8O39bOUj+4X1uvbj7EppONyMJJfsXrhvtYuV0758WHTQUEUeGLGYyKC7lMDR12apLHi
	lrPDaK4ZsANhsNo1vE3PF2prLlD1lQwuwd3HO+unuIhhb12kFNfa84Yu+fT1JhcqrK55LwzalPt
	7PzO4ipO5UcjOngcrcDzTvLiUp7eTcfiI3kEHQR75L1grb0b61iy6pjnDkj2rI86O5d6ok3/OA3
	3Vqg/bCLz+SemaNHhiETrBjouc/RX04RuE
X-Received: by 2002:a05:600c:3113:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb8882a4b9mr343791695e9.35.1795560671942;
        Tue, 24 Nov 2026 14:51:11 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2ec1-8a00-a10d-4335-1e05-e7ae.310.pool.telefonica.de. [2a02:3100:2ec1:8a00:a10d:4335:1e05:e7ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm393839525e9.9.2026.11.24.14.51.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 14:51:11 -0800 (PST)
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
Subject: [PATCH bpf-next v2 4/4] selftests/bpf: Check that map values are 8-byte aligned
Date: Tue, 24 Nov 2026 23:50:55 +0100
Message-ID: <20261124225055.87344-5-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124225055.87344-1-tphilipp@gmail.com>
References: <20261124225055.87344-1-tphilipp@gmail.com>
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

