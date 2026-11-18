Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976206;
	b=4TEKxuD4sS8xGlSeyE8ucH/qj8kFFOpl7qIBDuBBua63cgafIPSX9wNm0k4wnj+fbjmf
	 Y0az4DXJY7zdFpsv3IR9DDfrdrsloW65r4nypjJcEDh1L8Zp+3+0oYUKXv2VXpwGb0NbJ
	 v1VcIMwynafOiFGkv/nmOV8WPngosIkWnIx+coQte5LkXPd4s+Yhlysy07OPfjmhWSbFu
	 7dycROG3DR7RGVsbadGSrVmzuZv64i8nChiAjWAk5arL882z+wt6sRJONuG5CoFzNpET+
	 ZqCJlPNlIENAPBy3mXsNUGIzxG/VG9PTJXQDi7BnHWNqRXkoWzkrPLUMEsXrhOHzsfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZXTszx/qr4QyW+2nmx6S98scb91JUewV8ipA3FPTKAQ=;
	b=Dwt509pmfWdO/zv7qBI2kM860CQWtMrA1Gm9mgQ8bOlTSrGewcfHOqZlGVzvFY+8luRl
	 p5CJ1FLqna7DIQdbQR6Dpesi09H10rXm7udxBqkEeuNgZnLNZBjtfIBqRhR6uyJviMZ5O
	 PnRWNBAA64fmRinxtEVdJASFfmQXGTdWMaLJVgIdKdP6NUIeG+3NlQk4njaedsk3ZbxkO
	 U11pjK+unhqMfnmfByTQY4S2iP3va9ZfvQEabDiVcJK/3ikIW2cKqIruGFBfEe4SC6xff
	 QntAzBkNOjfbvr0Ytm8U/VUG2+KhMjlJPNzBwM/1wYWNJdPJVS2a1iZ/+iib3D9Um5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iXL+FDSC;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CDA606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90CDA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iXL+FDSC
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so862917eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794976205; x=1795581005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXTszx/qr4QyW+2nmx6S98scb91JUewV8ipA3FPTKAQ=;
        b=iXL+FDSCp/YfEpG1w1QSo3AM9XjwnPial2XybMiugKoavjVNGrWcYy9/3tgevsPMns
         IprgqsWDHTLZ6YOTmdtnTREWVE+Q4FR0iTJB3X22uN758IrNAAZhEBJv1HneMxGPb2Tp
         PCmb+L1nByo5zq+AGeoMhdyVFH3rvhF+PyU/OT49BQhVj0LMdGeiWr/wAws3eJUtIeNY
         HvH+HNsghu8c4+LCW6uRzBOymfy74SRvEYXZdRUduK9nCkDC80R3HhaG26lny3i/zYJO
         kZV2154W7PPh1OBB2KMZxZk6xGgEK1ibigVeE5EQ129EbGVWWXEHP40ZOe+uYiQzbbZh
         I3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976205; x=1795581005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXTszx/qr4QyW+2nmx6S98scb91JUewV8ipA3FPTKAQ=;
        b=2p+cJS5XM7RfegP+DPev9vB9rnyx6GtBxeSgR+r/K+HYYnNC6VNdc/o0S1QwvgD/I7
         ipMqC8bijPheE02rANwzEhD1T/1C/8VtiOkxc9swpxmllGWqYLGknUIIohF5HQPiQPAE
         hWXE1i43HxfCAbCQCBott0HvsJSqU1mOEa92Od0dPLsPA86aahX4mr3uLGUafvapiSoe
         GjkmtIIrVTBzt5D56ZkG/2TSoMWZpaJCoYbL+PnBkFT28vWzArGlsgTF4kwYGJ3MQLrz
         xylo8KK8224n4Txle6W/uK8cne6muRQkUz5RaUsyJvrQD7JlnLoU/tgNcOTAdHM/XOsb
         LgNw==
