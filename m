Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037335;
	b=4JpYhMQ/oyYoPBOszZi5rq7qdPsshEjdVWq+2oHmVGjkM79UISxQm4x3Sasb02yf2rmE
	 AmkkHbm7ZCH1gJkKOpsYA2NGkG3uaiASIzlIRFFLLyInbyoXwH1T9+reR7ddauNgn964w
	 BKNsF7MM85yfa6QmekYqJ+h/MrJ+f32ouknVcSBZRPoEtMQZN/lhRa6Rc7egQFM5P+bVS
	 ZTvNTVRTDfl0ASsegSfxR6z5kfdg/hoiArFr26AQ2NsMUO7M1LxW+Kjye9qSjFRBTeTNK
	 wNyTUAQ2WoZ/TxoOwZEq748XcjfSI9+hwgBgeoBgN3TspHGSTqFPFfvQ2koRPfFYhkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s4n5oLhMYFN0GZT8T1PCl7tWuEXQGuvdSxMt72RME2E=;
	b=qKxogfhfyT5zTmHWCSY31tUc1B4rWhwtBB9Gu8RIeCWp19fVCP66YUPs1AIPIkO8Wg6A
	 H5LZkHA/LSG/yMhSh/P5UK5IwkY9Z3myNVETAbR1Ob28yw2Z/4JR6DRvIKjw0/Rqy6vpj
	 rn7Izk0H2soCHGPQCvyJJj+UPJ+lvxOHONuvprsSkYCpv61bABqw0RC3mBM8n4/DggGI1
	 WE6XhBk/ItdcUvD0JNGpQVNgufwjrALLH3FPQHNYV2HZw3+hcTvU7zg0CZpZ76nZigIrQ
	 tguG4NaIpK4EtID8CHX5tgVpeYedDAMMdIjO9o3XO2jQXspyiVCvn3iUL0qTKANCurQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DOjwVFMD;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712DE60A381A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 712DE60A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DOjwVFMD
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7d2c8141dc6so725106137.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037334; x=1795642134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s4n5oLhMYFN0GZT8T1PCl7tWuEXQGuvdSxMt72RME2E=;
        b=DOjwVFMDfcMo57qcwPQexgRTtJ0WzI9qCReEasXVrgqEWpoptSAZ8EiO6SY+KBhmSt
         /mH9YngiZeYLZlw1qcnMhSZ8DkTcEtDddhbQxHDeIB+R63DtLzHMTLeWVryjDdCLTHbz
         AWTTlvc+CjIYNgAUi6mw52l5zJ5aBZheMgFYPh2Hk51rrE74237uB4YnPOTy0AmYFZan
         B8bqcVH8j2nn+3mkI9X0uVPSXrMWlXfdTAQrGAI8bQxPgUs8uZbFLD5gYpDFkjSrk5az
         4kMLST8/D7yE6ut+5k8xblahHCDXf2wCzdWyy4eQd+8O/HTk9c2shtP2RRDIIea/7qxF
         /xqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037334; x=1795642134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s4n5oLhMYFN0GZT8T1PCl7tWuEXQGuvdSxMt72RME2E=;
        b=odcaMtCvroLVOdSrwXq2n6Ey/9Fq5OIrbJx5v5nviVxmy+qVO3cUkdc5l8RnK13oKt
         MEQqvRsuxtFVHWGVQh4veoQf1hc+qf4Lf9fByHvHkrBM5qmr7UWBUd6wmMutmowU6iqY
         3fBz+pexFD8rMKoW6bvpB4a+rfdnny5KkUaMJViqaohtwaOVJN/YjDpjppaWQf5DbbJi
         gur7HF76BKo7pPzORLrMX+I9e48DLBzrgY6phPhGEhPY+BBgaaFQmyl8fIdTX1rweBs3
         Mpaek7LLYieQwJ6DeLDRO+XgFnQS4M+DfBHaEk8by1jKc5Ev0ecgJhE97ka8LOzOLTwH
         DnJw==
X-Forwarded-Encrypted: i=1; AL+hErHlTZUiItoZBQGGVU76iIpU/i2QiDBSslrob9vlcvkQRY8kvn+DbTPvL7fvV4wOQF3lfOR1ExaiWPZBob4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G1bAr/POYCo45HRuozuAMR3fqBUybray8vfwvtP6arwlZS6HT
	6WqDDDQZiRAcOYXJMCpyRXY0O2O4RsWu7isKe3gYGQ9R2DSXrZ2uk1SePAtPi4q8fd4=
