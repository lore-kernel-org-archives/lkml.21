Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759983;
	b=QDxAUC+LL+RYR0LHOIS/mgh9e8tGImEh7PDUIdPKJ/rTNVuKXJVxNXCi5byQ98l7vqBt
	 hsBIpaHN31GSC0J+DC1jYr4nnOHzrMes6lr2hOpv4b/CwgkDmP/hNtQpa0cf9ppm+sZqT
	 Tf1yFzlNeNRoM0ZLJQM4a8GbKSmnIWxEtpipIVi36AnecK9Qe2NwNuPvHhSE3pzCIAIUN
	 fDmyOnLBjOoj+OHWKoM00q+e2unH0OzZHlNIn7GMoIBq2SJRhcO+0Yrm7uqMKSTy6vJ+S
	 sGA2sHKE7hvTsYaeSieJVe6HHQKpOXqzRJsnZAlOey7S3JyOQA6kRUguNWh+LC+Pbbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
	b=JmHW/wJxBMYwCVI1/jjONq3T8xmlQelETUl1OGtCrHlgTpVpjl/fMS7nEIL3BQV1PiJ/
	 D2slrzDiRZTv/lgt5IaTIxxKXDQljRz0BQBJqFVSjlmxRx2nT5vFL+rtp3kygEUNJjeS0
	 dESF22pUtlNOdy3hugIprXd2Wd8ly/HXhNu/6B4icTDxjL+FTV905uAIRekuj3b9c4+GN
	 smtHkY6VNfJssgj54T34OcIoskll+taN4bWJgrlGNOlM4sUG1Fx7mnhfPOMYEHKm2M7M2
	 5CSutn8uRtIKYjl5lVA5Q7PWO9WPPYrZRuZvL2wo0POE93fKH1K6rPbH8mj7GU1f4pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4EI82nF;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A3606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 123A3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4EI82nF
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3866a784546so10595707eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759982; x=1796364782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
        b=g4EI82nF7Nloy8AYW+a/hEg1Vp9CiPUs78opiAEqztAWGt+rnfZGYefHRuK/3P3MIb
         u0FtuGU3ck2AoKHcWINsJZ0/xFyfLdRcpFAPIUXBaFduy1J+aLnZqWzVSYjxIw1IVLpU
         PkjOycV+9mLS5yKR7wrXBTc+uFeWbTfsfES7CAiU3vT0rYcm2N4UMQ1m7goBn/jOf3pb
         l3cSpqsw//tJS0gvI1snGWfBdBpmrWTvzhfms0icTgDhNiMfWBCafA/vQLk1QaWwhETM
         URt1FZF08BON6/v0tw6+d9kB6DkrZXgcVrK3HDZ7x6aVZR1y+QMV+ZA/LKjcYjj4WnUG
         h0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759982; x=1796364782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
        b=HnZCOnqvafXaS4Y290Puj9y+6ArpxrmW0mxBEHUnWNjCK1Szyqd5b6+3TylBsYwuNt
         NT+8oYCmy/8vGgxz1ohf0qSZQHt7RZWjVwASplDKXGzOxrmRI+dWmgo61dshHnPNNJYG
         ECSU5K89L35XzrstUFU9mbdt+FijSpL7CmsTQrhEKyUtuM4E1oblyPQjau0jWcWu65UU
         A4eRdy3GiJau0ddfxPyppdJ7VJ10VcJIwdoI+Jy6wmTtNV8I22kYnidvhN+HqgoMBcnM
         yZuFIDhyoZUNMYJHbaRWjbRrlm1JrJ86K86/GNIMIRSpS672B6X0Tq27A7/7eludYsDt
         cSEQ==
