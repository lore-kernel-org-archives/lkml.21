Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205442;
	b=qEnP+3HbC6C68cZIjJnFtwv4l8mHdBOpJS95mCLN21jia6yorLq6JWNkYvOUI0ilRcwh
	 CRS6rlUF1cABEM1h/jmNS4CY+IUd7zaAVcBqiYZf7chT9L33UyLRbyGwldtqXm40rW8CS
	 fg5909mmVLlUm+i5gSpTuP4T7xUh7a0h5mup4N9y+luELi+HwVUVTyZR5kZj3ROE5Z9FQ
	 b9g54qlplzzfWxuBoqXsMnS6Zb9GZG9O5naIwm4QVDMXgJ0Nmwb2OFzJApo1baZPaMM3J
	 ZT5HtVIZwfxRZQty8qd5+svxNAAZvBF1bKjTqREZEEbxzTd3KO412ZI+3gyx2SRtz0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=48fG40u44IzRAj1aROD5Y2Q1HOpJ9Yh55cmOS8ndJXw=;
	b=oTU5owgLlBNTB8A0xZrn2K92M5K3DGuyZpAeeYHY+ENU3ieBq/Ywt1QebnmkdfuwPEmj
	 ClYfO9nb8dUZaO5yW2PNAthWsJQjCr4VJgFqXSQ4SWgrHUT6jpewOq2WZjR7VvoNtAvJL
	 7NJNDGkf/daNv3MpQJUZyZUz7DfvOszFZua6Q51Uoc+BzIh4oLfdc9S7wWZcmV5EG3WYt
	 UeHCbO2u1X5wvXd+DPHC8kMuPkc4zoqSN8SgrBjGltbqrIOlDdsI8+ApwlsWM4Ey6ZSXQ
	 qe58U6cOSyVEIgnTl9rzK662wMprRBRqaSLMxZ0SpAZVB2tLX57ooLt6FbiNc+sJyYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4Jknyks;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ECE606A6F5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99ECE606A6F5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4Jknyks
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so873388b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205437; x=1795810237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=48fG40u44IzRAj1aROD5Y2Q1HOpJ9Yh55cmOS8ndJXw=;
        b=r4JknyksnkeFoXBitM2CtrdTAt/WByFNDdLy8fW8o6C+SCZHcfi3haoQwrCcoxrSPQ
         /thSr3/NDKFBjjugwQ3XfxvkApFm0SR3J6zXBVhDJlv7BN2Y07A4ssVX8yys65ZyaIZ6
         lBSjfDDHKq50FuHmmchlfoMqcC2sY4pzJhNGwCXu96Tonp/aO5WrpgNPPCQ7Fligl8vF
         fIRsbh6s2fGkotYFjUEDBYUkglEEAEe3Jv4ArntzTm2mQRU6sjDp3uoOu0FXzhSN+Iyv
         vww2suKoXeMaqE9r8Yk6vcgwx1LW6Lh7NIV/DtRq3KU+1fxNHNsKhK9KnwWPNN8s8E79
         5oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205437; x=1795810237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48fG40u44IzRAj1aROD5Y2Q1HOpJ9Yh55cmOS8ndJXw=;
        b=bL5fXRQE5iXzpO1o2Mq4cph0NjctSlxkRaGT5jLPKtMko072759Zoe/sRtx1x06bXM
         97wc3r1nzLQGcfzGnuk3Mv36MV1IzHj4mH3kRHcPDeHhFniY+a7uCApCYJztgqlOa6O2
         u44l1TkjmVieyLCvD8ZXrpzgM7OktSdRDCJeYsJyY86Q+zXrepKnmvTcGtZRKeeh+jJ4
         lLT6cN+JhflGSyAa/3I2+rpjMqsy5Pu+8gWBkAuco4HWcbSLpJOgFTP+udW5W3BELI/J
         Dgz/URMjVyOz6jSVpEu6zC2rLKpelNnDrwDqEi3zeXv1KTzl/AlE4hpcXBqWxv2L7YOH
         QNNQ==
