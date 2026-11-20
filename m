Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176003;
	b=yR6ieKqdh08nQqryS/6zyEIO3es/+VN+3gh464mTLbksC/apws9vVqdxJtYs6Vhi7qsw
	 gdIzknZPKG6hso0RgvTMBNZsJpHp9s4aEjoBNLst6dqCGIsbNEommw0XDzsTkRixGr54r
	 FGMj4rI2arcxsoATUOAsPsbmJcXTdrXxFlw+bth08zwDjcbORj5/S8q8gB3/WMEO/O38A
	 9hbB+iJwSeXN9ZMjyTXzcYjZNwhGvPha9m0zWUTLw+DJH0nHQq7yk9pGc0KVwO0rXY+Xv
	 ozlh/vsGcVITJjSIPXw9KxQW8Zpg/NPMEpLKJFWtonaN6as24SOSj/IaULHvfHyp+Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176003;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=gHHEiX1JvnvdZ5Xl9lNlgM1lRX6Vc6a7xN9v8eFMhOE=;
	b=ZmuFDUFw8oq4yRGlvG4hvykqOi1/amxbBKrBILFYiHkie86ZfET0kMxuUAQFNFP9adLH
	 s2dRixHZzTYWEPtfZnbaAC8hOggcvZ4pZCGqR3/5N4WPJD4uz0R1mZfqD2vxR+eeU3KZA
	 t+QzL9fG7rJ63B8k0+jTF7U3AE5T7452tU9q3ewQ0g8vxpR2M12VuComk4AC+EB8+EncR
	 yZfmfABsr902IvpFvoeJZsqVm8KCENkf25JFb/gQyEO2y1GVaoIUosSKgIZCz1YAXf4ys
	 1Aa6aE4aEA+CBg8KfDWLPstydGQXEnaD3rzteZglompLfsafNXk9ki5zSeZ2D5JkfGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="X/nTZxjh";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EFB60A2609
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2EFB60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X/nTZxjh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5138C4E4164B;
	Fri, 20 Nov 2026 12:00:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 267716017D;
	Fri, 20 Nov 2026 12:00:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5D1C11BC0079;
	Fri, 20 Nov 2026 12:59:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795176000; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=gHHEiX1JvnvdZ5Xl9lNlgM1lRX6Vc6a7xN9v8eFMhOE=;
	b=X/nTZxjh0lvm6tqhdHLtxq9+623cazNT/gcNlJi4LzcHIKCF9FzcxSfSMP/8ahaTEukri3
	KymKsZlsvVl5RK2tpzDPQ12642YYm7yr0uCLBKScczFwoi9lPHlu28XBFoCy5Z5ppBJVwW
	eeFW/6p7hZhvo5hHAYySynoHLFObWptvSZ/hx0h1BmYoadQqJk/D0FvqSZbcuOUkNniJC6
	fQcD4Dhmak4ewrZ7CKzJxyhbhaDqHGPGRlIPJXx2pVnVLrtvr2TLTowjDpEBlrmxXoVB46
	ombyxwYr6mncuR73ZB3NbqTLWDfOnatXtav6/IgukPHErW61wphlJt7L9Hxqiw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	George Cherian <gcherian@marvell.com>,
	Witold Sadowski <wsadowski@marvell.com>,
	stable@vger.kernel.org,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v5 3/7] spi: cadence-xspi: Inform SPI core about size transferred
Date: Fri, 20 Nov 2026 12:59:21 +0100
Message-ID: <20261120115925.173568-4-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120115925.173568-1-paul.cercueil@bootlin.com>
References: <20261120115925.173568-1-paul.cercueil@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: Tanmay Jagdale <tanmay@marvell.com>

The SPI core expects the 'actual_length' field of the spi_message to be
updated with the number of bytes transferred.

Fixes: 931e389ded0f ("spi: cadence: Add Marvell xfer operation support")
Cc: stable@vger.kernel.org
Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>

---

v2-v5: No change
---
 drivers/spi/spi-cadence-xspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index 48a6db290408..29a54ffa1664 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -1338,6 +1338,7 @@ static int cdns_xspi_transfer_one_message_b0(struct spi_controller *controller,
 			}
 			cs_change = t->cs_change;
 			t->len -= current_transfer_len;
+			m->actual_length += current_transfer_len;
 		}
 		spi_transfer_delay_exec(t);
 	}
-- 
2.47.3

