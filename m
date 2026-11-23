Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433596;
	b=4ZEhd9X9j/M5XLiiSyw7LvFSlakLRex3TIkEvhxj5OOKuqLt/umA1Eyd9GyAzPGHxW2p
	 NSSdc58vy1bCh9JnmqXX7X1JLvm6Z1qFFX641grFLAUI2J4FxBVe0wC+INvJ1fNuuApf7
	 m+5sXEXuQeJZD1q9J+h6rOuqls5IYIz2O8dLP0HKzwOHpVXMZSOK1EVLR+VRED381qB1q
	 EbuUFQ58kFYG3iTQmtVTjHWWjn1CGwENVaK9AI+a9kgWGdRiIkyJipL3yn2g2lRI790PN
	 e7+nqYF8ixyiOIfDbbGUtphof0JLh9Vfam0XlPHbZbsbyf3io7ohBnKitktu5AVy0fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h8PfSz1Z0HS7aEXYWIN1VEHp2/SQ6XDyiMLgGvjktH0=;
	b=RWmaGomF69tcLr+kW/Wq0mpOfC1PZSlGlJtQedDMUKsOioPMETICM+LkuYCNMpLG77s4
	 8kQiBgKPEN0y4Tyv5YvpOvxUJSEzU4vmV/Ae20JqofuoWxT2LyHLgMNoX9bUXLeS12BlF
	 pK/2sluj1HaMq+EOijKMAQBI/8gy9gXGI2X927fav1Xr5C43YzTC2vCHu96CLLDWHvvc7
	 LJNBy81xVKbA4vA7WYgvr7U6eSZrA/Uc9m6ku5eTfOM7Rbo+DcfJ9khTxb7xJ4ocZKIuh
	 fyK6A4lzvtI8AQrK5NIqk83yGdYsXFN/9StxW+jrJqOq/QaeH40SQVcTeodVWs6Y6kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUM4egdS;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5D3606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5D3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUM4egdS
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so516452566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433594; x=1796038394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8PfSz1Z0HS7aEXYWIN1VEHp2/SQ6XDyiMLgGvjktH0=;
        b=NUM4egdSLzip5f7WzayPpgs0/jIlwEePbGxRhIdXnVuVWMrWMtWCpjuWrXaYjB/DIb
         AHJ9gZHj5bABasHgvU4BC4s1sOgakUGgshPs2Y/httysdk29+jbXdhku/zMC3hYPqsbh
         n4sXsG6ZV6Lcf9LCtgstJhZ9dOfoT4L+eSktTfar2o5QP1IDcp6l5FrOKFJVUnC2toCd
         EjvxqGhSOqQUIEAoGQVV63YwkKxQH/X2LhjziyqWs1O/5PIfbsn775NQQc3uOLu+J/3A
         fKC25UcT3TkuvQZbLuCIKyDQU4Z+pt+IRS+ozZzjXPOS2wBnlGJrASt1UBhsvrJIf9W8
         T/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433594; x=1796038394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8PfSz1Z0HS7aEXYWIN1VEHp2/SQ6XDyiMLgGvjktH0=;
        b=185U2LVmOTwvVL6lolarBtnXHVvtDq/eCii2WcV1eHlM6xWUp3mtXmjRQ8HUJ8AOn5
         +FWFtRhaI/GD9YPeArkWKj0ZkUPLpd0IFklfYLjoNIRuDPrFSrHdSYhMKj7hSbD9pMOX
         yDsEcHS5XXnqYH0XxvVu09wz4qn5SmzNaccZvvMrjoH6/ep/0iPDAWi4clufj1eqnXke
         ngKyzwkAmLURsQDWohbo23Ds1Z1DNSxKQHsIt2n0r7/NdK7TzXtBMKdWIAOdYOLEB1S4
         IygIglL7i2N4UF50sJK3ovgP3SNvS75xBM+0uaMVavw9Jt0JtFzxkKUvH7i0tOqYdRkV
         EviQ==
