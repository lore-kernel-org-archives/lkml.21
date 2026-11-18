Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983890;
	b=xwi8MdNGraAuUjBQYB/8vsTmqe4FJDOkMgfeeo9TYzv1nlPQLndLyeK1dTp1XEfl49Xo
	 7gU7oTKSTUp7uy/DiKM7ZzMM34LF7P7BvLHVxH7SW0z6FH27tNRf24juKVa8ZCz1LB3Qu
	 ChvVzz4ARcOFy5uO5ZTMTjPEo/WZNklbtOI4X3SgNyJQHIpRuxFNtHrp0s0zgKM2Ebr11
	 6vWWJH4Caoee/miWQhppmG6edtpU+xvHPaNHj9rHf+upd91iNSB08JuRcRmtFyo7BIqT+
	 qpbehRCGe8U+yvH8J3PLrJz0Ir+mcWHh6hPI3ik28QZl/Zs1C6W/wI6POYX4qE849XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M1+qMsPy6fKyAjck+GZTx88ZCCPsYdHAFPCNWYPe8pw=;
	b=k2qXg6u8Pk6KB+/H5Vpwpn68Q8hpjubzs/G6RNI2brGtV+gs8v8FG1jYIH5RJZlKir8E
	 WuZxneOdyV6Rtvdad4D9+Zt+qiZHbePbPHsvzEDtLEPo61ECj4CbOQhKyr3mu5ku31h6h
	 T4Ooj1L/ZqF2cHZ8g+W25CRZBfUqKu4GVyCR3lb/L3A3cBwFDSXzh2GTYip+gTCQ098L7
	 QuYYkW2nxt/ISsAGgnxHZ+kPLgogFOI/7hTR4FgLINyI8TRZSTCuzQ1vgA5n8JjkBMSx7
	 rR0hBn5GIUHGrGkPlccjIzq9yXro46sZSHg46tgxSYye79LvhHU0reA4ZxqCuQR1QkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NI100kZn;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6897606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6897606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NI100kZn
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e90071735so129018eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983889; x=1795588689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1+qMsPy6fKyAjck+GZTx88ZCCPsYdHAFPCNWYPe8pw=;
        b=NI100kZnnTRpk1ImaMCnh1QcNvL5HV+h33KDyU4v6AxHVD4ByTlvyICYZDTqt9E+J7
         yTdAPQ4On/95/VA/SdN2mJbi7lHMgzNviugpG1Jd13GYOEew5KUXoJI7LwMFDaohkuVn
         eQPvLgtYYtZXx5vrE7WefaC4tMTl2GpmNop/KdCkUsjuVHPTuYrw+aFIV50dl7KVoqn1
         N+mODXg2c/IIAY5Nl9ByHaDD1+oppqZd1Hc21iOIQMjgvYY7Z1TYhZhRx0hE649rIakT
         yVjznvSCje+EnoJG4XNHvr4HpmhMBonDlWS7CVkGXe28VjcJgOBXy+Wb84aiVeWrqo8n
         XfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983889; x=1795588689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1+qMsPy6fKyAjck+GZTx88ZCCPsYdHAFPCNWYPe8pw=;
        b=mfvwlzbNOG+/8WxVxzVfgvytzRFs1bvSrhXak3Qucnp1sX5snYBCHNWMMbH4F03LMh
         r+KpK1Iyj2mYG+yQckzY7elETfPJocJGTWoZ/q85kyQQ0sgeEccdZUQwo5aDYgLhWu2w
         PfEFy6MwSyofZFylBQXo53P8NpRqcdio+ludcQJdd7bX7BuneezYyh4KEN6wy1iNbFgq
         Ev/2mxw1FVAHOHeJcC3p+pMnByx/gYaybkx6QeQweMpFla8jfwAfQ+RApnZobRFYgKjF
         I04UV8zRHpnFFoTWnuxDGOH23CcpVypaFl05iwFy0Wk6OImZ+RtOUTCYYwBMAPgPF8ze
         n9XQ==
X-Forwarded-Encrypted: i=1; AL+hErGzaYlHwnWQUYnsPtkSozpaT2uhnmooqcBfupbjevoO0d1Wlae3lizuWPlFMq0vC+VpkI6Cj+BGtzEitNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+auW0RwqJWbPVlwMAZns3lloSR/JiItxasgSj7d9WujpVvpaFJ
	FR7g1s8Q+Aa5PpILsliV4tSD9UY7R36ME6NHHxPLOKcrYmjgAi4g5/zswR2nOKxb
