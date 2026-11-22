Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795311537;
	b=DEqoOqM06MtW2DkgC5/p+NzJUhbhLI9lxUvROK0HStHjzMbeFRKFprH/w1XTQj07wdPF
	 7JCxO5uQ/DaSDjE5lt4wAeGvkNToAnN6hWWwhJ/+TMMBURBiVKg+QuYN1Ywg4HO+ZyZP+
	 TlGbFPQR68WR987NeK2Ak2reJDRPJ7M03Aebe7UT4f2R7FDRpyuBSRu/ze4y7vbvq7RRS
	 tS1dOvT2Nh+XBssTQ1IT2oahqr7a1KbUKzIDh2Prq0P4whwbVoeRgVfPI27e9V9zsJJz5
	 0KlbM+cOf/75rX2fu6ulc0ELyoPKXlQpGbhlDaL7syrypFY6kgVTQLMsdo1VCqjOwKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795311537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PrK1kSxztn5T+MuJ04ncYiEqzZVjZOIR+C9onJtmWmw=;
	b=EF2+rCcagXKHwOFST5wl7gBj4XAPDUoE22MGYZQeonZhPPlSpdj24EYxBYcKk/wlKd/Q
	 1MYuYzWn1wc2i0TBfBi+zRm8MGyZZk8mClEbXas0VkNXa1XMqOi8OiJN9dbNeqMkxa61b
	 37GmBXR2+kEK2LhlVBNyKEVQA2NhbZE/lGV+M3Y0gEe0E0y7uLZu6oP6+WHC28DLzEfQj
	 hw992JpkvWmoIn60V1EVVt8YIBSudo6KdmwBOFU/Dor+mfr0EUrdpJh1GM0rOvmOIrnPW
	 Dlv/jQi1m/3bHO6fvKQ7kV7gvYaXGRJ+FoNaUihkn+5puAZl0ypvotmuf8LYksA+Yew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUl2yLPI;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BCE606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06BCE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUl2yLPI
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38699cf08dfso1465612eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795311536; x=1795916336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrK1kSxztn5T+MuJ04ncYiEqzZVjZOIR+C9onJtmWmw=;
        b=PUl2yLPIULUEycaRT6c+ort4b1uQJfbZEunLbcd3oOdRwmTtRRMFoeEna0GkOOg+ES
         xOXnoMsHd9qWAdTcPydNIc7pkdUQu/FRSkh/gGsxcoAGa0UpPmKl1wZ630UMLfyS85MT
         9lbvChmEHtt74xYDEhqi0jQjRmG2UJ/AeYD/1i0Xuhaglysa3TsIr6OcripXlLrjgoQ8
         XVL7ScXjRfyj29OcBiKbNavTxTymUROvOq4tgn59I2EpmlcZUv/xxKiJwC441Do7MNXi
         PiA6C/DzoA6hMrYvPkMrFYtNgfvpbqMslWlGYGm07fUEltIb2XPL55vM5Mc/0HkcgC7X
         0SIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795311536; x=1795916336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrK1kSxztn5T+MuJ04ncYiEqzZVjZOIR+C9onJtmWmw=;
        b=UQM/48KnakCb00p6Ni2NjV9pPxkz/Wp9TxzeAIJ1BJVEPmifa34lfJ4yIGwXiiDQ1Z
         FYrXI98PDI45kDEnN3aAuMLFg2Kl2/vEHZqwJ8YXd6GMbSNWHK2PGFjFljdAjus1xQ6D
         Jd0bzVfalXvcSFRY9DjWxTced749uCrjXRYJb5grCAViM9UmDbuh8xnn0pLOpOIrp845
         aDfaugCBpg1BjE4+U/gJh+X7SrWYhAqw3LPbGdwABwTlRKT+jSTwVXPejC+KNGko7V+f
         4aiwhhK8t/xh74bw8qr+7HnSG1ef9yGq+tJnj450CYqTEqxnDsd4+CEflDDT+K/VADPo
         ACMA==
