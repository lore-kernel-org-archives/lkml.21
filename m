Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834347;
	b=wQsqTx/lmfpRjDP+XtDSFJkENesesNuLwVuWJjOVEsGjmUhagQfYazUE7Ty4jXv0qCg+
	 gCHPZglC9Wnbl2sjv6A7AexttTeLWR8cWeJ2DtiubYbgovcvjabAFu0yclQY6lZLTmRJE
	 M4Uk73fQ3sCTghinqVxfJikyjviNhAjr7Bv4XS/2UCYtPrPM7Q9NtY9a5ehaXYSfD2HUq
	 Yi0UZ/2WiLyVud43wtno7cqcFWwEaXZSKh2/juLfwAjrQSTl4GtQ2XgVv49G7DatUiXS0
	 wEjB0gm3hYDt0ZWQB1Xe/pTjt37EfNp7nguBK2xSaUldVCgx37YLN8ixrIwmz+H2/Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8A2aG/i00ALt+I19BvuUQjlBUgCWXgkl49Lz3wy4i80=;
	b=z5Z81Tsg1quIaB2L8cygEHYjmUhcVWScKWPRBbBuhP6MYAtc7SHWgHYokb2F/sYEIzMG
	 yA2ON3X+4pRQ2nap4IJaApU3/Qr+6XPya9175QbtZegmgG7aOUv7PsNAOxlItSIfGUD4J
	 F0nLcY2PeKtnjf2td+fIffpmoseq3id5jzdrhETg6mRcPHTcgOPihHiLTeVN4VaJ5Rh4u
	 9NtCQVYg+IucfBcKjlkl43qz4MNx8djAGd2i2xfN8ck/+/JSCF7wRzztkFFpMukqwgX4y
	 6YDcf16RIHWxtDzJ9KqDbCWI9wHftT7kLNWG5RRYPfoCKqybPOtnLE8EvW4NT0B3FNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ja0zi4ns;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8213606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8213606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ja0zi4ns
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b501791bb5so1548434a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834346; x=1796439146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8A2aG/i00ALt+I19BvuUQjlBUgCWXgkl49Lz3wy4i80=;
        b=Ja0zi4nsHu9pG20qcy++ayJGD8kC3F8A989dQSMa0yHCaANVW6o23UakqbBZcH/Cqs
         QmMXmjG+9EIDiPsUbaP75fMpIiUMcHpbN5RQOg2vhF04Jk2I3CeiCm2vHjL52KpF3Zci
         CswgdIKbKlR2Sjlbcb0Kz0nAigFcUxg5a81gWNty/GWUiPl26Gq098rgkyUMSnQys3nY
         9YcUepiIY5MbHpkRdiP5km/Y515nKj7IfeMel6MyeUL1olzbR7Gf4u7a/PnRSfPUXlvU
         yfi1aQqfeeWIM9CUx9febe8VoU49wx/TBaj6kDn+I1XMlD8wMFmTeA1XP68Jg+5n2MEZ
         WbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834346; x=1796439146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8A2aG/i00ALt+I19BvuUQjlBUgCWXgkl49Lz3wy4i80=;
        b=JCzoWHqLAp5d+f/Jkspp+P5vGgxXKXjBY3YgO7tTxlm4FxW3NRgS0A3HQE4Badc4DE
         Aq4O2xRlQb6IIrXRDemADhSnX+rJ0VkQR5XSbHc7C+B8svzE0Q+p1TtO4dDdDcqDZB2i
         uVr+MRuopkkqmpljz6rRJHh2gML8QuknqRVJ2xdeV1FTvU1nx4UqMNQFXf1nblqYXTum
         w99OMnJNzjlHNan2lSrFPUepvbBi3ToKBjC1zmhvcoN/8nOBfNDXkJ7hUjkAkkhKb9Uq
         X0rmWNGnn3yC7qID50RmUApXHbtbzWm4X3jXSqaL+OCU6x9IH2lnWIfaWX92QKGgxy6r
         CNbQ==
