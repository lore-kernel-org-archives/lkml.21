Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975268;
	b=wt+LSpldieo4A36elp+9fMQN6o2cYUnGu3HiYBZNnjRXuZrJkRMpI3qn5omXwK7FIb10
	 QQS9iQVqWpWm3+qMuzgwXp++a2YF07eyVg7AJxaZaY09rg6MTDD9Tpy83FBcuMzDxRc06
	 yffO3pMNVbgbfmonfuy+kzU24O5EYtSekd02WYH8fF+PBvDta7thyis/wpZRZG5gw9iiW
	 m2/Pyn++of9bNO9IHrSYNiRC+KQenMgCn9n280rZQbxxO85GIxyfvW7UDIJyj0XMAaFru
	 1sM5GKoL8X6sbxjARbjER1K18gOw/c3Fba0iI0FXjxE3HRFijRNp1APUGOAfJwFoYgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S7V7zZ843cUu9IT4B0WCibyEP2k6ABel5P+47hk3Njc=;
	b=oQSYLXMKjxMtq6KBKnZBAoiDeE0Mqyok1bqgnNQUfYDWNm18LN3GMnvhCOUmB9AG5yOO
	 NVjcTcQbwHQ9VS2rF+wzofNHPE4v2/JU4E0cTiHbW11cMnMjq6vasZs/muJZmYGlT24FK
	 tvLLPTKaLaUyiT5zl5ot1xATX0QeTWn/kA1Xs/8rZ4LgYpcYzdiCtDY72oiKunV/sfaIu
	 lhC5uWw0iLXMleN/cRl9gggxQFwNrqDlE0GQPCdh0gxWKMho7rGFCYHXdQhVME50PCr8y
	 ZpZ/D8ypY/kI/2/HzoJeFkg/JTq3PdZtFYGJ20s/iY6uGMzrUHcxUUM8d2fAosQfY6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iMYVw0pn;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8DD606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C8DD606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iMYVw0pn
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9eb579c0eso3106295ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975267; x=1795580067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7V7zZ843cUu9IT4B0WCibyEP2k6ABel5P+47hk3Njc=;
        b=iMYVw0pnpSGisBf9wt5mkp6dAmIfmEHqMVV3f2qKfO2D1MSkKjpCBpziCF7r7QU5dl
         R6IGkbU7HL3qgXhVAUilaShupESFUptektESp60qwiClRhPYZPoyu/cPs5/6gLnbOeRN
         lwCUrhXC2LAf4GSgyqUrdtJAT9spLBT15FupYCkmE9z6PAwK99T3qswWJjiWErHdeD+n
         IMCExIlvORPXX+IenIgKFlXQCnv0pBzncAXrcQu9RD8Jy7xScTWKmdviJ+IQy/5VEUkJ
         M2+UGv5eadFh7WZG/oWWg7XDQqgUKER5qu53eHzppuv9kMuHyKnH6yu6dao3SIHDApEr
         r3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975267; x=1795580067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7V7zZ843cUu9IT4B0WCibyEP2k6ABel5P+47hk3Njc=;
        b=L1Fo2c+I9mrzYeyjUyuKEU9FM5JzK1kABgvsHgukBhRbvl3CsBVdsUnL/CDv+NUO1/
         soKRZQIKePL8VccPLgG7CGtjkLHUTvRwRiKu4WFdjossYOBYaAQwjtMxH5mcAb4W86g5
         8dQhvVew/eTfZOGkGo4XQnav0AnaBINoyDi2FEHPG7M0BuLcKhrn65+N6iDLzsX9JvMQ
         wZeFL6zKVH/EhBqniO7NyiVeauLVG6lv1c7Eeor/XkiJP6lCeVCbMZ4HOk629wv/gzJk
         xWT1OHGGsl5JXc4tYk64a1dofDqLJWSjQqoK3ixQg9vGeVv235ceGeUA9ANfudpO2Hx9
         WQ0Q==
X-Forwarded-Encrypted: i=1; AL+hErH5cbENb0IrzOKr9zs5ODhLj1e2fHB++bBQCzF93SR+rDpzoDzzAQDIi3PNw53h9r3Dj7Nb2fufhgkJfSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YsOj9tzcgJBb7SH4P6+OdM25h0SfZ9chzBmcGv5wUepvsAI5F
	xuztYKiuIb6kWyUaAqOtZT1K5uMFupgr7WJUmBMUZ0qSBJyIuSLj05XP
