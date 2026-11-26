Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729686;
	b=WWZtouMm9ZJWfY6QaSrmHGUSqRNL4wVUlBCfTB+2U9TZG1iB8idhtSuVpKMVHnj4yFDb
	 p9cCFZDc3Z2woiB9ZQejYfWqLE8aMlyd4l+Z8p3bT19LJRa+XsGvHEX/7yN42wWrfAT0d
	 qg5fvmXmtzKIGvKrlBZqrtjmALrm/jxtP//214BMpgVzICM4n2/x+Vnb2s0CDAFtZZAzy
	 v2xJ5rKNeiGhrVYkMRkXVssSSVTnVECXa2kFLpraaTWBktqKjvEzKiMxEqUw7CXQGdcOx
	 4lEO5Coe0nH7kMN4bwZOpcetY7qU6FcLd6hn8NZP9oDcfvuGTE0CQwPJsMnYFmxsN5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mz+Itla6D9aJ4LEfK+0eYjrF7t88lxIqTXb6+qpzWZI=;
	b=RL5QNGb3N08Wbls7OWjaIwiRu7OaJzKocQSccsVmypzH1pi8tVdbOqK9zynTPCbnZHR8
	 uRmnGWgkMOplN8MgejaYV0wylKh+V2UHf/KmDclJnuFuX4KW/bvb7YB6ad9sREIKMd7o+
	 jN/ac3EHayjxzBw9p8WKv5l/TEQcNFZwkbp5hKm4M+oBsZmgvwnnMLbb1kUvrOAWHVwQJ
	 EEhSPa24KX8tlwClhfa5OzclzOgVj01Qd0PZwnwcgKxRxvz957eub99coIBB7YhKflXu7
	 ZRzJZnV8o6nQRqCBOQIYUhbjq3/ldiIs8S8KP+BqIqkrIlvjNk8dQjYJ95ZBpSDRTyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nUbvXPpQ;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646B8606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 646B8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nUbvXPpQ
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso4265782a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729686; x=1796334486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mz+Itla6D9aJ4LEfK+0eYjrF7t88lxIqTXb6+qpzWZI=;
        b=nUbvXPpQgySjxVjRz48Vov14b1bptslVjT+ROckJphZd6z2JWiCb6+dq402cm8/Y+p
         ldQKEa09j6sRxikDWcAgrUwZnpKFeTPtQ74zobflWaaU36PG+ver9lwpHjHmeKkf1h9B
         YMg/v7WJBXyDvf8eEdwoO+ZE2/ussRT3AkgxeW6/326QU+V5dMPZm5o4th4ahTX+ljIZ
         jaF91TpmwE65oRTeHneoyw25xZ5EuRTLoVeZRyEmqbAVidUAXlXy3tPQY7J78PfIcpWI
         rbWW/x4Z/91LAEoLLCDQFwPayJcahd4yMYL75ImZFXPywc+nuxpKjrbsPpxwIN4/chBK
         YMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729686; x=1796334486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mz+Itla6D9aJ4LEfK+0eYjrF7t88lxIqTXb6+qpzWZI=;
        b=SpJ7BO+rSHIj3T7ufpnOjlg60hzf00ij8OG3g1kWvAhGfLgNqtSX5qRw1pV1Go2ftv
         D/kBqzipZudv+HETpbIO2AkEts/6scV3jeuqbL8EaoMkyIQcDiw3nYd0THvkvTtoCNn8
         xOWVrJaSfAyuHbuLZefwhgptdg4vBd2O0K3Q1g66/wwmhDbiJopkQjk/mUxW5uGViUGu
         CryP0fsJm1G0oaZzTEfzVCOZk7oTMHkzZ8YjC9P8Z7MSHMHDIC6pzl8ubK2a7gFGy1bx
         YVBUmkWqvVzXRj4Hsc5cO9ZDTWJGp/1biB/w0Qe4aBoPWqwesWZPfLbjh7/mgRYuoxPj
         b4Gw==
