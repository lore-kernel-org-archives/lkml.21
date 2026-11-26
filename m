Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701930;
	b=lDu8ftWHZsLiPO0x6axQdJ5puyW/LFR+CTPQtdYEelGz84dVsZUlivjjx1/7lcukrwXM
	 1aDltnu9It8ffKcZFsYQAuPENqKvE6+R/G67Sa9gakw7TtYS5gZNzrStXqGmxQnq/gAay
	 Mw+Q/hOdeHDnCNaUFOHBKEOfrXkfHzmVb5S1QPL0AVf39o7XO8BQ2frIgklPXcBQxKQ3o
	 oFLi5/iqUSO2SluELZH7Gd7i/9Fm79KkLIcrQrbwouFxR14fK3RfNb/A8YPg7CjH+iBQT
	 /X3IigjcUtRhIOXYMH/i/C7wvyP11/dscxxw0imLm8YnwTY329wZTaAxLVCj3yCRyTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O/6YeVqDezPbtpzL6GKQeS19P8hKpEHC15hBz/pmg28=;
	b=vQJgAoyPIby4VDxH0pEz9EMJxAtfmg3moLrJDBFoPySgNOIs48QmB5W58pDTRNBPPIhU
	 SkGJ8fnMsv2X6jOuTFyTuy8M/3vpHPy4UEkiQeoMc6tmhGVfhttMgIwYq/KsssKfkdZo8
	 bvrwPN5GQBGpr/yMO8KN1C3MUB24pBX+NCCYpE7ZCPZmnB1rKkEWp8YDUrFNEdihi4AWK
	 8nojNZMPfq1wVs8s2eZeIw7U+5PnIlJyaHdAqDUhX19iv9vI0V+DJkmvYwaNWM309QB2n
	 BDS/ONR0JYFxe8iv49ZCw85RAmJoR5D7kwPogD3vKJ76dd76ExhnN4jhehuLWbHUBNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhP76msW;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10C5606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10C5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhP76msW
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so9871224c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795701929; x=1796306729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/6YeVqDezPbtpzL6GKQeS19P8hKpEHC15hBz/pmg28=;
        b=UhP76msWmdMp/KWrdrp+ClPjMaygBkOI06EyfKW7xEkyUX6Iozlom+4+mZA6oYQsoh
         QTktd6l59/W6LUCaUSX5oxPGZ2rh1EpWxLnMOLO5lYAl4U9zfSBgPTyAQQfIF0t/9ZLu
         JxW+t6dPL/UEfjF4aS3r1FmJbvcvzNMoEmuV/mM/z/CaTdg+XHpu1007h4+CTmiU77JX
         fzJj26kLFw4tp4sgeaCpXK9l1kl1+VdnJVxqVP5teCbn2wjuQcJMuiiJd46GMg69FOlG
         JLZ9B/0cZ5X1zmLPBxkF3cTBHtjc01H2dZpww0KPPVn+M33O8rq+D3XwAiWK7lcsbKp0
         D2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795701929; x=1796306729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/6YeVqDezPbtpzL6GKQeS19P8hKpEHC15hBz/pmg28=;
        b=t/If8qiM0GxTTjOq2Oy3aFySzGyEDUp95OjtrIvOvdQbo9zJSmA8olJW2auW0oH9Ql
         /I7HusdOBJOHU1Dr3bZfhCuvpGtsvAL+jwfU7JT4YkJ08IC8yJlBoG32Ost5zZp+bOUw
         quEA1/O6bOMyY3Umxu7b9JiTtoemSysNuEQ8iXfef8vt4B4RCXLFR1pu14DDAsNgY1AT
         ddjJk9pkN1kljy7qlSq3zmh8MfmnoyUYAcdA7rEJncxmBcr5owkT++uXv8YY61Y1qLbb
         lH64ZxnleFkcQ6aINrax8iqPZWzsiqFL/epoEIn1TMej2OzdzpUvjzIIcJvyz8k4M3lh
         xGiA==
