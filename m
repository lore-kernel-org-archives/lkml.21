Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021570;
	b=gvUwapkmkeSVKnscj0gNu0YzWk/H2OQZdDvlYwZy6y3BOD9N69vQH+YxU2/Maowkk1TR
	 AH1CWykwr/1Sk03Z8CpoDvOjE3nvKg7JjzG/02cGYymLwA98WOZ9IWpdj4MmurryNXP6s
	 Xlmv7da8o6SKZxlYreJxPdjcJV8WtqT8WzLSvLS/ZlxZkW1y1v3yQ/FEnVrWei0Ewq7TK
	 qkNX8tFAIlRdlFUS4LLR++S4d6E7YV0hnpzeEhb6yE2N+yUNrYVUQ03Q7lrdPlO7Dmylu
	 48SVl/mLcKellQNnFJDOGHVincCZE7++lwfV8f+p7ceKtw+T+I8fShgdY6z/SC+w9LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021570;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=0l59jLbipC2nuCODIXqu8qHn6K/XZMBe1rHBAYgKxIM=;
	b=ZVgxoTA5kNsUysc1h85WusQ5+OBw1J6XXJW+LvYOpEyovKVYuqiyAVAlMb8dhJAtGjVo
	 xVmyhgBp8U/vq/BPqThlFwYd8vPhQ/YUaaeLX+RqUuh5UYIi7RAFfScMjzHsusJLSnp3F
	 4oCtIVaBhb8b7QwiHF5y2JoffJQFgFnOUN7NcBurXvu6OnatzSGBSSGw+rFns2E7KiJKH
	 qukyylYdJxrnwYPUdPvGT2iyyLbf3lP8DOPF1sYUL6jD8Od/noEu4SC3K04v7C4T4l1tv
	 k3cacFcy2lUxBPdtD2v2T5cc0g5nT+VRlXNXQgyjcD13Gwx/FNxWzAl0biIP/8Eiy/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HjowiW6d;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1D2606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E1D2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HjowiW6d
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 907434E415F3;
	Wed, 18 Nov 2026 17:06:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 557295FE9B;
	Wed, 18 Nov 2026 17:06:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14BB911BC29F4;
	Wed, 18 Nov 2026 18:05:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0l59jLbipC2nuCODIXqu8qHn6K/XZMBe1rHBAYgKxIM=;
	b=HjowiW6d9cnuFS7xom0UpdyuXfkba5rHwRDOHDh9NqO4ULYxHW1hqPaXSewzQPfsci8KhT
	l8nLmYeZfZewI464Fh05UZBpnOEoZKC/Pvie6JUA6unQw3Zx20Ks1Ft42uQAwLqkKsp1oO
	nnYKQMuasEoDM/PHeA9P+iwbKLknSeLzcfYrz6sYrKzoxsAESdxvKMJ3oireTKUPo2Nm2a
	1fQ2j88ZmKycX4ORfCYpWt1AC1rVbjnZWESI5igQneLqtgNYV3WGAYLpgCyBLtK/Durfnf
	jhYIK7dD1F7CNxWfSvnCydSCfAw1XUMfm2tBAqNIHYvvuZ2zjcqi1csHRgL7pw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 17:59:10 +0100
Subject: [PATCH v12 01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT
 legacy
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-perso-ma35d1-upstream-clk-v12-1-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The whole clock list is supposed to represent the clocks provided by the
main MA35D1 clock controller. Yet, the comment at the top is wrong by
definition: it lists both external and internal clocks, which does not
make sense. HXT and LXT are on-board oscillators which are now correctly
described as independent fixed clocks with their own DT node. The clock
controller is a consumer of these nodes and a provider of all the other
clocks listed in this file.

A look-up towards the HXT or LXT index through the clock controller is
always wrong, yet possible (even if totally useless) with legacy DT, but
should not be made with a recent DT describing HXT and LXT oscillators
as individual nodes, hence mark them both legacy.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index 764d837d6162..ad0b281da45a 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -7,8 +7,10 @@
 #define __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H
 
 /* external and internal oscillator clocks */
+/* Legacy: HXT is not provided by the clock controller, do not look it up */
 #define HXT		0
 #define HXT_GATE	1
+/* Legacy: LXT is not provided by the clock controller, do not look it up */
 #define LXT		2
 #define LXT_GATE	3
 #define HIRC		4

-- 
2.56.0

