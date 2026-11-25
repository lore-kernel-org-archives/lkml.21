Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625741;
	b=lnBUslBYgIM/2NBpENczp+AkYQ+TKhnx3vW1bt81O271F1xnX1BULC/H5XU1qURm1KAR
	 JI9WNYvm3Q8fBpuX3QuHzHh/2IWHK8dcOvsFT5GKxgRGZuCqPdcLNHPBvtxXd9K014x95
	 iND174ZBojixNiOTvuM7yDclGLgEIKkRWYBtDMY/saDArvF9i1SuB40qYC6ekXeew3uOv
	 nPqq61pL83Wlkg87HVAFB030yktzif7aTeqZrV7gskVnWmb0ZEJGmFn8BnsXupJRIRvHa
	 zJUy9L14U8kpjDz3aINQJXZsWWNllAPZ7cRYGNLbcQdIJcwM/oi0Yn9zUahxiBOdqSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QjYkjPPHfQVUwaQ5dEuT5Luo4ZATk/cbnCMkj82XflI=;
	b=MjKGlAtjCX/sd4StY/qHY4m/JdnIJufpscqxDUbQboMWZkEZD3Gy7WV0IEM9anFBYHVr
	 XeLSzARAg8hanL9PUnj0DWJw9wbDsaLlmoXi05+Zjp0Vp5Ci/dLyIRTeX8yYIh/pstxfB
	 MkKTf8G2Mngsr+otueM+TyZE6FGxuHfVXAnkBErM78zsN2y/x03CSXpfYwu07vy53bqU6
	 OKE0+XXLVj2yXNdXc/FkCwse59Es5AwzCKZjdXaydOUNfM5nTwqMrbQRJ+swQ/rR8Eybf
	 iZiw2AqC5TF3jFHg21jjCZdz1p2HizuHGM8zmIOZRBHZdT8GH/1/byvWWNDc1o4SV6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=omZc+7Oe;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B37606A690
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B37606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=omZc+7Oe
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b360828905so55898587b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625740; x=1796230540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjYkjPPHfQVUwaQ5dEuT5Luo4ZATk/cbnCMkj82XflI=;
        b=omZc+7Oe0bKJrLjQ/e+T7DDbb/AoZ76rD0F19yv3PM/Ril4CA1T5xCEAO0f4fR3IZd
         dCBm3rPWPTjEKOyS5YXnMuzLFtiJZyg/Bxy/ag+qnKqgUKPHPoIyZD3LDSH5uECU66HP
         5Muy3o9fY9JRx80ev8UejrVo4VLW0TPE/DEQ0qcUB2hCaL6xtKQgDYfkZ9ehELJUrutx
         eKgEe6uqrYly07d6r92GxZy87p9WuP9gmPrIn1hGMofe3Od7pOQCeIya9ShHcDbjBBpM
         wbDq80lXTRUMo1rReFeJlxaogSVfEsh55qBU2EdoCvgjv9KD0D7JNiti1RNikHuXP4Ov
         /QPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625740; x=1796230540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjYkjPPHfQVUwaQ5dEuT5Luo4ZATk/cbnCMkj82XflI=;
        b=UUXdZ53pM/XqUR1c1eYgzR/+l+AsZoShbkbmUaFTUAEf9nmeB/YhXjJBCCW/jaWC7Y
         upqQBve6QE8q5On7Q1z3eo6IgIePD6D3PQMFHEquaI8LN91zQ11eXDaNn3z8a9nrERwp
         YOIGlRhnLjCO1E3E1xNvGfC1kE00vxffhfgmVsI/CBK71ngHEgfitoF47WghimRSsxVG
         vylQlkbpM8BzCWld+PU/qtfagFUacCnzicDPdShPjX6XLwNOLgynSFBgLps4VYXvrA/3
         S07lEVv+T7rhgJEfA2fbygQi0XhzpZnK+etu05HpwmxyDD5MrBRqP5RABTHWHsorPqOo
         6NEw==
