Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173518;
	b=DQY4Qc3i/qZzpbvooa9bxLD8kXW9NDFjeL7wvk/71VbdXe4azfnBdm41HzGYDwhk8t45
	 qCjLYTB5iVmem82M7O5/w6OxcNVnt97PIUwWIwlKj0wvY9/JNbpXwvxMLUdzoLeiz45Uu
	 mnGcQEB+Il1PgzN4yrHA6A/7nrhlLMv9te8YXCT6Haml/sRQkw+Vnu9gCdBkc/4I4hLb5
	 2i25aVWBo2ZDuLdmx0MWWZ4fliBMJslZh4OEnPGvgXrhFkWjTNJZ67pPwRH5CK5gD7FAP
	 NCJmz/CEqS1Jtlj8xLIm6H4CERtr61Jk5LW2dfGFRAkqe+sRGR5uNO3G/CLCFXRYXmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GVuAUaZMskqzeiLFr56cuMAxOEFeqJFepRj8B7tYuqg=;
	b=SWVGvu+3w4KnoPwZhL8h/dG6usM2FRccLUqlN/Gt2lroAN0xkDAUCFOe4obbrTpHwC1r
	 8at8P5IxirrnwZtiwXnYTmz36goKfuZERC7k31kLYKpENmQvjVYlF+i/rdP304/ucbg6B
	 NtVq9dVUt/OQaJrzFQ0xpq79AM90jTS3Kgql1iG4hwxnWuaYGoLTcLB3PBpecvQ0A9Imk
	 WiQvuVE6egq+hi5hwyA1ok3xyatEOjHWz9t3GwZyS/cPy3efcxN751cyTfq4hlyMIk1wY
	 tn1YL2pP+8DB0q2/LlZgxkvrCt0X6yctlZdodW20fAm0fdmB5HXne/j22lih8THaaRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uGOHyzOW;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94974606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94974606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uGOHyzOW
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d28f75d62so138748266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795173517; x=1795778317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVuAUaZMskqzeiLFr56cuMAxOEFeqJFepRj8B7tYuqg=;
        b=uGOHyzOWSEfWiJZ6I//Si1S/pmEbouLICKWn1MjChSpAZh4B8Baz/rLRknV5o+0qMO
         w2TW4T6dlC7tzu68PhL0ENiSSI2Bb/PsKkzzOTZ71bl1ahqLORphGSduFy5sVVRGRn1o
         Jf8kf4XRy2hLegP1DS98x0prWoQSVyoFKftinR38xifZPVaxvuWVWTDD2NSW7Pxlzbt8
         HxuTkMNp12+GSK6uBCvu+vEsP7BzLdlOIrHGZqwIDqvG9EP3wlBKmjP9brw2u/JqEL7h
         7SdQSkTnX11aFU3P3o7KPEcaYd3XYDwkZL5IJMUofTvcNNoMKfq6rQiBF3R7JnYsGBWz
         g69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173517; x=1795778317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVuAUaZMskqzeiLFr56cuMAxOEFeqJFepRj8B7tYuqg=;
        b=DqiEPo3G/Bdrtijsu9yYbbHgxSGyDLHmxsvB6XP/cJ9RauYNGBMT8lEvF4MQLMpdxK
         dGsfpBGORs5vOPSJrjriBsOe/2VtWgJHLf4R30KBbJkJZL8uatsJiKYIzk2GaUrk4DhO
         drL70FG1pkW3jYOvzs7htQntkqIABx4ZlkXMYOt4bu86ySVBQpTf73uf9abnv+fF5JVi
         KUogJxg98clHFsZPxvU8ccg6K+awkHfbb19aFl+V+bS28Znl02bhvBjJBRGc1H5kVbgN
         Y3e3RdfbitoEt/YAYSoa319bRmkV4mxiYIm6a93JS2mVAbj1U3Zx36X2RQVjyd7emZwz
         rk/g==
X-Forwarded-Encrypted: i=1; AL+hErH1NN/HrUl7wuSgZ2HdMDlCsn85htYj/HcrWjHPExt9Qh+17X0umkdLVOGVE/2fBsRV4l/GZEhn79SEePg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w8o9ReWs1dZadkdu4UZzt6NMP0y2OA4MJXZbv8nwENjdepE2B
	DY7CC0LlI158m065rWKVvBj9QgsVw6oVIiHmXa3G+DgfcKipbcIa7e4K
