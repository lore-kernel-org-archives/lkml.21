Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801216;
	b=IgwwSZFJ+gSPiOevwOCTSTWNT5AZYHseYCpgU7LkTTJ7IbQEjVqL/Niuewo9/BZ4s9Lb
	 8KhSnUpgEE67/JPCd0G7bNRcdwPMQnOpQ/mEhsX98Yd2AQs5/0Br8wGYodvu3VLkDyvD1
	 yTeYHqQo1GxLU0RbQ6IUj+WIz5vewwNJrldZhS/Lh8zVOzgWmxLTt/Orm7jY8bVF1NOvR
	 LobCNodV+R2IOCHjzKd/TLGRoGiZOyqclz5Jj3xX1dwUabuyoOThWuisLPfzTRIRL58Ml
	 awYNoEMk0Sq1XSnPfLmfCwUHo8112UqbZv441ezfpDTzwwFSsHaSAQwO/fgmfs/tcqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=bGqCohR5dtNzmiXlJRd2AHgHw1VyKnQU8NNwe2lurSA=;
	b=gIwSm8AiDEkvmpfdOnCi9s+ZOn6c4R3NS+ZOqzHg5e3gTaoifMSZHW0s82w2I+FwCxK9
	 +11WS7qnYNYzVCUuaeDG0ohJn0WP/jN0Je1AWTToo1siKlZLIu1IRUXTv7oIwfbb/I5jM
	 Kl8BCTL86zoOk6YR/1+eyAHJpO83tFimdDN3XjBa637HrChls3fkLC8uQA+y2/H4pwHzk
	 JN4I2RzTFZG/PtRE04ff9ifcSlTLqjmlGaz0oOri6LDJ3cjGDhwf6T7pXGo1EXu3Wl8Nw
	 7dwYkIgsHD0cQcOkkGDhqYkcSoub0b+dYRatuX2UV8LY/1fygDSdyFHGTOivRyY2yrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="oOvI/len";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F9606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE8F9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oOvI/len
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so85906595e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795801214; x=1796406014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bGqCohR5dtNzmiXlJRd2AHgHw1VyKnQU8NNwe2lurSA=;
        b=oOvI/lenxXfGHVTgSCi+ye20+5i95+K1Uln9vnZtLqQy66mz/qwBuXFCtv6F/NGsC1
         y7lyaaXYMATd/7rL+UNLuzZFqOT8e1YmGlngjf321x2+KClnnG9oLoO4kYoCoo0EiXxE
         Cj5MoBgAMwk7hdeV2uqPvT4rXcqw7Nt7e4H/RZ7J05kwHslGLABD+j6qwUMc0ybiIYWw
         UD2NBtX8gf9AUkW9A/QAlZwHjBDgR0xJswXyfbkqAUty1dEfng1MVumsqZpr+CMLajbS
         Icfg8Y9wLdfPNENvAZe/y/2if8H6Z8I+m355mabLiPZ9F3prkuKeViKvpEGJ6fJkWpAc
         Oz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801214; x=1796406014;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGqCohR5dtNzmiXlJRd2AHgHw1VyKnQU8NNwe2lurSA=;
        b=XEDsMWXrTAJDACJiwk5QrtMybGhRoeXXV7iz5i+mSRQbPTsoteoLlPwlIXagQRT47j
         15YQe5oXDLWdV+7qXD76pH2JZKhFNM07lQgUr94JYp26waFb+dY0AU+JoxISu83HRuWY
         O6N35dTbZxHG2dM19E+1IvcRBjK5dG1AebvsxArhIYRPeqh8GXd+k+G+PSn00InJHIMj
         jB1hxWAlOP/I/taTs/BYb19E0L6zB2lvVJa+RWJDbM0hlVR1/hO84DhSXbCyjUOYI2TZ
         CAzgbL79zF8vNp9ZrAh/9UeW1pWCSlqxGgYCUyIyHGqhzTSuC7INSWgwj68j3SPjoisH
         e9+w==
X-Forwarded-Encrypted: i=1; AL+hErEdly6JXjPj0cv1QWEUHqvP8L7jXuuNlMeQPOQ4ERTpqKqBWY4gxHic4/Ymk+TzvWNXrYmx55M+V4WZZW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DTzM7Yz7vJjIPwKHOfFA9aAXubEbs3RSjS+P+O4CCblCOJU8q
	eW4fOhVfszESHxc4cdMyAl1NY6yxhizWdtQ9glgw5V5TQlcRajOkeTHvT6KYWaELRRRFR5chzOn
	cgTcnSpg=
X-Gm-Gg: AZFdTZeAVhbu5DcHs0FQvVQ+x74yyqbihryPbNblUHg220PcsSbp0bF+40izvmckqoZ
	RDmhAOljHy1evdYlL9jp3TJngduOHtLKDtZ0lc9R4c9FDkAinPQvPhfAHpC0VcuIDkE7xMsj5eg
	r1/Rli9iCDrxbIOkFMDdX0uoEs8ZazkM1opDmaM93p9FQ3NlyjRUzom3HvcnY9fHaFENtglicyO
	20h3neJzVFQc3h4slv1yd3MsqhnqczAOnSil+mCEETlpJ6Va3PXCUsvZrP8DpR/2xgBXDUNDmli
	qiAsZmh2rqIz4Ihye5mNq3kc+Nu+oylzjV3yQzAR0q/Vzmeqakt15Z+vJNMXsQcUIo0VqhjPmxR
	FNwUoaoTk16jSbkeSLzm0Kr1YPtElXWR0VxuXOpX73BdOHmAlW4N7sBcOtf9zTJW8Gguw54IskU
	VH1Naupy3mCy8U8mF2axjqf6kxCutvygkcKgSfpYNum1FrxQQLwDquZNlRBhH3r/DLppGRO9JTv
	MWMSXXsJw6ngTMMlAIAsbOsSIb5rZ9twLJH6WhxCsXnplqjKmfDnxhGYUqbM9UETg92n7tQhnnO
	m/ANXOV1h0Ibm14dlDSyFgEtPz8IQe0gcFnzH9JNndsjFN9Vgfm+0WRN7Qf9KEj6QH/ujy4eeup
	UVJt5DexGNLuiEL5e
