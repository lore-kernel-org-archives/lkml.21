Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188531;
	b=E8d43pTNsTIvEDgem7NFS0E/mf7MutkIAUBF0YaiDkSrCm40hpZuMJwvabDNlKkKb3Th
	 l90ftLrF6m1n47Kn2AP/gwcRUX+qCJaui/WSMxZ25hFO7EXf5qreDr2Vj0usEOdITbdyy
	 tkA6ME1OBOxgWFsyHf6BuzdugUlCZ4xPnwwHqHTmQX6+qnk4Iv4X8qrdd8p64H5VrQTAU
	 uU2/KUPYYOJ208pdY5ZcFqJfm5+JUojyDzynhSflmn1VMU6q26cvFZm1/wWWI2zq2ffnb
	 ZZAITyVOWxH122iIlJypQRQnhLaP58N/0ZgJ3Ao/b6X6bmD6ioHffku12leaqKSfmQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kUtDIm0Ij5+oRdqP4qF3qpYzW0b2g/KAzdOQ4qh+iyE=;
	b=b0PU114s72vAizqn1QOuk6MOXYtFF6VnQMhU6TsvNgFbaNSKDM3NlgfAHzNDxVf+FGoT
	 +a6HnfyOSODFLaOIcvHRUU3BH7wIRzu8v7giKFL4Fn9PqQBfa7H8Db2VKe4d3QZzL+nm+
	 UOlQ/C0PZwXs8FMLRWPfAcyK27HdkDPy7qhSOGOSaZge/H7ItsiXQOPcWEmGsqT1X8/Yd
	 5BUDTDOTx6zpFcA1crcwyPPdOZOtraqEpR59xH2a49xkwvXCxeQPwO49FVEZoXJftGlUo
	 zDuL/pMDn9y8OENNdG+4sX0vHPZd6T01QjdjLkpoNc9EP6Qzdw70NfyciIlqeY5DVHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aNtxi2VZ;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB7C60A2614
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EB7C60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aNtxi2VZ
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so938431b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795188531; x=1795793331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUtDIm0Ij5+oRdqP4qF3qpYzW0b2g/KAzdOQ4qh+iyE=;
        b=aNtxi2VZIn9GFf3yaUr6WsQH7VOkU0qz7ho1puyEJQS9u9HhWQ6R5X8yfJ22yijGl9
         IbCcJ8IgdSaMRbk7TLSJOXy5vKIicAb5TAwupS2qJUlHUR3uQIpTh+FB5pliEP8RGL7f
         EgHy136rXDBJifSQaDbIWfgAJ+3eFEO7uOXPrO6SUA8LOeEnoA7pu1/6nLLwND5V25LL
         zyEocsZoz0YGZRTnel2o0nf5MLV2xj7PinZfz/4GrTvDqeisRyp80zmSLExLmVQ1C7bx
         ncDunPssQRmxtmCs27pG7b8Nn73pNKxMqAFArND6owFgAwPeyXJikHecb/XEB0Sxtfac
         ZWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188531; x=1795793331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUtDIm0Ij5+oRdqP4qF3qpYzW0b2g/KAzdOQ4qh+iyE=;
        b=CCz7ieA9vgkTY3Cq7XcSI+pdf4P7UlCmbR7ArOkzlrMVU7aQrwMSychl7drE4iLixG
         OQHolr09QCB9DvYdl7Ize//te+TrW9fQX1VjUN8wJOdaNhhk33buWko2GaYfl5OG96oH
         luMiTJlrIO+mmB1BM4XblSjfO0NHf7IHy91Ft5Yvr7pdqiLqrlxR7RezkrWeAIHah7SR
         FWMlyVIbOX/JYhFhBfkN++dbgtfDk9T4utYOLc1WEFLDcIVW09QafZFxviOCPNm8fJnc
         w/xVvho3F2x8VtUIYAF7JB5xFlrsHD81p/jgf1u9jadNrgDTBfF1dz3YkZqz1D9x1dXf
         XmTA==
