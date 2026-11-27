Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801211;
	b=H2h2wEpGD5wyXPND3aTn+nZzuPb4NviTbu5gVObwFFQBWUCGHV9NMQJqsd/Q7jHhsWf6
	 f/Baxn1M5+DhbLgm9rBNY0sRuHT4shtlaT1ocHn5WnOimRHxkdZ9OJCukj14EjRie19Fz
	 46MU4Y21nE878/FZcCnycYllJcp0tE5on7l1BKSRxtkNKvwEygMNUFbIlwh2mVo7BddRz
	 TsM1y1hmin+UBAUoQy71571vcoaF/N91J2t7xmLrcjRASCKmpTvEpxLMGRzXQi0W3QlqN
	 zKDdZtH80hJLWq1We3UBI42zM4czzT2qEFAfkufFMGMoCIeurxMe031cyEtU2T/U83g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ofArx5ujhLyTHENIAOuRlAWqZZezV0c1Av4Ix9tXe4g=;
	b=DVUoJEWwyzYiq8cWjBwST/LU5Bb+3LGCFDSUwk+H/Fbu2RMId4Lk76Su3pINSufyqc8K
	 dJz4kyNjrvXlabTbf9bz615b1MuFWg2jpE2LeI7SkQDIqc5xy5feZIaDgRszVMyC4GHHz
	 S9a/itbn2A8S1mu6I1pRRhqmF5T/Zpm/VMnddxRzleU8INBaPP6D+zE5bj97OqQwlfRQ+
	 NriA+qILUgkqeN8+4j2v35u/yUSYeqb2DBYj+cvbdv0CBGgfqyUYo60p1bQSUn4Qf6+7O
	 3rfxIyEEdc7PGjTJVUAm9RCpC5E4DvR3zZE52AYTCpMGEL/8jhdfIRdBaGU48OE8szA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QzXkkxb4;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA0E606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA0E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QzXkkxb4
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a358881793so4430485f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795801209; x=1796406009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ofArx5ujhLyTHENIAOuRlAWqZZezV0c1Av4Ix9tXe4g=;
        b=QzXkkxb43v6gQ2CTzV8YMdag74CWJ5+ozyMzEeC5wrFjCdKQlX6dC7Wyu3YOyzEPjS
         AXrxY9I8SDswiWYkplCebkVAiWAUYzLzOUOsn7ggfb8MU8iCDgMtyU0fn0gEHybmhC5V
         xe2Z8LnEs25LSgzPrkZO6rjm7hxnVGKtz46ZgT8ulM5K47279oOE54XDO10f4OZhhleu
         iw0Qh7aajtUvThR1dl/ihiScQKZVdU773LB4i8SkJpXxwmmvt85Cq6sV+ZMXdQ45MeEz
         cyFLS2N3TpbshX23Sa9h6qXMbq2180/+XPLo+2vKp2SZdaELFvmNpcKNvNvkltAiU/KM
         o1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801209; x=1796406009;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofArx5ujhLyTHENIAOuRlAWqZZezV0c1Av4Ix9tXe4g=;
        b=ribEBvz4L1TUzM5qsWNmB/YHB+8h8s6VYyZ9/nLQeqs/yhKwAGn/YoyJe9KXWsSC42
         3F93SzQERNcwIfjuBcytZ6rV8TcjIKKxIKU/Va1xd4Pz1Vxn+A4pZNC6V49RBiKJehiQ
         y42D5hw+7bc7COoIfOAH8WJIMnRXRIsLz7UKFttpBqtOnxGUEnG4fjf4r1AOmvJvPCYa
         KJXCHI5Gx5T9ek2u5UxQ+62qqiOMXdQRw5dzYes6nehBL+UlGDircs16beUZXmE9V7vA
         N6jma1JVlPlh4xzUbovIGLQf5oy9572RsmObA7BcILHK9JiMygH5bNEnU/lWJ9HwkjgQ
         gYbA==
X-Forwarded-Encrypted: i=1; AL+hErFRihZY3wyoxUCj9A27A/gCeHzPbh7niTj/6j3XQaVySGp83UZWhyarB1i/Jbk2bHmpGOGdP61JGtLIgDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aqphRkcHBaNUlGChvYW2ONP1WbPeCB7Ve87vciysxAqzJ69yn
	aBftmyp4LcEcGrCRCl+sDXPQaK5xE818WYXpSFC1ndajg6RRLlSeMAVE5dFKDvHJpdY=
