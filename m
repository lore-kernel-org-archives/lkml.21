Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037337;
	b=wghAcQbBXqlXez7L9AluM+8mDoLspd2RESn4vx/UDzi8Ltn8JJ0LoYmsszczGyZGGJJc
	 VexUTzl5uitQDRxitfXdGwWxwbRl9glTI7ZMVeB1EkjYmVazK30l05QUUvkgEMdtwjDhR
	 qeRxpZm9pX4dyWujV65qlzjTuZl6c05SuiYb2h5dRZK/k9GVXZAJDAlG2gv3tG0Hut6rq
	 an9Ht28Wr5ixfsutbKKozvJDSedTloSBj6Weofh/GbHgOwW3sw4K9JOlVn4jKa4L0BHUV
	 eHU0iuUl5SgLgvGtFE23n0bpVKoCYRaSce6DKQ7L8CG12Yv5JC8Jg1GBJiF3BMi5VXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L1yhfvEqBP7e5XFUmbUnaIa/8XvUMLf0rUD2vnzu2NQ=;
	b=aMf09OBGv0PnA/4AvXfevEs2Ej9aBBeXpZS3y0T4Dd6ITbr9dIEFHerPY+dhphLNTuNI
	 6h0U3F/AW4iQ9VzYxT9XD4sebhtOL0AZIlDRZoz1kUJ5FkJXobieKMkoOIYZcvVHnB6oR
	 gQWdD2e6rMQSUV3raZ2Febpy2MfWUzXlVUKlU7gKPw3NBemcRGcv+5xY8AANqeCHoS1qI
	 xLWm/ENI6IO5rrzCjWnKPZLAHfnRrjuutZqYL54X/S/hZiocZJ/mZ8M2k51YjjErMuN3u
	 BXmE/eE1Xfij9tcuC4eApY4JvNm1Lg0ATFUlMBKL3vLnFbODOK18UB3Mmkwxp77BaWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iSvs7k6Y;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8418160A383C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8418160A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iSvs7k6Y
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so1017329137.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037335; x=1795642135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L1yhfvEqBP7e5XFUmbUnaIa/8XvUMLf0rUD2vnzu2NQ=;
        b=iSvs7k6YwjaxOvBDjp3PksIfFWqgtnS2UWETg9JQuN099NJd1V5afHew59ASHEXl0t
         /SbmR7llhG9ljkHTguJhDUZoA9ca9FbalTO6CTroVmSlRpekw/wR8CcnvQF4cq87YMYh
         mi/Z1Ga/fbnK6PtFPhzw9saeFY4wOdqc2zFxrrF8E1lFBGz3xnRD5chdVSgzoI8qQydz
         5SR8IQcafGMjeFyIm5Tfvk8qwjx2kTdHXGqG2MBjyKwUcrrAECkvG/utfbg2msB8Nnf7
         zSukO7U2vuN9arRWTK9eU1ldf7qlM0rRUB2bEzLnLXlx8rR0zp5zLamEzGabuhN/P/gJ
         /1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037335; x=1795642135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L1yhfvEqBP7e5XFUmbUnaIa/8XvUMLf0rUD2vnzu2NQ=;
        b=Xilh+7+o1AF2/A8dPN+rUFhWsUgIei78GOE4yKe/mWcH1BpbQxjnsCdbIFT1GTBJi0
         Y28Pcn2j/XD0CGaVQCaYoTCaSrfrcGfgPhFohNVuQL98pTO0YXo0pjCEGfBPRAVQ+7jd
         SZu0W8AQc18r2uwf5svCsFmvJ76jeiCwgsxkTj49uk9Ch/Nmu9mPN9TAbeLBS6zvWPe2
         XkWnE0+m33efy9gzvRCH0FYZ2ERBpPqZbISjpv7Ck5erDkWdly6QhFvV2v7cDHqkW05q
         sSQ8SyS9jD3L+3BC1xB2kZGGsySC1Uhj8JzSUPsQm8jZCb/T+0zi3vmWYAQvCe5FDIgR
         0Ywg==