X-Forwarded-Encrypted: i=1; AL+hErGuHfRdJHg7IScXai5Ni+Q5zEvX1Gjpp2xR8nsRc5tt8at0i7O/1yPMfR3ov/XPRXq/fkozc10v2Mh5tY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KayichOgb8I8IwlaEPc36/utuT+epwV0kTJgFeS0yN87maIYM
	Q7+B0UMbhTvqkQCcfv9rfmn96kqB5KJYAB9ityrvwtN/9b9yfid8knie
X-Gm-Gg: AZFdTZf7p6QtKPEVXGobsRH7M4/iCkygCHqhcBHm9JtjOUr0S4IPg+YX98+iz2fIbMw
	ch0g6yBGK3sqyQ9+PccGnDBFGxXDtblgWkN3pMqY8csXnP3e2XHc3ad6izjjxL96Si3IzHEiefn
	HBF1tZCY0mZUFmm5SDDbY+++Z2qVznWryklBlgOeGyG7iAg86KpvDJne6xg72ydYMMw3ZuR4LlZ
	WbvjN0gbrblFhh+4henr3c0aundNMcB4IoTiylOAE2m2t4M+aCD/6ZQ2ZmYjhI8diKBbZJdI0wE
	kvuxufED10z63Zx8rturtLpEPQG6shi6bX6iq7VQdtHshqWGUhmW7VN9XDZPXDxo9ysBtG65qQ0
	Am61EUwXpNzJ93g6Qv7kWTJQOi4/EBb18oAvA/hEidfQoECD0HJC/6GcfydUISGVx7stlUcyhfQ
	t9aR+ECQLg30lg0kggGgRCg/2yCXPnqHz3KTZX0an+UgmNW/5UZ4jrJzeyexBebOIiwVfZyNzzx
	z4e9koTM03znORHb1aX+ngImlqUsTRqGWvhnQEpGVBYVqkYvpd3m8SV8SuS1ckvj+NGWxJL8Cyj
	3uQWkT1KWWhXZDv5tPLlUGBtnW/wyD9aY3//e8zW+l/HqIiBgXWvUjf/3+tg8UvoC/szqxXmpWm
	l3fw3drQKXztN48psoGsHZEAgWiKWz+Q6sqxtmlAhsnZWd88ldzbJHJpq3tzGnjfib37Rqi+Y1J
	VXbble4Q6KuNYn72/vvMaRdjSQuzDftS1GmTTJQJpPmMXjARNLFlNfZWzCmcdIbzDaCDZdo4Fcz
	0xE6GBFN/MJXbOokCQgofhwLYFoXyijKg==
X-Received: by 2002:a05:7300:de08:b0:382:42a:d3ea with SMTP id 5a478bee46e88-38570258929mr7725889eec.29.1795311535953;
        Sat, 21 Nov 2026 17:38:55 -0800 (PST)
