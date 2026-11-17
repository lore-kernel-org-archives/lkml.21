Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937723;
	b=u9JG1Gh6ifKZZZsF/qdREdLpC+mfeX2YJ9C8pDrLccG1UUw/ZVrGiNQhINNOzjhLdVSb
	 nOKuQmbpIvan6orCuVvJfCUntKlCjnUuNT5eF5lrKPY0AG9UWjK3kmaFCeGzt1pbsHhHA
	 GMyde4ABGDx5GDiiTPW0gev5M+vwxV8dlC3Tpnf2cqnH27qiCDXwKFwOlHg1Tk7rn3jcS
	 ABbpqTLKDQb0Ski2LsUJZ9Lw2UHaDIe/TeBFCTMc0BmvS+YeLv5Nm/lGEfyMfZvnz53uR
	 n/Pl9/xVD8PDcoC1/r167uG3ZtqBi2jGDdSRE67liUcclUPVzDIPKEU0P0txZCsF35g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rA3XzT8tXt6/+XP+fsrdKUtHJCQ7Tr9McEClsG+Hib4=;
	b=rcgAEjSJlBXqrhxDeKNEQXYs0maYWcfysoWQduk0tPgFpDLIVNvVLFDEHDDak41gNhc0
	 3Rw9b6hrOYW/sWRnm/zAnXW/Nk+hfE87WLNOtP8O3zGaSr9H2pnIEAXSpaJ/FRTCHXg0j
	 tc7acVku0l0rf7ir+o/1AqXXfJTqftuv2Qv53zpG6Oy/NgJ6v9rRoqQaMw5uGNzryTrg/
	 jUrfCB/xKKIJUjGGMZH2JSLC1yoZsBVHn0ii5c5NsMqMkrz19kr/FULbYr0IrAONynM1l
	 2n+gvWxaUTUONYUjEcWn6YEzr/h8MsnjYbXZJDpjv9yrk3g+I6kQfvZc9e0oF+YVLaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiGmrrMF;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C676A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C676A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiGmrrMF
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-380c17707ddso26803eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937722; x=1795542522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rA3XzT8tXt6/+XP+fsrdKUtHJCQ7Tr9McEClsG+Hib4=;
        b=QiGmrrMFGNPGmgf0GxqYkYrTsRRjHQQgLF13NxKEzWZtpp592CPhsZ31LZAsenbBAi
         MKEcnZp/bOvopVmVL/yY3iR487j3seyO/NpMReb8sEp7aDFd6CaaMNVGB4tOyJDW7RLB
         oKzka3tPei2HVfQQNelVqEqZoABJ0oufRwqGY2K7kxP2i9DLhslWkbhelIsrFLDKjIMw
         dx1cWvPHcaDBQTo5e5OjfXPVE8ZwFP7nkEI9Q2u9RdUvXkmMO4hLalIQ9rtSuuncZMKJ
         HT/J9uPb5A4j7fk1xoa9QoAPjlWmTJrh0lf5gLQDJaFn0MJFf3eKR5TIO428biMUxqOw
         mnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937722; x=1795542522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rA3XzT8tXt6/+XP+fsrdKUtHJCQ7Tr9McEClsG+Hib4=;
        b=NrCs9YBPlJTQUuuXEOkbLzBHaoDQsbhUKosxIA5nYEx6HmVTF0cSg7+vpOIXFiF6oz
         pvxw2ii/yY/NTneCB5nVmM3xFo8S3OPuyCtHK/7jr1kJnTUHZL63pQD07BZXdp3oCoLy
         KtUccI31BlLk8v2MkOQhH7yc+jigCE2EGZgGbAzdceir4CgLK6dM5pWQidTAEmowqAR/
         B4fQUq3JGnRL3+bcv3TkOBBDKxGQeeJT3uJAGoWgawEqeUH7zElDXWBUYvkeaGd3sS2c
         GqJFR+Wjcn7o7YgC5CSp5ImQjQq8lDMSgb7xYFW8OhAm7XqBTTM83aiBR0yex+GjGKlU
         ktBw==
