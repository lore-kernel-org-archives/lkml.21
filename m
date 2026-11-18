Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996736;
	b=c6WlEm054h0OshBqvt3zQm6zmH9reV3CmYEKm0PxzcpQCB9hFUjvgds3qkNjhFO6fg4t
	 iYZ+VGE2QqrmF/+Uw7emCgG2LuiSwlRdNP/hhxYAfBIO7hXmvaUOb1REsME3aF8P62tWb
	 HV53D1xag9X0tH4cN6PhGbfpHTEH7eomKWi0vC1EE/NZYnFRWXjOSq2NNs9NpJN9Amgg4
	 Rg/UJMlAWTj88XKMfsLZ5j7MuKgLQ9fw2UTRxwHRghosdSPETvWEGN+SR5fUL9s7pBE42
	 CHKAC11xlrC4Ht0peMHnxv/LArbmTGYq8Zs8UNk69W/1+VKJDmWUlO7kXKDmZNBD3Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=urL0eMB5iRPIEjTLq6WXSe5g/qGCtlbh75jFBqhB950=;
	b=fZUrRVnQGlI11RSG0TschZyx6ndmzq8AtRDFdFDfoq8WbdHhagl6PxC6Wem/cmUrSCrs
	 GIF/9UAEqA+ZIIzk5O2XMadlVR8q1QlSsdebWPLXlr5wmNHHQpbS7EDduV4o4te/zktHm
	 6LvYz/FXvgNMkLXwN5qswkKtBg3uzXlXtTNsEU81STbdnMo5Ymvz1F6GSahciPP5H0FuP
	 J4RKvnfMcPmo8WWYIdj8Ypda+tgkTf/9beT/VOWmUcS1uuXElTeNYJK+sebCw5+dIw5zu
	 MkYvA7gP/4MuHcJzStZv6JGSno7L5VnGPR7wngNqiWc62BnqV3cF3QujLIijEDBSzEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BciwCkhS;
	arc=none smtp.remote-ip=74.125.228.135
Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CE7606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72CE7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BciwCkhS
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c5119f642fdso22601466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996735; x=1795601535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urL0eMB5iRPIEjTLq6WXSe5g/qGCtlbh75jFBqhB950=;
        b=BciwCkhSMyiRE+I4OF/eTaeL7vyBLZoZK0MsO+mlhfi/IxkFtlNzGb1PjmUaptrbgZ
         xDwiM0wl4qQa7v9JbAULa8NUltz0LBJ8scuqR4iFW6MxhOfQbwPADs14pXBCAlxaN4LE
         qaRRRnksWymDLbv0KL4Go47Vro69sX4FaJ6Gn5IIxc4dmcmkdj7nwNsIvZlpMG8/G241
         ohPdJWoME0yEJO7ZQiNnt2DR1q2J+R/EqA6tnWYyXAwJPSShPRAK2FNAG6FO1zsY1ADt
         voVS2vxyBda7Ck0UenxC248bpmgy9EHu0z6CWEjIPRhKFTbqL8uxXp/HgxfJhEEL/tLg
         85bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996735; x=1795601535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urL0eMB5iRPIEjTLq6WXSe5g/qGCtlbh75jFBqhB950=;
        b=BGsaig2322OyVat9/Dm2UjoqPMl1khUC4cuzBhgdH1uSx/1LSBBeHo7WQWaoEqZjWx
         3com3uQUp0DhOSBDKnkcZjHdeyhA4VulVNSiAFdMcIFvyuQJV3ETEMT8//aW/ntuvdMh
         gQ/GuGgMsP6pktvw1JGoaFiIpxbbPeLEj6jRcRxDK1+jtvA2dSOPQ7gWuPlF93dh8xAg
         OcXkmin9EGuVXEEOO70cWG9DD4TCzplkiX080cl0vARJZvBhPyFBP5e84vARj+uKvct+
         w65UJpvwIak7hu3EYGTXNcxjY8oStBYvKJoFvyuUZzE/cue9UtF4vzqR41NRRoEx+Q0J
         Tq7g==
X-Forwarded-Encrypted: i=1; AL+hErH883r73C7mvmLDx2DX1BUIab83pfbYlRuUkBRB7dkBxsjpaSd9KkRLlDanE6dsEnBkaI9UANcdfcQcof8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uQf20s6gfUV4rAR/SrLL273Z4RTputoWRnVpY0dqZlE/1L069
	ZL5pTz9Z7iSL9c3u0Stw1Cw6oZX5KoYf6R73jFwGS+TSTM8u/4alPYhz972uveGn
