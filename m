Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630496;
	b=18evbD+8iw9J1omAdY2fLTX/7Dy5BuWcxl2X7Y/S6mXJ1y8YIbYobZ4vwNA36HCAoLMN
	 2dt3UKkww4j5uoAPHyMWnQAcBYDD1Hh2sRd60TkBXAiBS9VErrT4Yx5huH+PKt7PvOl/S
	 4VwgAtszQOd14DFBzkrL/+tR7QviBizXTzzPZYOQwwzyhjPqv0vMtJ1Kb74h6S/hrh2cB
	 wWz5XAZ6WKk997Er3rph7S6bFJG7bQc9GK2DxfjuRqpJQelvPxbydwFuzbLZ7tehPrJNQ
	 ehoK/EcmX8mF/7SI2qO+oRjfuDbed1GuBSzcjmDgzhMAplt+yLyvpyE3gIoT8bFjjQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/3R9jInxYucZc5UgFwp0iS2EvpFdqsgv2PW7AZ1EIq8=;
	b=vdmcqjLV96Ij5tOiBCbqkvoltT06X4HqFhik83E55sbnyvtUzfeH9WHC0V0QS+Cmei+U
	 Njxi/T9G7U5gyos6gGLUTePH29nTSKEvcYELqMqmRfxMLZBcJq1W0bGIbrpAKESX1yHa+
	 GyvRTl51l4vbE7VmImdTpPUAPQnFq6VKyr3jxKTBhySlFKhFtfSgbQ6OQNg+GrAxqYCoM
	 BIqmeRiAL1SFyvwbToKagvmZs2AIyy5LmaQs6Idq8G1EbLirbItBl1InyuztV4jcC0SJ5
	 mNg1tuzUCtEiCkmspY95Go4ZxASkQifXUtIhBr+oYPhdZuyEENDf0/oyG5MhVuBSaAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kbqh4Eb/";
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2DA606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E2DA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kbqh4Eb/
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b4e246acc2so44114237b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630495; x=1796235295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3R9jInxYucZc5UgFwp0iS2EvpFdqsgv2PW7AZ1EIq8=;
        b=kbqh4Eb//yLrc6tOqxrgUFFGqFnUNHFY6GozDX05Z+5BG176V6qLThFZNI4L9TfDvQ
         MaR9joMj8txXUb+ZUD7TWTG2vLkbCyMB9BwanANkL+YEmvqfV11aFFqb7S6tDBoNAIty
         70ToEs2kIKmwyw/Xrq13IncPEr29QOLIF8Po0b2WkdVaBIbo+nQWKwW4+g7SGxOAtPzS
         E749CIoNuFToCEQNMDOsd45RXcJpVovW5KFs5uvnAK80cv0EetCcYcUGR2wXDp6lUvXp
         8gcd9EjMkN8Vin32w6qsngNt574f0Pyn8ZQOVpP8tbslTNtmZK38ug8da4Qkv/I62g0Z
         CaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630495; x=1796235295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/3R9jInxYucZc5UgFwp0iS2EvpFdqsgv2PW7AZ1EIq8=;
        b=fXC/QN2yP05PJn9UXB5Rcx10MSD4raCTxoneAikVBBdb6JhUu8dOZxI4OUyIqCu+mB
         IAGffhxktQuOfQQeCF2TIr0H7qA1/jf+11/v/dahtZpf0oA3xSijppPxHvAInFitOgVR
         yju7m124LP0tt9z21ltoDxAvtJazB2/+VGLWoXi/9WqoO2hKPUb+/wZRupECQNTs/Px7
         YOxFZnxZEpT525845OiMzwyzhPcIqjK2fEtCXXYa+SbHmVr1aLZSYKMmKcHDHraTZYJV
         Za1dOefPzThOIdJy9lc9syM6eAZh2q7j3nMSR66FE0QeETvLFGsqotZi5qozSmrB9E7w
         E/6A==
X-Forwarded-Encrypted: i=1; AL+hErF83NRffAkBGlODy44mmX/HDKIG+KaSeCYzcfL+stM1NyWlxDBIest1unwvzLhMhNGkXTN3crutzuXjUY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pYC3CfhPPMyUderFPboo3R/RGtUtz+5ccvvNaiTt1ZJOn/bKO
	UVWFZi9KC9GXeM+Ki3PX5uu8yiCqgvYTN9F6/dVL8LZ80BdToxWA/wM=