X-Forwarded-Encrypted: i=1; AL+hErFk+WiN2qHdXEWmSWbvbPVEvGNZwT+K+a6Iw7qwldQVKgmuZ42fxBZ0k/Gyi3GFdcugJSHiJ87x6QehZBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xSQH204XYCosWEjglSJ0EgoUmp22J28JTB460QAwAUflWDEHy
	E14tMU7fpvnV3/fC0L3lz1xf4cAUf7hITHtvvxY8Q5X4WmwOZ2VrvFc2
X-Gm-Gg: AZFdTZfRO7qev4JuRn5ovofiiYrWw8ybQd8zUQr+toHigDQPbLLiginY8cZ2DjYQu57
	vH3pRuWDa8O9+98tYh2HCOIqZPGDiUZIhURbT/DHbYfC9pvSyo29ESllVmktI0vV0xC9ZIDHDdE
	zpQaIodDoVV5QgZujxkJNfe2lgv3HTWUDHdhEjmBMrHwIh4LVvt2G9k5kDLSKE3fJiEk2NfzqLx
	Wzwl2DGZt788Hsqupat5GbvBo2miDNp4zyZVU+uU346pRdVSF9/fIZYfBYOTjO+tJs7toaa+Uj8
	PF5LAnc3PVVVLRYapx4Ef8xFibq9ZgyA05Xsh/bWwTyjOy2HqYRXvLS3PYmiBWWJF2kLE0LDmxz
	8OA8ZLl810TyTLzrasa461PQdih2Ddcj7YgmIXz43eWLtWSFJ5KToed5sto+R5wMiDNuDZYag4/
	XJIbRzuhZo3BsOwxz4Dr4k63rPxG4ULgZJfHowdNkZrB9S1PghGnzhmvzGKK/CbU4nXLhdwFAMB
	ckl3V29R0JiwFm3KF4bov3ObwvUT8pA6TVXqAyRTxA/znLA5tTS0+p5u6dthbV09yOgbEGX8Nbe
	c9eZCWatZyX6O3ykWKE1My3c2a53vW7rSh30DugeA84NG21V9Y8Hlg==
X-Received: by 2002:a05:693c:894a:b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-3828036c8e0mr197352eec.2.1794937721763;
        Tue, 17 Nov 2026 09:48:41 -0800 (PST)
Received: from localhost.localdomain ([38.254.175.116])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3815045b90esm7025750eec.13.2026.11.17.09.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:48:41 -0800 (PST)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: sj@kernel.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH 2/2] mm/damon/tests/core-kunit: add test for damon_call() with repeat control
Date: Tue, 17 Nov 2026 23:18:34 +0530
Message-Id: <20261117174834.29182-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
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

When call_controls_obsolete is unset and damon_call_control->repeat is
set, damon_call() should queue the request and return 0 immediately
without waiting for kdamond to handle it.  Add a kunit test for that.

Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
 mm/damon/tests/core-kunit.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 13315291f69f..bc93677487b5 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -2499,6 +2499,30 @@ static void damon_test_call_controls_obsolete(struct kunit *test)
 	damon_destroy_ctx(ctx);
 }
 
+static void damon_test_call_repeat(struct kunit *test)
+{
+	struct damon_ctx *ctx;
+	struct damon_call_control control = {};
+	int ret;
+
+	ctx = damon_new_ctx();
+
+	if (!ctx)
+		kunit_skip(test, "ctx alloc fail");
+
+	ctx->call_controls_obsolete = false;
+	control.repeat = true;
+
+	ret = damon_call(ctx, &control);
+
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_FALSE(test, list_empty(&ctx->call_controls));
+	KUNIT_EXPECT_PTR_EQ(test, ctx->call_controls.next, &control.list);
+
+	list_del(&control.list);
+	damon_destroy_ctx(ctx);
+}
+
 static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_target),
 	KUNIT_CASE(damon_test_regions),
@@ -2544,6 +2568,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damos_test_esz_goal_temporal),
 	KUNIT_CASE(damon_test_last_region_quota_reset),
 	KUNIT_CASE(damon_test_call_controls_obsolete),
+	KUNIT_CASE(damon_test_call_repeat),
 	{},
 };
 
-- 
2.34.1