X-Gm-Gg: AZFdTZcGN9q8oIGPsisYNw9TERIsRom7zTpMY+tqutmPm5S02HxeLN4XrLAWjxuhv1W
	r5LEMj6b62vs6d3vYdUquMAQ7h+5GAtKgP4USqv7t2/vHhHsy5sEwpKE74kUXdBzHJpDISMrDEB
	iyMQpA9B4UE0enYnpm+bdDaFBqwJ2xT/zqnVdg3bBc27os6ClhFV4Ys6xRGOyF2/BY0ir2szlWl
	wD4RDFGWHCrVWNKFBIyNSiddoBgJrw68utPWsP0X5eBQnj6M3Q7JPJ8h1O6o6d5r8dGn1lIaEuf
	rH+oyuPkI74B8xIVNgz2lQuaOIP5rzx5Nf7a1bckE7ftWLG45HN13T5Xy00lDkJB0LBe/BNZjhT
	R8sWbIS58VxZ1sllfb/OFGqSEaz4aSgDfHK2HMwH9vu8CopFvc8vbu36qE58fwzxuM3pWVzxxd3
	IlgVme/anaSKWvGDpev8u7iDEZvIpGC7Kg9WbhiaG4rGME4n5KMxxL4+2aw/JLBbNjHjZdoXJOt
	5ON/TKvzIYnvPILXJUEPYSsYoIau2r6X5XTefkComuvGfjeUevk948eV4bAtYsf6Qhfaj4F5kSS
	R+J51s8F3IUDJoG//+LXJTeg3BGm7CzapMvJ9AnqDOV5pku4x94Vfykpv+y+TqoVS0+O1IvAVg=
	=
X-Received: by 2002:a05:7301:52c8:b0:381:dc3c:4c19 with SMTP id 5a478bee46e88-3827aed7177mr2606013eec.0.1794983888747;
        Tue, 17 Nov 2026 22:38:08 -0800 (PST)
Received: from localhost.localdomain ([27.59.52.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm6423069eec.5.2026.11.17.22.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:38:08 -0800 (PST)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: sj@kernel.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH v2] mm/damon/tests/core-kunit: add test for damon_call()
Date: Wed, 18 Nov 2026 12:07:55 +0530
Message-Id: <20261118063755.37749-1-saileshnandanavanam@gmail.com>
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

A newly allocated damon_ctx has call_controls_obsolete set, meaning no
kdamond is available to handle call requests.  damon_call() should
return -ECANCELED in that case instead of queueing the request and
waiting forever.  When call_controls_obsolete is unset and
damon_call_control->repeat is set, damon_call() should return 0
without waiting for kdamond.  Add a kunit test for the two cases.

Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
Changes from v1
(https://lore.kernel.org/20261117172219.26725-1-saileshnandanavanam@gmail.com,
 https://lore.kernel.org/20261117174834.29182-1-saileshnandanavanam@gmail.com)
- Merge the two tests into damon_test_call().
- Drop the list_empty()/call_controls.next expectations.
- Drop list_del() on the stack-allocated control.
- Post as a single patch.

 mm/damon/tests/core-kunit.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 43e2f950f8ff..228cb044d1dd 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -2481,6 +2481,27 @@ static void damon_test_last_region_quota_reset(struct kunit *test)
 	damon_free_target(t);
 }
 
+static void damon_test_call(struct kunit *test)
+{
+	struct damon_ctx *ctx;
+	struct damon_call_control control = {};
+	int ret;
+
+	ctx = damon_new_ctx();
+	if (!ctx)
+		kunit_skip(test, "ctx alloc fail");
+
+	ret = damon_call(ctx, &control);
+	KUNIT_EXPECT_EQ(test, ret, -ECANCELED);
+
+	ctx->call_controls_obsolete = false;
+	control.repeat = true;
+	ret = damon_call(ctx, &control);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	damon_destroy_ctx(ctx);
+}
+
 static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_target),
 	KUNIT_CASE(damon_test_regions),
@@ -2525,6 +2546,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_rand),
 	KUNIT_CASE(damos_test_esz_goal_temporal),
 	KUNIT_CASE(damon_test_last_region_quota_reset),
+	KUNIT_CASE(damon_test_call),
 	{},
 };
 

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.34.1

