Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704512;
	b=XEuvcvRtR24G7hTFTP2PYTJAV2gWPnfilORcc5Cs6KYFlzvOu7kQw/bi+4V3zYw+qKgg
	 5idfO6FuF1GsJDNanIL3GRQz8K8zKIQL0sy5E64UurixwwKu10Zi5+5Cb6FzVqvyOymzK
	 /4BWWcu6ptnNnUEsHPoe4sq/yQtv10MH4G8Q5ugweBiuEhNKgufQChFvKpbRJ05H5aDVB
	 WHhflytjqdyjpwxvbytMBClzmt4RoLabglknJi9NSSui7NhBTlHlpcPUMAlp71VBIdlgf
	 4zWm9FOzOvV7EIUFM+iSLsvMHaHIoBwt2jgTwjfg0Fo3ItZzX44VoKEYfe/jobGK5Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=nJhbDW5oUPFRod6/Q+bK32hWEC41qaxTZHqJdNWk3HA=;
	b=TDoGwtfZckCGjwMA6qnBz1KGYqEeg3c/N9JJnemTi73T1xp1TAuCufRDiSdiGW8lK6KC
	 tqRXpViKqylZDLDgjdDZHHNWsbl6QAGNhriI17qYuOpE2Hhv2hwkYyeaIh/EKwgYHBo1b
	 TgRcFogwi9Nmb63GHcwREWsWHi89021eYjKjHPYhs4pn7Gb0MpyLyphocQsH1JAdYNXH8
	 nz3bJr4xg9HunmeifPIdRauPrmIHuESyFBwE+vxcOokicKLbXzwRRo8ZO71bK9prZ+2Jk
	 tm3XwAO5K78+r1fWiS4cdjIZVhSB0bcmVdO+Ccj3OzkF6i3Ze5AqmhxVv0mun5PYHtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DrIBDzp3;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B821F606A692
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B821F606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DrIBDzp3
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so5545757f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795704510; x=1796309310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nJhbDW5oUPFRod6/Q+bK32hWEC41qaxTZHqJdNWk3HA=;
        b=DrIBDzp3wmUZ5hQlOGGmu5GrgvvQC0qOuBfhiPLxfvu5+R3jVr71uLdqk5Bhc+s4th
         M5X80VJrZ0pmzBYVOrzQw5stD2Ly6Xfn6Z9G8R/wx4HnJh9darUuS10XJQBececvs6nZ
         ecVbYy1MzCDhe0k/aKixp/zT3Yv+Z/fuZ96HfW8AVh6E3qjYWnR5JxZEwuximsNqWzIY
         cdOa1AUeY/UfmYWgNY7hrjY3VJpu46Pw0+nPGkOtg8sc7aE7jvAb2RBih8cwAeopLOIg
         b6oqc23rfyZA7QfYnchjnaeOpYMbC124fkWmYXh6SQzKTCz5O1+kgNZlp2FRe4V7ye5n
         4xwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704510; x=1796309310;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJhbDW5oUPFRod6/Q+bK32hWEC41qaxTZHqJdNWk3HA=;
        b=KT57pH60/u8c1WKPOTNlvg/37xi+zwlgToa3PAeaIWJcxkIvaJFyFVhNkLA26qn6fC
         F4MFbXy3x+LKuRvEQ2ED2B6EQ9pcA1f5CsSmPFVGTxc6FygCZuvQKZ4lxmkTQzxh6lsM
         yksFXlrvYhvyCyKREV6gCMpo+3jcv1X4bobUiScJMEVGUiJqGyxWounfP6tlQGBYB7+8
         MGqg2GW8UtLBpWX+CsKAmwS4v+FWft+b9wQ0ptlXeppn8X4ExXtZ2Wc5/QLnEUgh8Lzf
         nl+1618nvWjt/CBjBxXPc7W1VsF6NgK1Dno8qsN/0buKGBKc/LAtBVq/Psq4VV53m9/T
         ec2A==
X-Gm-Message-State: APuU4Z9K9b3SdMA/exbbMF2dn4FX8p/WQ8qdQQch12IfEm0Q1eZMRr4U
	/vdklDLTwTQjwxxpotGk1bFyJqdyR628iZTjhEfYXMIeXFqVE/Wf78G7XMgaUZkl/mU=