X-Gm-Gg: AZFdTZdQrJV60y39bCdTHjW7QHyf02waVYt4uht/nvJbLq8qq3rF3TEIw2gmyQBjRTy
	PsMIqax8EEB/Z5v9Y8Ll5Ul71LvdGqMR/lF5yiEmqc7iDiLTBvAkF1LcOM+VHBf8xA0HxXvHhcY
	KaXhzZP9P0L6lWWOoGH79okYuJZffRf4uCX7S4tNcfTJ7ulcKHZzhfg3ZN5VFNvPfBcbmrbzVmj
	9sD05BoBOwWtoKVsAm1mAmmd2PWxrvCf3kSm1/kYgc1YZeprZXuMcau0hRJBiJMIRXot2C8PIqw
	i9pFzy2xN7Bji1jh6xW8yio+6zj3WkydqSx4whkLUqGAdcSQ0XmJn3JTqLyNAC30bf1qMCtQBjp
	y74pCfvsymYA6NrTDMImQHlei9ufviCP6ZDLRFSxQISbNxzCsC1MN2d0Ov/YAT51Romfzg7txma
	p+HMbgEaC0VdWT52t3lIxzhgrePWU5Ci8Q/Y3XaR8CAbgJJFe+omypHHkycdep7KG6oGwQpb1IN
	I8cm9AZsAhYlmc7bE9v/zjpnRN1MpvIROu3PtPnTpvRclCxZbPaQYzjv2qdr6t3Ut7p4mEhuCq0
	ZwlUYhjBBPhbSN7SET3b8cExaqSdpf0YLOud0PSa7GU=
X-Received: by 2002:a17:902:c952:b0:2e8:1c7b:3b6e with SMTP id d9443c01a7336-2eff7403b8dmr13500835ad.26.1794975267252;
        Tue, 17 Nov 2026 20:14:27 -0800 (PST)
Received: from gmail.com ([2407:cdc0:d002:0:188:253:12:32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214f4dsm5728685ad.43.2026.11.17.20.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:14:26 -0800 (PST)
From: Jia Jia <physicalmtea@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>,
	Jan Engelhardt <jengelh@inai.de>,
	Hannes Reinecke <hare@suse.de>,
	James Bottomley <James.Bottomley@suse.de>,
	Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia Jia <physicalmtea@gmail.com>
Subject: [PATCH v2 8/8] scsi: target: advance past escaped DIF blocks across data sgs
Date: Wed, 18 Nov 2026 12:13:11 +0800
Message-Id: <20261118041311.19011-9-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118041311.19011-1-physicalmtea@gmail.com>
References: <20261118041311.19011-1-physicalmtea@gmail.com>
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

An escaped protection tuple advances dsg_off by one logical block.
sbc_dif_verify() adjusts the cursor across only one data sg on the next
iteration. When the skipped block spans several short entries, the
offset can still exceed the next sg's length and the following CRC
reads beyond that entry.

Advance through data sgs until the offset is within the current entry
before checking the next block.

KASAN reports:

  BUG: KASAN: use-after-free in crc_t10dif_update+0x91/0xf0
  Read of size 1

  crc_t10dif_update
  sbc_dif_verify
  target_execute_cmd
  vhost_scsi_write_pending
  transport_generic_new_cmd

Fixes: 18213afbd8ce ("target: handle odd SG mapping for data transfer memory")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_sbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
index e752b23b1bef7..671427d9ae74a 100644
--- a/drivers/target/target_core_sbc.c
+++ b/drivers/target/target_core_sbc.c
@@ -1553,7 +1553,7 @@ sbc_dif_verify(struct se_cmd *cmd, sector_t start, unsigned int sectors,
 			return TCM_LOGICAL_BLOCK_GUARD_CHECK_FAILED;
 		}
 
-		if (dsg_off >= dsg->length) {
+		while (dsg_off >= dsg->length) {
 			dsg_off -= dsg->length;
 			kunmap_atomic(daddr - dsg->offset);
 			dsg = sg_next(dsg);