X-Received: by 2002:a05:600c:a085:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb8881092bmr517665425e9.13.1795801214419;
        Fri, 27 Nov 2026 09:40:14 -0800 (PST)
Received: from localhost (p200300f65f044d0890ab5f15b7da13fe.dip0.t-ipconnect.de. [2003:f6:5f04:4d08:90ab:5f15:b7da:13fe])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb88442995sm745304055e9.2.2026.11.27.09.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:40:14 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: =?utf-8?q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] pwm: tiecap: Improve period calculation around overflow handling
Date: Fri, 27 Nov 2026 18:39:44 +0100
Message-ID:  <cdbbffdf38738f589330fbfbf31ad5dc9b6efed1.1795800756.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=SmM6TJdWDVC8UdQKE0BR6A5vTz09aHry+emBOgR21dc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrCcBpaLf5aAnHM+y1L7B22PHw1FRVgW1s1HYwC HNw3xuvTFOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawnAaQAKCRCPgPtYfRL+ TkBmB/0cgqcAdE8ONBj71ndky/lbdjgggbeGJ53SKJEj+Awgc4q77pK7r5/ujkK5jLVWedxu2hQ 5fcd25V+2iqzKpjQjXsZMDLR/5CC35GLxNFLKlk0ZixjuVJwLaAuBhM2Rz2Kjv4iIM0ssnDezCh 7Kz713LNrW3YOpQRv5uActRr4yEHRxzzlaq72/AZmosF/nXd5b3auW6Rg5AGED8IwRV/2UTfQ19 iW4G4SjofReg4TJvVL5pCAws/cWhJnqdo5xEUMce9NQvt5A532RRrtyhjm3zoNUmoPmrwtbtVN9 YpWmjNmcc0s5ndY5WB7mVbJJF7CZ/+Is93YdPHOXDzakm7nR
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Up to now the driver refused to configure for periods longer than 1
second returning -ERANGE. That is wrong for two reasons: a) Too big
requests should be clamped to the biggest possible value; and b)
depending on the input clock rate longer periods are actually possible.

To address this use mul_u64_u64_div_u64() to convert from nanoseconds to
clock ticks which doesn't overflow if the result doesn't overflow. To
ensure the latter make sure that the clock rate isn't faster than 1 GHz.

But in return refuse requests of too small periods.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-tiecap.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/pwm/pwm-tiecap.c b/drivers/pwm/pwm-tiecap.c
index 05c38967504a..fe803630d753 100644
--- a/drivers/pwm/pwm-tiecap.c
+++ b/drivers/pwm/pwm-tiecap.c
@@ -52,27 +52,25 @@ static inline struct ecap_pwm_chip *to_ecap_pwm_chip(struct pwm_chip *chip)
  * duty_ns   = 10^9 * duty_cycles / PWM_CLK_RATE
  */
 static int ecap_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			   int duty_ns, int period_ns, int enabled)
+			   u64 duty_ns, u64 period_ns, int enabled)
 {
 	struct ecap_pwm_chip *pc = to_ecap_pwm_chip(chip);
 	u32 period_cycles, duty_cycles;
-	unsigned long long c;
 	u16 value;
 
-	c = pc->clk_rate;
-	c = c * period_ns;
-	do_div(c, NSEC_PER_SEC);
-	period_cycles = (u32)c;
+	/*
+	 * With pc->clk_rate ≤ NSEC_PER_SEC the multiplication+division
+	 * doesn't overflow.
+	 */
+	period_cycles = min(U32_MAX,
+			    mul_u64_u64_div_u64(period_ns, pc->clk_rate,
+						NSEC_PER_SEC));
+	if (period_cycles < 1)
+		return -EINVAL;
 
-	if (period_cycles < 1) {
-		period_cycles = 1;
-		duty_cycles = 1;
-	} else {
-		c = pc->clk_rate;
-		c = c * duty_ns;
-		do_div(c, NSEC_PER_SEC);
-		duty_cycles = (u32)c;
-	}
+	duty_cycles = min(U32_MAX,
+			  mul_u64_u64_div_u64(duty_ns, pc->clk_rate,
+					      NSEC_PER_SEC));
 
 	pm_runtime_get_sync(pwmchip_parent(chip));
 
@@ -193,9 +191,6 @@ static int ecap_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return 0;
 	}
 
-	if (state->period > NSEC_PER_SEC)
-		return -ERANGE;
-
 	err = ecap_pwm_config(chip, pwm, state->duty_cycle,
 			      state->period, enabled);
 	if (err)
@@ -291,6 +286,13 @@ static int ecap_pwm_probe(struct platform_device *pdev)
 	pc->clk_rate = clk_get_rate(clk);
 	if (!pc->clk_rate)
 		return dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
+	/*
+	 * By ensuring that clk_rate is at most 1 GHz we can be sure that the
+	 * conversion from 64-bit ns to 64-bit clk ticks doesn't overflow.
+	 */
+	if (pc->clk_rate > NSEC_PER_SEC)
+		return dev_err_probe(dev, -EINVAL, "Invalid clk rate (%lu Hz)\n",
+				     pc->clk_rate);
 
 	chip->ops = &ecap_pwm_ops;
 
-- 
2.47.3

