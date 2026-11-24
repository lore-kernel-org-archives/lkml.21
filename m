Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535136;
	b=V9NIeChquGerfO3Zjez/S+M4ByYELC9/WLnc2pJj2SlURj+RPcBRhVOQ91oNQ+OiBHBr
	 fUpEgoSb7XZtORBjjxwOZ0x4Vq+h8VurdiPHJyfiy2/rmMTbJTv5lDEmDGZ0snnWl4mpS
	 KDAet9JA4UUgrZzZhgl6UGtVUOcRwdhzSyQMQtO08s4s9/HGZlEH/YkR/xpr6qLMsKrN5
	 BazofHorCXw4zgrSNjT6ERhgYI2aP6Vq7xaCHtOv+tzhHZFDQF7J++kvpe+dYblAmK0Nf
	 OHXpVwsqCzZv0jzT6N2WKsZ/+RE1v4uG4QIau21bsF9uVr1sR8yvHadI2ZZQugd5bQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5N56MgLFon8GdL7QzFpPjlEu7rx1MbvlYKRTu5FbU1I=;
	b=o5m00x1L034qRY95eqjBioZhQsTxTo4ZAuHyruI6sF4Ha+3bazZrpmCw2i4O9meRWygN
	 IvWev7RLX+TExT9ri/rv9jyC2boUE/kje/DjY3Psx2853+32BwO1can0aI71En7qJH639
	 ov2OwTp2eT7rfnqNMD0PzYBbS654nc1sC5OtOM2uZ2ORTw1D7wxT2GcaVhM3j050ESAxV
	 vE05jTeIe9ndwr1MPYd4Btvekqc5qaY8k/PiPquJJEKq3Xu+OIGkOWpqLjq02UPVPtZPn
	 aPUgccC+L+9Cd1h3Ow2xtdM5NXv1mGF8qZKNoXQi6tQe29f04TMYZsEp01zbMY/t97g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=002ECCbG;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B083606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B083606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=002ECCbG
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so3038772a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535136; x=1796139936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5N56MgLFon8GdL7QzFpPjlEu7rx1MbvlYKRTu5FbU1I=;
        b=002ECCbGoe4UvZrDiR8+fQIJbNmAxO8iRI7uDaM42niaGUYPgQXdlnHjkyX0nsDLrU
         Ze7K68D7fIBGkDIT4B637oXrGl2E+23Id/8+5WhhbDOrcw8sJYHHS55Evjw0mn3/pWT8
         JeeIumNTNxU5+BuLGul4WQ24pKlA8Qe8StoOFxVBTnbs0xLQyn5mXVZ0hurTXG4TslUS
         7BTXqdBGAvHNMZ31HHj7xrYnMeiLP2MCuGzud64zEKWg7GkswqHF1gJhRrcvX/sZjDrv
         iHy2tYdjan2IKlC81Nf036sgN13ZnQWwjClgHP2de8BtHSqxOl/PSlKAHVV6KJhdL4PV
         810w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535136; x=1796139936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5N56MgLFon8GdL7QzFpPjlEu7rx1MbvlYKRTu5FbU1I=;
        b=rGrJoROmHUs+7ilJd8q1wG+yVwnotRDKKqO0HiKBkbEJqZJwKgvgMJYbOsadax/vZM
         I0pD5jftMWfvcuFSO9TiATnu76jBZ1zP3/8XrIT2k7hX70rUZSW8XA5fNQ2GVGR+n2J0
         Q5EDOp7q2ona7C+nkEoiv30qHzR4HNeSjCjBWsEN5VgjbJfxWbgbEa2hbIcEk04BItgZ
         MfjPcczVHG+nwMu6MObuv4FWzT+INQD0HN19vPCm/M0B5DHvPYWrNPiPMaiGtAZSWs0P
         2x0XjFLqtZSHMJyD4s7869BIY0FOLZDF22Mm9/AKvA+6KQi3rHuAQY49rusQdILN14wY
         DNgQ==
X-Forwarded-Encrypted: i=1; AL+hErFd2sVixvgRwQr3W/DkPwnV/KihSqWpqno/BCgO5aL8oYQ2WAb8xlFrsB08zVnwcy4lKIvSvXFQQvu32+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/7LxtyT+2N1b1+MIfH0vwdqe9zkicoFkM9JPxUjpZKs5NlUCz
	CvbjNxWCaKS8ZbmzTaRFD6iWkGpcWnMVDIvzHlUavyBLKL0qcfl+sPokLoYaGoUKFQ==
