Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630498;
	b=LZ2Qw9tA4FXhjB+5w9BQnFWUJq48T0nKfRUw09umYT0imblPWnD81tl8J2kEd5YYXbyr
	 /KrK2taRUTjRxebMNlcqniGtMzhfVrQLNYg1sBTbFs4LGJIGEzJD5R1GTkkI+6teMZ42v
	 OBtFf1PSp/GMyLepkcwuOJ4ZAyq07mZnXv14hYaM5XVuNZIJHwtr8NtLL/l28g5zmcyPp
	 8XvlkNmqTydoSfuOmbu8e7VfK+k8hLB3Bsxi3mLAOvCcPAjBJAaKIoCZPgakOxUNQ6BHp
	 mfZALjH5Mrgy35CNCVB4TsG++haMOIO/q3GpCxd/B8SW4inghHux3ezDelDQK5oWNVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YVuTcz49Q9b2+slht8YsCMlxCLCkOo7/QKC3OMQMooE=;
	b=326c7BSYPHSs1Xj/20f+pNlFp2ENN5CCwWrpMv5ZWxP0vNkj7bv7r8wI+G19PQndUxT8
	 8r2eA6KD7X8R9QBPe6LQ0J/WeU16MZUnfPp5T6Y2E9IQ35GWk1C5YYm6Btlz4bglDXatJ
	 IJS3DSV7WdmIHfleAC8ZenxW4M2Glen7EbdqY0TjmfDhLB61dlyYmdr1CNrpABWKHZtVj
	 k6IwPWxJnCsi6ujja78uONNx9K6bnYjHFJY4cF00+1EcMB4ykOIWrhHfnsBl5Lh7+dVcM
	 dm5VZDsRpkN6gYdlpGKtR3QIyMiyXhcUeOjTKMs6sHdI3kgJTPmaL8bNqi985FYNTRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDOT7tOH;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E94B606A697
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E94B606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDOT7tOH
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0d126f631so53922817b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630496; x=1796235296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVuTcz49Q9b2+slht8YsCMlxCLCkOo7/QKC3OMQMooE=;
        b=qDOT7tOH0yEyKtTGHuPGtwNIe23KLKgYLOYamckSwZfDJrX6/t3m7FR+zwsEYBPXmz
         nRHwaRyVVwXKQMhDYuFH7r+OO1n8yx1BhSW+HpDwMP9kq2x6qpsAkRVjeax73hi2zQhg
         zwdXIiW/s3m5BKZSuvjtKS0oCt1W2wTIqVUqYJExyiGg8emOfDtorhZEq++vDln/r16W
         CA9G5yG02X9zGcXwJpIfJHef/Xg9CrnmipqljW9KTsix0AIdWuHzyPivm8CMOCNxvFZ9
         p7Pcx6uQp0oGuU1TIIqT/XoagYtWEkEwta1Bde2g0BmbJN5Ee99OGGeNgKs/E4aWzYoG
         YEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630496; x=1796235296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVuTcz49Q9b2+slht8YsCMlxCLCkOo7/QKC3OMQMooE=;
        b=iWBInCZu7g4Fnmsvn9LZV8gOKWxecDMQ2kv9oKD+eKV6kPrwP6R+eDqEvibCwlc/OV
         VIsWQB9X9cMnMbaCq/ldtA6VlE31dObScXIneh56fRPirrDwxGqVoWzj/tog3YMS3ZSA
         lBk/I7VqiJhEo78GivmZu60lM/AG7pLmJIKQUsBuBIQgCmvWFUJt10qPizgLMdiMQzM5
         xJS1PwBpQ00EtfblQ7QYF4Zue+29GweZGA33SeaG3kFHCMLJj//7cZhW14LYg7him/W3
         /e72AhuIYq31GlDmqOERUdOUmCIF1+/Gw5e31T6v35YZMVrxQVdMzU+lsVrBIcdS+hEf
         9S0Q==
X-Forwarded-Encrypted: i=1; AL+hErH3Z1QWV6Uocvvjof8j9NHFNPPLqJvjMV4YZrTz+yFOY6H0EeeUsoc8XipeozjCPL+PwFAP0VgkN148Z5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Oii3rDcGYAE1mP2CgJnRjMx0kGD8L8g7b7OmKGXD3g21jLgo5
	doTl35LoSgV1AsA1nc8RlxurjCnbmUe2FRQFr+lEFX+kwCCAfPH+zaI=
