Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672359;
	b=AMSd4hkn4kqGNzdK1/sverbRRjs6MF3uSUMQTEWftVt+mCHyoAkXLJVGMlyDsb3WItfq
	 tyod7jTw9MJgw9pe8P9SrQ5h+xFCHKpTN5zVgoZPzdHXrEuWhTbaK8l+9gLafeMCUkizC
	 BXrGzghFDMgVcBHEv0BgXKkRLHG8qXY1VXwOq0MnCJohr0NpDEV6c7wi7TAYPF4fMNXdQ
	 yTl6wv5IZmXOGSn16o9ELcqJf6eQBrVArIc79AGwjUyix8Mjg58rKQkhwiWZUIaN1SVfQ
	 +gQd3tgFncXooyuDy6q158DT4SL8h+copTDonF0dD9oWPrr+O8SyxFyatkPFKFTjMLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672359;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rp87fFVo66z0bNjr/QAS94X3yd/Vue0JZ5sGVAATgmM=;
	b=fbTOb4bQrSeqMf9tS/mu/ts84fLghHJM9o8H/J2XW95MU/qp/tPoWodxKxKToGovHdLX
	 dSmRR0HfN6Yo/DLXYshArF/smhRYE0B7957bR7bQsPaqZepVrOjgYAfL0qBLjBA2O1GWx
	 O3kRm68Tm8zGYkOX8+y8R3igmZTXhLw7qpk138scaMZFwBYKuwlusyKKCgqybaRW6L8Ex
	 Qn3lcFEwgrt+fK5cdVJc37D0L4R4jl+Hf52v1vZbtHgET32MxRak6sjdsw2CIqWvAbPtZ
	 7c3oRLvx6N7xyF/AViFrDaCVSzYiXd4k7g4hHEJqjNCIaKQc8UulOzK6B05PZ/HrblA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QG573tJa;
	arc=none smtp.remote-ip=91.218.175.61
Received: from mta0.migadu.com (out-61.mta0.migadu.com [91.218.175.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FEB606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89FEB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QG573tJa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PDJSASvlt9xJZen0jV2WM8AUZCLu70P+kYtSbovdDvs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795672356; v=1; x=1796277156;
 b=QG573tJaV654Sq6KseiWH+511Ij/DlsFvITfxRTQIVkHzfaXrNe3TpmmvmTK6hGzBqrZQkjV
 XGmgtLZfpdM/Pwa98GdUK9Meljq8EYzvB1PbtddLDt6iJNh6FRUeAXWb5OZW2kl/Rm23XEWB/bp
 hHZVVvsh76S1r+FAPLevpEN4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bb5f8296b098adfa;
	Thu, 26 Nov 2026 05:52:36 +0000
X-Mizu-Trace-ID: bb5f8296b098adfa
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com,
	tj@kernel.org,
	corbet@lwn.net
Cc: ridong.chen@linux.dev,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH 2/2] docs: cgroup-v2: Document the housekeeping CPU requirement
Date: Thu, 26 Nov 2026 13:52:06 +0800
Message-ID: <20261126055206.251724-3-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126055206.251724-1-guopeng.zhang@linux.dev>
References: <20261126055206.251724-1-guopeng.zhang@linux.dev>
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

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

The cpuset.cpus.partition documentation does not describe the
housekeeping CPU requirement for isolated partitions.

When full dynticks is enabled, changes to the isolated partition
configuration must leave at least one active CPU available for
housekeeping.

Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
---
 Documentation/admin-guide/cgroup-v2.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 2f792ff29425..36199da5c842 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2838,6 +2838,13 @@ Cpuset Interface Files
 	kernel boot command line option.  If those CPUs are to be put
 	into a partition, they have to be used in an isolated partition.
 
+	In addition to the CPU 0 restriction above, when full dynticks is
+	enabled with "nohz_full=" or the "nohz" flag of "isolcpus=", the
+	isolated partition configuration must leave at least one active CPU
+	available for housekeeping. This CPU must be outside the full-dynticks
+	CPU set, the CPUs isolated at boot using the "domain" flag of
+	"isolcpus=", and the CPUs in all isolated partitions.
+
 
 Device controller
 -----------------
-- 
2.43.0

