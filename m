Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834348;
	b=Qwm9drkB94vzea4L+3pMvi38wFMveRUYU/CBC15hXCZJkC7KTQ7CYYrAbETIazp+0rfa
	 MLu0P1GggcfD60Bd9qGJBwZYZYIVp+bv6zNpXGeY280PmwHiAtb5ZqxF/9/p2xqdQttcb
	 udE4XvcXS3Vf7m3raAil6WSwZkCkh+VtaB/gAhhiLCrd3U8ApVKsZK0bD21FnUzOMW1lk
	 IdjCrIlhJiWM6mKjT9hqeG5jbNyzWhkQjJ900UOERKG2e293kVxZ3WuvBR+lNiK8o5cKT
	 MUYW9d7KkENvM0nG7LR++m8C9yrHKTsILXprcG8uR41nYa0v2D+f8OGd/m2+z9WJu0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kD3PzR5f3F9SwQ1UrQGTXoeuck2gocAg+UO4pHEVgvo=;
	b=POewcVqeN1id4disZuKqaQZKA85cJL9Y8uRioS0bHUWT1sUZdsk3o7BkF6UdTVHqXjNA
	 C/Hu3xxb+7KfJZ6w48OezDlQff3H0hjkQ26hAfGKLH6VxqakfvWeZKElGpVwl/ka+hG5z
	 5cuUZC5uuDvMLgjRlcDuFcoR8GCUS1/U7E5MS44wTcbMwQbnzjeBFhfAciUaGGld/UOqY
	 ODax3PPNFJydCibUTN3NDB0OuhAlo/akGk3ZlAIq49Gc3MPNNlv9AzxGDhG9sICdkchyZ
	 YNG2ddA/qmElNuKel8smeQ1MkjJrD8sfs98NDOUtK7Bf2W/E0eAPl4JOwMEwcQn0sNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cM0cy38M;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEE2606A326
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAEE2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cM0cy38M
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cddac941ed1so3907650a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834347; x=1796439147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kD3PzR5f3F9SwQ1UrQGTXoeuck2gocAg+UO4pHEVgvo=;
        b=cM0cy38M4mS/YkYw1EXP0XWAg5pM0V4Ck/YFS3+fqiRD7jpd9OhGPtUZtOdgddq/cc
         pdj1Td5LkGH/Pl2si1nvXdGboGMxRTQONEF3gTrlF+vGliZw+/MFI6Teh4o2SecIyVBO
         x7qgu6JFX6DZBwifoFkIwLfipWzKKtP9s1YQ7q1QrwEeSVcLxoRuXE84Bn04oNrBVjmE
         f1DYJaCiAO50j6OjmrlxgnmrIi5lW6p5nADRpLL/Xxlk6J57N2WWQ4A+216RlQPGlTZT
         fjxs6tZBqat5pfwSRs/8qeW2QdYn5O73sdVQG5y4zSJiot5k/Dl5i86bg6xN2pzwPh8A
         wR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834347; x=1796439147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kD3PzR5f3F9SwQ1UrQGTXoeuck2gocAg+UO4pHEVgvo=;
        b=zuU0rhy9bXEkdnR1h0E5YUf31t19N90ShIlACLPXv/On+k+Ici/z55u3rmjhncqiAg
         B1GPNScBe9+xD9ywubSC9wClBVR2o4C8gpy1pjK+ONLoCYDqGzdGlI54P3ULRVgpnh1N
         jGoKXsQEQvLmgQaHoQNW58q+rltKLVB/sH6t+zkTHBdTEA45eoLg6W0UqCLf1W/pCxjd
         zuVAX8TEjJr4ohxl/2AC7Siul37U3oz0QkPb+Ui6tahANX17D/qgkYbqR/SwWjDT8RGo
         il5LWNolHtgNJl8i8lUJqzA4R9SdCw02WCndiuCedPO8sws3kT4oyZjRIIGuylNmAgzd
         zrWA==