X-Gm-Message-State: APuU4Z9D3O8Y0OWrPJmTdBhlzV9UdMTUGZFQyDNq0gL2viHLj1ejof+J
	D439cszqm26aKs4iZu2DJwm8Rdu3/ko5oZMd77guaNUyF/XGU7U4OyQ=
X-Gm-Gg: AZFdTZcB2EJ4RkbK5NnL1TUNjGc9d+37tfw8hecTJcE8f8EIEzZy/jNxZi4temnd4XY
	1b1b5bNB6MD76K/M6NrQAWVqvkXEVOjj6UF6BAof/TteBeOLiGMGKTa3Q7rCb29WtaO8p9yfk/Q
	JE3AqLtjeiUKLZ+k6FtZ4liiKeBu+eJYU+s7kBy1CY9QRtLVkCg+Ij5TIT5uyKxScOQYM+tbHDh
	QKXqfrzNo35QAQBaP12aOE2KNfh2vb20YC/pjsooFfa3K9Lj8J0q/sbKTr+7YPYK7UzF8vR2b/N
	8gxd3jfiLWxqv6P2aZO6OuVb6NtIBQxjThW9Ea2s9+Ba9c0cdBVXeOC1U88kfWmXNHtFnFdveJk
	drrtcj0MXiDYJmzOT19fCfmbJfpxv4WzNtLf70nYzBSqbzxYzuHvu1n2Qacy/yX+7xQn/o40Zxq
	+6tYgVpjvn+lgrDwDqyXAbriRCjoAjRALRUjszg5HbzbRhdcNh3zlbAIOCQw/oUTuxiek6E8bxm
	uzWd0gzQrXl9FSisvVCJSIkkWpYtRQ6M5lVuFqcvkJuNm8HnvVKDslRHVTcZQHbQgRbrEREknyf
	I2swdlgUAQo0NX6fCjSo9/h76Hq66M7JvWk3
X-Received: by 2002:a05:690c:9c02:b0:8b4:d584:6178 with SMTP id 00721157ae682-8b5204b2f94mr73504307b3.63.1795625740034;
        Wed, 25 Nov 2026 08:55:40 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bf474sm74766167b3.21.2026.11.25.08.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:55:39 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] MAINTAINERS: Move TASK DELAY MONITORING TOOLS entry to sorted position
Date: Wed, 25 Nov 2026 10:55:33 -0600
Message-ID: <20261125165536.792563-7-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125165536.792563-1-svav2021@gmail.com>
References: <20261125165536.792563-1-svav2021@gmail.com>
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

The TASK DELAY MONITORING TOOLS entry is out of alphabetical order. Move
it between SYSTEM76 ACPI DRIVER and TASKSTATS STATISTICS INTERFACE.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2468dde0d754..c48179f973b06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21934,16 +21934,6 @@ S:	Maintained
 F:	include/linux/delayacct.h
 F:	kernel/delayacct.c
 
-TASK DELAY MONITORING TOOLS
-M:	Andrew Morton <akpm@linux-foundation.org>
-M:	Wang Yaxin <wang.yaxin@zte.com.cn>
-M:	Fan Yu <fan.yu9@zte.com.cn>
-L:	linux-kernel@vger.kernel.org
-S:	Maintained
-F:	Documentation/accounting/delay-accounting.rst
-F:	tools/accounting/delaytop.c
-F:	tools/accounting/getdelays.c
-
 PERFORMANCE EVENTS SUBSYSTEM
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Ingo Molnar <mingo@redhat.com>
@@ -27384,6 +27374,16 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/system76_acpi.c
 
+TASK DELAY MONITORING TOOLS
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	Wang Yaxin <wang.yaxin@zte.com.cn>
+M:	Fan Yu <fan.yu9@zte.com.cn>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/accounting/delay-accounting.rst
+F:	tools/accounting/delaytop.c
+F:	tools/accounting/getdelays.c
+
 TASKSTATS STATISTICS INTERFACE
 M:	Balbir Singh <bsingharora@gmail.com>
 S:	Maintained
-- 
2.47.3

