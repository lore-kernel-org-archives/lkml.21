Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992291;
	b=iSLTD2muymNHCzp0EQtN1hM+fHJdrbkFjHGaBjJraV3lSEgGqJ7B2Hf9cCGXIWoIeWai
	 v4CXnKM5KzMp6MNt7qH2ge6fGkx1GhYuyHGlGbebwp04U0EkYG4Mw5lxfHLiLUsaGERki
	 gbjD+Yh9C4TT6PWJhxNqj6wD2m2y7uca8a8Sj9lrBsL0tEYx331sAp+gO68Y6U39JQxDb
	 wsc+WxuB7A9tn4LIknrvg2uWlyQe5o3XsDoMC3VNP2bG7ZSFeCjpBRrMlrXZSYZiJBNL6
	 6Q3icysor4dKp81YmJakBXmCZE554vWfb5eIEA8QsfWgH+pFKlS5Kn4YqB8iSYLTDEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992291;
	h=DMARC-Filter:DKIM-Signature:Subject:Message-Id:X-Lms-Return-Path:To:
	 Received:X-Mailer:Cc:Mime-Version:Content-Transfer-Encoding:
	 X-Original-From:Content-Type:From:Date:References:In-Reply-To;
	bh=bS3ANnO5SPstg4zhwje34jFvY6VcGhgNDUOJNHlts9g=;
	b=KGrGl6KL6Z5R1UIDGN6v1fabXzE5hWSv0MU/GZgCupgZyM88wAqz8ohj8oU7fFHuI2X8
	 V7/GXiGSIVXuT5h480Ne5LWEDaleSPOM2HCa/tAy7LqJ/kYH97g0nmNj35FDfIF95HA/3
	 xGKJPn/3ryeshTMdQKheJG9IreS/lzGthKebwX5bu7MUIJpICx3xSMBXQTySAv3r0by+u
	 4IiGWFhYEamz2RwfRfpJUlVS6uIAiLE6C9ZpzrNA059vh/GXVH0NQi0khqCgoomEUkwP/
	 B0DvwycejXt/FbZEc6M/gTI0wW+xTuvwV4CE3VnCwrArh1cP5oYu1EoJmWzeUXtNtdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=tpVjOpQi;
	arc=none smtp.remote-ip=209.127.231.16
Received: from va-2-16.ptr.blmpb.com (va-2-16.ptr.blmpb.com [209.127.231.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E812606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E812606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=tpVjOpQi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992286;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=bS3ANnO5SPstg4zhwje34jFvY6VcGhgNDUOJNHlts9g=;
 b=tpVjOpQiH8bZsESkcUsw8yblVrpxG6Slqj9wNbXBIMW9UBJudgcCeNSxOtAPQSUaIRnmm9
 uso549gnj+Q0XOOkjLKJ70j6T7JheBT+UWjTKwrHFVQq16SBM+RHu61YnlLmbnK2hYFKSP
 TW4nsvdSH3SlrHBn6fSrHgnEhKYkU/7rWJy5VOTL1HiYy7qYgDTT01jp3UUTwl3zVEkfvJ
 NxMMRzRnzpwNSJfpmoVtTvzzB/xjyxMY+a5fnVZuJOIC+hYg8V2jOZDBtzp8CxEvPHyDzW
 +crRNFv6JHm5OFOXAu2cNK3s7mwDi8ERQ5e4lKnnb0xzNc9gSZsOWn/mhvqtIQ==
Subject: [PATCH 4/9] platform/chrome: Allow ChromeOS platform support on RISC-V
Message-Id: <20261118085742.1817536-5-yang.wang@deepcomputing.io>
X-Lms-Return-Path: <lba+26afd689c+6e19ef+vger.kernel.org+yang.wang@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:03 +0800
X-Mailer: git-send-email 2.43.0
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
From: "Wang Yang" <yang.wang@deepcomputing.io>
Date: Wed, 18 Nov 2026 16:57:37 +0800
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>

Expose the ChromeOS EC configuration menu on RISC-V so boards using an
EC over a supported transport can select the common protocol and input
drivers. Individual transport dependencies remain in effect.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 drivers/platform/chrome/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index ca2e84420..6beda4655 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -5,7 +5,7 @@
 
 menuconfig CHROME_PLATFORMS
 	bool "Platform support for Chrome hardware"
-	depends on X86 || ARM || ARM64 || COMPILE_TEST
+	depends on X86 || ARM || ARM64 || RISCV || COMPILE_TEST
 	depends on !CPU_BIG_ENDIAN || COMPILE_TEST
 	help
 	  Say Y here to get to see options for platform support for
-- 
2.43.0
