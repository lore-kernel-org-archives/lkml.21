Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591991;
	b=dohDKsZwxyP4+vemS2L3KrhDYkgLcqduJAtwHN6Gd29gAXVtrosIZuS9D24UpwTH7N0I
	 0acz2mME8pSB8DAvg8NULVslq8r9Cua9bxEBXNUy0bmBGcQgYX5kPGoEwYD3nEo5buiyi
	 NELxnkG2LjMH79YxcmXIGT2P/7NZfQZxbC5MUZUIRRfyr1cKYuvcGnGqi8IRI7Y8/zcD+
	 BUIItxVGwmpABmbf88cHnp/T64h6kxfSOmKISTYUk5mM5PjUEobIwjGVk9Me8u1LV8IFC
	 iNR3Kke21AM5wOFznGsCVzQ9yE7nfTcavwF7kiMCbu2ADSJlGI4l426f3ibq++WKTLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LY9PIL87+p647dH24UAXYUoRiDEKyNrn4zGa9K6gDcM=;
	b=uhS04mgjzzjWEtt+NJYC8C+ROege7IXAILdL3QPdxwIc1oq9eOnfkRaA7qE9VXRBj8+l
	 xw3DMJ5bgcuuUehUq7RVajRfZP7zX4fUIvKDNVxmoSVidY6POvAlACIdBBAOVQluSL5v8
	 CjnDwWxP2pBbNOE11/VI5szgI0u9qVp8a5nSwQJFme2C1imtLzwxTHubegaMmRvF0GS6b
	 lHxx+yXFxDnW1Jg5g6Nic3w7QjW/nB9/TesBoCpIn5V1+6TojGZ6WIP6+m/haVSQX4Kyh
	 g7VWaRjNfYzQ2A9OiJqVar75pWlqb5YqVY6we2CvfxOmVS4rEC9uEg1KEVbWC+3x8ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUHeKRSb;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A11606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A11606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUHeKRSb
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386c336eab8so1799825eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591990; x=1796196790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LY9PIL87+p647dH24UAXYUoRiDEKyNrn4zGa9K6gDcM=;
        b=rUHeKRSb4wtr1LFUAu6mYK/iO9og9xSu8Cy75l7lBIhBgreIzjgAMHY+KcYT43wwia
         r7RmcjGnhR/cFImCmA0dl0BsCw8QmzUBe4syhXvALpiiupQjmzf2pq/NvB9/OrFwV93x
         XTkicsOjVZxa7vxFTLb2uyrA2uCGyhXb8c7sU3laEQv8H4ulm+EWMzArxtACYq7r8d+q
         VWX0I4knzqhr7IWTbpJ6w0gxcsl8yt6/Q1P/D2jBfaXLIKmbN80gPRRgwrvnOAeJrRb+
         xIeORNkknNy+LRczGEabzZmyxYXvTQv9FE0RxnZu5+dfUyCV4YsJbSOvgjo+HImnhAnV
         +M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591990; x=1796196790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LY9PIL87+p647dH24UAXYUoRiDEKyNrn4zGa9K6gDcM=;
        b=Cw4dthrGctgdsFbrphd+LJ14fu1Lp9W3SWjYk271CRn7f/PXbOsEInklzm3f/gveSl
         wz4jFHVlEnJ+gL2PIXWFRTp9FxhOnj9UUSZICGGH5IgwkLJpClhGvQEkzWjcYJIYx+03
         oUC/HoMtGsd0+jD4ry20Fs/9qVR2HJ8na8PmJFIlLJCtM7916od5GZ9J0ZhzcLQYY3HW
         sX6PdpCsoidJxpPbDuR4ZGyirdvhVcFGPSnoyZCOXH2snswsOq6RB6gTj97ClweN24qj
         XLqOSo00uM3hFgia9XUrLypFizY1ETeOS/aOjRL+IwDdwr6OIffGJ/b4NwBXGTkDRBMZ
         DXxw==
X-Gm-Message-State: APuU4Z+Wg4noym2kbYUEkdLhNlX5RiE11srrjc4x/g6lq78nhoxl+WC7
	WQGi2++ldj0BpmQOjzWRhHeRQocK+DHAWt2wdiBRhaCjolgsZhfecu61
X-Gm-Gg: AZFdTZd8Ro9PLoP6y+g7p0UvWhxk4brt4bXAhOyjHprLnmDEtDjUPx3A8bUKdSlB29Y
	xkRQi+cOriUMuUngjPG1MYA2t+lk6Nr39ExYb0yhoRAIUyt9sAJZ0LGb7KCe0kM0WZIidf4ncat
	XY/oPykhThZHU+zqfjSV0GCcbZslAL02HnCT67cHEHyb5fpvzEIiYLS2KjBgtXq7AyHjIbQh5R8
	BrijXxkL1NwJS2e5E8GIeH7AB4V6YldbBslCYZmYy0/JOb7GNYj7WevG8ztb0RHde4bHxBzO1ik
	DJDtU5o8pCf57wmAaTZAzCJY11lSXCJYj0dgWjg8C6CEWr2KWsjW3WAFIRA0Nfx5wHI0ZOfDBkP
	UwOmMLQd7chsVqC6fi0EeK/PqsQOSnvLrZRGAXm2Xug0h5kHNKrbfydQEm8s9ALG2H7UNdzf3cv
	MwH4JHx6+G2bKLIJkosnjU3zTj0pzyMGldISjXfWydNqlQtd0qPOn3JcWh6j6xTiEuQIz72Bx/p
	CXOUJ9axncDvkzlLLQsl+WwUrkg0jzWeKt9ZAa/Nqjm2OMpYJv2YmvPoCt0a2MLdWuYL+ntAotM
	FzPrprDj8GAD7V4jvy/Gu/yrWpfGCVJy9SFzCxM89Gm9jVVzctRn
X-Received: by 2002:a05:7022:b056:20b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1b5568eb4acmr18251286c88.12.1795591989931;
        Tue, 24 Nov 2026 23:33:09 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.105])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm45906027c88.5.2026.11.24.23.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:33:09 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: Fix dynamic major number assignment
Date: Wed, 25 Nov 2026 07:30:09 +0000
Message-ID: <20261125073009.3091-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

When major is set to 0, register_chrdev() allocates
a major number and returns it.

Store the allocated major number and update snd_major
after successful registration.

This ensures ALSA uses the correct major number for
device registration and unregistration.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/sound.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index 24f40763a20c..eaead62cf814 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -396,7 +396,6 @@ static int __init alsa_sound_init(void)
 {
 	int err;
 
-	snd_major = major;
 	snd_ecards_limit = cards_limit;
 
 	err = register_chrdev(major, "alsa", &snd_fops);
@@ -405,6 +404,10 @@ static int __init alsa_sound_init(void)
 		return err;
 	}
 
+	if (major == 0)
+		major = err;
+	snd_major = major;
+
 	err = snd_info_init();
 	if (err < 0) {
 		unregister_chrdev(major, "alsa");
-- 
2.55.0

