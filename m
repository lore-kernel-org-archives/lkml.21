Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191032;
	b=Q0BaNOZNsOEhC2W5HmxoX8w0sMweBcgPq8lObtyaIx/W4aNu9rE+4/Lvj/1esScaxc8m
	 KsegI5PVWNlZakIr/Omcl1x89gnZLavqPXCp5GDhITRL3S5KIExQFnVJK7PfU8S/+A3Ff
	 dsX8X1ywHCLvxt41VXx5aPR4FHLwQFs1PPWv/Atj+179ChYNDWUvp+5YFnMCqTIcryioX
	 81YFk+6wbV+XwM/xlbrXqs2joCsbMn21kSCWBHYBaSJSKf+rY8zGm3FxcIuBctstJ8vdy
	 3A8MHqLPmz27YJEqsocfsiWLHzd1w3KJGvvEllJFj8JKxpyAaJeTic+3uxg7zxVFfwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191032;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=thFabj8hkz789nBEnn7Pb06wQJdzTnC9OTaWYkZ4ktg=;
	b=fCFuOatqttPTnBloiM/u/EbQGfoXticqawAgrqyOLDGwPwstvi5C5GFxSh/wbD4YoDfm
	 x0u5JphIsFym1M2FWHmlr4y92ZqHIUkwGL+1D1INByQeNgz+I4yhly1uvyZh57JJUbgei
	 Zhx2pqeE/WJP+050kKtjBfh7olXxCYd/N+8LMk0oaWTASQTMAEiewD4q63keWGZ7/s1Bl
	 uVP5uAaIyRrEovjqwR+/99EKgFYX3cID2vftxGEbG3kxQutPykWSMH10an/IJmwlT8Jfv
	 AgqxE6U1iX+XMvLy1CFlB5jo6ZRD2QIJ5gud+MgU46jpIVbmOIEKXAbhRXC5iJZaSZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LMlWq0Go;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62E8606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C62E8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LMlWq0Go
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C6A21A174E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:10:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51C11601B9;
	Fri, 20 Nov 2026 16:10:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD41311BC0449;
	Fri, 20 Nov 2026 17:10:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795191029; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=thFabj8hkz789nBEnn7Pb06wQJdzTnC9OTaWYkZ4ktg=;
	b=LMlWq0Gov+VD0OdA7EWRMmqzCR2pW56hRKMNtd9zdfuO18Xe60zIwZp6yvX1shz3SIKjwk
	VwkcKMG/7GUx77hfRLpxqyI4/pujxVqema+kASn/QN0/tcdxVPC2CoOLLRT+GeGCfPXDVB
	fhA6zRwaJluDJS7ct1Bos+jyQfICUF+lwWlT05vo9i0yazcxknZ7TG9gI6LZgt+HKC0RZH
	+JfgKCFt4PPaGxhF2/ZRoHNlpFCvwbrDhBVGjNyj2ykeXqhzC6JYeqk/uVqtbwizY3gHvS
	Qsce9ZsdG/eTJf3sA0tLMWz/HxBg0GcXIiWuUzfDBiLUMRDDxLGbWYOfGo4nvg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v5 0/1] ACPI: platform: ACPI 6.5 fixed clock support
Date: Fri, 20 Nov 2026 17:10:19 +0100
Message-ID: <20261120161020.297735-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
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
X-Last-TLS-Session-Version: TLSv1.3

Hi Rafael,

Here's the v5 of my patchset that adds partial support for ACPI 6.5
clock resources.

I don't modify clk_find() anymore. Instead, the first clock is now
registered without a connection name (con_id is NULL) which means that
it can be obtained with clk_get(NULL). Every subsequent ACPI fixed clock
found will have a name, "acpi-clkX".

Each clock is also now registered to the clk core using a system-wide
identifier derived from the ACPI device name.

Changelog since v4:

- Old patch [1/2] "clkdev: Improve clock discovery with clk_find()" is
  gone.

- [1/1] (previously [2/2]):
    Register fixed clock as "<ACPI_ID>-clkX" because we need a
    system-wide identifier there, and we don't have the 16-characters
    limit there.
    Register the first clock to clkdev without a name, so that
    clk_get(NULL) will obtain it.
    Register every other clock for that ACPI device with a "acpi-clkX"
    name.

Cheers,
-Paul

Paul Cercueil (1):
  ACPI: platform: Add basic support for ACPI 6.5 fixed clock resources

 drivers/acpi/acpi_platform.c | 75 ++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

-- 
2.47.3