X-Forwarded-Encrypted: i=1; AL+hErH/pgZmVorYa7khf6VQHMwwoTBNfnevcntadjt1qud0sVQQHe2mtPL24pnE3SndgLSCdCEPnsf7uV9316I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L2hchk1kkvz8lDsbIX0GxRm/K9ho4z9HPUE+BgDQt6AEoaMth
	whWno82JnpaFPggt2JtZpEqDUAmSsgElft/IOYRBDv/MaGIGYkrs33Ht
X-Gm-Gg: AZFdTZfM1zOrIvvKBMn9M+J4QvIev9JnVvmYQmS3rydAnnLXE0yim06Coo2QYBcgWif
	oAATkK3WfqiBG7pekdMOkzl0u2dDR9aF2ZNEo3KFsr2Ijh4b2wjLdG1CWKbyC8JIiKccS+PsX3W
	cD99cpTIrbbAmvh450ICnCqPeVCi8Catx3NDU0vFy7Piozg5UheAJ6NKDCmpoMJqCVBiSeUpqs2
	mAFgcXPYQ5KYQaFa4U3NsZag/zzVLYzHIlM6qi93s8ZDERIp7L4EpMUjkzWZ0w9b1bET4FS/QRa
	3zCa7bKZT9nEMl8P5XoRgSo6Virt47SmxD8Q5Lu5yuX1M8mo04Zu73qpnnELo8eBB4msGg1nlIL
	DFQ8Lfo5iDbXbAKnhblHaGFFdC0R1orSB0MdNDW4HDXqgaqGnwe6ZL338+Gl6rm/YjrJHJ/9+38
	wbIAjiCFwBS7mL66MuX+4u6xqcKuj32xvSQOGHU3KDnKa5UjpUqkFOVJaQkuGC1kw8tzCb2CkYx
	PBcdWeZvwtbps7CjyT4k7v1Ug/chVh0OCQU+tZiugWFpgkrsJyzWwONouU9Mbl/O/qKDFDVkX/M
	R+tYhOdx1N/VjAjVVPFwL3Oi9lCW6g27m1Jx+O1BuIeRZRo04fhIEnhZPjazX5gjcOyZL6OezsS
	Qfs/3z0Ylz2Ja7froKxXCLfUPtp+EcMcK7TBy8aeK2plFFz6F382GGpHv3KOoo+JE145qpgvERU
	TpBFtnJDOzBJHzBffAZkDms33PbFtzOEdZoV4ZI97ayB/P3WI7F2B/Acpx6ZmUjUdElgYvXPgv+
	4KUAgg=
X-Received: by 2002:a05:693c:885a:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-382824c2225mr1475658eec.31.1794976204599;
        Tue, 17 Nov 2026 20:30:04 -0800 (PST)
