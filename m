Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534696;
	b=oJlA2tTMTKf5MgXPLdFi5Fkp0ozHy4MsIUk9Bz9ysA/SA1mSc2svzuf/dVeVaKh4+qyf
	 S5PA+++7qatabtr2MflaaQF5Lj1EzIosm1pKnH7O9xrb/5xT1X34DIRmtDw2lG8SrgsAd
	 ism6musey3DgEoktVleX5N8Zzn6oHJnUQ/I13LZqsSR2oHH084zWZAxejl+IQmYFjHBlj
	 8Pvr2zi+k0WLZ1u4m1C/tWEDLgsUpxQmnkMkTWq7x1lbWZkHLl6Jd5PbTglren1/ALSDo
	 6Blau3lObR2GHjqL22fbPn3archzD5k7XecLzrO/DGhzKdrhEOhadtb9qxYLKDRzyGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7bx6YXLfofHgTcT+fkqDDtRZ6uWmHxeGGyk9a9eB7Gk=;
	b=KSo9c0p1aW+x9gTo6Gjj2nQZOA2taW3dRte0tjMKlbKGAfPjhAhSmhSQID4lNe0n7zYR
	 0jntSJ4Iau9DP8LbGAdJnFxesAkeZ5ij1gvGakzU729Yr8rLn34Tk+nrMAgbt6uk/owec
	 Wfr5z1LUyCZTWLpwRCEMPc5sp99pRpqwD1yAUdHHa3vT4OROKyu90/RjRrmKPHX106oGV
	 axL3EkaAsCKH6OgRR54iWnav1HMP/K9PL6DTIXDkjMv+h6QiiT92qRCCZAaKRkxVla6bc
	 O9d90R5RwDQJ05HQfFgX/G8unoUK3qx83Fuvk/UeCjnIpqkJSijXa0ljiMecl9Hju5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deUMFlsp;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FC4606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FC4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deUMFlsp
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-862bb0a189aso2290063a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534694; x=1796139494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7bx6YXLfofHgTcT+fkqDDtRZ6uWmHxeGGyk9a9eB7Gk=;
        b=deUMFlsp+pdwjun4GHWKzF0sS3xgDr7ShhARb9srSDmtj+cvwu5jnvhPb3liiFtNfB
         qzbKd01Eaj4Z8WUIUYTFNaE4x/3WA8YjyxxHwoy7pLVcQqLFAFwmNlIhoSHhOsOjLAV6
         xnXQVaVEGEAZsPXMNjdBNVG6zGYHPNtTBtIUNPA4NWAbCsce+47/lPHkRcmclXtCrx+R
         KkKwTEPolcal86hgNwozGfFquLFse5ANwsZyJo2ZIcjPYQE6mhTXmkQndUs83HufDfWN
         nA0ppBbpW+2l+bqJRPQQXGklRXyAd34kUYIHmY9KUr9AgwzrFUevg2ZXDyQ0yX4BAg4v
         O0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534694; x=1796139494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7bx6YXLfofHgTcT+fkqDDtRZ6uWmHxeGGyk9a9eB7Gk=;
        b=If4Di3afh7TahKUokgCYTso2zCB1yLZfT6cSIKtWhcYUBxjaTOFFZv1r0FhBjsjsBF
         91dLWPAKhsBmyowX7DDttWac4ex3ycKu7ZglKbKEuZYHZ/Anw62rEfSZiMP/6kT0B8Jg
         PXv2Plge4wcI297u2t13q0Tdp9xPy6Kp9w346xbCMk1L2fC8GbPN3+OK3FyciyiS8/hD
         W4qCAZk+TcoIzYAXKe58k5SH2wQGByWnkuxVcnnO9UApuo0xQf3qKlsxpwAgLCj7V3M6
         9G2+wz6am8Jms7f3q/UQaU9n5FiU0IhFFycayrNwMp8a1et44ialx9nbQZIDOhv5HljC
         9u4w==
X-Forwarded-Encrypted: i=1; AL+hErHk5Yoo8PuyTOyL5DAvXsgVE8AiTNSha6Imtgb2QBDYdZyhyjDS76E3U+JfaGwtiUsux6YcMYyGq+JVIu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LxB6yn3rBUovowa5vfl4Z4IwDrYEwJ2WsSj5JvUzFScaAfR9K
	w26Ly2xGixeFxvvaTeN0U5Q0dm7Hg5Lz8M09gMWZ8AmAKr3lb+WEgbeXOn2qJQ==