Received: from FT6N242TWK ([223.181.117.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm25330517eec.10.2026.11.21.17.38.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 17:38:55 -0800 (PST)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Justin Iurman <justin.iurman@gmail.com>
Cc: Simon Horman <horms@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] ipv6: fix ioam6_id_wide sysctl on 32-bit architectures
Date: Sun, 22 Nov 2026 07:08:48 +0530
Message-ID: <20261122013848.14287-1-jain.sm@gmail.com>
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
and stable; it can follow in net-next. For normal input the handler
behaves as the 64-bit one does today: base 0 parsing (decimal, hex or
octal), surrounding white space is accepted, values above
IOAM6_DEFAULT_ID_WIDE return -EINVAL, and a write of only "\n" returns
-EINVAL. A continued write at a non-zero offset in strict mode is
ignored, as before. Input too long for the 24-byte buffer is rejected
rather than truncated by proc_dostring().

One change on 64-bit: a write of two numbers such as "5 6" is now
rejected with -EINVAL, instead of being a partial write that sets the
value to 5.

The bug was discovered by an AI coding agent (Claude Code) reading the
code. It was confirmed and the fix tested on i386 and x86_64 kernels
under QEMU, with a small static test program as init: before the fix,
i386 reads "4294967295 16777215", and after "echo 5" it reads
"5 16777215". With the fix, i386 reads and writes a single 64-bit value
and gives the same results as x86_64, and on x86_64 reads, writes and
range checks behave as before. No kernel change was needed to
reproduce it.

Fixes: 9ee11f0fff20 ("ipv6: ioam: Data plane support for Pre-allocated Trace")
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
v2:
 - Keep -EINVAL for a write of only "\n", as before; a continued write
   at a non-zero offset in strict mode is still ignored (Justin Iurman).
 - Changelog: say that on 64-bit "5 6" is now rejected with -EINVAL
   instead of being a partial write that sets 5 (Justin Iurman).
 - Changelog: describe how the bug was found and how the fix was tested
   in plain English, instead of an Assisted-by tag.
 - Cc the sysctl maintainers.
v1: https://lore.kernel.org/netdev/20261118042958.83243-1-jain.sm@gmail.com/

Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

Tested on net.git main d5b89d55a322: x86_64 and i386 defconfig builds,
plus a build-only 32-bit big-endian powerpc (pmac32_defconfig). W=1
shows no warnings for sysctl_net_ipv6.o before or after.
Under QEMU (TCG) with a small static test program as init, i386 now
gives the same results as x86_64. On x86_64 vs unpatched: a lone "\n"
still returns -EINVAL, a continued write at a non-zero offset with
sysctl_writes_strict=1 is still ignored and succeeds, "5 6" now returns
-EINVAL instead of setting 5, and 21 to 23 digit input is now accepted.
Other changes seen: a lone "\n" at a non-zero offset with
sysctl_writes_strict=0 is ignored instead of returning -EINVAL, and a
read in small chunks returns the whole value.
The big-endian kernel was built only, not run.

I did not add Cc: stable; please add it if you think it fits.

 net/ipv6/sysctl_net_ipv6.c | 45 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/sysctl_net_ipv6.c b/net/ipv6/sysctl_net_ipv6.c
index 1a0a36dcda..61c28df64d 100644
--- a/net/ipv6/sysctl_net_ipv6.c
+++ b/net/ipv6/sysctl_net_ipv6.c
@@ -30,6 +30,48 @@ static u32 rt6_multipath_hash_fields_all_mask =
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
+	loff_t pos = *ppos;
+	u64 val;
+	int ret;
+
+	if (!write) {
+		snprintf(buf, sizeof(buf), "%llu", READ_ONCE(*valp));
+		return proc_dostring(&tmp, write, buffer, lenp, ppos);
+	}
+
+	/* an empty write changes nothing, as with proc_doulongvec_minmax() */
+	if (!*lenp)
+		return 0;
+
+	/* proc_dostring() would silently truncate a longer input */
+	if (*lenp >= sizeof(buf))
+		return -EINVAL;
+
+	ret = proc_dostring(&tmp, write, buffer, lenp, ppos);
+	if (ret)
+		return ret;
+
+	/* a lone "\n" is invalid, a continued write in strict mode is ignored */
+	if (!buf[0])
+		return pos ? 0 : -EINVAL;
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
@@ -210,8 +252,7 @@ static const struct ctl_table ipv6_table_template[] = {
 		.data		= &init_net.ipv6.sysctl.ioam6_id_wide,
 		.maxlen		= sizeof(u64),
 		.mode		= 0644,
-		.proc_handler	= proc_doulongvec_minmax,
-		.extra2		= &ioam6_id_wide_max,
+		.proc_handler	= proc_ioam6_id_wide,
 	},
 };
 
-- 
2.54.0 (Apple Git-157)

