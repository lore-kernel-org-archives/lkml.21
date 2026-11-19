Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106016;
	b=OzXKgSvOa8eZbTqVDBBH4tZcTRb4M+sCUf9h4/t4NyptV3OehPBZhXAJVc/CnXcPhy+j
	 zxZ2OUnRKnts5K2uLwea/kfXeSkDIm93D26xOYED9t5Nfw17sQ8KZXmC0ZdG9m5thXVEy
	 /v/1T7ljn2xDILuJZlxILFXq8xT7yI9A+jNYl8QPzzn/zNMkb0JnN/yQ05I1paf4Czu07
	 J5wI/88hR3EY8kP6tF+1ijJJrMzFhj2N2zr+bUBRIISW6WFOylvzcuf5msf5vHsFmsQfz
	 o1zJh7AP2ZTc3T3zhkzPDrRFLQJI/Ta8OcCciySVUiCziWXT5N+9a0RF8aXfsDIcmrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+ZvuHn6ya9YnbK+HCx0pAQs3i70n5ubo26Lf+Gm3Zv4=;
	b=WK5vgPrJJeKuImH0Ybrszpi8bl3BBfwWtAVNWHowGGXqvS5fQ1WT42xIkWZRssM4JzMh
	 Ygnp7RZ7cSEsC3iFheuzxvTeJxb/UOOkJy5dHcNJVQCgYlx8v8x0gmVWeJdEP2i0WbLDK
	 jtYhF0Y6EpmzTPuiw2p7c1rIFJu6/hCyKFzMUKGEgHIhN6mChRRfuzRAxzy1Pk2aJOEFN
	 crARYmzXd6mNhCg2isvzkW4b6VmFjhf0/7+xjMneXm3Gbb9zH4GrF0VfUSTOp1ro6XlT2
	 H8P0XlkVdiPjyLyTkOMSWdiJ4QMdwQCn1Vp9guKXcCKts377NB/J+EiyxAnxF/akBPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=EqHZzZvu;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830E4606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 830E4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=EqHZzZvu
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso1278098f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795106014; x=1795710814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZvuHn6ya9YnbK+HCx0pAQs3i70n5ubo26Lf+Gm3Zv4=;
        b=EqHZzZvu2/bjApZCJGNtoNeE+d2Sj9sd2BeFEQ/7rMnkTvXVeNITJ/kTOn7qEILyHq
         j83Mx+THFnHsWacoKfmp+0A2cqutgx7SPbsdpVqmPC1F1hMa6bM0//R8QKzpSQXxUqOQ
         FAitpOz3o2yLmhMINzuOH8xX9cSlpi49fhoszpA381qK7PPKukmetyS8VjUvRt+O7qCc
         CR308bb3SIr2ZXIjhkIj65evqGW9sRQ/iv5AyEypMcoBf5jCH/zOFK2mt/y/hP7KTw6h
         vlCO5bxWS7mpZ5wPAuh0ublk4pA7tqsP0WJOyvRribkMKRiXU1be7VFukC3dNoDsi7X2
         LXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106014; x=1795710814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZvuHn6ya9YnbK+HCx0pAQs3i70n5ubo26Lf+Gm3Zv4=;
        b=gYg5SuEDSOQthKq1FfcvgZE+1N75W3f/uT3Q7JHAYFO5IWT0cc+jL15domGIu5Zt4g
         eRGiyF4M0MSe0Lpy/8H290+KM6jyHWQZTgGGOKUEmz5HesP8RijeWGOyj8N37wIUquKU
         /UGWi0aJZDzBS1j4Mrn59z9GAoXTYa0FTYEwGtI1W1jlTQ4QRJG/nYp9RB7WiozeAlKg
         AaQUTCOuO5SD6XEXQSi4r0HuG5nhZckkv2vy26sXMCNmL4lpbtL3j0RnBkChBHcBx0zh
         BswiJ8gKl5AjlJ3GkEdZunWJeS6nUBa4XaPzVor2trzKJg4Zyo6DyzuR0OIhp1Y1ZLH/
         0dCg==
X-Forwarded-Encrypted: i=1; AL+hErFhh3EkEMTWHO7449fiw8NUr8Rma8MerOX5mijjax0HSvxcExwJMAfCSx/tNublp3p7X/HFI3WfVIsd8AM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BiBz5q7nlJnVJaPH0KzO7IEUcdpRJjQDYBjz954B1h5Uk5R3I
	K6qFT0tc5W9KPWAJlv7TwiDKNwzS9d9m6T3HXr8V37BIov0bDAoD9i/JujpXcQsx2Sg=