X-Gm-Gg: AYBFou1p1nUk0BVAM8gnnp9+ZNI/5qwmxWM+I53TUH7P3hBf+TXwvdulw0aJuufvGEC
	XLFckimCreYRcA0Tckgj4TyernAqTk8fBea2BTJAT0BopULywDvJ8lwmhwLe8NG1y/ghrdHXNe5
	Ssg3pCxJa5VgUXhIFeXY1B1yJb9bXWBiCvFnNY5Bgyl9pmAGBS1wAvkzxrRCe4lyPcWXU7GPeal
	jadz4tL8pxxcSK33Ar4yfKk+iWkzE0Gjq6VmhV6Yv54ZdS09ryQvbQqf8q+CPAaNX6sfh4IAuLU
	o6a/N1aH8/VmeiEgmnSp3IdwukS4spY/Mg0Vp97jpYXej8toFd+xd4VdehwMYsDih0jtRP47T+B
	uWucfOLWEovcuhw1cFTbWQtXPQGtkatJe6zsYZGNuDOGvLIdYhbA2NKWGyooczSczHeDOPJw7VA
	4UaBdUVGoVF2pPtNzzngntsrcF1JgqU3yJQxs4NmfuO8KqRx7peIpi2w4hWqV/tVVsc+W8/1+Fs
	JmDUpnmQJ3svdk7Fi1m7oE/UWifv4wfGqQ8qbv+VCVyEhbYUbX0lYwrwM2zOLXEH8xXObkEIRjQ
	9XK/Afnr8BlI/tXdI9MlMBHnYmDM2EuH5I6+q557mK7GhacUkT2ndq2Y35yDQ5YeZX882nEW09S
	gfrD44NgQolQp/RkObAb7PYWViKRO3DADbwUPLY8EIN5IR1vTcVSXSMAR
X-Received: by 2002:a17:907:d406:b0:c49:cfcf:8d7f with SMTP id a640c23a62f3a-c510e3bd593mr169522666b.46.1794996734526;
        Wed, 18 Nov 2026 02:12:14 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f332sm78436366b.7.2026.11.18.02.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:12:14 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v4 1/2] i2c: i2c-xiic: fix clearing of bnb irq
Date: Wed, 18 Nov 2026 11:11:46 +0100
Message-ID: <20261118101147.3350796-2-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
References: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
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

Add a function for clearing the bnb bit,
It waits for all preconditions before clearing the bnb bit or times out.

Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 40 ++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index ba560462d451..e68e17bdf0ba 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -233,6 +233,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_RESET_MASK             0xAUL

 #define XIIC_PM_TIMEOUT		1000	/* ms */
+/* timeout waiting for bus busy */
+#define XIIC_BB_TIMEOUT_US	1000
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
 /* timeout waiting for the controller finish transfers */
@@ -394,6 +396,30 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	return 0;
 }

+static void xiic_clear_en_bnb(struct xiic_i2c *i2c)
+{
+	u8 sr = 0, isr = 0;
+	int ret;
+
+	isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
+	if (!(isr & XIIC_INTR_BNB_MASK)) {
+		xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+		return;
+	}
+
+	ret = read_poll_timeout_atomic(xiic_getreg8, sr,
+			sr & XIIC_SR_BUS_BUSY_MASK, 0, XIIC_BB_TIMEOUT_US, 0,
+			i2c, XIIC_SR_REG_OFFSET);
+
+	if (ret) {
+		dev_err(i2c->dev, "Failed to clear bnb\n");
+		return;
+	}
+
+	xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
+	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+}
+
 /**
  * xiic_setclk - Sets the configured clock rate
  * @i2c: Pointer to the xiic device structure
@@ -883,9 +909,6 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	}

 	if (pend & XIIC_INTR_BNB_MASK) {
-		/* IIC bus has transitioned to not busy */
-		clr |= XIIC_INTR_BNB_MASK;
-
 		/* The bus is not busy, disable BusNotBusy interrupt */
 		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);

@@ -1030,7 +1053,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)

 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);

-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1097,7 +1120,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)

 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);

 	/* the message is tx:ed */
 	i2c->tx_pos = msg->len;
@@ -1181,11 +1204,11 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
 				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK |
 				((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
 				XIIC_INTR_TX_HALF_MASK : 0));

 		xiic_fill_tx_fifo(i2c);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1227,8 +1250,9 @@ static void xiic_start_send(struct xiic_i2c *i2c)

 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
-				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK);
+				XIIC_INTR_TX_ERROR_MASK);
+
+		xiic_clear_en_bnb(i2c);
 	}

 	i2c->prev_msg_tx = true;
--
2.43.0