X-Gm-Gg: AZFdTZepAeDLI5lC6lLGj/Ns0kDflWpgpFyk4kwMYtqBfHlRrchXnYrF+Mck7yrYyeN
	KqG2iEgC9pZg8Wd8AP/zRfDzqmWhsmnzp/34Td2w2yucgcgvzqxmPYQwU2rOavgpJquZLVqplzT
	HN1sz0xL4nt+w9ek7F+/ePEu9xFW8LPVVSpNipN+eFEtPrQMBVY9VXbWPHiwb3Wt3M2ENOaZBO1
	8NwuQoMdn2UNbp0wn2ZMiTPT5c5xjN8+JHcaEMpptaGfEqt8F7Tba003+Xuber0hCWW18PuC4m5
	xCzV/obnaN0ueAIjFGc0di3d0Q+Q4K4usN//vTbvNB4PqC8DqFce2i8nc47DfFDgH/cTLKXpeux
	UDfqLTUCfvfXrUa2g6UNDinUbwR2eiQ1Pn/gSrBbJEJA/rIP3qH0b/tiLEmAa3b/uFl6m24Bb3p
	6UkBRYw4kf6n1Yo9AJFlx8EgvEN3wPUhNaO98YDQaRW5MXlAbPUgCPLGhdpktOyr5E8IH7hlYCe
	q+HG/fwtK8J36vrKEqirQfgEDCHpGacTA5l3VwnQJxQcOrWpWFxd4nLPr3FPIzQT5SthX3t+cPe
	Kr/tvClTN/gMTZXxTOg/fwZBAGq0MnAoGizFtSiBD/Sry6ZVyNVpBa1NLYtaKpDyMsv3Z+VOPND
	D9pjfSmCxsssY/f8=
X-Received: by 2002:a05:6000:4304:b0:4b7:6d41:f12d with SMTP id ffacd0b85a97d-4b76d608a13mr16936131f8f.27.1795704510053;
        Thu, 26 Nov 2026 06:48:30 -0800 (PST)
Received: from localhost (p200300f65f19a904aae808b8a2e91502.dip0.t-ipconnect.de. [2003:f6:5f19:a904:aae8:8b8:a2e9:1502])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6baa397asm41780626f8f.48.2026.11.26.06.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:48:29 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v2 3/3] spmi: Don't export locally used function spmi_device_add()
Date: Thu, 26 Nov 2026 15:48:13 +0100
Message-ID:  <534f8f3eedc660003267cbc3c87967781a90fffa.1795703292.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795703292.git.u.kleine-koenig@baylibre.com>
References: <cover.1795703292.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rkQgZ0YsBC9dqXJc/Ni+Qhd91yg7jB4tiTKPltAE97w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrCEaylXN4Ecc9LbG6TiZETDJRnYwLJvdFDV839 P+cONQShHKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawhGsgAKCRCPgPtYfRL+ ThKKB/9bQZt2Zz2ALyWnnbnehGzZMb5lVJMZiJXZGFToe6SCOhWq9UxtugFsAnVt1r4TKClwsXR fGdxjRSvfs6/gIFsPlqJPH5vpLZ6eUOupJA240BlWr5sqmgV69EGhCS2FhJfaAGWdaRcUe5+0JV Vlin4r6kHfnmggQu6smrbXpuqBE3AioGyMy0KSWFnDUvg/a+E0FUCkmxyBXJfuODhyA8dl6kRQ7 sNVuuH03cuS0zB9UYuGQGK4KKJ7KJKnjB6GUqiJ5mB+jK5rPCnxHeO1T2IgqeR2sBaRWoJW2TPj CQqfz2aiSZWzWd01CNnkEg7y00PEY45nKU204KwUUq6bAcNU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

drivers/spmi/spmi.c is the only user of spmi_device_add(). So there is
no need to export this function for module usage.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/spmi/spmi.c  | 3 +--
 include/linux/spmi.h | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index 6d6805a5ae69..c8b3e236db83 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -73,7 +73,7 @@ static int spmi_device_match(struct device *dev, const struct device_driver *drv
  * spmi_device_add() - add a device previously constructed via spmi_device_alloc()
  * @sdev:	spmi_device to be added
  */
-int spmi_device_add(struct spmi_device *sdev)
+static int spmi_device_add(struct spmi_device *sdev)
 {
 	struct spmi_controller *ctrl = sdev->ctrl;
 	int err;
@@ -89,7 +89,6 @@ int spmi_device_add(struct spmi_device *sdev)
 	dev_dbg(&sdev->dev, "device registered\n");
 	return 0;
 }
-EXPORT_SYMBOL_GPL(spmi_device_add);
 
 /**
  * spmi_device_remove(): remove an SPMI device
diff --git a/include/linux/spmi.h b/include/linux/spmi.h
index 4daebc980501..c81ff3eb8cbe 100644
--- a/include/linux/spmi.h
+++ b/include/linux/spmi.h
@@ -65,8 +65,6 @@ static inline void spmi_device_put(struct spmi_device *sdev)
 		put_device(&sdev->dev);
 }
 
-int spmi_device_add(struct spmi_device *sdev);
-
 void spmi_device_remove(struct spmi_device *sdev);
 
 /**
-- 
2.47.3

