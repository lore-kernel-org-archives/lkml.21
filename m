Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108048;
	b=zCejm3IssXYrYXOxxxQy7qoWFZKxstNd7Q6tyvcc5OO1977yUseZ+9jjkL6ESarkHp4K
	 crbp1ysKsLwcCqcsq9xRr5F6wOX1IkOT6lDw1TSl5JRH7wVWS6lc8YuDWz/7QqOL0dUZQ
	 BkizhB3Y+uizyqdKG3OXIgRfIRE8EiyVyekfo9aROfBKnnvFWsRtDzaaxduAez62T8iwz
	 eg1NB5tRKcY+Hi8W2ulIpwAnO+6xDZWRF1VkaQYexJ4bZn6t+wveumm1a0cxMtJkUme4J
	 3HaZR5eAHK7dkHqD6vwiPuSk4QwEOIcRkngPGIFJM/Jd+Szo7gAVBIaKE0Us6iMH8NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=CPSkT3mQY7L20a8r35/Y3UAKl++Ut888ubg0F2YWBeY=;
	b=tft0R/iuwKwFZSq58uxYVf5R1xiFgcAykhYCuKKcurhDTf7UCPXVIt2Ey5Yyet91PNOS
	 Pq/QOukssadCv5QCUf+NNkqFrNlMUbG98e55AGXuYwRupvUHSprsD9ujyvnFpXdSbFkVc
	 525SFhy5z79ZC06YbuzteBh4DisTO6GWxFghoxqqGMe565fQy8LI26xBAuKBUDYsX6l9i
	 aMd3O11AIrqcPj3iLodZtsA7MG4AaJ0iO8rWMavBXvdvnw2ObwIGN5SLFbiE/FbKTrfRl
	 DKKLBdyTpl8JTy/lw6d9ifFhughdHe/sXEhb9pj8K6Mn65T0Ck+dnLKiyRJIbSMzr7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oQJ2zRf7;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54456606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54456606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oQJ2zRf7
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so1729346eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108047; x=1795712847; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPSkT3mQY7L20a8r35/Y3UAKl++Ut888ubg0F2YWBeY=;
        b=oQJ2zRf7WaeJXxKVx8+Ci1prOzbFnjiyzDxmPKQ6slH141x143RIZISqaQOa4oT3rP
         Yab/eNteyL55flOnj5vp8iAIEx9d/Kh4cX9ML/WMhElGYEYm90MmEs2+4hLN3av06Oz8
         SM1Yp955IKP70oO5LEeLMyZZeI7dDmyeLaoZ7El3x4c9jQru3NMg8NCO5WpBgY/QQSlG
         +f6tPV0uW2jqEdv/B+IIOINbv929d4BttYh4k47BH3cn12pj7n2aP2rg6lU8hxmKoSuL
         04sdSFG8yV+RbNrJlyMieONaW3K6N7eFer5g9XVGIZsNIwtIqgMoIg/MlpKsOrXj5tg5
         JHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108047; x=1795712847;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPSkT3mQY7L20a8r35/Y3UAKl++Ut888ubg0F2YWBeY=;
        b=UQDaiWVGpdLPDiLeTZsJPDyfTrPa8BJ1p+Qth5grWjPUTbkJzaG9AV5UiRaDjQLXi5
         VR5P56++fwOU/0qNRUiT3vFoiOc1nGn39J006PDY+dL7yauHqRMZ0r/vD8s5Zf63vJSZ
         ZEAfEEtHLQRv+x6fKKXT5dTNb7ajX7Wb3su+EJOA5xHo8AnQ898jR6KTiHyTgVvFLDOy
         5hUwYL9l9M5lbuz5WW5MQOf3ybZXdBG3upHz3UHSdOLyrezj54plHONCUzCb6mVnRmeQ
         Kz+vbpqVpDthxBlD2WcD56HeDPz46Anw2GOgJz1J31Y1FTmCDhLBawneIvRL5pIzp8qg
         XmmQ==
X-Forwarded-Encrypted: i=1; AL+hErHbIq8yKOkjqKBpLgMBUONkXcNqMn6P2XuKxmHfXjcnTW7dWWttBNkAeIoWzXXAStZRXtHIHBX4gBsPdlY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pG09MH10+pxzOx5Qg4MWkcyR6GiXaPSqsTF2lqvOauajTeJXk
	ad/G8GEJWUJDy97XDBArPWlXTl/kwoRSCHEBcvTzBOsHqu2FjJfa0jGP6TTm+VBf3lCqgVZJu+o
	uCw7Y/m96wA==
X-Received: from dybmd48.prod.google.com ([2002:a05:7301:1830:b0:376:93cf:d6ce])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:3f16:b0:375:dc5b:4400
 with SMTP id 5a478bee46e88-3856c5b52eemr19829eec.1.1795108047106; Thu, 19 Nov
 2026 09:07:27 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:22 -0800
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
Message-ID: <20261119170722.1524088-1-irogers@google.com>
Subject: [PATCH] can: softing: lock card->fw.lock unconditionally in softing_card_shutdown()
From: Ian Rogers <irogers@google.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>
Cc: linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

softing_card_shutdown() calls mutex_lock_interruptible(&card->fw.lock)
with an empty if-body ('{ /* return -ERESTARTSYS */; }'). Because
softing_pdev_remove() invokes softing_card_shutdown() before
unregistering netdevs or removing sysfs attributes, a pending signal
while card->fw.lock is contended causes mutex_lock_interruptible() to
return -EINTR without acquiring the lock. Execution then proceeds unlocked
through IRQ and DPRAM teardown and calls mutex_unlock(&card->fw.lock) on a
mutex not owned by the current task.

Use mutex_lock(&card->fw.lock) in softing_card_shutdown().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wextra-semi-stmt enabled; fix and changelog drafted with an AI coding
assistant. Build-tested under LLVM=1 W=1 (-Werror) and -Wextra-semi-stmt;
not tested on Softing CAN hardware.

Fixes: 03fd3cf5a179 ("can: add driver for Softing card")
Fixes: 47fa0336c1b7 ("can: softing: softing_card_shutdown(): add  braces around empty body in an 'if' statement")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/can/softing/softing_main.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/can/softing/softing_main.c b/drivers/net/can/softing/softing_main.c
index 519ab3097f86..d3dfad4f5321 100644
--- a/drivers/net/can/softing/softing_main.c
+++ b/drivers/net/can/softing/softing_main.c
@@ -448,9 +448,7 @@ static void softing_card_shutdown(struct softing *card)
 {
 	int fw_up = 0;
 
-	if (mutex_lock_interruptible(&card->fw.lock)) {
-		/* return -ERESTARTSYS */;
-	}
+	mutex_lock(&card->fw.lock);
 	fw_up = card->fw.up;
 	card->fw.up = 0;
 
-- 
2.56.1.708.g77570a6a1d-goog