X-Forwarded-Encrypted: i=1; AL+hErEit0j3ZUWHtLzmwwrBOaFBvH3x0uIruWJ5rnSV/Y2zi5qarXEeoiTerMj16bQ8hPuheqVPRY7XbQQ5yok=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q8e0gs4VqEtqveSovEjmmPYYV1ruwcagkiwguYpHfkn/NTx/Z
	e1/w0QakxcRr/s+7HiNNR5nlncWoe46nCTkuUl/pmoB4dMoaAFJ+kX/eheYmGygHwtw=
X-Gm-Gg: AYBFou0BHfXsB5EdrC6l1aMVJpXi9VAEywQyfJNRWU289g1hjOlyO0NP6Y7KPvsJhB5
	0iZl1e0RnCKObnzfK/Ujqp2/Xt5WTPnDFMoyX1nT/69ZLnVwa4BSuTh7BNJFBUaR4TWJsDGcK8I
	Ap9qvhQxg7oy554uMLR9OuZNtv89zP6ulLSzD0NuAzIEm4xMGUQLPxlLgLmi8qpBuaIJ8UfSsTH
	bqnFDzfEP6UoEaT0ECU4GroS9rJ9YDUleTLSttrRYNVbYWjogAQEFhkkjFsOf+NoR1r5TJqai/g
	DZvzxwDxY2FVuQGTzKJETHBEwBBzxIOgZI6LIZOvdLaDDsyittaaVcSFcE9NCfx0ULi0FIHpoj7
	8ycbcSJTG5aSSxSHXGGbN5kZzm9sAtx04kH8cAzvcFGEZ7hsKuj4pMIN0OdBLxvjERarey3juOm
	bHi7K4L/bLV/K0OxDa2E9BM7dA66LHGC0tSql4XdmwavJalEwbKWsY7V6MQ3oo4VhSg4unHfgvd
	4eQ1GsWvFDHY8ULwDrn7+iDvm45p1Eh12FBDoF6xsL4eaT6rvEBEWJbLoeDDD1EJIHsVe7agPpU
	oBFS/I/Ov9HLsD15a45/UdoLEu4Fk2eRQWc+jf27t/4=
X-Received: by 2002:a05:6a20:e347:b0:3e2:5d7f:f630 with SMTP id adf61e73a8af0-4014d75b547mr3642378637.54.1795188530800;
        Fri, 20 Nov 2026 07:28:50 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4c::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm1704693b3a.7.2026.11.20.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:28:49 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net v6 5/5] bnxt_en: stop the ULP around the reset task
Date: Fri, 20 Nov 2026 07:28:27 -0800
Message-ID: <20261120152830.699712-6-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261120152830.699712-1-joe@dama.to>
References: <20261120152830.699712-1-joe@dama.to>
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

The reset task can now stop DMA when the firmware does not free the
rings, but the RDMA driver is not told and keeps using the device.

Stop the ULP before bnxt_reset() takes its locks, as bnxt_fw_reset()
does, and start it again afterwards unless DMA was stopped. The silent
reset for a VF config change is left alone.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 9daf053293a4..2abb721d87de 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14710,10 +14710,14 @@ static void bnxt_tph_update(struct bnxt *bp)
 /* Only called from bnxt_sp_task() */
 static void bnxt_reset(struct bnxt *bp, bool silent)
 {
+	if (!silent)
+		bnxt_ulp_stop(bp);
 	bnxt_rtnl_lock_sp(bp);
 	if (test_bit(BNXT_STATE_OPEN, &bp->state))
 		bnxt_reset_task(bp, silent);
 	bnxt_rtnl_unlock_sp(bp);
+	if (!silent && !test_bit(BNXT_STATE_DMA_STOPPED, &bp->state))
+		bnxt_ulp_start(bp);
 }
 
 /* Only called from bnxt_sp_task() */
-- 
2.53.1-Meta