X-Forwarded-Encrypted: i=1; AL+hErH/LgLCSUYvQP1bS8bMMSrJ3+imo4H0kwFg1qDXjEQ3lEUL51WQj9NNiLSno/8cVIN0+nFoV5pC68WQQSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xVhDZo4bP/iXkwZ9Jj6y5cgoSCGBeiUps8CdWc8tZgF3UQqW+
	x0yiI2nLl1t2EaBrESndS+Ej6IoklFg9l91OChqcWenrXu0xLlCdxtWQ/Bygs8lCGFQ=
X-Gm-Gg: AZFdTZebb0VAplBIfUzFyVUq/7EA7RwHUt4b+LrwG0YG8UtEDenEcUw6x7Fa94XSc9l
	rXLW+O2EDUKr5wpMMqve78S8fNMsuxh16Ahh/UW6RChyIcYTPDfPzjUKn1S76ID3Cx+Y2nSMtRB
	cWR/YruBqpcWsxxE7iY78U0ePpU5gtI3t9/vweuVpJxZKWrqf/CCgRwNCVyHlrkix09fKd9nEqV
	/nuAs9N9s9HP4logWzVdkoEFx9Os9SSLqz17lmC7VjtSlKJ/SzquLIUk/d/h/nDqFkqLqbFOomu
	S+7vB+qY9AtQa0Jom865B1V6Imasb10pjJAv8Ry4eWV/LkisesM28vRQqwnT6BQ+2PY0OreLbOP
	5aiCtp8NzVYB+yvq/hCCtXOYrYJ+XJkP3Xppzgp998Z4JiftEheMbYFjs9Fqm1c/75izuXjmLrG
	/rAzmN4c9Ex6E0jS7gH8EQpCNuyVXWV2LmRfT8IhxPNkPiAiZ60pirUtEEkKxBKLGqCNoGnyilF
	IkHGxHVjJsesXrVm/S8UnAZT8yjKlXX8VahKknc+Ewr4ZOxoiiFXMGxuX8hc1SgpXENN0t9ICru
	2oNqWsu3XYsXBgXP1PZuT10DDiU4FNmoujKa/XNTbIxfYvdhZIrUV0KIZnbESSUusBA0VB+LkS1
	CJJpIVF6qVXo1uA==
X-Received: by 2002:a17:90b:4b05:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b41c911c9emr24356298a91.26.1795834346952;
        Fri, 27 Nov 2026 18:52:26 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm43492413a91.17.2026.11.27.18.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:26 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH 1/2] clocksource/drivers/timer-npcm7xx: Fix spurious timer1 clock warning
Date: Sat, 28 Nov 2026 02:52:23 +0000
Message-ID: <20261128025224.2680046-2-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261128025224.2680046-1-william@wkennington.com>
References: <20261128025224.2680046-1-william@wkennington.com>
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

of_clk_get(np, 1) returns ERR_PTR(-ENOENT), not NULL, when only one
clock is listed in the device tree. No in-tree device tree lists a
second timer clock, so the existing if (clk) check always logs a
warning on boot:

  /ahb/apb/timer@8000: Failed to get clock for timer1: -ENOENT

Ignore -ENOENT since the second clock is optional, add the missing
trailing newline, and check clk_prepare_enable() for errors.

Fixes: db78539fc95c ("clocksource/drivers/timer-npcm7xx: Enable timer 1 clock before use")
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/clocksource/timer-npcm7xx.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
index 9af30af5f989..c7377f30e95a 100644
--- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -202,11 +202,15 @@ static int __init npcm7xx_timer_init(struct device_node *np)
 
 	/* Enable the clock for timer1, if it exists */
 	clk = of_clk_get(np, 1);
-	if (clk) {
-		if (!IS_ERR(clk))
-			clk_prepare_enable(clk);
-		else
-			pr_warn("%pOF: Failed to get clock for timer1: %pe", np, clk);
+	if (!IS_ERR(clk)) {
+		ret = clk_prepare_enable(clk);
+		if (ret) {
+			pr_warn("%pOF: Failed to enable clock for timer1: %d\n",
+				np, ret);
+			clk_put(clk);
+		}
+	} else if (PTR_ERR(clk) != -ENOENT) {
+		pr_warn("%pOF: Failed to get clock for timer1: %pe\n", np, clk);
 	}
 
 	npcm7xx_clocksource_init();