X-Gm-Gg: AZFdTZfhqqv/eLkGxsohViC0BUW8Tk7T7xWne+9a0jtgfzgaPLwOJQ5SuAZNpl8gsoa
	xD2sX9w4yRPRD4HcOdx2pgIcYjydNninvwCkbEE1QEmdZMKfaUtf/7nnMOTitoqDjtBNDn0YNNW
	TN+qbPpduMrBYJo6Qb1zXcmWCryl9udvbmCA7TosNjrMRy/R5zVNeQUWxByejPHzDVQBPdC/lvb
	zyE/94uPn6+0pf9wM/A4ESlabYkyRmz9PRGzdtCmN7dlpxw913/yz3KzyTO8oZtH2XvdpYxEm/Z
	b3weAPElUTUP4Eiz1WFgHfCBKoz0fOyt9hM4nPeJomN2U+dFV1VPD4BGVV5VaUwo8c12tVgadN1
	h5qJqjaKAvDGvs7j4WCfTZ2Lwsq6sL3e0TJwpsvgXT3mOeIgGiY+nBBohpX6ecihcPOsBaYRJ84
	KGitfnhHvExXrDANnjrnEA5tG6zZNxPKNtFFJKPo67ABCm6R1p6RaYUoXW+FHt8FIapSSg3O7Mb
	qvP8j8zbpVaETHHg8/xdWBLqs85HFmLqYV+H6u3LE//21DW1lw7awQuBDXhU7YMtOAfwu3T1jaM
	3vji3+Ru6JlHM6g4n5xVe8Y2EpgfHCpwvSAhOzwSgbh3ojs6mh7Aylry+FTX7K74Gg0J
X-Received: by 2002:a17:90b:380e:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3b41c9493ccmr14751455a91.50.1795535135546;
        Tue, 24 Nov 2026 07:45:35 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:5da8:85f0:b5f6:2eae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm26290347a91.7.2026.11.24.07.45.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 07:45:35 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: saa7164: Keep the frontend alive during DVB teardown
Date: Tue, 24 Nov 2026 23:45:30 +0800
Message-ID: <confirmed-20261105-31-0973614e74b7@gmail.com>
X-Mailer: git-send-email 2.50.1
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

On HVR2205, the frontend is embedded in the si2168 demodulator's private
allocation. Removing the demodulator I2C client frees that allocation,
but saa7164_dvb_unregister() subsequently unregisters and detaches the
frontend through the freed pointer.

Unregister the DVB frontend before removing the I2C clients, and detach
it before removing the demodulator. Keep tuner removal before frontend
detachment: si2157_remove() still accesses the frontend, and on HVR2255
lgdt3306a's release callback can free it during detachment.

Also clear the published demodulator and frontend pointers when HVR2205
frontend attachment fails. The existing error paths already remove the
demodulator, but leave its pointers set. Since the PCI probe continues
after the DVB registration failure, a later remove can otherwise tear
down the freed client and an unregistered frontend again.

Fixes: 504b29cbb0cc ("[media] saa7164: Add Digital TV support for the HVR2255 and HVR2205")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: x86_64, GCC 14.2.0, W=1, drivers/media/pci/saa7164/saa7164-dvb.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/media/pci/saa7164/saa7164-dvb.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-dvb.c b/drivers/media/pci/saa7164/saa7164-dvb.c
index 3eb749db1ca76163c1b16578ce858a4b54a4e82f..76fe0fc56867434eef87a86d869bac343daeaf47 100644
--- a/drivers/media/pci/saa7164/saa7164-dvb.c
+++ b/drivers/media/pci/saa7164/saa7164-dvb.c
@@ -492,6 +492,13 @@ int saa7164_dvb_unregister(struct saa7164_port *port)
 	if (dvb->frontend == NULL)
 		return 0;
 
+	dvb_net_release(&dvb->net);
+	dvb->demux.dmx.remove_frontend(&dvb->demux.dmx, &dvb->fe_mem);
+	dvb->demux.dmx.remove_frontend(&dvb->demux.dmx, &dvb->fe_hw);
+	dvb_dmxdev_release(&dvb->dmxdev);
+	dvb_dmx_release(&dvb->demux);
+	dvb_unregister_frontend(dvb->frontend);
+
 	/* remove I2C client for tuner */
 	client = port->i2c_client_tuner;
 	if (client) {
@@ -499,6 +506,8 @@ int saa7164_dvb_unregister(struct saa7164_port *port)
 		i2c_unregister_device(client);
 	}
 
+	dvb_frontend_detach(dvb->frontend);
+
 	/* remove I2C client for demodulator */
 	client = port->i2c_client_demod;
 	if (client) {
@@ -506,13 +515,6 @@ int saa7164_dvb_unregister(struct saa7164_port *port)
 		i2c_unregister_device(client);
 	}
 
-	dvb_net_release(&dvb->net);
-	dvb->demux.dmx.remove_frontend(&dvb->demux.dmx, &dvb->fe_mem);
-	dvb->demux.dmx.remove_frontend(&dvb->demux.dmx, &dvb->fe_hw);
-	dvb_dmxdev_release(&dvb->dmxdev);
-	dvb_dmx_release(&dvb->demux);
-	dvb_unregister_frontend(dvb->frontend);
-	dvb_frontend_detach(dvb->frontend);
 	dvb_unregister_adapter(&dvb->adapter);
 	return 0;
 }
@@ -735,6 +737,8 @@ int saa7164_dvb_register(struct saa7164_port *port)
 	return 0;
 
 frontend_detach:
+	port->i2c_client_demod = NULL;
+	dvb->frontend = NULL;
 	printk(KERN_ERR "%s() Frontend/I2C initialization failed\n", __func__);
 	return -1;
 }

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