X-Forwarded-Encrypted: i=1; AL+hErHiP4brSkhadOrlDw9sTgHb9ZtIAQG/tzfXcSq9P1n5OJ3fH81aaG3vkxk+Vu2Pr8lKIaqyBFKgEx/0Ds4=@vger.kernel.org
X-Gm-Message-State: APuU4Z87+rGvjCsVB6BKYJ8m5kXJR988gBvE2djFZ2V4aJOCQUJz6wgZ
	7+pjIYML0lt7ONVXWDIoKRS4svqWLvHjtEvFbvDV1/Yj655m+Ior3vtyy5GG581fN7Q+jD2Sm4j
	xPXAE
X-Gm-Gg: AYBFou3gvqSgnjUflvYug4RFeHzqRbntgKofrZ4ogHUqS8XVY0iz7SuK4tY9PEROf0J
	ITTXEB+/o8XuV60Txh1BZCzyhwxJEvykAUOz9jeFOQ0hn5vHS56HrBX7V7PPL0bIB1rWJ+PLQHa
	16IblV+/6a2cNXH2PJledOhsswt7Wyx8rbixX24trwUL4DvCx9eQUERte4GKuNIpSs4OCfvv/aN
	Ea1XJQZZ2iqHAX/4sGZuBc2MLlOsflvpWHNNx3s/8RkmO/eK+sCW+KGFznrI75v2dEoqXvGWrPK
	NATe0QIVM4KqaX4fHkNB6Cli5AO/CS5bLyUBWhqO2ASyQOU0x6KM9G1Mn2s+hlJz/E+elti8/oa
	YBZYv9dOBmTDNlPG/JxN79z7fWz/243thHnqEMNZ+HMkWgF/V9SbhWpOaXBwRZcx1CHS6YxGfQC
	hBUYDSvMJN0BsR5xueHgYjcPsQ1O4Yn+/N5tnmTy7BB7Vn37ly0Gwk9tQVnlwuMJR/uCilqRl8j
	ZRSVBEVglWhhO/AVymFIO+N/4HvBU6uAORqbTk3Z9rpx42FTlmXczTykyVdloiE2EV5GskUcwcI
	DU2M7yKhOC1ZkbXq7Py82UzAFfTMDaxYQrixMcmkVavZUOna9YFmDyUibmfkdB18ezG8XwieD6D
	o5bKn3AE1SiYwkazuL7p3sJBl9vWgmdFRTLAQ/bOpeDcB1Umdw5V5sET4HX4XG3Lied3lLBqi5Q
	==
X-Received: by 2002:a67:e113:0:b0:7c3:2b19:6267 with SMTP id ada2fe7eead31-7d6ba46ca11mr1512091137.32.1795037335676;
        Wed, 18 Nov 2026 13:28:55 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:28:54 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-api@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v6 7/7] selftests: liveupdate: Test LIVEUPDATE_SESSION_FREEZE across kexec
Date: Wed, 18 Nov 2026 16:28:42 -0500
Message-ID: <20261118212845.2855249-8-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
References: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
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

Extend luo_multi_session.c to exercise auto-frozen, kept-open frozen,
closed uncommitted frozen, and closed committed sessions together across
a kexec reboot, and verify that freezing an incoming session returns
-EINVAL.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../selftests/liveupdate/luo_multi_session.c  | 36 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/liveupdate/luo_multi_session.c b/tools/testing/selftests/liveupdate/luo_multi_session.c
index aac24a5f5ce3..3b09cd63c832 100644
--- a/tools/testing/selftests/liveupdate/luo_multi_session.c
+++ b/tools/testing/selftests/liveupdate/luo_multi_session.c
@@ -15,14 +15,17 @@
 #define SESSION_EMPTY_2 "multi-test-empty-2"
 #define SESSION_FILES_1 "multi-test-files-1"
 #define SESSION_FILES_2 "multi-test-files-2"
+#define SESSION_CLOSED "multi-test-closed"
 
 #define MFD1_TOKEN 0x1001
 #define MFD2_TOKEN 0x2002
 #define MFD3_TOKEN 0x3003