Received: from FT6N242TWK ([223.181.117.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe75b5sm2877268eec.15.2026.11.17.20.30.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 20:30:04 -0800 (PST)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Justin Iurman <justin.iurman@gmail.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] ipv6: fix ioam6_id_wide sysctl on 32-bit architectures
Date: Wed, 18 Nov 2026 09:59:58 +0530
Message-ID: <20261118042958.83243-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
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

net.ipv6.ioam6_id_wide stores a u64 (netns_sysctl_ipv6.ioam6_id_wide),
but its table entry uses proc_doulongvec_minmax() with .maxlen =
sizeof(u64) and .extra2 pointing at a u64. On 32-bit, unsigned long is
4 bytes, so the handler treats the field as a vector of two 32-bit
values and reads the u64 max through an unsigned long pointer:

 - reading prints two numbers ("4294967295 16777215" by default on
   little-endian);
 - writing one value only replaces one half of the u64: on
   little-endian "echo 5 >" leaves 0x00ffffff00000005; on big-endian it
   sets the upper half, and the range check uses the upper word of
   ioam6_id_wide_max (0x00ffffff).

The wide namespace ID emitted in IOAM trace data is then not the
configured value. Same class of issue as commit 162cf592b577
("net/smc: fix limit_smc_hs sysctl on big-endian architecture").

There is no u64 variant of proc_doulongvec_minmax(), so use a small
local handler that goes through proc_dostring() and kstrtou64(). A
generic u64 helper in kernel/sysctl.c would be a larger change for net
and stable; it can follow separately. For normal input the handler
behaves as the 64-bit one does today: base 0 parsing (decimal, hex or
octal), surrounding white space is accepted, and values above
IOAM6_DEFAULT_ID_WIDE return -EINVAL. Input too long for the 24-byte
buffer is rejected rather than truncated by proc_dostring().

Found by reading the code with LLM assistance. Tested on i386 and x86_64
under QEMU: on i386 the sysctl now reads and writes a single 64-bit
value, and on x86_64 reads, writes and range checks behave as before.

Fixes: 9ee11f0fff20 ("ipv6: ioam: Data plane support for Pre-allocated Trace")
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

Based on net.git main 2a324a58a084. Built for x86_64, i386 and 32-bit
powerpc (pmac32_defconfig); W=1 shows no warnings for
sysctl_net_ipv6.c before or after.

Runtime tested on i386 and x86_64 under QEMU (TCG), with a small static
test program as init: default read, echo 5, the maximum, max + 1,
values above U64_MAX, -1, non-numeric, hex, white space, over-long
input, two-part writes with sysctl_writes_strict 1 and 0, and a new
netns. Before this change i386 read "4294967295 16777215", and after
"echo 5" it read "5 16777215". With it, i386 gives the same results as
x86_64. On x86_64 two corner cases change: a write of only "\n" is now
a no-op instead of -EINVAL, and a number with 21 to 23 digits (only
possible with leading zeros) is now accepted.

I did not add Cc: stable; please add it if you think it fits.

 net/ipv6/sysctl_net_ipv6.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/sysctl_net_ipv6.c b/net/ipv6/sysctl_net_ipv6.c
index 1a0a36dcd..7bac56b9c 100644
--- a/net/ipv6/sysctl_net_ipv6.c
+++ b/net/ipv6/sysctl_net_ipv6.c
@@ -30,6 +30,39 @@ static u32 rt6_multipath_hash_fields_all_mask =
 static u32 ioam6_id_max = IOAM6_DEFAULT_ID;
 static u64 ioam6_id_wide_max = IOAM6_DEFAULT_ID_WIDE;
 
+/* unsigned long is 32-bit on some arches, so handle the u64 here */
+static int proc_ioam6_id_wide(const struct ctl_table *table, int write,
+			      void *buffer, size_t *lenp, loff_t *ppos)
+{
+	u64 *valp = table->data;
+	char buf[24] = "";
+	const struct ctl_table tmp = {
+		.data	= buf,
+		.maxlen	= sizeof(buf),
+	};
+	u64 val;
+	int ret;
+
+	if (!write) {
+		snprintf(buf, sizeof(buf), "%llu", READ_ONCE(*valp));
+		return proc_dostring(&tmp, write, buffer, lenp, ppos);
+	}
+
+	/* proc_dostring() would silently truncate a longer input */
+	if (*lenp >= sizeof(buf))
+		return -EINVAL;
+
+	ret = proc_dostring(&tmp, write, buffer, lenp, ppos);
+	if (ret || !buf[0])
+		return ret;
+
+	if (kstrtou64(strim(buf), 0, &val) || val > ioam6_id_wide_max)
+		return -EINVAL;
+
+	WRITE_ONCE(*valp, val);
+	return 0;
+}
+
 static int proc_rt6_multipath_hash_policy(const struct ctl_table *table, int write,
 					  void *buffer, size_t *lenp, loff_t *ppos)
 {
@@ -210,8 +243,7 @@ static const struct ctl_table ipv6_table_template[] = {
 		.data		= &init_net.ipv6.sysctl.ioam6_id_wide,
 		.maxlen		= sizeof(u64),
 		.mode		= 0644,
-		.proc_handler	= proc_doulongvec_minmax,
-		.extra2		= &ioam6_id_wide_max,
+		.proc_handler	= proc_ioam6_id_wide,
 	},
 };
 
-- 
2.43.0

