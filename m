Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798634;
	b=dFlUbWA9I/OE8k+5yzlQunGhzKqxbfGlaJpT8iYrQfoDR3/r7F0t+DlaeclElPPlLo3N
	 vtawaRe6S0UfKft0XryOM9ta186gSi08wIynbUsUKocn96MqMQU0MazXKNk32KzdVwld0
	 gY6hE5P9dyNpHavVUZE7Hh7PsBDjv2MY5MSkwG1UlK9+XPyJzMhPA20SRLPMd63YD9wvj
	 L421aA9UGCbRgYRUKUzm7//n70dHz0xvSKug+NlUayV5pMVcLtBJCQLFIrvfUKd5dCmzr
	 ZjKbROg8OcVRiK6IlC1oxkIvqkwqnoweffBp/n9JLHvrgl8fqgx8z40sVszjo056neQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8DFfV8aBZKMYXzcp6drGNYa5ur5Ni8CtyOsBIJLVXME=;
	b=14lG+pIvoVgvqOPshBZHXZib1mwWq+9KwNhuxRN10oKSHb+ZgUVIk+M12jw5WswVnVFi
	 FxRi1f45vPomZ7F9kalpIh6kgSSxqujFwoBmPW5CKk/K0U6WoB2u2zllOZT8E1VESPeSs
	 ZJ3b3osBwMxD3lfC6u7g86FieDL6GbyVrYOGQE6ylPVQfQn4PhF5Z1k9+Cbo/wpGtCnO2
	 QWCy+7LpkpS8ZUQkbDKNLx4L2tsAwEYJdKJsxJ+tvJxLtleZxGTMMM8kZZSlnUKokttkd
	 9QUjNkO7Uymh56kRG1sPqhp6bVZnJkwhicgX0A2n9DxR8M/loEA/4ZeQ07tCmFXJppA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAjrz9+7;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2BF606A332
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D2BF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAjrz9+7
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c102ad8420so4426363e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798633; x=1796403433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DFfV8aBZKMYXzcp6drGNYa5ur5Ni8CtyOsBIJLVXME=;
        b=jAjrz9+7Cfcz9ViRDJZZK0VgzK7FPMiHo+kgNCzIaaBnxHgfHlkRP+cBKqU2C4+8hP
         u5X209k3/o310sWnaf3VYYrAA2HPOVcY+iyYOUo8WlmSSOitR5l7TpnGm/EqM1RHia6K
         cKxgsR+2NOiIgV80oWzM9iG8KaDKC86Fx6NpxVkDTSlOyZpQbsjA5B3Iz1sgpf/1xaes
         9kz6Y3OXXmlx+lGtSCBu8BXHU/XMpYZTSAwXx26vTthA70IU0yqfz9WwOfNXI7YtoDtJ
         CigILaCPT/olvg7TXvBFMi+Hi0H9VqUWTnJvw6a6GYWGzTs6/3orhnxU3cdXbyLOIZJR
         yD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798633; x=1796403433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8DFfV8aBZKMYXzcp6drGNYa5ur5Ni8CtyOsBIJLVXME=;
        b=yGitZ4bYN+Xsb0NovjH7qGWvxOiFzQYqrzvGTVpVUUpKbaSpowjX9V0+2CW1tvPHLr
         ZklW5YoqDcNM5Ow8PsdZMMOn7P2et51N2OXb8svqpixMIJeQn6tki6GqHHbGF9GOHRjm
         TsK8e4WkkzZ6lqFPIPHR1N1QblPsNIISKkCXhTbtdCDHhAxlQGOd3hvLM6mzmNoK/KrN
         aoZJNI4swMdj1GbjlTpwiZ6aC5dLNT8Q28km49MSn/nQ/dD3T9cH18V3l8R+/IIfIOkX
         auo4qaelWSZp0OMW3UldGMPPTrbusyBx/XiI/3nYOqdn8xGHG+EC5Qauobh1FaaJfFdX
         iSxQ==