+#define MFD_CLOSED_TOKEN 0x4004
 
 #define MFD1_DATA "Data for session files 1"
 #define MFD2_DATA "First file for session files 2"
 #define MFD3_DATA "Second file for session files 2"
+#define MFD_CLOSED_DATA "Closed session data"
 
 #define STATE_SESSION_NAME "kexec_multi_state"
 #define STATE_MEMFD_TOKEN 998
@@ -30,7 +33,7 @@
 /* Stage 1: Executed before the kexec reboot. */
 static void run_stage_1(int luo_fd)
 {
-	int s_empty1_fd, s_empty2_fd, s_files1_fd, s_files2_fd;
+	int s_empty1_fd, s_empty2_fd, s_files1_fd, s_files2_fd, s_closed_fd;
 
 	ksft_print_msg("[STAGE 1] Starting pre-kexec setup for multi-session test...\n");
 
@@ -57,6 +60,8 @@ static void run_stage_1(int luo_fd)
 		fail_exit("create_and_preserve_memfd for token %#x",
 			  MFD1_TOKEN);
 	}
+	if (luo_session_freeze(s_files1_fd, 0) < 0)
+		fail_exit("luo_session_freeze for '%s'", SESSION_FILES_1);
 
 	ksft_print_msg("[STAGE 1] Creating session '%s' with two memfds...\n",
 		       SESSION_FILES_2);
@@ -72,6 +77,25 @@ static void run_stage_1(int luo_fd)
 		fail_exit("create_and_preserve_memfd for token %#x",
 			  MFD3_TOKEN);
 	}
+	if (luo_session_freeze(s_files2_fd,
+			       LIVEUPDATE_SESSION_FREEZE_COMMIT) < 0) {
+		fail_exit("luo_session_freeze for '%s'", SESSION_FILES_2);
+	}
+	close(s_files2_fd);
+
+	ksft_print_msg("[STAGE 1] Creating frozen uncommitted session '%s' and closing FD...\n",
+		       SESSION_CLOSED);
+	s_closed_fd = luo_create_session(luo_fd, SESSION_CLOSED);
+	if (s_closed_fd < 0)
+		fail_exit("luo_create_session for '%s'", SESSION_CLOSED);
+	if (create_and_preserve_memfd(s_closed_fd, MFD_CLOSED_TOKEN,
+				      MFD_CLOSED_DATA) < 0) {
+		fail_exit("create_and_preserve_memfd for token %#x",
+			  MFD_CLOSED_TOKEN);
+	}
+	if (luo_session_freeze(s_closed_fd, 0) < 0)
+		fail_exit("luo_session_freeze for '%s'", SESSION_CLOSED);
+	close(s_closed_fd);
 
 	close(luo_fd);
 	daemonize_and_wait();
@@ -91,6 +115,13 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 			  stage);
 	}
 
+	ksft_print_msg("[STAGE 2] Verifying closed uncommitted session '%s' was not preserved...\n",
+		       SESSION_CLOSED);
+	if (luo_retrieve_session(luo_fd, SESSION_CLOSED) != -ENOENT) {
+		fail_exit("Expected -ENOENT for closed uncommitted session '%s'",
+			  SESSION_CLOSED);
+	}
+
 	ksft_print_msg("[STAGE 2] Retrieving all sessions...\n");
 	s_empty1_fd = luo_retrieve_session(luo_fd, SESSION_EMPTY_1);
 	if (s_empty1_fd < 0)
@@ -108,6 +139,9 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	if (s_files2_fd < 0)
 		fail_exit("luo_retrieve_session for '%s'", SESSION_FILES_2);
 
+	if (luo_session_freeze(s_files2_fd, 0) != -EINVAL)
+		fail_exit("luo_session_freeze on incoming session did not return -EINVAL");
+
 	ksft_print_msg("[STAGE 2] Verifying contents of session '%s'...\n",
 		       SESSION_FILES_1);
 	mfd1 = restore_and_verify_memfd(s_files1_fd, MFD1_TOKEN, MFD1_DATA);
-- 
2.56.1.708.g77570a6a1d-goog

