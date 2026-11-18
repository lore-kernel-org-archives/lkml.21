Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795042998;
	b=Qtt0ZUVYrieg8kpfRHzFHOyr5JNhzidGEayPeKlOy+WtVLF+20IgpgLfW9Sg/j8imL75
	 ThiwDuK8iKDte41gqsp0czYDTUclYU+p5yOfmPoTr79BBhrNmfyp7CDBmw5JJqPs1YdmW
	 V++b+PAyDvXrXAce1RCL51qA4IQTAVlqjrbpUKFUO6QhEYiivcZJZOmJ1bvxqN0dixaKY
	 tQgl0FbXKyVO6Hw0HhrSAwjteMWIllzhir7bMW5e7FTQwAR/rOezyA9gE5AdSd17KUkCz
	 y/Px7Lg4bj1E7pAtHP//bFoLMScBXf1ceqNOSZNvy+pMtQ8QTlbD2Q38WC7bQh/7kXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795042998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0bFUqWyrVVHgbbYm8tQjpF1HSKbOC7uPXofdWERkqu4=;
	b=NmOfQ7B0Hm935cioeGbhj41LBtrMloehEX2Y+M+5ZDQNuxr6ujotMKa7z+Xo5cm6glGV
	 jEGUghj0MHDXK6ID0Wk00iGZF/uDn/O8dwNFJUM3VcWap+y5BfnGrfYk0TKpNfkGHZ5j5
	 DnYK+wbQi+ewlPjZIXc8LqJIqr4R5AuNwdVAtBY41ByKd4e7VQxcPX9NVljZNfMuHDiyM
	 uMsLCVFFyuX7vS6jr6KFJIjEpGhZnMKrYM32J+kPHi1cXQjV4XTFpCZnxJmmSlukcnZ3u
	 ax+wkOotFGKeJUGHnvM7SAT/py7BwZOks96sx470m189I20E30UoCRTEJCL6aVwIaXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dh2cFrtF;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B60F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B60F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dh2cFrtF
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so13042115e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795042996; x=1795647796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0bFUqWyrVVHgbbYm8tQjpF1HSKbOC7uPXofdWERkqu4=;
        b=Dh2cFrtFAJzh0Wq1ncHebviOUJHAQJ89+8ZQCMqAC3DD8exD152tT5fOtJOzrNDJwa
         2KDIIr7kkV5rJq32/9Ssw9kB78CuFudEHS5CmnH81c7+CM6QVr8cA3CDL1MGU5AZSsHu
         +wPGEG1q1h8HoUwsFxGnP9tym94YLbJkCjMycbre0b5vcPJr5CWFqI0fZ2zq6DSEsmQq
         PqxCS90k0aOgoDhvRuLf3Xvcsn32iRR/K2Bd5ZkyosPKLsOaVr4GbrgIebuYBiW5o1KM
         JbJn4eAUXepRbTXj13hG1dEiCzjfU10ojfXY6bJqfhoe78308M/rLL4fGG2le4Scosq0
         Gecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795042996; x=1795647796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0bFUqWyrVVHgbbYm8tQjpF1HSKbOC7uPXofdWERkqu4=;
        b=K5h1raDezJqG52Pj5hZU1UHh1q71kMPL+jIrT0JN525iRkm6rIkdOXT5hVLPDFd9tS
         sydIvWwXn1HoQYeWHMGjUskVlIqBXK8e8b2wsP2rFzRPSQobHYSV2mvdcnsmW8YvIiae
         vtnc0Oyga7MLKcByr+79pduVuaTB2nSq6BkNdMO6TZjz0h8D1be0+puoFFwX6Wt54IZo
         yqIHEWals8zMFSj1rqHEu8VrB8/0uawErwdQm17KSS2XVzGExEM5o19FXwcoKQdJhQeI
         /j6WUoCDhKvkeSu4z9g4EjeTfRiKsVRooH/IRv0rCBdJQR6AsBC4QMKcz8yypY06Osvh
         CuqQ==
X-Forwarded-Encrypted: i=1; AL+hErFrUNfR0tMS9W6xQ43833xALgNgwbRSMDLEcnlbwPidAEkOimB5saXwl7ByE3Nj36IcojMXYYkejHKBjKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xrSeJokPAv2H86vlzC6MB0SG+G2clsZfeOzX8rO1vfvgXrOzk
	BN6bG8RFd2t+ArhnWHIM2wOhEUAwr4sMkPjhyiW8hX6h2GhURKf2cs1Q