X-Gm-Gg: AZFdTZc6I1/jz7DjHRGguZcxuhx/E96NCheNE8BcDWbrYGdVjhpuAwWsC4J5b77eqgl
	N6YIJDUkgCsWXdZ9YmRuu2HRwaTjLzG7xrNWrVmYsazyjgqPL3lLoWxu26cEQ5H2smo2Qj3u8hs
	InNU34V5xBNzIw8He+Mv/+PWXrdM3V3yDckXGLRKJxRDSwO/aOFEi/C1ZHLJSp8y8yeVgLsOSN3
	9siCwIhqU2pIxnuwEOBllhJighI5r+5UN/mu3i0jhG8wfam8x6nQdrlQ2AfjOQpPlbLY8QYObct
	sIMT7F1eWdmAOn7UzE1LV8ohaq+VPvS7eFyT7gByKTmu+udczmSzOYx91atoMkO2tUb5jzuh/C8
	BbglzYh5W8k6M7SmEh7ZSKItQjqFDe2O7UCGRtKkpgYKHdWlssEi2OXD74Kei4KzYtJTby9dlLI
	6BSKbFeb0aXiU41w3Ga1ZQblWIvOHiIvQ9JhBLKs82GcdwcVqqovuO8fJW/lfTrz/xh5F3uDvc1
	JBQt3NYWLC48mQK8aevvsImZS+NfjVd5fP4w8W1dsD8zvgvpbnIAgpqkBd13eBhu1cOKxtaYEK4
	+E15nNtbWnyYofPv0ZLBkP0R
X-Received: by 2002:a05:6000:2f81:b0:4a8:5a5b:3b7d with SMTP id ffacd0b85a97d-4a85a5b3cf1mr10186684f8f.56.1795106013927;
        Thu, 19 Nov 2026 08:33:33 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm522855f8f.54.2026.11.19.08.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:33:33 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>,
	Phil Sutter <phil@nwl.cc>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <amisiurov@cloudlinux.com>
Subject: [PATCH] netfilter: bpf: reject a repeated bpf_ct_set_nat_info()
Date: Thu, 19 Nov 2026 17:33:28 +0100
Message-ID: <20261119163328.878804-1-amisiurov@cloudlinux.com>
X-Mailer: git-send-email 2.43.7
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

bpf_ct_set_nat_info() checks the l3 protocol and the manip type but not
whether NAT for that manip was already set up. A BPF program holding an
unconfirmed nf_conn___init can call it twice with the same manip. The first
call sets IPS_SRC_NAT_DONE (or IPS_DST_NAT_DONE); the ct is still
unconfirmed, so the second call passes the confirmed check and reaches
WARN_ON(nf_nat_initialized()) in nf_nat_setup_info():

  WARNING: CPU: 1 PID: 21673 at net/netfilter/nf_nat_core.c:674 nf_nat_setup_info+0x251/0x2b0 [nf_nat]
  CPU: 1 PID: 21673 Comm: loader
  RIP: 0010:nf_nat_setup_info+0x251/0x2b0 [nf_nat]
  Call Trace:
   bpf_ct_set_nat_info+0x81/0xb0 [nf_nat]
   bpf_prog_e4b00ba35d2f7a6b_nf_skb_ct_nat_twice+0x110/0x13f
   bpf_test_run+0x172/0x2e0
   bpf_prog_test_run_skb+0x2e5/0x4f0
   __sys_bpf+0x7f8/0xe90
   __x64_sys_bpf+0x1a/0x30
   do_syscall_64+0x5f/0xe0
   entry_SYSCALL_64_after_hwframe+0x76/0x7e

With panic_on_warn this is a DoS. It is the same BPF-reachable WARN class
that 16d464013ec2 closed for an invalid manip value; the repeated-setup
case was left open.

Reject the call with -EEXIST when NAT for that manip is already initialised,
before nf_nat_setup_info() is reached.

Fixes: 16d464013ec2 ("netfilter: bpf: reject invalid NAT manipulation types")
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
Found during a backport review.

Reproduced on almalinux9 5.14.0-687.61.1 with a BPF_PROG_TEST_RUN SCHED_CLS
prog that calls bpf_ct_set_nat_info() with NF_NAT_MANIP_SRC twice: without
the fix the second call returns -ENOMEM and WARNs as above; with the fix it
returns -EEXIST and there is no WARN.

 net/netfilter/nf_nat_bpf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/netfilter/nf_nat_bpf.c b/net/netfilter/nf_nat_bpf.c
--- a/net/netfilter/nf_nat_bpf.c
+++ b/net/netfilter/nf_nat_bpf.c
@@ -42,6 +42,10 @@
 	if (manip != NF_NAT_MANIP_SRC && manip != NF_NAT_MANIP_DST)
 		return -EINVAL;
 
+	/* a repeated manip on an unconfirmed ct would WARN */
+	if (nf_nat_initialized(ct, manip))
+		return -EEXIST;
+
 	memset(&range, 0, sizeof(struct nf_nat_range2));
 	range.flags = NF_NAT_RANGE_MAP_IPS;
 	range.min_addr = *addr;
