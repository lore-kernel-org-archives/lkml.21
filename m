Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454951;
	b=m2z/JkFw9ebRBOIzYZrGtJ1sOKlCdJLm51YfmwpKWLC+BM+n2KQuPUVUJzY//FCIfJsW
	 w49iu9xOqZKoJEiciMWwrYljKuzuk0n2+7xFz9jZ87zC7arelsKDe6IYA1rbGVkXsO5Iv
	 DRxu7QyN76/T114SEH/tLBdx56alpobnqNvBWpCrNobnqb3MnD42oZ4TSV47MXTTqYesq
	 hvWyi51NAfiFPLu90f7DyTNnps2Xhkq7IcL08uguE9WlXDD26wuN0MmentsrGaavMv0PF
	 T71gEj4YM2ElBp81BFxXptIgiVWPKGKSls1c9h5/GR7z/KIvSE5Sk/LCKYF5ZywwhrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q533qC5yHnPMw2MvdiCjXU74WULol03pGw7lt5AbWok=;
	b=mKFdDfS3PqtDO8eUavU7wQMl37qYI90IADdSri0yGvjTwcK5gkt8FVKEaHVvr3i58YMQ
	 nlC/lGDbkZSsrFCZT1j07ap1obW06nQElwnytXanfbkrKTRA5uMSIxdaaL2jQusQWk0uL
	 U3KO84iRX25gVnsCRxhw0ijY6MRSpclGpnXus9ZLR5qGHbe/xoMp8YnnsUXL5LGKJVykE
	 oYxUPBMBnnbGTvNql3CXDjxn9IJRQ29z4P8XEykSVW0IS1mapslLzIjNcOpP3oKsQUmV3
	 0QuBPs40LF4tjNrjIJ47hN6br61TJnA2Zq2e74eg53XjMkm2DN7Kpma2OzlzDJq5NYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jUKX6QGg;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC62606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC62606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jUKX6QGg
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1350505a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795454949; x=1796059749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q533qC5yHnPMw2MvdiCjXU74WULol03pGw7lt5AbWok=;
        b=jUKX6QGgXGnne3N+/ACsSaxSUBaZeH/sPWhDAbfR1nxNCsW7iZwExRGVaIy4IwVux2
         tuCY+bLAqSf63jUT+wo8nvDawRwCMWwEDaVATXA7ELQwm71eZWd3VNavdF6GuapVBxgP
         ZRJ9J7i26bbdrdos2LYfgzF7uF74SSg2s3dHpx0tduMsmfFFVhkScJsTG+iuXMNNPuUn
         lSwJ+nC/jfNvIsIzRWBcDwWSkcIuiSIm77IH4ip2NYTiYECSmT2SE8Zs//41PsbqKzil
         gV/kqRzGgF6Y3SF1WG07YBwz4GosFktaEpiYnOxVrqS9eePBY9V6JtOrnVhXmQdvlmaX
         tmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454949; x=1796059749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q533qC5yHnPMw2MvdiCjXU74WULol03pGw7lt5AbWok=;
        b=zILLqa9XejMlzDB636StZTQZSfMZeEyQHmDehAepstNxRhzQGBizDR5eaI098hxR19
         z15a680WB7QuEDrxwEGPh9UaWZ1l6wXMQx9Ny5A2moHPblaoAUEWDRY27l+kbayoLVte
         H1z/qklXFuetgvkT3p/WY4B6QqBPwK2CtRnqdUBH0zv0fzXBEr+P9oUV/cVpHFR4VuC1
         umO2iHz8uaQXuQRZ8NEwPzRZC2FL0Hk/LuFFqXhayUk2jQY8AYvvrJ6nCczhyM2iUida
         OKjPILu3WeacELw07c8yOOEA039CBi710cJ/bS5p5qR5JNPxN/BfzU/8RAj9eHeSZYsI
         LG/A==