X-Gm-Gg: AZFdTZcaZn2+S/v9/jMX3liclb6tVT1u/UcrP55N4VMhjDIMHpuzlUfLYWHka0HbI7/
	EXYAhf7T9m5YYzzSgIhRYhtzUtlA10wRGUnq0dmnKFwY0NLqdbNTKX7X2dprmy2Wh/0aObLf206
	AiA/xi61/p2pOkRr1ZW2gkFXV+ZyLrR7NGwHZjqTrNB7oObdrtkgDvteEGGXbUnU5hC44ivnfeD
	DAPqwHpR/rfzgHwz9rMG4/hdxxnXCm8+oaHgnv1eB6elRZ5pkUi7jOyzyLHVSg5+okZTFddWQBt
	RyIaREI8HRb2GiYUudpO29UOCU09EoQ8uQYY++RRiKmjVnr7aNxl0DLiaQe7Y9PrR4I918NoZw7
	QR8A3H9P0lKnDDu0x09QpuEKziBuhQTCzEb17UAvQhV7zBIGaJiye3ickjysoMvT+bTuhvLXMsm
	pjueAYt9/uw7TOuwX8SkmM51Jzh3ou53ONrJAc6HgzDzOShamjmpWJE5KrBdcrG6kYRSQSxzyTr
	RF7pUki3HuLslTdh5VM9ODmHSRp43xHWaK91sYB9ZzfOKNWjRPGag2kcLU7SC2uw1q0kt5qzhcZ
	q5kZbxEmrHECWw==
X-Received: by 2002:a05:690c:6886:b0:8b3:1fab:fbdc with SMTP id 00721157ae682-8b52051799emr73665767b3.64.1795630495470;
        Wed, 25 Nov 2026 10:14:55 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8cdbsm74546187b3.1.2026.11.25.10.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:14:55 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/3] tools/nolibc: fix strchr() and strrchr() for the NUL terminator
Date: Wed, 25 Nov 2026 12:14:51 -0600
Message-ID: <20261125181453.814976-2-svav2021@gmail.com>
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

The C standard says that the terminating NUL character is considered
part of the string, so strchr(s, '\0') and strrchr(s, '\0') must
return a pointer to the terminator. Both functions stop before it and
return NULL instead.

Check the terminator too and add test cases.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 tools/include/nolibc/string.h                | 10 ++++------
 tools/testing/selftests/nolibc/nolibc-test.c |  2 ++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/include/nolibc/string.h b/tools/include/nolibc/string.h
index 4000926f44ac4..2693b9bef43a6 100644
--- a/tools/include/nolibc/string.h
+++ b/tools/include/nolibc/string.h
@@ -111,11 +111,10 @@ void *memchr(const void *s, int c, size_t len)
 static __attribute__((unused))
 char *strchr(const char *s, int c)
 {
-	while (*s) {
+	do {
 		if (*s == (char)c)
 			return (char *)s;
-		s++;
-	}
+	} while (*s++);
 	return NULL;
 }
 
@@ -299,11 +298,10 @@ char *strrchr(const char *s, int c)
 {
 	const char *ret = NULL;
 
-	while (*s) {
+	do {
 		if (*s == (char)c)
 			ret = s;
-		s++;
-	}
+	} while (*s++);
 	return (char *)ret;
 }
 
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 1157b521e65b1..9e1d0f3afb901 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -2028,8 +2028,10 @@ int run_stdlib(int min, int max)
 		CASE_TEST(setncmp_blah_blah6); EXPECT_NE(1, strncmp("blah", "blah6", 6), 0); break;
 		CASE_TEST(strchr_foobar_o);    EXPECT_STREQ(1, strchr("foobar", 'o'), "oobar"); break;
 		CASE_TEST(strchr_foobar_z);    EXPECT_STRZR(1, strchr("foobar", 'z')); break;
+		CASE_TEST(strchr_foobar_nul);  EXPECT_STREQ(1, strchr("foobar", '\0'), ""); break;
 		CASE_TEST(strrchr_foobar_o);   EXPECT_STREQ(1, strrchr("foobar", 'o'), "obar"); break;
 		CASE_TEST(strrchr_foobar_z);   EXPECT_STRZR(1, strrchr("foobar", 'z')); break;
+		CASE_TEST(strrchr_foobar_nul); EXPECT_STREQ(1, strrchr("foobar", '\0'), ""); break;
 		CASE_TEST(strlcat_0);          EXPECT_STRBUFEQ(is_nolibc, strlcat(buf, "bar", 0), buf, 3, "test"); break;
 		CASE_TEST(strlcat_1);          EXPECT_STRBUFEQ(is_nolibc, strlcat(buf, "bar", 1), buf, 4, "test"); break;
 		CASE_TEST(strlcat_5);          EXPECT_STRBUFEQ(is_nolibc, strlcat(buf, "bar", 5), buf, 7, "test"); break;
-- 
2.47.3

