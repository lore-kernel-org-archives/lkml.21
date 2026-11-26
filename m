Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722682;
	b=qUifetUL05WOgeFkTKkIvfPmcW6KA4MXlLXShPG6k16gTpNRLEYTa1yOiwliOVA8aeTr
	 bT63oqQN++WNjkh8KyVjXfiBQ2Uq7rEVwfbDY0kQlCGs6pU3BHDaxyy19HV/cVFdHXCnV
	 scoIQd06bzMDRR/EXuYHBtLyRRbYOYYGMk9YGXjQBhmvcux4nsIHHLTwtcvFuHyJcHVRG
	 hCCh7fz036sZCJal7n1GJ/tHybW+F43rKeRoWdFPHoWgXKGqoBLkNtfY6npy9P412jvXX
	 0HQf53M0cWr/0o1Jp+F5Rt713lLJO7wDs95PAOKsX0E4c9ttH1jzMc3rKXeyOYuVbrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vly0CmdUjORbmtqfoq+NzpTLxjcAn8jvLhSrWs+51ig=;
	b=0ymPVVtnsOLeIIlggvMXuotqaWnSiSMG+pUQdNI5DAIzQO1f2JDh7fGuL4kBakNuMbvS
	 K5vkZmgJZmvkZny8Mtjmv3cP+fV6uRC3Utk1fAuzHAuhE5D9g5To1xLiPZXbVqYMwP3Ja
	 ql+f+B4KQDYe7iDlB4Pglix8adimvGXhUkiDxg7j49fj/JN+pHqxjEs6X784rGPr8LpXw
	 4nOBdvPMdStK7Sou+Yo09XBZgTmh6xLTOO/oZdRrFxE6vmH8tsusPju+0RrAZSqsCWhkg
	 QVbLPEYBP0jLG9N/hMgsy3Df+BWZ5sKKU8Ide3zqRwCfjrXoOp/hdI6ESI2/RFkBiMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXsDHF3H;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA909606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA909606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXsDHF3H
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso2518696e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722681; x=1796327481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vly0CmdUjORbmtqfoq+NzpTLxjcAn8jvLhSrWs+51ig=;
        b=gXsDHF3HYqE87K5skDIuQqocEsYWt7Fc+zSlhipQsPVBaHwuO3Jy+lX/kNwYybjllF
         Yn/A+Pt37OYAYnLAQNhRLQ0Cy7+c/3g0T1vI8RDhiKZVQ7vToNybOznsRCD7r+g1Pks0
         7w1yh8ducipxi5uGK22vK7fNJXlSUqHeN+YYtiaof9d5Q6KwqiB2pyQR5OGP/cGA07H1
         ZNlUiB0yb7/qiAKWeb8h89yV7z8P1UuKsNrKi34BEF+M+CREauF95OTrcPhzn1SuRxcN
         8hfJ2VGRkeDH+SbMAfxjOsB60O4Rtq5UWWY+FgeNuPhgGIS6TV35zki9VRWYpmktiEUd
         jydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722681; x=1796327481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vly0CmdUjORbmtqfoq+NzpTLxjcAn8jvLhSrWs+51ig=;
        b=VDirT0bujdHGjOCEfGRFIMVMvwvKO51vhbu+wzdlRsl4Mup0K0hk4myJJLIKNCZk4M
         2tRIbqeUblByPZ9CkxdU9SalF8r1qBzsIjceWUZ5+AbeY23yKiDclov/hy5e+v7v3xft
         DzGDUviVOrAuGvJXhVQ9Lfd4vzs/32GDIwK31/YIEvO3ILwBQRBGtWItSBtzDXmoGMvN
         QeW4wrEX1WshVe/ZTovIXVOczvNHL3IRtre+LSTbHlfYW7woAUNyICzTfCftzY7+KcKQ
         9zaeWS5OfSYo0p2ZxTkxhGemWm3s2T1NIpbfkILgX+sU7NZHEKop+zKLkqf2n46KNYIc
         cXSA==
X-Forwarded-Encrypted: i=1; AL+hErH0iipXmMiBCl0NmfRbPSyPLVhwycDv/WKT05WsiL4OJS3VMWcf8rmHNqYp7wtJCqMn7ZhECeeMoyBnHmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dC4IMvVhAQ5URXLq56XoMdd8F7kizklC9mztvdxNafljKeOWe
	f7F1oBESN8AuyHU606m93wFAhDEiW3rUQmM6gwLFrIr3ajVxlbrl6SVl