X-Forwarded-Encrypted: i=1; AL+hErF0Ek4WAUQegw60TsEJ3nnUxJk0MpexodVc4Iy3w14vsrvU6olecYas6lWYbb65jUZObLpBPomilFG60aE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3xA+MPaGc1IYUqcvZOIW2kZpBxqQr+S9rrTFm1KgLVVViBkOf
	BE9OAOHGDklnmG0HqIWgEmr5t59YPE5wSul1LqP2FQrpZkzxXH+JAR1G
X-Gm-Gg: AZFdTZeS1CgkgtvVFVCMct/A+j0N28FtNwlILHrPE1NMlnNZUHJN1tgRcnaqnA6+ZTv
	jXej7PJoIAbx90Uy/Q7dzfCYNwXpEtzPBM8/+vJxDZjdf9nXbPH/eIq78K6EHQv1BTt651qfmBy
	fBeRxGcKpG1Bqo1a21HTlLHkECvi9KG3k7FDX7YX/g6JCdnev9wildFPxhS5WpI1S7rWxqC/BPZ
	1DonPhPwbmN6h8UMj89ZGfBTqDfb0HnqANgQhYUrore4rFXEy+Kqeqm5fLIHCHaB3Ht1jWbhK3S
	wLix/yFS9D00dIiwPb/k61MdVE5GenpZnOv1M/dIAEg8xnmqDKivu11NNvWkltr2R5tDjdIrYWd
	V98QRl1aTWyQlPvbq/g8x2qZ3wAogYMbdZkFwYmST80XK17wP3PK5JdqhRJyQ9f+O+3j9l+c1Is
	Q0TnKRz/FubzL1lerc+PhMpxgfdE2armgR+xzeE/+NZsrohcf7r7nNuqTKkLFbVvvdXvSDj+ctk
	RR40L+mZS1BV8RXKEaS1H6ru345YataAAzD3OxkdJ3O7KQOH7OZad67mg4nX2mOToNCvhgWt/ct
	UqJ0X47t6lSnx5+X20qiDRUG99usBX8StjDgi8lcMJbe9Oa1bTWQ/0mKZ40x4aTCIwMBSKuKYQ=
	=
X-Received: by 2002:a05:6a00:3d44:b0:8a0:5eff:ad5b with SMTP id d2e1a72fcca58-8c7ddfafeecmr3911362b3a.33.1795205436562;
        Fri, 20 Nov 2026 12:10:36 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c86d821637sm2075227b3a.0.2026.11.20.12.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:10:36 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: sp805_wdt: re-enable the clock in the restart handler
Date: Sat, 21 Nov 2026 04:10:26 +0800
Message-ID: <20261120201029.1685193-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

wdt_restart() fail to reboot the system if the watchdog counter clock
was previously disabled: If userspace cleanly stops the watchdog, the
core calls wdt_disable() which disables wdt->clk. No reset comes.

Re-enable the clock in it as in npcm_wdt.

Link: https://lore.kernel.org/r/20260911031916.A8E051F000FF@smtp.kernel.org
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/watchdog/sp805_wdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
index a14ff7ac0db4..20b2fbb7334d 100644
--- a/drivers/watchdog/sp805_wdt.c
+++ b/drivers/watchdog/sp805_wdt.c
@@ -138,6 +138,9 @@ wdt_restart(struct watchdog_device *wdd, unsigned long mode, void *cmd)
 {
 	struct sp805_wdt *wdt = watchdog_get_drvdata(wdd);
 
+	/* For reset, we start the WDT clock and leave it running. */
+	clk_prepare_enable(wdt->clk);
+
 	writel_relaxed(UNLOCK, wdt->base + WDTLOCK);
 	writel_relaxed(0, wdt->base + WDTCONTROL);
 	writel_relaxed(0, wdt->base + WDTLOAD);
-- 
2.53.0

