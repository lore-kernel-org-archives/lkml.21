Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261320;
	b=b+7BIMoVLqo3+aTr0vXRluEB8VkTVz4sTrGxvv52QAYminsoJ5tZBeleKD19zmVGzSq0
	 j/0xUmDj7HBAHahwrPBHK1CAapHn+Kt7S0idOUlRPFKsCBvyln2IRPg7hjeiyVdOwjO+y
	 K1wMZp4EoLD6dOhbY7/Rtrh8EqcqCHokOzp+JoI3BnQq1ilse/5IsCrfCmOqKLc3N6A8l
	 Xxjj61ma6kfhdwK2Z0El74qz9OuzZVV0CenFf07PAWYjtJvKso/nvFSqJ30nOCkfJVxlJ
	 aILCjunQf76Czv1vbVTosv3zqjb1RSPWjpoFS0CwGs8kQ13/Vd6RAfK0TXnVHPa+t0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261320;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=aTSdgsW/If8AvBAp0QS47BaE9NNJMAYxI9k/KdCbIRM=;
	b=Gsi4KHUf5GW4qC6f5xXyrzdFz1SdqYCsgRvu6N+onErO88vo15oviJJbtHal0G8/EpZa
	 s4aDH4uxFpUnqeYUGC93rsFZXWv8/rKBXosWMRrg+xf2QQKA/eOX093vjW47xQ+EwMfzL
	 jSbS8AtzzsLCD2I5w77OsAtHzqFeudvpZd8Tm6F6rSMWziAM6SRG10+PGP9QU2TdUl01s
	 tKeyv2agOE23k3Bi0rdXXTp4WtESvYFRNQB5TknOpIWhZddY9k0ug5iRiq/miRLUaIAki
	 aWsM5xdQ+v45fQ/7uds5cGaVVf8T5wJziv5v4zfMoD9JFiL6KcPoM1BCkt3p4fJgzIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=yOf8hpyX;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9491606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9491606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=yOf8hpyX
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jWr031dshzMltp;
	Sat, 21 Nov 2026 12:41:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795261315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aTSdgsW/If8AvBAp0QS47BaE9NNJMAYxI9k/KdCbIRM=;
	b=yOf8hpyX+tb/aLi477Fz6ev+zrCj5FDs/13EqjF4PXOWzjVDcRkra6kobstNG/QE8thwpo
	Y1afUv7UYr2C4IbLbI05b6MQ/Dsdy2wgI5jhSgPenkOv9A2kTLLWYVSjv992AICqpCAkK6
	CZIyl84sPi1uVb96guTb2xt0drjuxNA2V0hevKNt1cpWO+YkxCc3htcZWI9orr+TJgQuJc
	Wo0ocMUJG6IHPra628M7XU/EZIG3QHHDIu8yQxGCPrgtGg4ogkWmingbk7e6kvuiyzbUQb
	yh31TJTuhtNofaPHRTxUW5QqgUGeqIxvjNDhU9USlgPm3PfF+tvcIpPLIg40eA==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/fair: add ')' to comment
Date: Sat, 21 Nov 2026 12:41:29 +0100
Message-ID: <20261121114129.1443346-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
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
X-MBO-RS-ID: 555838a9946ae005197
X-MBO-RS-META: s4j3ubgywsfps79epfa5yxrwy1s8b36e

Add missing ')' to formula in comment.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d78467ec6ee1..d10670b22921 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -67,7 +67,7 @@
  *   SCHED_TUNABLESCALING_LOG - scaled logarithmically, *1+ilog(ncpus)
  *   SCHED_TUNABLESCALING_LINEAR - scaled linear, *ncpus
  *
- * (default SCHED_TUNABLESCALING_LOG = *(1+ilog(ncpus))
+ * (default SCHED_TUNABLESCALING_LOG = *(1+ilog(ncpus)))
  */
 unsigned int sysctl_sched_tunable_scaling = SCHED_TUNABLESCALING_LOG;
 
-- 
2.54.0