X-Gm-Gg: AYBFou0lL5W+hFz9554cu1TaM3jnCp7AV6chbqMOCHtPcgbZFufZIYFzmO6/CiyMBdQ
	HePcFvx/P5Uc3qV/Mt4cSlSs6rQxihPKP/sXRhADmNFUwy1IezQHTEfVWWbcH2GTzmYAF9Pt8Vh
	WwhLP9WGzBGsKXvEtVVmwWBRQa8qbRRI8ZE854/ArFwYz2yGypQ6MHKvL+Iueu9ViCO3CvrRxIw
	MyvEkvKNZlHbIU5F67HuWlpKNb3rPi+o9Mea9hB/RArIqiVQ2AMWnB86cV2iJxIR39KnV8gACfQ
	DLMnYxJ3078vtPp4sxkgni3z4u/IRz1WbmN4z9FB+9MziJFyDiufknu1+6Ny1MPvG5UBvMKiKi7
	AZlXwnH1zeVC/pdy48Mkxrdjn/5WAVtr5OetlwyeRS/Nfz3FgVEFpmD4Cvi73m1oBq7ynzcBYP/
	R7Lkr8hedDV9rJLGx4jien2AyVEUNIZOd6GwfXEeNyasUBw6Z/BI92zqnzDbfH+QvlW2Wl4++6E
	GaALPQCdNXs0JYmu0sZsMDWp1Y4r7mhZkFB1wQCLn7/8haIp5T+1Ffcf6hMjUNqD8r77Wi8Bfe8
	qaMrgsRFFEr5s2M2WLA449uzbLF9uwipkp3408IMBrjQ4N/AgH+ydNKqJqYawEQMI8QNrMLUK5C
	xkov4tPv00h3yXSRo7vx+gtQo/MoIoeYGuYgQc3YxFm5R+DGcyQb6Ax8PQy/UHiezzcxjJfZU+A
	==
X-Received: by 2002:a05:6102:4412:b0:7d2:8529:6892 with SMTP id ada2fe7eead31-7d6ba3e7857mr1999245137.11.1795037334470;
        Wed, 18 Nov 2026 13:28:54 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.53
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
Subject: [PATCH v6 6/7] selftests: liveupdate: Add unit tests for LIVEUPDATE_SESSION_FREEZE
Date: Wed, 18 Nov 2026 16:28:41 -0500
Message-ID: <20261118212845.2855249-7-pasha.tatashin@soleen.com>
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

Add a luo_session_freeze() helper and unit tests in liveupdate.c for
LIVEUPDATE_SESSION_FREEZE. Verify negative cases (unsupported flags,
double freeze, and preserving files after freeze), that closing a
frozen uncommitted session unfreezes and returns resources, and that
closing a committed session retains LUO ownership of the session and
its preserved files.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |   1 +
 .../selftests/liveupdate/lib/lu_utils.c       |  13 +++
 .../testing/selftests/liveupdate/liveupdate.c | 107 ++++++++++++++++++
 3 files changed, 121 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index fa07fed08364..34657d6eb67b 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -26,6 +26,7 @@ int luo_create_session(int luo_fd, const char *name);
 int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
 int luo_get_session_name(int session_fd, char *name, size_t name_len);
+int luo_session_freeze(int session_fd, __u32 flags);
 
 int luo_ensure_nofile_limit(long min_limit);
 int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
diff --git a/tools/testing/selftests/liveupdate/lib/lu_utils.c b/tools/testing/selftests/liveupdate/lib/lu_utils.c
index 74d41115c281..51384374305d 100644
--- a/tools/testing/selftests/liveupdate/lib/lu_utils.c
+++ b/tools/testing/selftests/liveupdate/lib/lu_utils.c
@@ -198,6 +198,19 @@ int luo_session_finish(int session_fd)
 	return 0;
 }
 
