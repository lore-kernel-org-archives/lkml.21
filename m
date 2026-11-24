Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514783;
	b=HdpzG9hOmMuhG1e6zEAnzBgJeUq8WsSsBpr+UnBNRc8SLjUNLNWzJNqad+/hBVRbI2ct
	 eSr5cccUo/lNm2sb+snJH2HahhuX4Ne1HwTnG1Pvjg6vfvEVA74YLPAvbBGDrkNpfqjXE
	 54kjZKfMD+wCn3AflB3jYiwNhaZRxuDIcaIzMzFAyHzOo1KehT9s5lAIy3u2vT0UuQ04q
	 R2DpdvooT1H58NINN5G6IU/SVXGGoY6R/dbjVC3VblrUu9oqqIZN1A0I9zRjOx0eQREi8
	 n5byh/lYl+O4BJN1g2JeV4pzkLpZYhnFgsIhXLHMC6HvR7/6su1DwiooScjVj5AoBgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=goejSGAp4IfnqTSxRNc89CxXB1nwqTfFiuZjHrzldo0=;
	b=f/1zUB7AuSWNr0YShmL/cpinwJMiUMaUrymoZnfh96h1w6QL6FV4zMXAWPYo+rUfFO9h
	 Xh7AVOfWlNINOwGS96b4xF6sgyjAXZpEuPMk2n7YYqWtHYoXHFt6NWNWeZ1+cpgU5GU54
	 7ypr7PKdTv96wHsnEIg/ceRUNJ1v10JwbWyMxc7mMy7CQr60Am75RqQIEddcBJQhvjsGT
	 X/5hUbTpaX4+XRA5vdm4hTb8ShDiby8GT7B8nCIZfEJP1Qn6Dlom2KmbXqFwUGc29Jahm
	 wCBf8StQFrrCY7wXzvdMm/KIQ0eEVOXkz5JKN0acZZTCWYeSjr8iEGvjeB3NPFQ2Gtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b="Kn+IoJc/";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF78606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF78606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=Kn+IoJc/
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc758830601so3304521a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795514781; x=1796119581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=goejSGAp4IfnqTSxRNc89CxXB1nwqTfFiuZjHrzldo0=;
        b=Kn+IoJc/DvaEwHC14URhDRXWuXoxofpgo12wxLoC9rw3Shv2Z+C/lga6OrLMaZbeLX
         nrRChIM/IMr2wWUjscp4KYeeVRp3C1x0NehlmI/lpa16AFCgMvZsU4764Bi2i+RrfsVR
         k6ldQXVZ0qyok45U6DYl4ppxawZ1a2/85SU68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514781; x=1796119581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goejSGAp4IfnqTSxRNc89CxXB1nwqTfFiuZjHrzldo0=;
        b=WvL2YHoe6x2lbibm7POXmrdiOB9HlhmwxUPTQORIA30X92iipNu5IChf283galE5J9
         qwPqMPAUxpRyMhJZWB6X9v7m26NKLcVifzzKqgYZ0sIUCxSkvF7Dkj52RdTDO0U4brtu
         7fqWg6xl7cmQorpoWHYE1tAL4mqjC7exqyIyp54O3fASZ+rZ1g/pSsZTF0lpT9Vkd6fO
         1DtEbTSEgv1jKqYtA3Nu4lE6D2dOwu5ZjjJ3/3LMccy6+yDfopSIbYIKzoYhO/2h9HhL
         alNq1cfixV7G1B3v7ciiubNHqS7ukqaCSqwv3JtB44Y4BE0iXBLrySBfWkt+Fvia+txQ
         zsvw==
X-Forwarded-Encrypted: i=1; AL+hErHhk8UWos/FrDg0A4sbp4c6/W8NIQlpNGZu9h1UEcrdpXnm1usAdX903K69+FTramz3aHlWZhoLLaaAwwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ey7DjZhqJXfesBMIiK/1yGriNsciGz/p19A6iYKCHMY0FJ1jb
	lzEC/1d4n67F6plvfomIQhnJqsEF1eAB4IQINYScW4h5REAvnKM2/ZXfRsmYS8Xmy63MxXkbhOs
	NlntS