X-Gm-Gg: AZFdTZceFxayDkJD3Zwcw6mp7H/1ahpiv/aL0UTiBc5Ru6InC1pIqPJ0HxO8X28ZPeN
	zwmWxJs19anA/+MboqfP+yr4UCd1nXdSKHBIlEAIveOpqMjOihMMvFbZc5JVtABtiLubqlZj/AV
	B/0ZpLp3qKs2HgaL8dYpPo+o5mRlqjPA0TxT7TFU+tlamvimYltScx2t/A4xe+ucdWwit0BzXkM
	nv56L3ES5dEEExhu13tRb8H0ygLZw3DvsjNW9H8EE+YflbLINfXNfKL7LUzHGUCDoiZ3lKBagfZ
	vVYBhRePguL5q6UGviHMZ+6mWnityyFwhVieLPpsAYimOeqHtDK4cHoTSXha8atE71o0pL06LMx
	2KmNqrFkPTs4jbkp3dE8nvWq7lurK8pbKVhHIgiwfFj7SjP2U0IqkLSLRkSTJiSdgc8RvduFdGK
	JvWRANEWr2OJ/9hpyI2BJx645DJckvgGpIOlJGrLaZpPCDyzupXw+iwZqDK9t4WHSv3Y8IB00d4
	UEZt1cd+vzK/BroAn3lmrQthh/9SVUDzxRlGXVEfVN0qGDD15Nr1jBHAlU+bt7SUEXprEEGFsQG
	Vj1hyUAvoR2m3w==
X-Received: by 2002:a05:690c:2a48:b0:8b4:d8f4:8ccd with SMTP id 00721157ae682-8b52042e7abmr80135727b3.12.1795630496306;
        Wed, 25 Nov 2026 10:14:56 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8cdbsm74546187b3.1.2026.11.25.10.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:14:56 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/3] tools/nolibc: fix strstr() with an empty needle
Date: Wed, 25 Nov 2026 12:14:52 -0600
Message-ID: <20261125181453.814976-3-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125181453.814976-1-svav2021@gmail.com>
References: <20261125181453.814976-1-svav2021@gmail.com>
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

The C standard says that strstr() returns the haystack if the needle is
an empty string. nolibc returns NULL instead.

Return the haystack in that case and add a test case.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 tools/include/nolibc/string.h                | 2 +-
 tools/testing/selftests/nolibc/nolibc-test.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/include/nolibc/string.h b/tools/include/nolibc/string.h
index 2693b9bef43a6..191a3bc8af29f 100644
--- a/tools/include/nolibc/string.h
+++ b/tools/include/nolibc/string.h
@@ -312,7 +312,7 @@ char *strstr(const char *haystack, const char *needle)
 
 	len_needle = strlen(needle);
 	if (!len_needle)
-		return NULL;
+		return (char *)haystack;
 
 	len_haystack = strlen(haystack);
 	while (len_haystack >= len_needle) {
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 9e1d0f3afb901..971a7f48e016d 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -2046,6 +2046,7 @@ int run_stdlib(int min, int max)
 		CASE_TEST(strstr_foobar_foo);  EXPECT_STREQ(1, strstr("foobar", "foo"), "foobar"); break;
 		CASE_TEST(strstr_foobar_bar);  EXPECT_STREQ(1, strstr("foobar", "bar"), "bar"); break;
 		CASE_TEST(strstr_foobar_baz);  EXPECT_PTREQ(1, strstr("foobar", "baz"), NULL); break;
+		CASE_TEST(strstr_foobar_empty); EXPECT_STREQ(1, strstr("foo", ""), "foo"); break;
 		CASE_TEST(memcmp_20_20);       EXPECT_EQ(1, memcmp("aaa\x20", "aaa\x20", 4), 0); break;
 		CASE_TEST(memcmp_20_60);       EXPECT_LT(1, memcmp("aaa\x20", "aaa\x60", 4), 0); break;
 		CASE_TEST(memcmp_60_20);       EXPECT_GT(1, memcmp("aaa\x60", "aaa\x20", 4), 0); break;
-- 
2.47.3

