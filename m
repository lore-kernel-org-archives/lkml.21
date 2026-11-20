Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198593;
	b=wcGa2gUrg/PLdgmIP0zxJh/rNnrygHk5lfdappGGZQ+HT3Y17akB3i76rgo+ZvIhphdn
	 pMS6ffuZ8W45T7whOEGUuSXx7KMG6aXWs9t+INITNF+wIltug/8cpbsT3LSgYp4EfHQOE
	 obxNiltuL6tagr8WkuN0HwRceXBMRCy1x8enjZB92fQCWoudEPawC2Lux9uGmXZmjR20V
	 pX59ItyILscjE9vdIR2STNuKyOns6URp+oHddvU4cUjro+5MjGP6AO3L9CEW21W08mPUu
	 cOJY6/dhfrnM/KNihRCy+TG7dvynEbOA0bAIpYVDMjc9VmHEtVWubyOXKzEvytg+RfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VPm/N53b/qsbfk2FS3qgdrUd59JBO4w9mAZfXy6OFWE=;
	b=GfQ2ndCwPrMIbIEQ3e7dlUy/W8JygY1vVe4NWu7JCy2G2LAEv3XMY981tPYp5ZqRTiuM
	 h/Edu5tojgYPBmLatGSZd3KD7IG13pqHX1vs3rfEr+Aiw0ngt+m6XK+NG1NqocZT8wDrv
	 cXxqmRycMyowvyuVTmtW1K7FOiipDXIq2M8LVGT6R0zj+IOhe3jzO3VvcGcqoboV4Ps/r
	 QDp4NI/43w39C52NW+dlEz1zWjWL7iZ0T57MM8KHKmWQK/Vjo1oWsusUpl2YMKfMfm/LX
	 vj/unrKbR3RVBwPTqL5WanddnzKocZDo9QzqF2Y7bGwe6nCeNQzp1ZB8d3A1Pdzx5yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zMF0mnSa;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2C5606B212
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B2C5606B212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zMF0mnSa
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so2976136eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795198592; x=1795803392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPm/N53b/qsbfk2FS3qgdrUd59JBO4w9mAZfXy6OFWE=;
        b=zMF0mnSagPg68nJVvEx32vA3DRPcme38H8XiAufn3nU/0OdEoQFLbj/KxaBUDtmP95
         hOsx3KX8wWr0X1vMjVxUOaINwEzunhzSuXCYXDpEcpMvFSmL6GI7WU01M/cuF4FKJGxM
         TGOop0u1ig8o5jzHW1m7IHMOaNICnef3MamRaBPxYYE4mweLQCY3QqZ1aFsjPT/MsVJc
         KPYHuRi5WC4FpJors/lirWwi6+D3oLnLiHiWkkziW/pc6mN885FygKl6dbQ+AgDj1FUj
         irefs2Wmwq1HEVbFieHpywKGD/iLprojIB8Erk1zsNnhL8+sSvAxiNyLekWOb62BbWAv
         Gwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198592; x=1795803392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPm/N53b/qsbfk2FS3qgdrUd59JBO4w9mAZfXy6OFWE=;
        b=utT8jlalFufvIts1nhkQWrqpaGoTAep+6kO3SOvOVdqOSyZMJ96QBtBhKjSfvxKO+5
         GOQmZKJWegiEkFLsWVVta5pDVYSx4nbNWDY8qk4hz4Z1U6H8oJbcFEYzty9Iazufw+Nq
         QALJGaz/JhKL9ts6eZvsrtLtmW8hNW5lflFUfnxirJ6AXdL2cPc3mcbffQv2bOB1FzNO
         6nKkramsR/uRnkn0ayrDJ/Ig8RT90JHVKKHGqmZtD/03mn8jAClF0G1TCo0ZI8QpWEJQ
         lWXhVyZbezpT7wBHFN7z7xvyXql/QLSRPUK0SRqUwZUA+y675Hs8oSCYgW52SfGU6SIL
         bH4Q==
X-Forwarded-Encrypted: i=1; AL+hErGwr6KDspL7+q7CMXLVTDcRLgR/OAunCF8vD5694UJWUJf27j7J4RMNzjZtGixbqrvCCxb/g5OlZoJ+q3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tgen2diZ10gG01pE42ClGcSika9F+Wqx0Bg0Xl7lW2K4CvRXE
	iTRUH1YGM/+cWw/rgFk292b07/xmiJlMyNtK8bBbZXa0rT9X7x5+dKyn