X-Gm-Gg: AYBFou3ank52POqHppOObwAApGqkyGZfaq8EmCvh1I20Soez0bL80kAa+Qi1/VsF+ou
	4HZeNkZJfMyHGGXvUXSEz0w/sA1TZvQK50Y5//oZ/aeHzJK8eG+QGN3djXucTWE4kqcu9wWb13d
	wKS7o563psdl9aPJYea2F4IGRyc7rK3UZWJ+rtmzMDvf5aD3umcCHz+ufTPbJRA9tr0+hV4HCG4
	Tob9flHzbyAISZ3AKG5VszbHrkzmkJraqipZOkwYwKBlpDK/thEWDGA6ouqXeS0qGQTCph2GWFz
	z/JzcfVvT308qem2RXCBnEL27DPXrtHaSYaNpg/vTKgUjgWnpCdnfa5qRkKvqueELNIYqRpwzkf
	ySUgSC3+/sqzeO6ExG6yPAyl7uZrO1NqamVXvzKhQBlhj+Oin93QeGSEbA4aq8yvyxRGUcja2bX
	zplcknZnn6OLQxyu0ZsLZeKiPeoqiugxS4IZr6ozVdqXb2YnO6pGDAgMMvE5vxIXQlr1XUXyP7V
	xvNIT2olxYD8BRMFXpjxMu7gKdyVv+8aKB39uoEBweK6ToRZlj1fxK7834IcWEFSfYQ5jt/xORE
	Gbs73V4QtbFMCSTp75qjJq7oNcG8+Cu/kLpm9NY8hi6oSZ2vp529IA==
X-Received: by 2002:a17:907:6095:b0:c51:24eb:4de9 with SMTP id a640c23a62f3a-c513ac634admr257163466b.34.1795173516536;
        Fri, 20 Nov 2026 03:18:36 -0800 (PST)
Received: from DESKTOP-OL07BOP.localdomain ([87.116.183.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm4985562f8f.3.2026.11.20.03.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:18:36 -0800 (PST)
From: nenkov2004@gmail.com
To: linux-raid@vger.kernel.org,
	yukuai@fygo.io,
	song@kernel.org
Cc: dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	magiclinan@didiglobal.com,
	xiao@kernel.org,
	neil@brown.name,
	agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	syzbot+8b22a0459202f76b4096@syzkaller.appspotmail.com,
	Hristos Nenkov <nenkov2004@gmail.com>
Subject: [PATCH v2 1/2] dm raid: Clear MD_RECOVERY_WAIT on reshape setup failure
Date: Fri, 20 Nov 2026 12:17:56 +0100
Message-ID: <20261120111757.4705-2-nenkov2004@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120111757.4705-1-nenkov2004@gmail.com>
References: <4d13edef-f454-437b-8910-3a905697303e@fygo.io>
 <20261120111757.4705-1-nenkov2004@gmail.com>
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

From: Hristos Nenkov <nenkov2004@gmail.com>

rs_start_reshape() sets MD_RECOVERY_WAIT to keep the sync thread
from running before the table reload. If setup, check_reshape() or
start_reshape() fails, raid_preresume() logs the error and continues
without a reshape. There is no reshape-related table reload to wait for.

Clear MD_RECOVERY_WAIT on those error paths. Keep the bit set when
reshape setup succeeds.

Suggested-by: Yu Kuai <yukuai@fygo.io>
Link: https://lore.kernel.org/r/4d13edef-f454-437b-8910-3a905697303e@fygo.io
Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
---
 drivers/md/dm-raid.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index ac019a0f5..e132951f3 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -4004,7 +4004,7 @@ static int rs_start_reshape(struct raid_set *rs)
 
 	r = rs_setup_reshape(rs);
 	if (r)
-		return r;
+		goto clear_recovery_wait;
 
 	/*
 	 * Check any reshape constraints enforced by the personalility
@@ -4014,7 +4014,7 @@ static int rs_start_reshape(struct raid_set *rs)
 	r = pers->check_reshape(mddev);
 	if (r) {
 		rs->ti->error = "pers->check_reshape() failed";
-		return r;
+		goto clear_recovery_wait;
 	}
 
 	/*
@@ -4025,7 +4025,7 @@ static int rs_start_reshape(struct raid_set *rs)
 		r = pers->start_reshape(mddev);
 		if (r) {
 			rs->ti->error = "pers->start_reshape() failed";
-			return r;
+			goto clear_recovery_wait;
 		}
 	}
 
@@ -4037,6 +4037,10 @@ static int rs_start_reshape(struct raid_set *rs)
 	rs_update_sbs(rs);
 
 	return 0;
+
+clear_recovery_wait:
+	clear_bit(MD_RECOVERY_WAIT, &mddev->recovery);
+	return r;
 }
 
 static int raid_preresume(struct dm_target *ti)
