Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107972;
	b=syno5dI6lcV9WtqOlu1pc5FLFxiYC5YHNX6oq6+e9MAXAcTDbd1/F7vCaATFCUniZioP
	 wj6eVwxcljkdSN8GMIHHBZ84iuV+D1BV9ukGNfLqqnR4iovRg1t7S5soBe6GPhJ798mpq
	 sOAzRqUl73iEVLzluCP7ZuFG+t+X/PmnP0JEdYgQM5Cf/2eZWyg4k4cet80vVJbkcC8g4
	 H8wxmeiL6h/niY/FjyMeB4UadistSDaBRvmpSjWxtj92gcYraKb0Rf57jof4p4NMtSN92
	 SmctbTvZ0RbTJu/hUus8ZmVB2tdkXIHrd5QSYqQa84enISn7c4HRl1ACT2D5PhoJrqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cnk+S66UzyDHe3QGPtEeIJhvpws/OJ1mh8yUxrgOPRo=;
	b=pKquXtrZScEhuSS0TvM8FGe1A/Eo2k37f6pdoGedFfm/ERKkggMn1Xixo0ZeOaoGrEIR
	 ItEOBQFCv0V9EiURat45+nnQE0q8escAGdo00bGCHJYGGn+rdXwHYFcWqya1PIEp4LbWB
	 xWL4hfGVxXc97lwZgYbh/QpJSPR2WU/5y1aiU8XfTy68CZTvmJZLN7Pv7yiAOurvehcu8
	 M9dyYljgkDG04AlE7uaLjwrZUWhiw6JZpJvzixKUpogoC6wYGyJCn///87mk/JywOQtga
	 Oop6+8B+IFO+1gBMtWeMG2bWNH3vfb3rsoum+mm9nTF+Nwh+iWjD3H8ADirINpLpekQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=muw0IJ9p;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268E4606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 268E4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=muw0IJ9p
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso767836eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107971; x=1795712771; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnk+S66UzyDHe3QGPtEeIJhvpws/OJ1mh8yUxrgOPRo=;
        b=muw0IJ9pufguJObqIR5TGGw7Dd54/03fF7wNGpGjvmyrbGv/8lr2oNBvmxO/W6r+XG
         Oh2xwcm2RIHAbouXxgPg5paInNrpMIGO22af6ca2mxTtSfnj9yFoEK72JMc2qm8w19Wi
         pqHm/LXaDbieTyLVHDqTyo+1ktbnxkWVAIKGxIDWUelJGmwBe2uB/M/D3+IDHBAyrF0p
         z9t6knX7OHaE699F4PIPOiwQ3axwY5ke2KUrXJQDpd7WOUoBluhdaSY/BTIIle0Ml7Om
         1HzyIGfo1xrOGasAyr8FeVuE3umMX7/7aQOxiuzHr+N3PIjAyPu5J83Mi+YvSgIkXors
         oUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107971; x=1795712771;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnk+S66UzyDHe3QGPtEeIJhvpws/OJ1mh8yUxrgOPRo=;
        b=W34zhxbv+89A0PZAqmvUEwe18Tm7ZZIjbqXEp9zaYWh9E080ZAoNN5J2OLf92q36Tp
         6XCPj8BnmB1AVZamH4fZuHOlXOYFOnKCVDGFMO+l/6SarkBbsYb6VIlkFzP2Fg6FBXFW
         veirW5HMLsMZXz8yC/7KZv6Yq0BEIhl/hKfeTLdW41nhm8TFxytcXQD4Da+8ni8NpROR
         uQO6UacqF5xm1Bq/+PUbkRCBCGHVv0mtfU6PmQ5wzcXweFlI5wbbHRRH5O5huDzPRuQG
         SpRa05B6oDODt83YlE9G6m/JXXUadDvy6YFX1fZ9fG0tLwL2W3YJvj4tD5uCsPj9MZ5w
         WYYg==
X-Forwarded-Encrypted: i=1; AL+hErEmDZaGpPw7ZJH3CWFVyXgm/HC0KiZu1YwuZMKwd2g0eVeNxLRhwoJjCwtLm6aLpHIQv32kuckTDaE8GXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BCX/K2bt5+20Hxy8uPKxHQpi8t2DPb3LCU6Mw9wPcmHgRR6vq
	Xf7ug7sFYluLJtkYc/AX3wT/rbznJ04w73f2MRJeSSAVsNFBniT7sACg05mAIQzJNqBZN/ULo2l
	88EJoibbspQ==
X-Received: from dycns21.prod.google.com ([2002:a05:7300:f795:b0:382:8cee:3808])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:648f:b0:380:c3e7:7814
 with SMTP id 5a478bee46e88-3827ff819f7mr6396707eec.7.1795107971055; Thu, 19
 Nov 2026 09:06:11 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:05 -0800
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
Message-ID: <20261119170605.1518761-1-irogers@google.com>
Subject: [PATCH] scsi: aic7xxx: Check ahc->flags instead of ahc->features for AHC_SCB_BTT
From: Ian Rogers <irogers@google.com>
To: Hannes Reinecke <hare@suse.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In ahc_linux_run_command(), the untagged queue throttling check tests
'(ahc->features & AHC_SCB_BTT) == 0'. However, AHC_SCB_BTT (0x40000) is
an ahc_flag bit stored in ahc->flags (and tested via ahc->flags at all
17 other sites across aic7xxx), whereas ahc->features has type
ahc_feature where bit 0x40000 is AHC_MULTIROLE, which is never set on
any controller.

As a result, the condition is always true even when SCB-space busy-target
tables are active, needlessly serializing untagged commands per target and
mismatching the untagged_queues accounting elsewhere in the driver.

Test ahc->flags instead of ahc->features.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wenum-enum-conversion enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wenum-enum-conversion; not tested on Adaptec Parallel SCSI hardware.

Fixes: e4e360c325c9 ("[SCSI] remove aic7xxx busyq")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/aic7xxx/aic7xxx_osm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/aic7xxx/aic7xxx_osm.c b/drivers/scsi/aic7xxx/aic7xxx_osm.c
index d93b522695eb..e12ee18a18d5 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_osm.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_osm.c
@@ -1432,7 +1432,7 @@ ahc_linux_run_command(struct ahc_softc *ahc, struct ahc_linux_device *dev,
 	 * table in SCB space.
 	 */
 	if (!(cmd->flags & SCMD_TAGGED)
-	    && (ahc->features & AHC_SCB_BTT) == 0) {
+	    && (ahc->flags & AHC_SCB_BTT) == 0) {
 		int target_offset;
 
 		target_offset = cmd->device->id + cmd->device->channel * 8;
-- 
2.56.1.708.g77570a6a1d-goog