X-Gm-Gg: AZFdTZdvZUKysfpU8Lq6bstmsI61wDOWBzBta9OCwDoPLA5zK2CT5O1oajxDepK0Dyn
	saF0Mqzxiz5GEq+YhNqsQAQJLJ640BXGWU1G5I9Ph9RgavqzxS+cxiLRS9/9RXsBqxLcRFIQFu9
	7nHaryE9ETKXfcjLg7We3PoyHAXntDhZB97rtJSZQDuYwJYM//Kg+zdtSdsghzMtL+uIZJ35Dhl
	ijkXllCXq6qCeQzxuWZZT3i7Fd4yAhhbXP/+lk4PSLJu4SMTHaLAjMngrOyLwUxTwlqmbD4nXmG
	/KkH2ROut5w8VF/IWUlkwp5xzc48yNWKm80mu45Bp6N+VyNH9oybNIHaHi9/ujf6/NSknCFztFp
	vNGisXadzQ3bZYyAkdkKfBsyzxIS3I8luqovh6xhxgoyuG2zd5qfoqIlz2JVNmu2vPzJ+Ikoyda
	LAuEeYFiRS0RFagrSyPXUIJP46MHcocBDnZw0nDDRzEXa839tjF4D+05xKTx4UF9yrzHjMyq8qL
	k1iHV7HZbO44eOGp9YMEXkrMyR4MQop9/60fWV8znAdlWDmmIIUNVvmqtT/3IIpvcMQS9vXvvzY
	6P7/17F21tTR3eNOKKIJpbG/9whCS+RUJjwZayu6ZINTkxp/SJIVBSYVJbC1Tn/dncIpOaA=
X-Received: by 2002:a17:90b:2f8f:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b41c92a3dbmr13975688a91.29.1795514781425;
        Tue, 24 Nov 2026 02:06:21 -0800 (PST)
Received: from shiro (p1721212-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.166.141.212])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm21080437a91.7.2026.11.24.02.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:06:20 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] Input: amimouse - Fix the buttons
Date: Tue, 24 Nov 2026 19:06:04 +0900
Message-ID: <20261124100604.2380938-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
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

On the Amiga the left button is connected to CIAAPRA bit 6 (/FIR0)
and the middle and right ones are POTINP (called potgor in the code)
bits 8 (DATLX) and 10 (DATLY), all of these are active low according
to the "Amiga Hardware Reference Manual (3rd edition)":

In chapter 8, "Interface Hardware": under "Mouse Buttons" a 0 in CIAAPRA
bit 6 means "switch closed", and under "Digital I/O on the Controller
Port" reading POTINP "will produce a 0 if the button is pressed, a 1 if
it is not".

Invert the bits from the registers so the state of the buttons is
correct.

Tested with Quake on a real Amiga 4000.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/input/mouse/amimouse.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/amimouse.c b/drivers/input/mouse/amimouse.c
index d203c2a6c438..caf35ddf3d06 100644
--- a/drivers/input/mouse/amimouse.c
+++ b/drivers/input/mouse/amimouse.c
@@ -58,9 +58,10 @@ static irqreturn_t amimouse_interrupt(int irq, void *data)
 	input_report_rel(dev, REL_X, dx);
 	input_report_rel(dev, REL_Y, dy);
 
-	input_report_key(dev, BTN_LEFT,   ciaa.pra & 0x40);
-	input_report_key(dev, BTN_MIDDLE, potgor & 0x0100);
-	input_report_key(dev, BTN_RIGHT,  potgor & 0x0400);
+	/* the buttons are active low */
+	input_report_key(dev, BTN_LEFT,   !(ciaa.pra & 0x40));
+	input_report_key(dev, BTN_MIDDLE, !(potgor & 0x0100));
+	input_report_key(dev, BTN_RIGHT,  !(potgor & 0x0400));
 
 	input_sync(dev);
 
-- 
2.55.0

