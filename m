Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171620;
	b=vcZ1VvPVruPEG5+jZIqyOWyR9MMDwqYJOWMwzml4h6DkZ39gwhCz1pjTCCjT/scUdtQe
	 nqJ5/EAxySdAd4ZpoLJoBHLuAk+fjwmfbtTcuWeyLkGdKS12066ucaHz2mIw+HvoXZ8bU
	 jU8aXCn7QbZ/KvrOInCp2SKRSYRl51q7pWE8rDsz68B0YsNZ/LTbM4XCdaWLwSbztVboU
	 JIn0GL0RFN8ZUuqqVCCk3Am9dMdPLlvutHyHVqucMHbpyfI9DTrCoUR5XonamKHA2ZIsk
	 gPemdGdK/L47B0oyiP5PppKPU/nqGsOa7a73ek5DC/Zy1ELBa48nBZjnP4BUO7zuotw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FlPQk0xkrEmQkTap0k2QUV6qXixy3ELzOIiL8b3426k=;
	b=f7/p4PcTOF7uPxqFTgf4MWAIQZ7Q7P58o9t7D6QqkpEJSAFoph3DQfQzyscXc5c0a0F+
	 YdI9Nhd5nOk+uixJ9TFI8wqPNK/jMD6aSxPP9S4pRHG09bJAno8gfz5MrSGe0NV0CqhlH
	 oxfmW0vIdLg0zRTOgBC/fo3QeCqbLPmOR6W7fjX8TpCTn09iTAdipiUeL6amm8BlMdf47
	 M/U47czi5lKjf1YFk9lYFSjSFnHxytxgsSIKzp+j109c5qNO88k6JOTgQ0kLCOzJAhKq2
	 9Xyos0UQxxe4zznIu0B7C5mtwl5e818T1fWZLKLSX9T2MX4WWq1ucSNG9JkAflyGxTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zoLiwRLM;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCE3606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CCE3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zoLiwRLM
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38431138772so899306eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171619; x=1795776419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlPQk0xkrEmQkTap0k2QUV6qXixy3ELzOIiL8b3426k=;
        b=zoLiwRLMkiqlNdHkj2K7Py9ghW/D78MwNVU5V74TY5eMc0TeqysbubI5az/qQ4xvE7
         CO3rZtDdQUSuYXXPw3q8sbRBJzKmDTW7ynaCIg9yevdi2oHz1JJhtowyuUtL4hBGTKMb
         qMHeYnSoAgOxhsmnWFR8n9kO6zY2+wDpqNHMjPlnpNozYqngIQO80EPxv3V168QjPI0H
         Tcv6MMlAS/P+z2UATsPKttopAr0IamWtyYnaR+rKWMmyEZ9sKvCTO6Aps7y1kEpdoq2w
         PmcirYkYPX3RISBmTxnOasVDor6mZ/cbyvnWeF39IiwXKafZvxe19vDE4OlezW3mrRzd
         TUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171619; x=1795776419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlPQk0xkrEmQkTap0k2QUV6qXixy3ELzOIiL8b3426k=;
        b=JWfBuD6KNMPISnM+RinvbU5SCOTFGSD5qhWGF+IQXNm+EjgT7S+dRK/bJvIuLZMIIg
         rm2beRsX1w8nt4yMV8Stpspx4JrkLujQMEzEleIs+jtv0PKjtI25oTJXR+zDf02+wYMC
         lFOeekXxoCIx8WoHxXg88D2QJRR2SAzHhoPVzaEf3OxmkmIscWOtsyV0LdMzEorNmtkJ
         pKeVXl3QD4I7HdDpY4Jzasd3XLBnzd2nL3qRazPsFXCUUq8QlelcnPh6xB1/8BTHRWe0
         6KEMfpQuJfePHNWStvf/1C8dB7eIimbk9yuVo+1+XhmX+Sg+zD+JbvIhWXL/R0iLAJn8
         np/g==
X-Forwarded-Encrypted: i=1; AL+hErEpM5EAsn8QZI+1qKwfwfh49lFOQDcwjxsleVYWYyYzRoVzETZefdQukUSW1OSXSQTaRYx8GLJfoTgZ9yU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vcAmTRJi6uJfWgp+25kCtsLzxgcn13uWNqtCyJUCYyLkfsQ1n
	OxbBDHUU/mawkKX86wnRGZ4dgjdjYt2FbErZCNPyAPng/s1xZkmW22p/
X-Gm-Gg: AZFdTZdMCLK3xd/0VMq0HhgBqWns7c1G0nE8vhNglwYuKbAYDL+qBdJmOmvCGKi19kb
	dwB6B4FUZHLmY3sEa9Y8wjiJndmeKYWET4sxD8wtrOTKaLdGBoNZzOl3XIqx+V4BZotC9cZnIw3
	b4HlAZapIC0g2fpB/frAm0G1RfTh6Ov24qPy+bE2uuxuOzuADOo/6/V6RvSv2y4WMzuLs2RqT8l
	dYKPc+PHMcm3bGgI3/MRJ6AgqkXxqv8LlCkocNxwjccOUK4YC/6ZjF9IShQdZDPYU2hSpkZtSqX
	bm3nzHsE1cwHfsWaZhQ4lYIswWJip1jqh+gisalHIzKgA3HSZ0XRnbE6HA1xMq9n8bNc740DG/H
	SwqgiSYIEwnIYh6ZIg4sTxi12jLlfc6rhwgaE9d8Ylz2cizJao8f7Tz2aURCtk7ELo6loK0Ye/7
	Bc4Vl5HTg2oXOAjv1KId6CndeuTRrqFSDXoyXYS6ECsa/sMsYoZuQS2cLUev6lRuobGKigtMMPc
	dW6q3jPSSxE/JqSjVBwDKfBZmbiOOa0evKJq5/dOcibchmmlTGbX/MtIpRN9LdHkW13Id0RXit4
	p/aD2iQtjfGOHi3iqogDMFGVjQpzxswQIsMOXmebf0ZyQvB/XbzQN0O8rSetb90MqvlJ+R/CEqq
	r+8cnGGb5DQHQQPxbH8wGPJ0nBFWzeHGFBrMcvWUSFD2Q
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr3506558eec.21.1795171619119;
        Fri, 20 Nov 2026 02:46:59 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm7326292eec.12.2026.11.20.02.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:46:58 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/2] ASoC: atmel: Mark interrupt registers as volatile
Date: Fri, 20 Nov 2026 17:46:28 +0700
Message-ID: <20261120104630.10240-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series marks the interrupt mask and status registers as volatile 
in the PDMC and SPDIFTX drivers to ensure they are read from hardware.

Link v1: 
https://lore.kernel.org/all/20261120100408.8053-1-phucduc.bui@gmail.com/

Change in v2:
 - Update the Fixes tag based on Sashiko's review.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel: mchp-pdmc: Mark IMR as volatile
  ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile

 sound/soc/atmel/mchp-pdmc.c    |  1 +
 sound/soc/atmel/mchp-spdiftx.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

-- 
2.43.0

