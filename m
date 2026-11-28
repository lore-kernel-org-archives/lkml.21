Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795840942;
	b=dlJxHAGTeLY3FxVBYb62GSvKs8DrYScHGuytl2AJNWdNwAjZHrivwgdp9dCi21GmsDf3
	 ht39vejoqROVjVZCu3H8Iid6xjcX7dMToXlUzjC3Ifx+N0NLhFn+nyTKNVy7IZretX+Cj
	 eVJ6nTJ6fajlLcCM2VQqvzAdltm6XaskqLKp/jjw7tDJbBcKoWUW6UumKwETH+EDrCYd4
	 adp4WqzF7bhRVlTXUX7+3W6VwL0GD/AtgT/m/C3s9ikdWCGBV1gohtxd3KVRcL2QsGz21
	 /BTgbkqS9jal5zPEyigqMjRDZEBrBv85s7LYKszWZdiRWUcBo1aVL1RHhjg/pq6Hw4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795840942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YciI8kRUrInY0KCgu42G/I1oiYsRIqMO4kLjHtEDjOA=;
	b=0SExQav7subWb3Dspx4Qwxe2h56cviOjbwHwNuGFeZkKW5DRP4q1YB8G9jWbaakk4fG9
	 JkiVzrRUInR61q9dnJ+wQSmDqWLR7M2s+20RFdYEMgKjyL21vhLAtyVU+yz2V1BZOJJN1
	 tI/+A4CVOnb26kby3Io6l8orGSttDhMvowe2wRWjUrvu1CRVw03nDnCZKE0p69TpdQcVv
	 hzn+msPnIfmxUP8gbIvsnKhU0kheDiH9Iac8PD2EC67sf8cTaRWYngxAXPOvolG/EmJYI
	 h4Sr04qWGEzfZ+6loZYxLF3QTEV75wPJo1zu+zTARguxDUTyT86n7cdz6iannCXpiqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A1X2msCI;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E5C606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E5C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A1X2msCI
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so5616294b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795840940; x=1796445740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YciI8kRUrInY0KCgu42G/I1oiYsRIqMO4kLjHtEDjOA=;
        b=A1X2msCIX4ekoST/dOr/GvrTArKIqLNFbIp+0mmVpt3YJq+SsoykpIYo+MQ4rsFavL
         xTHseXOnzFBfnvcMwbeXauLOQrgTmzguPch1Aunk5VLO7tjsjC8klJ8BcFP2gaCtLXEC
         MVM1aIauNBccrsSIgD7XAT8MmEBXLoXGDnKDqcJxPv0o0ayk25/3NDpPC3vv+Wm6EWJQ
         YN6mG1Seegil542b5Iryt1NP134X41ROhci/81ZlswtLAePAjijlRYKtWzwk8/IBJFwH
         1lBkSV3ams82WrFSfZAcmBS6IkY0Hv56n1/Xf2WJDwyZ/+tcQI8ZGTuxTwR3gEbQY4vz
         L3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795840940; x=1796445740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YciI8kRUrInY0KCgu42G/I1oiYsRIqMO4kLjHtEDjOA=;
        b=chsX0wc9QaZTggcny60xL3KZup79alKsM/ZsgOuPV8N48KU3LAXYXQfHhh0hy90yBI
         DTuoRa+BqZ6gB7hsQfRbWJRBZTMF4CoXcO7bQ1USOBxIwiuSGFuCjVxDlMXinePOSgiE
         MkCayc/mUZdN33ZsZ+zAlA6mLDvn8bnKHLec9mTg7COYqYQ3W48girF+Xf3lLkxmsCuz
         TvwpIG0+YwiaqJa8DSt2oyDc2Y/KG0Z7wbvksPR1R94W2JwsH3BNkCMNKUVQCB+ovjG8
         0xamnhHaoJQ6qEm6CRvuWUz+chqKb+USSBKlh/kUG+WfgYZe319VfOxOy32jfXOFgp/1
         3lzQ==
X-Gm-Message-State: APuU4Z/UqcfsVrKq4yvCQeuMbDiFZOhowyguJWfVRzmx/W3vIOU4vjAs
	Lgm+uCkvo/hPgYv8URLnn5Vh6e0RDNUWd3jyGeZOHo4Y/u+lMlN9LMCUnmZ2qA==