X-Forwarded-Encrypted: i=1; AL+hErG0PO7/F/uEGkGw+5ILeQEf8CYETFZGNxlbjVWivoM1JqV8W8YYlOQ2IEDJkdjj+OcnFsMpMScZ3H7Uct4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Af9ZH7CUD/GEN1KkiYd3uJbmjQ5HBZHw8vfCzVcprcsEOmBWi
	N87hobQRXSRLJtnB9w5zvyDx53w5sbAVWuPVGtg1DGjWXcrg791RFKj8
X-Gm-Gg: AZFdTZfiyB4p3MbjPhvcv/8hSDQkGBLHte4Z7nOnafXFJGwhB+s7mT0Zq9XqJbm+DMU
	dtEdyb0puqgrsRpchphK0xf2ED/aKyBVTzdMjBOwygKVIQo3x0qhNSQTgsE1BgIiBQ0x2l5OnFj
	v6BrJVGtoRBft4RZnW8dWpmRDKGe3spC9QTK2vsgryGG77Zf5Tg3lk1kC11ZyK7NMzwNtIYc6Zc
	n8wPbkw8QYS2d4lw2JbX9baPNLXWjEhKZhWYioYuO1WE4NYRJ9VPdqtXJ19nkIMJJ9jVyEDYqZ1
	+uKrELPQuH1ommrjG1Mfp3AR06OFcQHe7om/Wrm1KD9VpnjGiMna2buHW/qcI8VKQrARq0is24E
	o1nuMiwwRYuytSO1JkW3Aq145BzEMITrwGxKTgwRfAdjxfOoqdVd9z1ZjwsDHF4IfQ3+vnokjQP
	+FYNVxFgu5cPlp3bfCcnL93lZTgFvSd9F0iUxC559YpP5S+qPOGKgtDqLSEgAoARTTg7Bv9GuEg
	ix2/7COSzI2uppbqLBbtEU1FkXWpu5ySIrXsLKwuDfRH+LNTTdq0ixZMdggoqbE5x5Y8uIGDb8h
	5vchDcDzgaDxYvvANXyjhhGsU50LuOJGh6x21S1Ue6tNzU9Vrg==
X-Received: by 2002:a17:90b:2f8f:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b41c92a3dbmr22744671a91.29.1795729685759;
        Thu, 26 Nov 2026 13:48:05 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm34636414a91.8.2026.11.26.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:48:05 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linus.walleij@linaro.org,
	viresh.kumar@linaro.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3 4/4] ata: sata_gemini: add missing newlines to error messages
Date: Thu, 26 Nov 2026 15:47:56 -0600
Message-ID: <20261126214756.39027-5-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214756.39027-1-artem122novak@gmail.com>
References: <20261126214756.39027-1-artem122novak@gmail.com>
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

Terminate the SATA clock lookup error messages with newlines
to keep kernel log messages properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/sata_gemini.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/sata_gemini.c b/drivers/ata/sata_gemini.c
index 9d87603ef531..b69db749b49d 100644
--- a/drivers/ata/sata_gemini.c
+++ b/drivers/ata/sata_gemini.c
@@ -227,12 +227,12 @@ static int gemini_sata_bridge_init(struct sata_gemini *sg)
 
 	sg->sata0_pclk = devm_clk_get(dev, "SATA0_PCLK");
 	if (IS_ERR(sg->sata0_pclk)) {
-		dev_err(dev, "no SATA0 PCLK");
+		dev_err(dev, "no SATA0 PCLK\n");
 		return -ENODEV;
 	}
 	sg->sata1_pclk = devm_clk_get(dev, "SATA1_PCLK");
 	if (IS_ERR(sg->sata1_pclk)) {
-		dev_err(dev, "no SATA1 PCLK");
+		dev_err(dev, "no SATA1 PCLK\n");
 		return -ENODEV;
 	}
 
-- 
2.56.1

