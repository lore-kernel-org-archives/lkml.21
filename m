Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009108;
	b=l3HOVE6MB2ksVrXPeSKzUk7y97yzFm7G0cKkXKWdn/X628DxA+GFnp5RaB6cXt79vPJA
	 KRxY/SQT/j+eOjd5vwxnbm0n1BjrWNxoO7mKlUlRZlo7ybF/yGIPyo+kWsdvJHErm1OO+
	 SwJkv18I4DHInYSRIB0nGJxQ6RaYyjsjIAGVSsP8r9mfcY304LUHwc+FBghFvENyt75sh
	 fLdVp7KyouM2GMYxUR8KV9JSn7ExJcTqBWnK3E4R7ni3FoBrvW9LxHZJui+aMPl9/ue2N
	 OyrLMXY2wB9OBUpEKx0kRF77cfmdlwabFThIjxPehOF1yr2r/IDPbdA0MWDfN9CHjSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009108;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=kFZC9tucpVhNJbgeqCn+d/WcROzjtP2rv0y3T4mg1tY=;
	b=2mCc6a5RLzysc+rCBaIl3Mh4sQLwjf+XE9xg9nVgh/rP6I2+imAwvK79umVTWb13ANAe
	 qXPxXoNna36HOl/InVMpFgaBXZkmEFxHKfrdy47kNWJOih1LcYp8YDskyPWyLgBKxa1ew
	 Z9SBytXbeb4ce8mNeN9DjrWVkPg77HicDE64AG/mGUg2GYFGMg7U13dZ39zXn0VbFYlOx
	 MeBE+T4VbpUyatqaZVnUYibXenrJI/dtVSG8hWazEuv8PVcP57+klwELs2qz6JgM+68gk
	 ENOXDY+JflnvDnHaP3YhrTTixKaEVHnDLch6HxTt7L/1QLz9nUy6sTxZhGbFOY0Il2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OZ0sjl4v;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4FF606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A4FF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OZ0sjl4v
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 321E81A16D0;
	Wed, 18 Nov 2026 13:38:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE9555FE9B;
	Wed, 18 Nov 2026 13:38:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D06711BC206A;
	Wed, 18 Nov 2026 14:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kFZC9tucpVhNJbgeqCn+d/WcROzjtP2rv0y3T4mg1tY=;
	b=OZ0sjl4vmh27yEtpI5NUr4MmRGxIyVVTfCvJ5u0WaWUQMFETlxEAQO342LSuvqacew+b1a
	CmSP7RvUtqtyu+DTbJAlrMwJzAMBFbF0ip1Udw2INht7rnMEOxPB2HQmaktqPw6T7Jf2NK
	hFsuRPeLNTfcfTYoP4JCM/LXqZmMMX01KeInKb7XFVYSiatCqm/ui8vzqiBzpvJH4s7f+8
	/E95gn1nq1v4oT4vq0rhbWuyeskz0XoqH36T9gqTTz8HDWJJJ0oVpBGZHfuUDz4emNk6oM
	vVeqBI5873gIqbkdPq324yBTc9R3f2us/VGKLmfAPq91NJkyEcvSQshsa6Gd6w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:37:14 +0100
Subject: [PATCH v11 07/10] clk: Create
 devm_clk_hw_register_fixed_rate_parent_hw()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-perso-ma35d1-upstream-clk-v11-7-bd1d1e060926@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

clk-provider.h exposes many different helpers to help registering
clocks. Most of them expose both a 'basic' variant and their 'devm_'
extension (with just the last parameter of the inner function call
becoming true instead of false). Do the same with:

     clk_hw_register_fixed_rate_parent_hw() by creating
devm_clk_hw_register_fixed_rate_parent_hw().

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/clk-provider.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a355d1ee5189..c2b80cb3ab0b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -458,6 +458,19 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 					     fixed_rate)		      \
 	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),  \
 				     NULL, (flags), (fixed_rate), 0, 0, false)
+/**
+ * devm_clk_hw_register_fixed_rate_parent_hw - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define devm_clk_hw_register_fixed_rate_parent_hw(dev, name, parent_hw, flags, \
+						  fixed_rate)		       \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),   \
+				     NULL, (flags), (fixed_rate), 0, 0, true)
 /**
  * clk_hw_register_fixed_rate_parent_data - register fixed-rate clock with
  * the clock framework

-- 
2.56.0