X-Gm-Gg: AZFdTZckmyqxW9AhzeCW2xTUvDtaSSdsHC6X9IvDWBVWCeKWb9v4Fx0CcKwTfvz9DLj
	Er+Eq6CXaKlgdUoI8VzClqViNKjdd5p0xKERUtbSHkgGhSsFMH1JuqS/6cPR70vJ3wDqxc+cpGs
	QSlPvk2R2CVwgVvMmaMW1ISmSmR3AC0MbrGT4NGU5wOfFZCPPQdTq/0UPFApILj/bUg3nt3Jjil
	/dlQdkYPS4kM+YNCc7oJ303YQOfDDvMdD2/52tkOKLJJBW4s1LDXs9tQm07onxlYBBxqJ8O8eBL
	IDS5xfJjbv+QEUy1xKrvUG0caFNQOFuSVPChDmpqJ4dMMvXJvPYwRv4YkXY6O8cxbVOHRQF+8Ax
	dRmsrFSXC4ruutM/GroCFmOx/RS3cdZqTvZKAImArSj01S0oD4bpeGDSdo5u6fJEbCXc6qCZcVV
	HuDPwjmTGqK8Cva+BGhwclt+IOJXzwLDJ39HDm7CAWY2+5z622huGFljHBvcMwYijE0oMk4MjRN
	4w8r4rkFHOIQ2PgcY197aRQVGQ/1je4OZ1lh2xwhtwrOiz+38Jj8DPxr0dNVwestteb7PpNjlMy
	ITeAydTdzNOzR+PIoNmQWP/D2lR/7lV677ZAQLDhQT9kbymtkF4N9jqPnbWuV+Eqp9/EPkborzk
	fbmLMrkvV4pz1Zo7ato94etT0iwvm5cB+Onk6Naq03HmZItnUzfTZIvZuiUxzpGurW5Czy78KpN
	0KKQ==
X-Received: by 2002:a05:6a00:1382:b0:882:7bed:3b3b with SMTP id d2e1a72fcca58-8c87c481e1cmr24791571b3a.36.1795840940447;
        Fri, 27 Nov 2026 20:42:20 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cc4eb26293sm10113797b3a.16.2026.11.27.20.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 20:42:19 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Shawn Guo <shawn.guo@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Grant Likely <grant.likely@secretlab.ca>,
	stable@vger.kernel.org
Subject: [PATCH] misc: sram: do not allow unbinding the device
Date: Fri, 27 Nov 2026 20:42:17 -0800
Message-ID: <20261128044217.723361-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Other drivers allocate from the SRAM pools and map the reserved regions,
with nothing tying their lifetime to the SRAM device. Unbinding it
through sysfs destroys the pools under them: sram_remove() notices and
prints "removed while SRAM allocated", but carries on, and the devm
release of the pool then hits the BUG_ON() in gen_pool_destroy() for
the outstanding allocations.

Seen on an Armada 385 with the CESA crypto engine holding its buffers in
an mmio-sram region:

  # echo f1100000.sa-sram0 > /sys/bus/platform/drivers/sram/unbind
  sram f1100000.sa-sram0: removed while SRAM allocated
  Internal error: Oops - undefined instruction: 0 [#1] SMP ARM

The driver cannot be built as a module, so suppress the bind attributes
and with them the only way to remove it.

Fixes: 4984c6f5e56c ("misc: generic on-chip SRAM allocation driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
An AI coding assistant (Claude Code, Claude Opus 5.5) was used to find
this while reviewing the CESA driver, reproduce it on the board, and
write the patch and its commit message.

 drivers/misc/sram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index c5110c32f661..fed949de60f5 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -450,6 +450,7 @@ static struct platform_driver sram_driver = {
 	.driver = {
 		.name = "sram",
 		.of_match_table = sram_dt_ids,
+		.suppress_bind_attrs = true,
 	},
 	.probe = sram_probe,
 	.remove = sram_remove,

base-commit: 917fcbf033154a6c8d83cfa6c88f012b71eb37b2
-- 
2.56.1