X-Gm-Gg: AYBFou1ikWnMRR1WDbqj7q8T4YvPcT0xBWgy3zkwcR+ZVPSXb9sVz2k5s0uguptIuXZ
	b0JgqyFu539Sf23znjh0kZlPa5/ZaW4z+AKJnLZi6OEOuL8svbXrebvGzklzLREu9YNKEALBFqK
	3eebezJ5jnRK2YE0HdhdzqwhkKHwYYkXnJDCWPzb7r0W+Kgb85xccPIIdDNtLNln5YwFTQ+rHpq
	aVQeQQyuKVDhgdbiJWot1AoelqWH491KbNd059cpmnDAXlXt428JiCVrkUuoiOyex6FXKlEkmfn
	/iCF/FNKJUn3LjwyztyTosQtGweBfGUTisPD99RVuBaqx7rP4+BYQmO/INEa7JMvyqi7JZXkkXh
	NhUcM9VNnZ3zIhRwPUn7hID2SWjj7woxvMaZTfq+Jdlqwkwc4tQtRAhGhrX/BI088KeN4AgafiS
	ZJEMWHu5Qqi3zZLjrzWLoJsNkOr5BPpB1tri1avzr+NR8mmZJPx4rJtaQRjqJF+t6fvWUbYxRYQ
	stPIKZwkkQ+O3rYsIXndsvx1cXszsL1uUC7+NqgjwMx5haIit9mIixYXMJriFvBkzEWq8pVyRbM
	Lv6HgYNiHirCXF8CKnWa/iNzqQWLusrF/ZnZ23SLeqfUSFyt9lK2cESJb75DPaiIBLS5meiNuWA
	b09RIHiWjIVcsEbzMOIdMpqaqeW4f11ylU59SOuHLQnXSGYdcqcES8MvqFmDHztMebTSiy4MyCH
	DrNpLIw2GRQyRm8NiKL0/KRNxFu5TX1UPe9zVax7T+8GzdOQm9TOpoewktoUdms5CATtChKteI8
	IF31exa/7sSCJTJ
X-Received: by 2002:a05:600c:c167:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb7da390b9mr78174065e9.25.1795042995856;
        Wed, 18 Nov 2026 15:03:15 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-b3f2-1adc-a486-075f.rev.sfr.net. [2a02:8434:fda5:4201:b3f2:1adc:a486:75f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb842f0941sm5232915e9.6.2026.11.18.15.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:03:15 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/bootconfig: Preserve structured histogram filter strings
Date: Thu, 19 Nov 2026 00:02:52 +0100
Message-ID: <1218ce4d98a4c6ab6df6279c34d973b9d033755e.1795042969.git.edumucelli@gmail.com>
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
Content-Transfer-Encoding: 8bit

print_one_histogram() expands the hist.filter value through an unquoted
command substitution. Field splitting collapses repeated whitespace in
quoted filter strings, and pathname expansion replaces literal wildcard
characters with filenames. The generated command is already incorrect
before run_cmd() evaluates it.

Print the filter with printf and a quoted command substitution so that
structured histogram filters reach the generated command unchanged.

Fixes: f134ebb28126 ("tools/bootconfig: Add histogram syntax support to bconf2ftrace.sh")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
Hi Masami,

Thanks for picking up the run_cmd() quoting fix. I had this small
follow-up ready in case that patch went in.

Here's the thread for that patch.
https://lore.kernel.org/all/97454eceb5d56bf956740b8998972767bcfe6c70.1793216183.git.edumucelli@gmail.com/

This uses the structured hist.filter option documented here:
https://docs.kernel.org/trace/boottime-trace.html#ftrace-histogram-options

I tested numbered and unnumbered histograms in a temporary tracefs
instance on my Ubuntu machine, running kernel 7.0.0-38-generic. Repeated
spaces and tabs were collapsed, and a wildcard expanded to filenames.
With the fix, the generated and installed filters matched the input.

The run_cmd() quoting fix was present in both versions of this test.
This additional change fixes the string while the histogram command is
being generated, before it reaches run_cmd().

Feedback is welcome.

Thanks,
Eduardo

 tools/bootconfig/scripts/bconf2ftrace.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bootconfig/scripts/bconf2ftrace.sh b/tools/bootconfig/scripts/bconf2ftrace.sh
index 6a3535a2c..0992e54c6 100755
--- a/tools/bootconfig/scripts/bconf2ftrace.sh
+++ b/tools/bootconfig/scripts/bconf2ftrace.sh
@@ -163,7 +163,7 @@ print_one_histogram() { # prefix
 	print_hist_actions ${1} "onmatch" "event"
 
 	if xbc_has_key "${1}.filter"; then
-		echo -n " if "`xbc_get_val ${1}.filter`
+		printf ' if %s' "$(xbc_get_val ${1}.filter)"
 	fi
 }
 

base-commit: 0ad31c3252d4c626a93ae6251340ef86b18342d0
-- 
2.53.0