X-Forwarded-Encrypted: i=1; AL+hErFviOgU1FjF6ErepRPfz4w0EgZyiFw3PuLIy6e72I1Anzhh43OIZfX0gRLQ1udcmP2PbEq38D0GjrfM3rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YZfz/WuC/9Nl4IjHnYAm9JJRPFzaReUWZFfwZlcjZpXvFdZ5T
	/DaDt89u7If+f1C9JOglE4l3W3qN6IYU6FllElOJTz7R1Df+GGAH/+4yRYf24sITWFg=
X-Gm-Gg: AZFdTZcAgcb8lLTiL8sj2oPbad5QKH6W7K41UpGTMATHWzcCMJBdH6wnXvt6DhNNrS8
	E+ew+H1NqP5erbcnPxn3ynim6bvAgai8M0wpwwVueWUh9MI2cDtwxc4ZimUgWi0YSxzLiD/kocl
	a11qrIefT8n/VLdm4IVDtTfVwQc9LuR6e/qAjbz1XxTAXD25Z3UBf2+GgjxDK1jgvLKed3lDMA9
	SJzOnOPmO6tBOQubloz6xRREpjooXDsntX3kVxoAaeB48wL4hokbHE2XJWHjmCCwr0JajTOWOKU
	k/iybMxwikPX/JtGSCU0sKpghid7njVY48JB0/7ksxHdwoLnvLYJPGraOXird+rGjJmGFzZQYG6
	tBW0Ili/aP6HNQq1uU8d2hQH6tcu6SsaZl2gJqEx6ZIsufmMU7am+eAaZ00noXhxliXW1y8DpHe
	I3W2A9IHXAUlZ7UQkryweTkjxrr2ILGa9Cjb5NcRTROlrYxxSqJeCKq6yJVHmZ6r/xIIgMDPhS/
	COfyelCfeXVSjHMaFN1kkr7vrnzi80G97Mwl8Yr1rRxuRrmKJ3GaIpHc5Uy7ee+WF0VMg6oydpw
	61xXSfEKxQHrPdeWEienJlFaeTu27sVGoYzbSl0ZXH60IT8NzC2C/JESO9chBkJfhHatFPsKw0Z
	uxNfT0d74Pk/uPQ==
X-Received: by 2002:a17:90b:4a88:b0:3b5:29e:11b0 with SMTP id 98e67ed59e1d1-3b5029e14a7mr8814612a91.17.1795834345981;
        Fri, 27 Nov 2026 18:52:25 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm43492413a91.17.2026.11.27.18.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:25 -0800 (PST)
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
Subject: [PATCH 0/2] clocksource/drivers/timer-npcm7xx: Fix timer1 warning, add sched_clock
Date: Sat, 28 Nov 2026 02:52:22 +0000
Message-ID: <20261128025224.2680046-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

Two fixes for drivers/clocksource/timer-npcm7xx.c found while bringing
up Linux 7.3 on an NPCM730 BMC:

1. of_clk_get(np, 1) returns ERR_PTR(-ENOENT) when only one clock is
   present in DT, which is the case for every in-tree device tree, so
   boot always logs a spurious warning for the optional timer1 clock.
   Ignore -ENOENT, add the missing newline, and check
   clk_prepare_enable() errors.
2. Register the 24-bit free-running timer1 counter with
   sched_clock_register() instead of falling back to jiffies, which
   also enables CONFIG_IRQ_TIME_ACCOUNTING at runtime.

Tested on an NPCM730 BMC: the timer1 -ENOENT boot warning is gone,
sched_clock registers at 80 ns resolution with microsecond dmesg
timestamps, and /proc/stat reports live IRQ time under TCP load.
WPCM450, which shares the driver, was not tested.

William A. Kennington III (2):
  clocksource/drivers/timer-npcm7xx: Fix spurious timer1 clock warning
  clocksource/drivers/timer-npcm7xx: Register timer1 as sched_clock

 drivers/clocksource/timer-npcm7xx.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

