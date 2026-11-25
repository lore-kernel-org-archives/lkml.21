Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620918;
	b=Mh7yjgGHOlpsWxy54RM3KACk6dDkIclLUbUraMHHinNm1lwq7PPJL1/7lE0uY67uUQR1
	 hnthLi5zd0pSoDhL8HpPWRi/tOA2up/qscxDbToadiFINuBUkBS8FqcA/qkY8N5hmEJpZ
	 F4KDNRL34uygls1WOgAr1LJCHGpQlMDvZ++DbRrlyh8nj4+kbhDiESKLG8Nrqrdvd5x8k
	 Fg/vJiUocWuMvsFOotlsOzPBmyLlakvSAKdkjhhdwAFz+IxQaRKAVUMu//k4EvC9ZiLWq
	 TSImzSj9g/+mYsb6Ca65N1tIw32lyhmdQGmDy1HMdh0Qk+XEcZVZrB/ImCyoPrPTkyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vhkFSXBg3GgpQvepNDJMBuRf8NhXV0xRBkRjdJ1kVu0=;
	b=QeYngYhIR+/C0AemItO1cle/lM8tTMdd90nrStu91AP6dChclvFb/czzjAm3GOEOSDCx
	 W1JBR02TVrQeQrImlDkqieawX1fafsfKyCtjD5EuTwUT4NX0ltc+QJfBcB3kLtEwwFglP
	 IQvS/rKfv1nhuqQK0wvbGyYB/1durRXmF2PXi+2CWWdaOK8JOEXbeYesrtRneBnKsNyah
	 gNm5myHIalaQL/r7L7NPn9a2QEN0+0RArWlsm8NBNO5OdPYUdNizeeXAI5baospED9xx/
	 /vIzAvCYygvSs52ttSy7bXd3PD7dDp0BY44HioqAfj2BNEgV+5X8V18wHJs1WgqTagQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=faP9Krxg;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2243B606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2243B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=faP9Krxg
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2727494f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1795620916; x=1796225716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vhkFSXBg3GgpQvepNDJMBuRf8NhXV0xRBkRjdJ1kVu0=;
        b=faP9KrxgjbZ63ZEOV428WdjRtzLDO0aqlsXeW5xv6ju1u950zL4qz8x5/GECab7zwM
         U0IbVhPBgcVVHDCxXpog5E1ZLrxjB6/Z+1hq7AWBIeRp9i8oKSkDl0uOsguiniFAwZ7o
         yi0zDz8mJuQpTmNNwDwDtcpWvjigQqx+0yCzKldN+Nv3O4bCEw12+QRzZB09jdMJ/WP0
         4Q03q/PlFPbBV0thhbXoe4Q19joXOc1+oEPx3llh1tfi2W9tuSzntYKvUFmQNnM2c+bK
         sn51MNNLLHdOpflaxg2HCyii0/pu5KRRYyk79zusb7iWz7144gWKI3HQWQxhryGju6Rb
         p8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620916; x=1796225716;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhkFSXBg3GgpQvepNDJMBuRf8NhXV0xRBkRjdJ1kVu0=;
        b=WFItu7OeXjXO/nJ4E3k2CsP8tYiKNszEe8hvuVcT2Nl7yCz7c32wJEcjZfIW34Ge94
         h0V+3DafwlO6dTpulcuJFbrRsZhxcg4EEJCwriVEVazjfNm/8YGrORQUrxwGDS/1b0hU
         PdixlDvQSFYRKHBf5llQfFAJyPV/XkpErFRDd/Rmj82zb4MUcHmon/Cb+5Qnu4m2qEdg
         zfaY5k6+r6r7ZvGBICoVnUeI3koeb1n+mRb4TH3IYeA5Pjuf0PNkcW0lGwbau+Mu/e2u
         q/bfuJwO8mC0u1S2Y9QdJbgKnUlCUN7TpV7BBItZZOchA21FkSQVAo9JYA3yTn/COOGq
         dEQg==
X-Forwarded-Encrypted: i=1; AL+hErEEnHJCybXXtQVzkdWB6x1pJA5FQXwKm7xeV5RQR0wZxD+BXTFvefz0Yr8ixIbLl+mPo+ux0EEpmvQtdpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HiNCGAHenbgEoz7Ut3htr25MbieIylAFV3BlFUKvZCJ4Ixb7N
	RRKd8Noemgc/DkLjdeoSmx7Od6E6aXf9S7Uva1mb8BHyMIubAjidTvMVO/5c54VoTSA=
X-Gm-Gg: AZFdTZe+UWAv0vlaAutt/Knr+W91r+AIynv93oFKRLGOhD1FUxde7T4BS2hPN8nxMO6
	pRlDoFInyiLkp/uDIKE0BlomS3tV/9SlgDQGNhjyG0BV9GGFPgvVdBIe45bSIo0HriEqxLe7zLh
	lIDZi963bobcVZNrGJIF734Dy9PuF1SkVd5nbOY2nA4LUpa6Yi6zcEGBnThz4s0oOHnsEm0U0Nz
	OWNSezkQ+7YbNGmPQWyZMT+HnTI/aAJLamR3lDCVf8eLTu73LEss/JvQuCNhJtlWm/lmTtbPyn8
	s45TxgpYzmA0XLVYtXzhUSF7hPS4dzVRuRYswXlM8U/xIV+yH5QOqWu+wJv4SYqNLdrVm4r7Wic
	7qmVkautjbgvo2U0IIdQgBYxYBj+W4wb8UrQMwSEkfw0VWpmt6Xf/kHOkaF0ABJ+3/v+AvrqMek
	ARCoMOj6kJ2l6ICezJN2EeprppX0+EQZOWLBzMzoTkryLn6Qk/Y4augcw2WUsE4K1jx3Ef8hFbf
	IZ9kmLpb6AKq8d4OnuwuaxsDwUJvHzSW7FW/RjUEAi7AAMUOy1Ct4JSjgi2ryQ26rNAH1fOe5F1
	R4c71kYcRClq7xyN2cKt29Et6udHfz0dB/aR+XW3lnGeGcXgABZsS3ICsoFcfbGUNYGN8TRZFw=
	=
X-Received: by 2002:a05:6000:29d6:b0:4a8:bca4:f295 with SMTP id ffacd0b85a97d-4abb32a4173mr23941677f8f.38.1795620916557;
        Wed, 25 Nov 2026 07:35:16 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm35816275f8f.3.2026.11.25.07.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:35:16 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH v4 01/21] drbd: mark as BROKEN during DRBD 9 rework
Date: Wed, 25 Nov 2026 16:34:51 +0100
Message-ID: <20261125153511.3060599-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
References: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
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
Content-Transfer-Encoding: 8bit

Mark DRBD as BROKEN while the driver is being reworked for DRBD 9
multi-peer support. The following commits restructure the driver
extensively, and intermediate states do not compile. DRBD will be
re-enabled once the rework is complete.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 495a72da04c6..b907b07468bb 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -8,6 +8,7 @@ comment "DRBD disabled because PROC_FS or INET not selected"
 
 config BLK_DEV_DRBD
 	tristate "DRBD Distributed Replicated Block Device support"
+	depends on BROKEN
 	depends on PROC_FS && INET
 	select LRU_CACHE
 	select CRC32
-- 
2.56.0