X-Forwarded-Encrypted: i=1; AL+hErH6fOOq3YPBgex01roO/h+GBEm04IwMdS4/NealTTRQplpctSekwg6UjWLqBjpepI4zl+t5aIN2H1N3fvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HfxbEwhew67WUZZ63ZHdHqaPPXi3vLwcaoCvGgjG5Yh8QQErx
	Zcb2SH3JMuD38KzGtYSR5D+aboZ2/v+gV9VZikMd2RVsPZqsecaPJBkT
X-Gm-Gg: AZFdTZcseptv45ROfJ/oyKLHj21DicAmyORVA3Ni3YKCS/ndpACYwVERl8q9zPe/0Db
	/g7x66XM0ll6XRCGy7eTzQSWHKFLFHjyMkkOXImGnki1NMKwZECRtsKtjd8Ae2UoukBCDA6DQsT
	h3pNwTKTmeWkyAuXD8QxQZ9oj1whe6xXg3F6c96vTtKN6yVceQwCn7Sv3cl7FI3PwgD2d6KdS9i
	JEMJsAuSXu+6s1fyzrSqnMuDSjoPnQMBuN/qNZWX3+6dxFddRPzYXoHmHb52t6Xe6Q3uebq3kf9
	SPo+HcFjap6hfNI4VOHywpCShTTtyAO+0crNXlonSnH/NddIot9JGtZD9p56A3rkRhfITJpWL66
	dXnh0m+/ExT2G4fg70UT5fPTC+6VWA0jhWctTDC11Cwj+SsVP7LapzYA6ZNL6T9/t7Up+5bhQu1
	A/OUJheNAydxla1h+ikc3W8wFY9VtIQvbGj72UcEUm0+PZn82gGfc3tE0S+Z5MGFqaBw0ZuE4gl
	WlIkX1VF3qNMXxC3C5aTm05u5RaFQ9cVZS2reqkWGwyEVX5hdixev9ONmSfCFickWTai9Rc/OxZ
	rHDlW8kYfv8gyiIdj4zu5EEmf72xQryMrA/2C0bY+4KBjhiW3IjBYa2TxxaQGxe59pTUq/6l4q7
	5aTmxwECVQmJlz/x6
X-Received: by 2002:a05:6512:3e13:b0:5c1:4793:bf31 with SMTP id 2adb3069b0e04-5c1bc8495damr8087724e87.58.1795798632553;
        Fri, 27 Nov 2026 08:57:12 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04096asm6045081e87.47.2026.11.27.08.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:57:11 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	m.szyprowski@samsung.com,
	kuba@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: [PATCH v4 1/2] alpha: parse early parameters before reserving contiguous memory
Date: Fri, 27 Nov 2026 17:55:49 +0100
Message-ID: <20261127165626.1352471-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127165626.1352471-1-linmag7@gmail.com>
References: <20261127165626.1352471-1-linmag7@gmail.com>
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

Run parse_early_param() in setup_arch(), after machine initialization
and before further memory reservations. This lets the subsequent CMA
reservation honor cma= before start_kernel() reaches its normal call.

Initialize jump labels first so early handlers can safely change static
keys. The later jump_label_init() call in start_kernel() is harmless.

The parser uses boot_command_line and guards against repeated calls.
This moves all early parameter handlers, not just the CMA handler.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 9fda01b73b18..f21a7c8f5213 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -26,4 +26,5 @@
 #include <linux/errno.h>
 #include <linux/init.h>
+#include <linux/jump_label.h>
 #include <linux/string.h>
 #include <linux/ioport.h>
@@ -580,4 +581,8 @@ setup_arch(char **cmdline_p)
 		alpha_mv.init_arch();
 
+	/* Early options may change static keys and configure DMA CMA. */
+	jump_label_init();
+	parse_early_param();
+
 	/* Reserve standard resources.  */
 	reserve_std_resources();
-- 
2.43.0