X-Forwarded-Encrypted: i=1; AL+hErEm665dGsgsyoc46gz1UJhxvZoc2Wi1vN7EEMZUnU6S14BOeKceaK1B503rJUrYPW28PEbNSxPPU6tiRUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yBoxa1zSxJ4qqS0m1Umjk+XFVCzveqtTvm0dJ4ndra0JzuuyA
	rNKhvs8LM2Qxss3aH4E45dYG+xyODNEGo4XaS6PLArCRzGOiAIfDD8Nw
X-Gm-Gg: AZFdTZdfs9nXYDjfb0iH2/uXBXEJL6LCbIW28YVkysqCp7ZOjINfBPXcquuv321J+sw
	ohZS+Qmj41TvPMteCHHsjg23LgvJEG7U9+lZwLlP28st59B/FBt976x2ZMSzsbf26V6tGZsEPt5
	HeFpxsPoaafLK61HWb53I+uTf5+YMDDU6EFwAAz4ugwCYzDU6dTd5n42k96Ms653OGAYRhcyM/L
	KoUVzILR5mg9fk4v+vR2q+gw/0DUaVqusSsLqK6LdosK4nEbe2KRUidLCM7S98Cg6Z3wWIdQEuM
	rGg5/fMVsxrHSYghnzxsa8ll6SXDxJ7xslP3xtF9FpHLg8am1dUETfbAdHeFPvn55hTne42wBrU
	/m+L1sv4yCgZcoRbwdoiuMD00OMbKxcv41J8GrIT0HdMz9iyDRYYaKJ2shIbuFxjjP++gfRl3v3
	Nlf0V4m0tdkKh9KC8vYi6GwYuXcn6aZR8gsDLatGlCs9gwTCyUk+B1EaC2u0OwQ9JMtZjw9HSo5
	BRP64bXsv4arGaz4gX+o2trdEK89jOgxN58/nOi7/3HkQ9TZCUjHBvjf5ahk4coa4glZKR4EsNv
	EHs45cfFnH1XbWu3HtgsnL819gSkdIRhMCii+L/FTSjd/AQ=
X-Received: by 2002:a05:701b:230d:b0:1b5:8a6e:8791 with SMTP id a92af1059eb24-1b58a6e8aaamr4752365c88.7.1795701928900;
        Thu, 26 Nov 2026 06:05:28 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm48644542c88.2.2026.11.26.06.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:05:28 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	Ed Blake <ed.blake@sondrel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: img-scb: disable the clocks when probe fails after init
Date: Thu, 26 Nov 2026 21:05:22 +0700
Message-Id: <20261126140522.3991135-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

img_i2c_init() resumes the device and drops its reference with
pm_runtime_put_autosuspend(), so the device stays active with both
clocks on until the autosuspend timer fires.

If i2c_add_numbered_adapter() fails after that, the rpm_disable label
only suspends the device when runtime PM is not enabled, and
pm_runtime_disable() cancels the timer. The clocks stay enabled after
probe has failed.

Disable runtime PM first, then suspend the device if it is not already
suspended, as img_i2c_remove() does.

Fixes: 93222bd9b966 ("i2c: img-scb: Add runtime PM")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/i2c/busses/i2c-img-scb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 9d2ee449a40b..0fabc54ad572 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1324,6 +1324,7 @@ static int img_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	struct img_i2c *i2c;
+	bool rpm_enabled;
 	int irq, ret;
 	u32 val;
 
@@ -1400,9 +1401,10 @@ static int img_i2c_probe(struct platform_device *pdev)
 	return 0;
 
 rpm_disable:
-	if (!pm_runtime_enabled(&pdev->dev))
-		img_i2c_runtime_suspend(&pdev->dev);
+	rpm_enabled = pm_runtime_enabled(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	if (!rpm_enabled || !pm_runtime_status_suspended(&pdev->dev))
+		img_i2c_runtime_suspend(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	return ret;
 }
-- 
2.25.1

