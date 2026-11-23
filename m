Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453046;
	b=5Buogc5pokpYJDLrVfXFqmhXcePSOqnGB7vN7B5N0bxiqnrI1o8TudYqOIpfktXPMoFc
	 fQ/Ft8YYQzNkEfTR2x028git+hSF0djEUTmI7IWMXgilaxRH/2ooYJ4cVn6i8or2SneYc
	 L3cEitv7IEzQObePR7Th3wYQmy+hCFa6z/t30KDUiJLMmRJ/XSafL6sfDc57CT8O1gOYe
	 kXgS9/M5qQoRueVsaGDCtfIXG3rcgCymG8bzW8rw811WjUTPyaYrAfm+w1fVkHCEJxysj
	 ray0DBO7U4tfjSRpAMZWzuyvPy+6eIMrojqz+geUTiOPzhh6f1PzuMhHOSyr4GzVRkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Co4SdvXZ9sSIXs1Uh5/HXOpqDLiA1vGpW3W0bsDAIpY=;
	b=xtFhUD9BXZKjXu/VAXjOmA6zXQuNRATK1mBlK7syS73hp0v45vxJV9YnPjEXWN5+7sAL
	 jPvN92e3YSMYhWDcphjRLOmztebsjkfQBmT3svvNT4x7a1ezb31yLeAPmQWYBiJyjQmsi
	 uhKX4+DhrwVjQZPGQkGWLQexEvWBambLoiT+yDZPWuNi8ygrpPwYgDW5N0DIy/OioHgAn
	 wGLXJlbgW7ZFM5ZcC06HX89MROkHsV3XswMxNu4Js4MNQhaXnYKqppuMTts+jQd4PzOlR
	 Rq2dlNozaMYeUdXVxz/Vml4txVlsQ6it84whR3f+vnmvjlCu+gwP/cpc8eXBjtlNqhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cRNpmwpM;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0BB606A335
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC0BB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cRNpmwpM
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso7558473eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453045; x=1796057845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Co4SdvXZ9sSIXs1Uh5/HXOpqDLiA1vGpW3W0bsDAIpY=;
        b=cRNpmwpM4KYLY4iB8PjXQlgmjkcEHhrG7sJSL6uZL5z0f1vRQkI7VaMrG28CduyNQw
         XOWU0lae2hcNgAFLYMOCPVTs/7TKvV6hzRhVZ6lCS37BsVRuPQ4YhLt2wbBElUKoQx6h
         9VotNcMaBbNvS1VUJiZE3GU3t3I46bPwkRIU7T3iY9HbiHQcv1oblWFMWmbLWI/YUW3U
         ocwz8SXb1M6pris7HEQ8MXQ4PiQIDWeo55oEk57F2o7FKhOC5e94A8x5Uypo5Ceuczuz
         Aeu8uPPpR/zAHbHJmg+SMJE1O6zx+9zhBya4lbMkwaHDzNlAYIkQhMV1vXwhs25zwWV9
         ufVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453045; x=1796057845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Co4SdvXZ9sSIXs1Uh5/HXOpqDLiA1vGpW3W0bsDAIpY=;
        b=RocC8CiKEiG1iDhQS2ZstO6SL1nFD1vdbXviMfs4vXb4eitEI8G7DLgnwcl+yiwhww
         nHvQAsznmKSHccWYGVqG9vManPWiMpiHrOyA0y3ArQUSlhNeFcr7yg0D1O8vcclWgS+J
         e5sKDyZn+H5mS3AoxHRMdc59H83bwF7x+DnNkWN6QO+qwrdAmM0rfatkiFXuT3+sFscZ
         w7lFIVM8bqfZ3igqV8InJzrXa0HSxjbuQxumdTbK3O7CZoKatEis4FOGixsq75uMZZa3
         Dln4tglMs8NeUcgOJXqqTQVe25XVDLTFmIgTdXAPTsckUe4iZJnUcgVVGkE4T1I5NvRS
         Fg1w==
X-Forwarded-Encrypted: i=1; AL+hErHVOgl0D+OUnGIilME4WhUz+VWEKU+rxf4DBAkdvq7pBC6dQW6HF6nOSlSUAyh0QZGIq3gMFiwkKF/FvFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q1Dyf/fZCNsEJplKJ9y73V5KoBk6boAtjQAIY2JVEt+ioNLx7
	gSchdhQAOcm8FtNl2oG9HgGaO62nUtUST75gueUcESlPqtkByhe2xaVVcxLhhiYC
X-Gm-Gg: AZFdTZfVpK0+FwGNK2tvuXii1qgWlnxc4WYAuNmflC7+CNbpm/10QthkiPmiowv3ZSP
	0jVeCJywsVaE6aS6LxZoP7Uw/cM4pxeFGVwuqiBxaweZJ521RuqTkdbvWKfsdt4KG7kk6Wj55gt
	KrJht3Pb69pf8UfBjJbM3zONAsI9XtNA2bxHqGw11Bcukhf951qh5tz272vdUBdVh6JrlkFJObu
	YKfJX9XPiKt3xBLnKNKhZJx6oMwoemJrRHWdsYJAanNldTe5/sRLqSdunBbQaFS4yCNsoXBa7bp
	XdsBO8sGmEQlTzgR16j6V1vuXVHi4zVLLjaKHmGImtznpHE2Nsljl74j0/IbTcXkf8JskhkmL/e
	s1NBna+0peZ+TZlmHM18naC7OYvP98LAXdHOGLOiLAb5vF/+pj8NJdSsqewSn+p7qjO7+aSl8h+
	YDQ1v3o1ndQHRXnUVK+XQF+G+jfMxmVzYMDzpXeptq52rebHaBQJSVzMLsOobWgJNxAXcNbXgah
	RAW/Nc2aM80i6bF3sHrLVaC6WWw1MzeXiFqFWaxc89Jh9yDpOxbS5D/TjoiV1Pc9RrnPyqXijVf
	Lo5niINvcu9yELid4IjdzO0Hl9zXRbx/4BDRULeRClnF8ahILDOkoecpOFCcx4b4mFNeg1ju4Yr
	lHchv6FBf1fq/HoMQEBgGHw==
X-Received: by 2002:a05:7300:5994:b0:386:a915:8b97 with SMTP id 5a478bee46e88-386a9158dcamr6410286eec.27.1795453044778;
        Mon, 23 Nov 2026 08:57:24 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:77b4:9837:f7af:7965])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm39766715eec.22.2026.11.23.08.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:57:24 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: fmsh: add support for FM25S01
Date: Tue, 24 Nov 2026 00:57:01 +0800
Message-ID: <20261123165702.641230-1-hjf3108@gmail.com>
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

Add the original FudanMicro FM25S01 (1 Gbit, 2048 + 128 bytes per page,
64 pages per block, 1-bit on-die ECC per 512 bytes).

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/mtd/nand/spi/fmsh.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/spi/fmsh.c b/drivers/mtd/nand/spi/fmsh.c
index 6352e9c9e5..a2bdf3a445 100644
--- a/drivers/mtd/nand/spi/fmsh.c
+++ b/drivers/mtd/nand/spi/fmsh.c
@@ -216,6 +216,15 @@ static const struct spinand_info fmsh_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&fm25g01b_ooblayout,
 				     fm25g01b_ecc_get_status)),
+	SPINAND_INFO("FM25S01",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa1),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&fm25g01b_ooblayout, NULL)),
 	SPINAND_INFO("FM25S01A",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE4),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),

base-commit: ec1e844b9486302a488abc03ea918db60709766e
-- 
2.53.0