X-Forwarded-Encrypted: i=1; AL+hErFbZij+1iac4xkDwWFaeRE9hFc1V0+jHxRYxjZRavaT0F/E1jSn8UmnlxZeUDZErr8pHIezPBlYR50z/5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WeE+nl2NvozFhtqu9ahTurx/jRUKbsSwK8bW+tWkdx6+fQMS8
	deZVesO3+QjW9EfIC3yKfiHK4p76KMUmoFDe2dmn8mTL8kqoFM7yQfQ8Vd7dRux5F74=
X-Gm-Gg: AZFdTZdH2AoO2AOe+2HQk/IjBcbDMmmEk9WcCN+tJmNg/pqxMnKnr5PHtvby4te6olx
	7NkjHIwrvihLaMHQc+KRs7+sEHt+j1479xeujBeU9gdkYhZsp2TwZNuPRi1YqC4yHGh8uJhBBab
	639/pGxiKG+MBhhn5Esk1MaAzQx0C06yJSj4KLOJJzqPUouhirZRpx+JafXQtEVwXnEbjXX9tZP
	DNxJQw8eSSsuSflxFo1dW5FduDinVjlcTU9XtgvHVZ3XmZzP6EcaoN38A5LH9SmzpGV7lA3IdwD
	uHqO5PGdutrl4W648l3zwwuhpbchu8rYEViCx2YOL0+MgDuJyh5D3QXGQjOzd5weVr0DprsAAxV
	Pkf+8wl6hqFdsMq+dQeYJ8jJ4Zl/USLyM29tPs6ahtQU8fsd50bQy19Fc1cRS1AO3iVeGlJkFWJ
	PBDwrGcf62wx4jAL5EGP92gv3z/pKoeiHaqZWQ0E7WTl1OIQjzpJ0o0LO2/b0qGNgFMTKNK1pa5
	stc9NWoOT8BpqDpQOMFd/AcvI00E+tE/JoyES+HHIjI2VF3ZbknBv1YLzM8Pp05yVl69PUeWYrr
	Kbugm0kMk5JKGbRnlMhob+wBtdMquvdVNiUAT6xt+gpgNGv+elcHF74fVsCoY6Sd1K3gtlePKe4
	9ti5jIHPxsOpFtq4=
X-Received: by 2002:a05:7300:1c17:b0:386:a105:fa66 with SMTP id 5a478bee46e88-386a105fd17mr17976279eec.7.1795759982150;
        Thu, 26 Nov 2026 22:13:02 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:01 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 02/11] wifi: brcm80211: move d11.h to the shared include directory
Date: Fri, 27 Nov 2026 14:11:32 +0800
Message-ID: <20261127061147.506129-3-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
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

Move the header to brcm80211/include, where the other hardware
definitions shared between the brcm80211 drivers live, and include it
as <d11.h> in brcmsmac.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c  | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c          | 2 +-
 .../net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h (100%)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index c1a2318d7e..eeae85cae0 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
@@ -28,7 +28,7 @@
 #include <net/mac80211.h>
 #include <defs.h>
 #include "phy/phy_int.h"
-#include "d11.h"
+#include <d11.h>
 #include "channel.h"
 #include "scb.h"
 #include "pub.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 9cb09c8a13..d81de701a3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -21,7 +21,7 @@
 
 #include <brcmu_utils.h>
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "scb.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 0a0c0ad4f9..6841bc0052 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -17,7 +17,7 @@
 #include <brcmu_wifi.h>
 #include <brcmu_utils.h>
 
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "rate.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index 2b10fd5427..e178b1a0e2 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -18,7 +18,7 @@
 #define _BRCM_RATE_H_
 
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "phy_hal.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
index 79d4a7a4da..6e92dc4c90 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
@@ -17,7 +17,7 @@
 #include <net/mac80211.h>
 
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "rate.h"
 #include "phy/phy_hal.h"
 #include "channel.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h b/drivers/net/wireless/broadcom/brcm80211/include/d11.h
similarity index 100%
rename from drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h
rename to drivers/net/wireless/broadcom/brcm80211/include/d11.h
-- 
2.53.0