X-Gm-Gg: AZFdTZdl6c0fiRF8fm1odnwnc7MQXSZtwbWTHe392DLtl2IjDLg+ZJkkNAZcwZ2QUaa
	TvFN9ohdJNRdtK64w59PMT+upy4+Fhjqk5pSNq6S520WpkOoJ2RaPUKKoWagjYzL6gBUpMZHcJq
	Ouiyu5kNLYAyG6JtKpcQqhZbydoHzehZKnO/YSM7tGMKRj60aBoYbKPEIuNMOPjK1qz05llf452
	bjfma6BT8AAot84iK9w1nJ5aWs69pxzAnlVAfn+c/LZhMHppscC7FGbIhQM/hPLvV3xMsjYokJT
	67GU19fzvX8KOTht4Ohp0exuhQKvnHd09s6kA6nV4TUwn1YmHlXgvjGPDzQnYTyiOvEVeG+CCUY
	si/4h23p97O2pUePCDpmGA3Vr8dRQE0IPn2vaOu+n9YzwZROnheNGuRLxJdYh9kk1gvrfL43vBG
	WG8zrkyiU2sf3OGN9EWzAaP2IrlQH4NyqkglIb1stvwHEEtcu4DSShqV/18kaTsLBwRCFc56hPf
	jKPm7bnDTSbyUtTAhgieS3g+GPs8B4ndJSnEetCxENyHsDfw7DeJzYrckDDYvQO/SvCz1EFdMBg
	pwbCKk6B/at8yRGd4SdciDwLPPArK++Z6sVtfVE/za0SDoqGNDDFr9VCHJW5QF5E6Naf2Vmt9W9
	rprOh6aiAHEogiLTxknEAt05VxV/pZ5VytMEIXNrWKQMtb2k=
X-Received: by 2002:a05:6122:7cc:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ee8aee2709mr12650427e0c.10.1795722680819;
        Thu, 26 Nov 2026 11:51:20 -0800 (PST)
Received: from localhost.localdomain ([2804:1b2:aa42:30d0:f9c6:2eb5:66c4:899])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b6641d6sm21675692e0c.17.2026.11.26.11.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:51:20 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: tcpci_rt1711h: unmask alerts before registering the port
Date: Thu, 26 Nov 2026 16:50:59 -0300
Message-ID: <20261126195059.1139494-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

rt1711h_probe() masks all alerts before tcpci_register_port() and only
writes the real mask after devm_request_threaded_irq(). TCPM starts
looking for a partner several milliseconds after the registration
returns.

The ET7304 (RT1715 compatible) does not latch a CC status change in
TCPC_ALERT while its mask bit is clear, and setting the bit later does
not bring it back. If the partner shows up before the mask is written,
CC_STATUS has the Rd but no alert is pending. TCPM stays in
SRC_UNATTACHED and VBUS stays off until the cable is replugged.

On a Radxa Cubie A7Z (Allwinner A733) with PREEMPT_RT, a source-only
port and a sink attached at boot, 6 of 12 boots ended like that. In each
of them the mask write finished after TCPM started driving Rp, and in
each of the other six it finished before. With this change 0 of 12
failed.

Write the mask right before the registration, so the setup before it
still runs masked, and drop the write after the interrupt request. The
interrupt is still requested after the registration. It is level
triggered, so an alert raised in between is handled once it is requested.

Fixes: d6b82dafd17d ("usb: typec: tcpci_rt1711h: Unmask alert interrupts to fix functionality")
Cc: stable@vger.kernel.org
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
I only had the ET7304 on a Cubie A7Z. RT1711H and RT1715 are untested.

 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 0581659763a..635ea9aa8fc 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -337,6 +337,15 @@ static int rt1711h_probe(struct i2c_client *client)
 	chip->data.set_vbus = rt1711h_set_vbus;
 	chip->data.set_vconn = rt1711h_set_vconn;
 	chip->data.start_drp_toggling = rt1711h_start_drp_toggling;
+
+	/*
+	 * Unmask alerts before TCPM starts looking for a partner. The ET7304
+	 * does not latch CC changes in ALERT while its mask bit is clear.
+	 */
+	ret = rt1711h_write16(chip, TCPC_ALERT_MASK, alert_mask);
+	if (ret < 0)
+		return ret;
+
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
 	if (IS_ERR_OR_NULL(chip->tcpci))
 		return PTR_ERR(chip->tcpci);
@@ -352,11 +361,6 @@ static int rt1711h_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	/* Enable alert interrupts */
-	ret = rt1711h_write16(chip, TCPC_ALERT_MASK, alert_mask);
-	if (ret < 0)
-		return ret;
-
 	enable_irq_wake(client->irq);
 
 	return 0;
-- 
2.43.0