X-Forwarded-Encrypted: i=1; AL+hErFV6qqTqlN2CkaG4vju7jOnAseOBIWDSm58b0lRoYTe6ZHSvsOIq9A51AcNoCuj8ZTqalRFazxkRTfyETg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K2l6+rJ19FYS0CorKJY5GQ7BotZ0Ruk75e4hsmZDD+FaoDdd6
	EQHyrNJaIxovN7+hW4qBLpRlsdaAAnd+9tNTp1vKoM+apDdCGjBpaRPTY/UTD2rsYg0=
X-Gm-Gg: AZFdTZfnA/lmnIDH/12I8pYrVIxfKJVa1GdtWy6yiYfqLCj92OwuZHtiwi4InXoIHkk
	na0b4A5pp0WLM8WYurdiS2i7Ce4WNu0xfOOdl1geduHZvoqQtf6CAfmmFsBM1huqcSGKUoeCnT1
	al/at1bWlll/bqBOgiemS4cEl2HNl1MZFvDf++LWCmo116lSEQsF8dTysFu4o0FNt/THccz2M/P
	FpgEZCUVmPAJJsL6ecOMl9kcA1yCDr228PxFaLRBUrbxBTmTfsqJXDb/L8LTJPo2UhcP/HRnBMY
	6O627BTlNyUl6mXUkdjIqqS4ym64FEz7c1apqA6OfqY5WYKrCkiO67li4cE+fEn2ExmE7ibvcqh
	G+24ecEXyBEMlH0SZliTClEZ6GY5pT2XK2eLuCiJVP9L4noLhBFzsDZhThy3QDBUg0Tl6SipeRb
	+XLqmTJMsVU7PSSmHJ3tSlTl3c5soViWOo6AJgXuSjf56zuifzXPRaxpDzXkPj5jwn/YehXInF9
	cXQRMY2H+vq/NUqbtYEmfNRPEZ+5BSn+yQY4Ui95NbVzwnVRIwXq936krnYUepckj1SirVUzbzQ
	OGKwfnU0G2X3RgJHObyahRrMOT1Qwvh6fMf8g0xS3No9Z8F19Q==
X-Received: by 2002:a17:907:1c9d:b0:c37:8c7c:a840 with SMTP id a640c23a62f3a-c513a80fcb0mr952035266b.18.1795433593843;
        Mon, 23 Nov 2026 03:33:13 -0800 (PST)
Received: from lin-mg ([178.226.61.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afca58asm382625566b.65.2026.11.23.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:33:13 -0800 (PST)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guy Morand <guy.morand@bytesatwork.ch>,
	=?UTF-8?q?Theo=20L=C3=A9brun?= <theo.lebrun@bootlin.com>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] gpio: pca953x: Fix TCA6418 multi-bank I/O, caching, and IRQs
Date: Mon, 23 Nov 2026 12:32:32 +0100
Message-ID: <20261123113234.197852-1-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.52.0
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

This series fixes multi-bank register access, input register caching, and
interrupt handling for the TI TCA6418E GPIO expander in gpio-pca953x:

  1. Disable REG_ADDR_AI (0x80) for TCA6418_TYPE so multi-byte reads and
     writes advance sequentially across all three banks, reverse Bank 0
     bit order (bitrev8) in bulk read/write paths to match the datasheet's
     MSB-first layout, and mark the input status registers (0x14..0x16) as
     volatile so reads do not return stale cached values.

  2. Support TCA6418 interrupt setup, edge configuration (GPIO_INT_LVL),
     masking (GPIO_INT_EN), status decoding (GPIO_INT_STAT), and W1C
     acknowledgment (INT_STAT) by reusing the existing pca953x paths, 
     while rejecting unsupported IRQ_TYPE_EDGE_BOTH triggers.

Tested on TI TCA6418E hardware across all three banks (single-pin and
multi-pin reads/writes, input volatility, interrupts). Also, independently 
tested by Guy Morand on his hardware.

Maria Garcia (2):
  gpio: pca953x: Fix TCA6418 bulk transfers and input caching
  gpio: pca953x: Fix TCA6418 interrupt handling

 drivers/gpio/gpio-pca953x.c | 120 ++++++++++++++++++++++++++++++------
 1 file changed, 101 insertions(+), 19 deletions(-)

-- 
2.52.0