X-Forwarded-Encrypted: i=1; AL+hErGYs6vTrjxTYfD609x1JZDWzoAwRw80xowBBMO/mXn4MxT5P6gMMBvyB+RbzphgmiMI24EuF8QdTYdlzas=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HEUI9UH0N9tV+muJ5HsYviKqgLtf9xR6TxExtBrfgNUhe9teQ
	MTugF/1nK4COQyjMsLjBwrjuf9fnaBy9qbSeCDR0F8bunuwP9+3iD5sG
X-Gm-Gg: AZFdTZdk/DTvX+EHP7O8Nh1C1AHwFZJ5o7Qig3WWRZ10E8WrzW1SnQquWS3m+QSM370
	dbtU5+c80yHQBdBU8ZZ2BXbMIvPHve33wUk62a5wHec65leBB15o/IgdaIEsJzX+qfQDXYfot/C
	wUzZ1FjwTfq6Ta47lQXxDjgiAEhXH+ajBnW/H3x1+c60Xe0XUWZplb7H5av5AoVv5Y1cPD9d7qu
	MFiyO0fxUzW9HjonUVDIGJzrCOwV3osrWeU8L+yOlIqpDitGSwIX5LbYVPsQV/GWd/0d+ob8GV+
	qA7+Z5LPGpddxVCBpGhen2Vww8toZiTU1KBJTHMZmkbXiRpHBckmWqJ31gm9OZwEJ37zIISG2+H
	uzDKabaBRdK5JBTvf86xivd8qRKqytdfq7Cb0NApd+kfK7BbuQT+QAUb1OoPnYvQqZAVEK3HQbY
	XYCOusx25ijNM4nRH6tbS00biie8H4SBvGpMy5HDc3/0R8a+ZuTwAkQ+WyYNb4CwJxYj+ins0vr
	VbSd2PRT4pew/KPbfZZOi1rJs2vkNqsbNUY3UzFDeZeAYu0WTgrGb7ya0p9eHBQ9pkwV2X/pGgG
	cvZKvfn/Z65pki68e8/5Of/M2CamWztf
X-Received: by 2002:a17:90b:288e:b0:3b3:ab75:c94f with SMTP id 98e67ed59e1d1-3b41c92a098mr10454308a91.31.1795454949484;
        Mon, 23 Nov 2026 09:29:09 -0800 (PST)
Received: from omarchy ([122.186.156.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfebdbasm5552489a12.13.2026.11.23.09.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:29:09 -0800 (PST)
From: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
To: jic23@kernel.org,
	marius.cristea@microchip.com
Cc: crofts@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vaibhav Chahar <vaibhav.chahar26@gmail.com>
Subject: [PATCH v2 0/2] iio: adc: Use cleanup.h guards for mutex locking
Date: Mon, 23 Nov 2026 22:58:34 +0530
Message-ID: <20261123172836.130440-1-vaibhav.chahar26@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070802.14487-1-vaibhav.chahar26@gmail.com>
References: <20261123070802.14487-1-vaibhav.chahar26@gmail.com>
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

Modernize mutex locking in the mcp3564 and palmas_gpadc ADC drivers by
replacing manual mutex_lock() and mutex_unlock() calls with cleanup.h
guard(mutex) and scoped_guard() helpers.

Changes in v2:
- Patch 1 (mcp3564): Wrap switch cases containing guard() in braces,
  add blank lines around guard() calls, and clean up the commit message.
- Patch 2 (palmas_gpadc): New patch converting palmas_gpadc calls to 
  guard(mutex).

Vaibhav Chahar (2):
  iio: adc: mcp3564: Use guard() and scoped_guard() to manage mutex
  iio: adc: palmas_gpadc: Use guard(mutex) to manage locks

 drivers/iio/adc/mcp3564.c      | 63 +++++++++++++++++++---------------
 drivers/iio/adc/palmas_gpadc.c | 46 +++++++++----------------
 2 files changed, 53 insertions(+), 56 deletions(-)

-- 
2.56.0

