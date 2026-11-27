Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753969;
	b=w9zb3gJiedVsqFkII7RxyQqrsXL0aympGGS1ZxfAKwqaewSNYjLma7i3RQowmxXtHlE+
	 oL6ng43o6qbeIfm2ITEUn65g5gUyaaIcU6ItRU+PoEaY2Bswf1+trrFOU6HUH8k+YLnb7
	 JZzqjdQPtXt8t841S8QPYX+Uvqx3J7s+VQMroT8xPZ9v0K1IMs1Ik1oM4D3CrJlnccoe3
	 /cZcqNXmYlXyX2axfGDnSQKL0/WJWqn78+UFlK+a53wcumKyerfutjqVUPS3KU4MezTEp
	 GtykTs7VeQZ3r6E8oRmpg5gKY46+1c2RiTRCFCeDAMamocUuUH9RJ2HHt4B278waMaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mkWAaJcKCZd7YWMW2TW7OYqNZMDoM5K/uLexjGADDQQ=;
	b=DlbLfXbkluxUQy7SWaTSSC6dFDhA++QuuN95ZuMKi/Qfz+Xp/mAcdDbFC5u9+Gy6b3mX
	 Mjwmc3BmBC6xqzAVEPjVW0cnA3VC8joYkd5tytfruaZ7CECCfl8iOHaibq1vLn3Re4ujs
	 tU4c4km0riUrPI1mkHPdGtD8SsnQOuJmLZ6Y1bUQi2R5FCTfFFGdi8nvY7lD60QfBIcP5
	 zl7PoslFtUxRXXedV2DXVxEi+60VeHHvvrPiJTvr50/diVL0sYcA1TucPtMrbnjZVR07F
	 /acsxwydwgnth37hT7J3f/e8F6M+Z/1k42pN4WJjtYlCdF4BTEYPRc9CJpEWbgUA+VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kI0W7gfy;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947A8606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 947A8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kI0W7gfy
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8d2d4cdb478so81112b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753968; x=1796358768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mkWAaJcKCZd7YWMW2TW7OYqNZMDoM5K/uLexjGADDQQ=;
        b=kI0W7gfy3Y0O9M9HqdiPktoDJsPo3hxPLOwvK9cg+/7CmcjvqYX0tT9mpqZIKBvpaC
         ZNpCYM4qxSd0WXKQOjbP7CF6XlJnrG/K2IY0B/JWwKcvY4jSy+NymIEa73Np+JLz5Ygb
         z5DpxtQrz4O97wRf/lldiA8ImvQBLn1SoH30DiLsP97FCYooWJEfTmw7NRone9hLIEfZ
         pIemgU55S7exfMOCo9Z0A9Xq27mdCXn/jK7WkR6Zrnuz3bIHLMuNoyF1cEmH+jiYd8Bb
         R9hIgdYRO5id927yfJajVmWQf5U9Bj5JoQfUW9PM+qpGhuETFpsIt+Wv1H05OISPpQLm
         7dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753968; x=1796358768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkWAaJcKCZd7YWMW2TW7OYqNZMDoM5K/uLexjGADDQQ=;
        b=cRtVfdiDnb4ind2H1eicMf0MaFpFJhciHn2NaD83/OldBN7RAhOYEgqKbJaPW1sFqG
         oKYLNHXFigM5m1b8IRqDQZ6oLwhWByHYLGO1qSAroHI0+uLOLVAA7R23LnYp1kcK6YSB
         Pb35b/fQxDefvKg5uDvDjmvcQg0TuAAlzXXXODG18Q94410WwDNEPX40quIC9SY15sfE
         B5msotqCM6zPVQNSG0qvKc0CYlX1zm6VUx5PIaUTcwdMxMQrzt7qIPt9oCTe4Yoe1PQJ
         CLPFlZB657EgFK8h8czui5EnozzmfgEhqI+Zy+YYyPkiLwGi5ebgs0NXXXYoNS9weu3L
         1edA==
X-Forwarded-Encrypted: i=1; AL+hErEMbq2i2MfW9xyM1NnAXIYFkW7DNZUQuWg/9iJX5hkBrNdD7zVOmhjEzzAtES23m2RlBV2R1SBqz2Uy67Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uShzMBExUlnS+sshCFa0vHjrWKGAue1vPLXumZrCBpxttQ47/
	/O9542yxclScCotTEcsRGA2pWUMuV664MvZSuol9bR/MIRN5Ljvkb1mL
X-Gm-Gg: AZFdTZcOlQrvGX6V+l3GwYU4ecIJo5p6jQRseYBh6NuoA2LXucZNB2fumWIR/khBO5O
	5rrltBzTN6KdsDX1v1AIUSy29shpZ1iaKrYSxuHtuf5IbUh6+tRBQ2atzxzPDIzptWDCwBz2DW3
	84vYRaIABcOiaGRExR/ftzPX2Wk3yGdKB6wnGxbgsKu+xHKjVG2Ddg+h5AqeQI4SrgjBkIEm+59
	RP1dEM4J2rQeMNknmB/lJvsV50C7gZuw6ONzVwGynTpFsXOWrKDLoAZM3B33s8A3UgXn7oakn4v
	qJbwL1fmrdWUlF4tLwYnxcA4sksfKcTqnel9VEMDNhFdLaTNaopXmHYO4wrwCFfOIAFpj+VPDF9
	eciLXh/QsUE6G+vrz2yTaKb66Wn+C9LYcwyLSOnZ6v9KCE70jFlCHMc7M9Rmio6YHHzdCgONSpq
	DzTfkAxtINDC42q/kAdYUr3ljW98LWn2f6qS3RxnHDrZmWzHZsWEVyZEPL+P+ytWq0XQgDtfQ8e
	MZmIvFmNW+gElE9trg2pvfbo7GlrFIyGGGwltyn2f/0ofBtHixND15SDLyebGWpGlj9ap2wlwFa
	6eyZZJ6M89XgZwcI6t3kKiCSValcEYkXJKNKOtOeZXHFHzpJmg==
X-Received: by 2002:a05:6300:670e:b0:3e1:dc9a:56cb with SMTP id adf61e73a8af0-4014d254816mr23219180637.17.1795753967872;
        Thu, 26 Nov 2026 20:32:47 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm11468690b3a.26.2026.11.26.20.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:32:47 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 1/2] platform/x86: intel_ips: remove trailing whitespace
Date: Thu, 26 Nov 2026 22:32:44 -0600
Message-ID: <20261127043245.132189-1-artem122novak@gmail.com>
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

Remove the trailing whitespace from the comment in
update_turbo_limits().

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/platform/x86/intel_ips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 636f4511127f..c7a4e1cedbab 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -707,7 +707,7 @@ static void update_turbo_limits(struct ips_driver *ips)
 	u32 hts = thm_readl(THM_HTS);
 
 	ips->cpu_turbo_enabled = !(hts & HTS_PCTD_DIS);
-	/* 
+	/*
 	 * Disable turbo for now, until we can figure out why the power figures
 	 * are wrong
 	 */
-- 
2.56.1

