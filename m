Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219791;
	b=oHOomXvqYlFRjb/WAJQLCbgLjjtX+kIdc/hH2fU5N6xPkh3w7KU+Yk1bTlnVV9DD5f8p
	 VKiCGdvO9AooqQtReGy9fy/cmpl/8eLqqbkvndAaGW5hjM+J20qatCmYBqckbqyhL1Spm
	 sRw27GbDf6gs7i/sUyWbieonunkpvf73WR5dfyaPyEL9Vu0+US4Zjbz4ZYN2GzT6ZzT0l
	 nUlZhKeoIwmB9QH9uki1D5cAuUom7u0d3lnjMFcSnA+7EIWfBgfVM8KJ+XFrswmkVWTrC
	 8US3FYGXY1qB/Di0DQ3SqE82+er0ZIuP5UVSTffFZSwxk4Zty0QEEBx+Cj3jh74qrsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UgYq7nK5M7zEdKPjaX3cHEhvCzK+3haVH16deXhSDxM=;
	b=mueCwGVx56f6r/6EahY15e8PIL7m94ZAUGNoUPiVT/F1vCDifRC+P1CFC7rcK7xmblYA
	 jESZq5L9PaeOFsqPHnOOkNd/CY6dO5lKsL7H02/mdxJwwkq2hoJeUEmAvnHjU5NVII04r
	 79E1XbNjKPOY4omc7U87ZRhlh+bWp0UrAp/ErjENfkS7wFbUO6M2rjSjRX2Y5mABgIOs2
	 uc1igt59tMff/gXxKTgGjA0TSrrxnhXAUG2+OYn7ognB5b7JEK5GYt29TVKoNg9s6y4Qf
	 36L5pIE90lonz4LrJKBpbKainP7k0R1sLDMqDM8XvXttRIrnkXCnwq9S/skxqqsJahw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQzYziZi;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36E460A2603
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C36E460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQzYziZi
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso809921a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219786; x=1795824586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgYq7nK5M7zEdKPjaX3cHEhvCzK+3haVH16deXhSDxM=;
        b=yQzYziZifcgfpTJ2u9QRa4bWXl+fbyW4UGW6+iDIS0qK3Xci9kf1dfN6jujGJAC7Q0
         AFJmZWeBOjg6kMzaDXOL095qpSxAcbStyoairr/sQujkdGCSI44VGcb+8NsU0ehI93So
         Wv+b7JhGBiNntoFS+huQ/mtAbHYXPG5EQQHHtJSolmTwI0/gDoi6oFpo/Uk4+J4A0LhG
         ke7N7Ckp7XNS+w9ZQXTKhhRZ7U9uXqOLZa/U/4kTqcBbLQzJFrNqelKUWqRvlYFHt0gS
         PyT5swdD7EIiVzxQZ8iVMZEGVDEKrsQ4lDQyGgRxFSLSl1eLmr3KzEdx4OMKp77kL5XN
         QTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219786; x=1795824586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UgYq7nK5M7zEdKPjaX3cHEhvCzK+3haVH16deXhSDxM=;
        b=oUtoKx2wD+EMgiO/fvr11uGbs/7f8yO8H97MEkmgv/tVKLZ+MbqKOfgNnImZ+tVu8n
         YtQDLlYywt5Hk2R67UwQhOwnrwThusrPltx5qTkyXttg8VDgmSq4J6w7D3MBFMjczj43
         aC6MBiWyc0xWEuOC1sAZ2AIAQVBueDn44rOx99og7r1Lyda7KYZ4QV2MF808lJb0tOM8
         xdoREM11x1OOZZTKQu4ykelLapkzOCy77Rc+qEMGQalfK734GCUB5maUcxKwNTB4e9ye
         yNJzd7XtDj8vHUip5C4KuLrKyn+dhRpTENReCPRjG22BAIiXjuJephePmwV5gx5Hxm0E
         yamw==
X-Forwarded-Encrypted: i=1; AL+hErFNwZTdEKUMVJBpmqbbKgkiOMr52Ree7aNJ8CISl4RkbSsWE/gRH0McmQ8Zm4rxTC7lLO5v3syhy822ODM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YIDEH23Mje1LsUoYJVY4JhqALbs6t+TwUIwGBET4Vr+C+b6zh
	N+F1W/McPRK21ay7RmH9RA+mPpdnWOf5yBYWw0SGQw2Wy8nYpQsm1hz5
X-Gm-Gg: AZFdTZcG3c1SpxUWxPaaPgoBsKXfoL192IomxV2omMe+k3UDq31l0gu3TSJiFzOSYfB
	HuIee0jTq3fMkDHNKAqlBBBEKPCRGoma+sJ2NNuUAgvMgN2cdveKqehG61eldw/l5jio6JAaAPG
	oz3amU9hnvFhmjfs8zlbaM4rgQeqgrca/vvRcRrJuhfkE4+VMXdn6gZMobsjn1T/qWqSkGcpU6Z
	tORLqnJz7DGXPRRDktGYKjc/tZYLpn5lrP27ccTTr39babF1AQfmU4yqeBmm/ZROkTGtwM2QskJ
	DF0g1wnxaRBgPOaBfnIoJzthOkpIFDF9rulAgCQ/9h5gOGziYNu1PMAQGO7Xp7p6C3c7UwvZyN7
	riPJhIvyVSLtpdjcU3TAGGRG3KvVJjnnNlkkW84t0MDIvolTBzHrIvtKYfIWuNnQ8s0M6vqUoJq
	67U+JdyZ3sceMC/LZSG4ZgIBxUYVXq3/hDmB9RopN0CX34zL35TmPiPKqQ1cg8YlwbC5isTP/V/
	kV32IZkPZ4o0HBNqDiMVMnErZ3sZOGd2IL0RwARR05/XThKsAjuZjJOfr4TdqMkMmDZsByWysei
	2eMv1wAQiCSTczQoLtFni/jPa2V21tnv22tN8XcCm5VtHoLJrAuYO3RkzpoeVhDWCoNItYfIhXh
	NMl7M6A34GSJIAzuvUMF15UGBYebLu6ADtEAoOO8G1BFrQS2/tY/04gqijFmhcqko3dCaQf/T98
	/Tig==
X-Received: by 2002:a17:90a:d2c6:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3b41c57565emr4384171a91.0.1795219786076;
        Fri, 20 Nov 2026 16:09:46 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm1920509a12.5.2026.11.20.16.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:09:44 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	Darren Hart <dvhart@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] platform/x86: dell-laptop: Parse the charge end threshold as an int
Date: Fri, 20 Nov 2026 16:09:31 -0800
Message-ID: <6abac23d8f9985b55282ee56c97155a67076257c.1795219225.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795219225.git.rosenp@gmail.com>
References: <cover.1795219225.git.rosenp@gmail.com>
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

charge_control_end_threshold_store() passes a pointer to an int to
kstrtouint(), which only builds because the kernel disables
-Wpointer-sign, and makes the following "end < 0" check dead code.
Use kstrtoint() like charge_control_start_threshold_store(). Values
outside 0 to 100 are rejected either way.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index eca348497ac3..c512267be4c4 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2382,7 +2382,7 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 {
 	int ret, end;
 
-	ret = kstrtouint(buf, 10, &end);
+	ret = kstrtoint(buf, 10, &end);
 	if (ret)
 		return ret;
 	if (end < 0 || end > 100)
-- 
2.56.1