X-Gm-Gg: AZFdTZchtq6MI0fuyYgtL7hwf9v5KLm4yE21BWilJYJ/V9gLbpzgnRDN0VeE9jBl1Fo
	EwccnACXMar9yR1jKgpSe/e9qxQA43xw9sjzQCr7n+MVFD8dJzoe8lxfJuHeyUn29ZUU4/nMKA9
	+6nQ4607tpxwYIuIIVzbKns7fhkoBbdnFar+EwntWO3CsSNBJzhsj8CbeEJq50aL7TaIEejKqRk
	/J3J8xq96pW526SV7sWFwYODpfPxM0oz0C7OZdsbm7z1WkDeGLkYtpSQXg+9hcvJ/U/vcqqq55R
	IzDh+XoY+lrwc8fu2sHxazAy/UFLOM0jR8sgnKPcTDeAm6VjsUZrfAm+aYJFL6DZPYMZz3XoWBQ
	+p+byT5jNO9NbL3OQS8Fl3yQzBYP71LADdWNVCvB5ZBBuhecHqHcXs7hAsepW+O0aEaSHD2rWxa
	ZD4CCA8U54pC5NtA5yR/O5HJx3pZYGEDI5ZprRL14FHh/R7pR3kObd8y+RGzma2ZBMXFaNYKL6L
	PxeN2HarUl7HM3K3VAN+7uDqmWPpZhXdqeYK6WQeKiiE22rXJ1tcpgPZRfJlaAE5+vKb149aoYb
	cgueXDUtrwO89oLggohYh5JQIjuHmszf30+XHme9X/lIRVtIOjSj42UrfN9lMW9uwa8t8dficQ=
	=
X-Received: by 2002:a05:7301:6405:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-3856ff54addmr3982441eec.33.1795198592317;
        Fri, 20 Nov 2026 10:16:32 -0800 (PST)
Received: from sumeet-VirtualBox ([58.84.61.133])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm9736610eec.23.2026.11.20.10.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:16:31 -0800 (PST)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com
Cc: lukasz.luba@arm.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH] thermal/debugfs: Fix truncated cooling state transitions
Date: Fri, 20 Nov 2026 23:46:20 +0530
Message-ID: <20261120181620.12648-1-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.53.0
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

cdev_tt_seq_show() can truncate cooling device transition labels
in the trans_table debugfs output. The largest packed label,
"65535->65535" needs 13 bytes including the terminator. A W=1
build exposes this problem as a format-truncation error.

The buffer was sized for an assumed maximum cooling state of 1024,
but the transition identifier reserves 16 bits for each state and
does not enforce that assumption. The signed identifier was also
shifted directly, which can sign-extend the upper state when bit
number 31 is set.

Decode the packed identifier through a u32 and size the buffer
from the largest representable transition string. This prevents
truncation and prints both state fields as unsigned values.

Issue reproduced and verified with a W=1 build.

Fixes: 755113d76786 ("thermal/debugfs: Add thermal cooling device debugfs information")

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/thermal/thermal_debugfs.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/thermal_debugfs.c b/drivers/thermal/thermal_debugfs.c
index da02d8f179b0..107569d12965 100644
--- a/drivers/thermal/thermal_debugfs.c
+++ b/drivers/thermal/thermal_debugfs.c
@@ -322,14 +322,11 @@ static int cdev_tt_seq_show(struct seq_file *s, void *v)
 		seq_puts(s, "Transition\tOccurrences\n");
 
 	list_for_each_entry(entry, &transitions[i], node) {
-		/*
-		 * Assuming maximum cdev states is 1024, the longer
-		 * string for a transition would be "1024->1024\0"
-		 */
-		char buffer[11];
+		u32 transition = entry->id;
+		char buffer[sizeof("65535->65535")];
 
-		snprintf(buffer, ARRAY_SIZE(buffer), "%d->%d",
-			 entry->id >> 16, entry->id & 0xFFFF);
+		snprintf(buffer, sizeof(buffer), "%u->%u",
+			 transition >> 16, transition & 0xffff);
 
 		seq_printf(s, "%-10s\t%-10llu\n", buffer, entry->count);
 	}
-- 
2.53.0