X-Gm-Gg: AZFdTZe6QONfukA6A3Z2bvovK4XUVuGAiP8ku2HGtGJ6aPUNkIRaeosxanzzKHChJ8L
	Yb12FIrb96JXR0kmHgyv1wjLggjKNuwB1fYbgTyRO4Ozj6OVHzrbogrIR/8A5JeyV0AunOR8wNx
	9KRmd6IGxKe5C1iLBEtH7Q0yAOrmNbj/37XpfGn8Gyn216GsGbPsRmvBALV70CrcD9B9RXkda1S
	wQfv01nOpIlZkzjlBKnWq0K7M4cgYyTu5oSzOn4Ds3ox9h9KxPol2t/FzDJIS8duqMjFZh8zSoC
	hufRUal+fjbZXp2dXGWR/Fx6LFvwEKOE3207muIzxe2KmetZy8kfNVq5rye1xajshkac+0ibdel
	BFLDgrEJTfC3NizKn4LmACr7D21u8xYP2mqL/DmGWG0zw7JGbm/RFQWxUWxTkw0DJvcyM/Yedyi
	kiANHww8JEhfMP5htxZZnqDQ/ZVRWl0/mAVbj9jlNWhRCaMqg6mC7CZIEQ4ehq+fH4OJI9zUZ4K
	WDly/hJCkhQkQd2oPIA+u4gNfozdfF+LFle/Na7Mbva2v6+tye4F5b0rA5iMSALGFtIxSfVrMOW
	qkB14ddeFDRRfAVzZEQBOvOzug1TSdYA901/eeVoma5merhlAqI6K4EKfK+3ImhWDIQZYCCAF1N
	+wK+E56YTj7HXgjDEAs4QiOfxv8m4LU7+4KC49LIFmByDzdBcqHQ11VllS5MFP1afhLUNahZZ2M
	T3BhZnfn2Yh9pf
X-Received: by 2002:a05:6830:3151:b0:862:ca2e:919f with SMTP id 46e09a7af769-863158f0a19mr21098554a34.18.1795534693844;
        Tue, 24 Nov 2026 07:38:13 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863607d0f48sm1501065a34.7.2026.11.24.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:38:13 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH] pmdomain: renesas: rcar-sysc: Fix CPG/MSTP node reference leak
Date: Tue, 24 Nov 2026 15:38:08 +0000
Message-ID: <20261124153811.338437-2-oss.patchbox@gmail.com>
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

rcar_sysc_pd_init() checks whether the device tree has a
"renesas,cpg-mstp-clocks" node by storing the result of
of_find_compatible_node() in the bool has_cpg_mstp. The returned node
has its reference count raised, and the reference is lost when the
pointer is converted to a bool. rcar_sysc_pd_init() runs once as an
early initcall, so this leaks a single reference at boot.

Keep the node in a local variable and put it after the check.

Fixes: 1c8c77f52d10 ("soc: renesas: rcar-sysc: Enable Clock Domain for I/O devices")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (ARM multi_v7_defconfig, W=1). I have no R-Car
board to test it on.

 drivers/pmdomain/renesas/rcar-sysc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index 3c8a44c6d772..20acc9dece6b 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -353,7 +353,7 @@ static int __init rcar_sysc_pd_init(void)
 	const struct rcar_sysc_info *info;
 	const struct of_device_id *match;
 	struct rcar_pm_domains *domains;
-	struct device_node *np;
+	struct device_node *np, *cpg_np;
 	void __iomem *base;
 	unsigned int i;
 	int error;
@@ -370,8 +370,9 @@ static int __init rcar_sysc_pd_init(void)
 			goto out_put;
 	}
 
-	has_cpg_mstp = of_find_compatible_node(NULL, NULL,
-					       "renesas,cpg-mstp-clocks");
+	cpg_np = of_find_compatible_node(NULL, NULL, "renesas,cpg-mstp-clocks");
+	has_cpg_mstp = cpg_np;
+	of_node_put(cpg_np);
 
 	base = of_iomap(np, 0);
 	if (!base) {

base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1