X-Gm-Gg: AZFdTZfWXvOxNrfMyKecGVU64y2zX1qqGPQ3qeyLQVYhrjAt1/sAlAGU/rGFBXm81Pv
	KpvrNRS0tXCB/wJFzzahAIFBoNYczJ9fM7fCGYu4py5pLQo/X7BCix9bU0dmOxi+HKXIrthBKnu
	dr5fUIt2801VtA2ZbYsgUi8Q+m4+xA9/4nHkFSYZGhDoBsDSIDub44qrz0XXU2Mx0uWTF/7owxu
	V65bx0heE5U5xZPhfrI608fyMX8XZh5hPAvfYXethCg0b6q32wf263Itpt2Q2l2jvhJJXOP1JNF
	YveWHWA+VCf7QWBTQa8cuqWa5DLqf/xu8Vb7V6g0KUKJlGTsTr1a4w/bbsue7R9PIuqrNpPTOs8
	HIGfkZ/WvZXm055/0W9QqEjq0hR8YgQHJdlfqPuXGTYd/VG4/HK0FEjFmEXN7qT970OPsuV5oGM
	TNrJYp5Aeo0qqAjy1FT25QQ5SWmGD7Vwm58ow8HZnYOyl+DwQzbxU2FbQLaaHV/UZmtmBHjAOX7
	mFWr06tVGQT1q+zI9WY/A201F5x8Un4OogZV2OxI5HM4CgUYpxTHV7RO0H2G4ivuLMes31HBZ6U
	m0SmGbcph1ifHEauHJp9C/iO70AQXXEsebf97jy3CzYH1oeHKcp9qPAiE2IXY1j6ImfZlwSSR1/
	XBDoKuWd2zZxNNG1l
X-Received: by 2002:a05:6000:220c:b0:49a:9499:7909 with SMTP id ffacd0b85a97d-4abb560e39amr50243242f8f.35.1795801209594;
        Fri, 27 Nov 2026 09:40:09 -0800 (PST)
Received: from localhost (p200300f65f044d0890ab5f15b7da13fe.dip0.t-ipconnect.de. [2003:f6:5f04:4d08:90ab:5f15:b7da:13fe])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6baa397asm48965065f8f.48.2026.11.27.09.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:40:09 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: =?utf-8?q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] pwm: tiecap: Fix type of variable holding clock rate
Date: Fri, 27 Nov 2026 18:39:40 +0100
Message-ID:  <2d23fd2163a63f0d9a4b4a4894c0e179ac777aed.1795800756.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795800756.git.u.kleine-koenig@baylibre.com>
References: <cover.1795800756.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4Ctacgtifo8C3GPHQiX3Wd3miPIQZmI8GaVpnJ0UTIg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrCcBdNY/FpkIDaVueb0nkyYPqwc6huZFYVFOem P6YdtVUZa+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawnAXQAKCRCPgPtYfRL+ TpP2B/9EA6FBVWBX4jcIKtLfzJFsUe/XWi7tq7uXA3T77dq5Ugu47CLkjZTtjj7n+Rws4EVQ1Zf Z38qagwt+4Euq0HAewMLgk7DPstStG/8ITmRA8qL1h015geX31k9GzrG/oL66bEGOm9xhMq5gZI f3BxI7YKdf6qynDklF7gkUaadvSOyDZ/z8Ks2lEK+/jFAv6jiGjbC/FIARQ86e7q6w/1yDlZ1ZM Xcr7RXYlXdg3dVbfm97tnEu7vMDfE4ynfH/rZL02UXRWOlIafYRPOS7pBhg6JgOX3lxHqhLJMSF zgjEKa5myiFsT/6S2PeIxAjr//rtz9xZQUWTsWHDYAg+eRDm
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

clk_get_rate() returns an unsigned long. Make clk_rate the same type
to fix silent discarding of relevant bits for architectures where
sizeof(long) > sizeof(int).

To let .get_state() handle that possibly bigger variable use
DIV64_U64_ROUND_UP() instead of DIV_ROUND_UP_ULL() as the latter assumes
the divisor to be a u32.

Fixes: 8e0cb05b3b75 ("pwm: pwm-tiecap: PWM driver support for ECAP APWM")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-tiecap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-tiecap.c b/drivers/pwm/pwm-tiecap.c
index 9a490b8d60ec..7ca23a7576bf 100644
--- a/drivers/pwm/pwm-tiecap.c
+++ b/drivers/pwm/pwm-tiecap.c
@@ -37,7 +37,7 @@ struct ecap_context {
 };
 
 struct ecap_pwm_chip {
-	unsigned int clk_rate;
+	unsigned long clk_rate;
 	void __iomem *mmio_base;
 	struct ecap_context ctx;
 };
@@ -232,10 +232,10 @@ static int ecap_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	state->polarity = value & ECCTL2_APWM_POL_LOW ? PWM_POLARITY_INVERSED :
 							PWM_POLARITY_NORMAL;
-	state->period = DIV_ROUND_UP_ULL((u64)period_cycles * NSEC_PER_SEC,
-					 pc->clk_rate);
-	state->duty_cycle = DIV_ROUND_UP_ULL((u64)duty_cycles * NSEC_PER_SEC,
-					     pc->clk_rate);
+	state->period = DIV64_U64_ROUND_UP((u64)period_cycles * NSEC_PER_SEC,
+					   pc->clk_rate);
+	state->duty_cycle = DIV64_U64_ROUND_UP((u64)duty_cycles * NSEC_PER_SEC,
+					       pc->clk_rate);
 
 	return 0;
 }
-- 
2.47.3

