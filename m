Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108240;
	b=Ph0sjDvVVx+DoKxTrg2OvNP8f3pEeUjxTST/ie2ECTduuReqQnlQ+3Mv2wgEMyxX3HfQ
	 SRy0cwINiCCvqg4taragJ/VBvXdcXq+wCGb8WKnqg3wnmYPe2BhQvRi7JMvWKvyJTfzwe
	 U+tXMR5XorjFZyq4UugC8R9ULx/+A5OZYdroJmwX7yujeSV/bW5pVZemgMsLaYFb53H3E
	 3URBuvirBInbtBS3dl6Oj229Mf+ZT3jarAN0vHmHFWxoI4OgVdxe1WTJRhk5JyIlKi6Y3
	 zmr75skvELiNCRV4O7ImlsJZnRDP86c9E3UDOvgVfaStLG5C7Evr2Am2Fuy+kcH48KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=o0YFHDsV85WusBxLlbw3gy7XlrMAOreRvj1T3GhoBqY=;
	b=U/qCGDt/pE/XdoCvwigGt6efzVFnyZcV53zIWtnPPt0s3THmwJSS2Nc/uTQLKOWN3F7v
	 G9Ko4TlTjckgnnCye3KocA5oFQ0h+yPB2RsXTL0Mg8wT1DdvkmqrUWkA5jSAuVx2g1FTY
	 vAzgJCW1GygPVdLJPs8TLnTvcwGSX/soIIu85WNTcVNCDZfQf23r48Q8j/W0XrahPtkrx
	 j/iViVLc3UGe75e9SnYHiF+1nEutCA03NDWhxQiF37ng87HkN7InGMjXugBztNe8dv5mQ
	 3gaXOPvHQXNK/uXEMbzo5WSJvvJ09kU4Y83E12HQhBy+gyozRN7n2ztRDY8sCTK6UZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R8GFJzyB;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27384606A605
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27384606A605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R8GFJzyB
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-86313f7f4faso326180a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108239; x=1795713039; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0YFHDsV85WusBxLlbw3gy7XlrMAOreRvj1T3GhoBqY=;
        b=R8GFJzyBafa8n9vJed6wgg6H5h7TaVP1UUEAohsETCkWNrDwQgr5f69LHtWGBz9H5T
         94d3Dkop8IE0AU1OHaULcUrIqgu69aXdql+81c9WqmVsKTJtQigXrVpHSL2UGGpiJtDh
         vTNY/3KGvIUAaIQyRJVzK4BXOQSWiIRwO/HsDMLXNuDLeKTLgmAQeBMtDvRNBaGYcgEr
         1aVoDE06yzGNOGj1aRDLNqbdKx1gG+yjgbhwzykVWk/qxXuLsSirsdIn/eRFH4RGAq1h
         YW3I0FN1CRmcI7L0FmEYA0vNwhXtZniF2Omd7P3DEIcgVHVJaq1HKWtxWg4kkln1ajc0
         ItKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108239; x=1795713039;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0YFHDsV85WusBxLlbw3gy7XlrMAOreRvj1T3GhoBqY=;
        b=rMDi3zoCVdmv2dxCFw6Tq63wOOzWoHmGDTmHYtFJ43Bokk2utIFi1fDrRiZWeft2VV
         VORzhhZBNEp6I53ryNRVewFQ3tS3Yx20U+fNgS+SVztNkL0VrjiefK/TOUIMFZqOcLC9
         0GuDawprDuZLSacCR5g2awJNMqBVk2PtsD1DZvzM/ZShA/OHeysK2yctv90XL+lJIVdn
         F1IIu0aTfxSiofMIERoD7YJzLu1noriWeW7pBu5r6tAFsuhJuGxnq/oxeQeHHuHv4cIR
         kkHVwKrfqDySmVmmTSery7PLca2xU/Z9gHsO6RafrBzYluOFuG1QIMml6CvfvlL8zlC4
         w1jg==
X-Forwarded-Encrypted: i=1; AL+hErHT7Eqf8cJODaeIi+TeqPjrel4EK4bKBU2GzE1Ph5hfjT+h2wS5x4qnuOelzDJFqIY2kRDHQVdqkg0XdCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QyuzVZezVOhtJOME/hdvqxn/5j0zXOPD9oHO4kDzOIP+vMBw0
	oRhjdL8pzeh3gJ6aL5pLkDdZvdHPTxFCzHRpyZblnItaAtRxDLdzp8LRiw9cm7urFUXCjl7zPMG
	24zoA/s7uhw==
X-Received: from oiju13.prod.google.com ([2002:a05:6808:116d:b0:4f5:740:2bcf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:e8c:b0:577:2255:61b5
 with SMTP id 5614622812f47-57a0b03bd9amr687021b6e.30.1795108238778; Thu, 19
 Nov 2026 09:10:38 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:33 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171033.1535923-1-irogers@google.com>
Subject: [PATCH] platform/x86/intel/pmc: Fix mode check in pmc_core_lpm_latch_mode_write()
From: Ian Rogers <irogers@google.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Xi Pardee <xi.pardee@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In pmc_core_lpm_latch_mode_write(), when pmc->num_lpm_modes is 0 (all
S0ix substates disabled), pmc_for_each_mode(m, pmc) terminates without
assigning m. The subsequent 'if (mode != m || mode < 0)' check then
reads uninitialized stack memory for m; under zero stack
initialization (m == 0), writing "S0i2.0" (mode == 0) evaluates
'0 != 0' as false and latches a disabled substate.

Track whether mode matched an enabled substate with an explicit
boolean instead of comparing against m after the loop.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/platform/x86/intel/pmc/core.o with
LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized, and with a
standalone C reproducer under ASan/UBSan; not runtime-tested on Intel
PMC hardware with disabled LPM substates.

Fixes: 8074a79fad2e ("platform/x86: intel_pmc_core: Add option to set/clear LPM mode")
Fixes: e35ee8ee498d ("platform/x86: intel/pmc: Remove unused param idx from pmc_for_each_mode()")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/platform/x86/intel/pmc/core.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 47759b2a8012..7e12990d45a2 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1147,6 +1147,7 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	struct pmc_dev *pmcdev = s->private;
 	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	bool clear = false, c10 = false;
+	bool matched = false;
 	unsigned char buf[8];
 	int mode;
 	u32 reg;
@@ -1165,13 +1166,17 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	 *	'clear'
 	 */
 	mode = sysfs_match_string(pmc_lpm_modes, buf);
+	if (mode >= 0) {
+		/* Check string matches enabled mode */
+		pmc_for_each_mode(m, pmc) {
+			if (mode == m) {
+				matched = true;
+				break;
+			}
+		}
+	}
 
-	/* Check string matches enabled mode */
-	pmc_for_each_mode(m, pmc)
-		if (mode == m)
-			break;
-
-	if (mode != m || mode < 0) {
+	if (!matched) {
 		if (sysfs_streq(buf, "clear"))
 			clear = true;
 		else if (sysfs_streq(buf, "c10"))
-- 
2.56.1.708.g77570a6a1d-goog