+int luo_session_freeze(int session_fd, __u32 flags)
+{
+	struct liveupdate_session_freeze arg = {
+		.size = sizeof(arg),
+		.flags = flags,
+	};
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_FREEZE, &arg) < 0)
+		return -errno;
+
+	return 0;
+}
+
 void create_state_file(int luo_fd, const char *session_name, int token,
 		       int next_stage)
 {
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 2dedd5fc2534..4b0c0fb1be87 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -530,4 +530,111 @@ TEST_F(liveupdate_device, preserve_many_files)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Session Freeze
+ *
+ * Verifies LIVEUPDATE_SESSION_FREEZE with flags == 0: unsupported flags return
+ * -EOPNOTSUPP, repeated freeze and post-freeze preserve return -EBUSY, and
+ * closing the session FD unfreezes the session and returns all resources.
+ */
+TEST_F(liveupdate_device, session_freeze)
+{
+	int session_fd, mem_fd1, mem_fd2;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	session_fd = luo_create_session(self->fd1, "session-freeze");
+	ASSERT_GE(session_fd, 0);
+
+	mem_fd1 = memfd_create("freeze-memfd-1", 0);
+	ASSERT_GE(mem_fd1, 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0x1111), 0);
+
+	/* Unsupported flag bits must fail with -EOPNOTSUPP */
+	EXPECT_EQ(luo_session_freeze(session_fd, 1U << 1), -EOPNOTSUPP);
+
+	/* Freeze the session */
+	ASSERT_EQ(luo_session_freeze(session_fd, 0), 0);
+
+	/* Subsequent freeze attempts must fail with -EBUSY */
+	EXPECT_EQ(luo_session_freeze(session_fd, 0), -EBUSY);
+	EXPECT_EQ(luo_session_freeze(session_fd,
+				     LIVEUPDATE_SESSION_FREEZE_COMMIT),
+		  -EBUSY);
+
+	/* Preserving a file after freeze must fail with -EBUSY */
+	mem_fd2 = memfd_create("freeze-memfd-2", 0);
+	ASSERT_GE(mem_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd, mem_fd2, 0x2222), -EBUSY);
+
+	/* Closing the session FD must unfreeze and unpreserve resources */
+	ASSERT_EQ(close(session_fd), 0);
+
+	session_fd = luo_create_session(self->fd1, "session-freeze");
+	ASSERT_GE(session_fd, 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0x1111), 0);
+
+	ASSERT_EQ(close(session_fd), 0);
+	ASSERT_EQ(close(mem_fd1), 0);
+	ASSERT_EQ(close(mem_fd2), 0);
+}
+
+/*
+ * Test Case: Session Freeze and Commit
+ *
+ * Verifies LIVEUPDATE_SESSION_FREEZE with LIVEUPDATE_SESSION_FREEZE_COMMIT:
+ * once committed, the frozen session is serialized into KHO and survives
+ * closing the session FD with ownership retained by LUO until reboot.
+ */
+TEST_F(liveupdate_device, session_freeze_commit)
+{
+	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
+	int session_fd, session_fd2, mem_fd1, mem_fd2;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	snprintf(name, sizeof(name), "freeze-commit-%d", getpid());
+	session_fd = luo_create_session(self->fd1, name);
+	ASSERT_GE(session_fd, 0);
+
+	mem_fd1 = memfd_create("freeze-commit-memfd-1", 0);
+	ASSERT_GE(mem_fd1, 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0x1111), 0);
+
+	/* Freeze and commit the session */
+	ASSERT_EQ(luo_session_freeze(session_fd,
+				     LIVEUPDATE_SESSION_FREEZE_COMMIT), 0);
+
+	/* Subsequent freeze attempts must fail with -EBUSY */
+	EXPECT_EQ(luo_session_freeze(session_fd, 0), -EBUSY);
+	EXPECT_EQ(luo_session_freeze(session_fd,
+				     LIVEUPDATE_SESSION_FREEZE_COMMIT),
+		  -EBUSY);
+
+	/* Preserving a file after freeze must fail with -EBUSY */
+	mem_fd2 = memfd_create("freeze-commit-memfd-2", 0);
+	ASSERT_GE(mem_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd, mem_fd2, 0x2222), -EBUSY);
+
+	/* Closing the session FD must retain LUO ownership of session & files */
+	ASSERT_EQ(close(session_fd), 0);
+
+	EXPECT_EQ(luo_create_session(self->fd1, name), -EEXIST);
+
+	session_fd2 = luo_create_session(self->fd1, "freeze-commit-check");
+	ASSERT_GE(session_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd2, mem_fd1, 0x3333),
+		  -EBUSY);
+
+	ASSERT_EQ(close(session_fd2), 0);
+	ASSERT_EQ(close(mem_fd1), 0);
+	ASSERT_EQ(close(mem_fd2), 0);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.1.708.g77570a6a1d-goog

