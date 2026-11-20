Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147473;
	b=XMrVelpkbVug2o6+Acs5FP+QAEgR5g8fv1Mibm2OhJucCF5uMDH2m322sfCysg7UHT7h
	 1c4wbdOfEeH6qk9dmwHLMlJrXId8I5dqaCHGHtS5hBlsKXYMjNVeE9xBDHtSKOCRS/y5u
	 2xuDh6cGqpd82SqwRD5xpJXo6b+SKCwA3cikJbKQghhU63wO76Y7poGDGaXWRHRi45LKJ
	 6FgKxZhg56GxVypYhNTCSNEliqANbKTavcXDq/rCNYjjDmVB4DctIV21B82/MCwc90VlL
	 Xty4RbBMPF34uUSqrpymetuROm8AaJj9f8hrOTZK2bupF6NDZ4Bn6q6uMVXcgCfQJ8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Yek7TewnI2aK5YoR43fTNF1BZ5xqsmq3IxR2HR2rn7Y=;
	b=TExWmBRcXbYZpFu746ndCG6y7mM3qnN0mCVMIdRDPMF7mSCldQlg7iXPoEyXrR3erQLz
	 YXK13bCKd3tiwtuVZeA2TtyRqMAnmHN2jcgcYVAULAQN3sr9+1TnSxvHz1aIhPArit7+9
	 MajO/SS8l1Wx4O6cPXA1CrYIo7A/N3Wnci9iCN0fzfudcG8DOBHefavRaf7gu69+MVW32
	 ZyapPKSUg5vL0cOoSepRXp8coBXKQwAfGxvQwo70/55KPNgDXnAu6uU3gy4lDOLUPOzyb
	 QeM66ZjLHxCXBOPQ354SgCGFnZZGZBg32CEb86OKMQWtUh/HZTkoO/q80VktVguqlKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BRp+T6GY;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB684606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB684606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BRp+T6GY
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38564b4b017so486827eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147472; x=1795752272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yek7TewnI2aK5YoR43fTNF1BZ5xqsmq3IxR2HR2rn7Y=;
        b=BRp+T6GYrD2T1p00UHmjMOBFHVaB72hipbL6XIW5+iHHzqq1TzxknsJzl+P85i4kYT
         UfcY7HYm3qlkMRAjYucpT0oXW1FA8h3NHy2OfkXO5b0o0wYiHnqz1bsUTQ412+93Mxph
         4y7/dcuOMFSAK2rSCC5wLDZDdOstzUROpPbOCXSraRvlXWiCu8gGx6TDv0QfUkKfPuSy
         RFNQqzBwCvXTTgIxjeQGyth/olpZmUaroZ32PCyJDrru7acl7W7eQ7k6V1HSDFcW5oSp
         FeJVjaz0P4W9Rs7nMg2bkfHbjsJzrcw/YrzjLrdCg+uW2rBGRQBXntJgm+Pu++FBn6HJ
         /2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147472; x=1795752272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yek7TewnI2aK5YoR43fTNF1BZ5xqsmq3IxR2HR2rn7Y=;
        b=geAvIJKuWFFQ0yytyul6Am9AhYV4+Bm82xVAM+zOMCReONg3naHcqStZdvT5KHPO0Z
         jduo3zt2FwqMEnwKtiRaREW1pOrMzUFYgmbHeGj/yQPEYFQmk0ont9iuGIZPP147BPqO
         sdXsYXqzNo9bdQmvlNvswWnPp32a33gXH4Oz42cJXlJKMh8ChReVZZSYF2C+zPpnknxg
         dskMvF+iugn/1AD+8Vqva1YuMftQVohCjPIOl/Ad//ga3psyJB+8bhg4r+fqnNNlC7cJ
         fykBjgAgxN0MBXqsNc1n899wP7FMNnD20W14Xylquf8zC97kJ1lTijDMweUFK3CRyl5D
         0XWw==
X-Forwarded-Encrypted: i=1; AL+hErH9Aj+JLImyvj81zidQznQVYAYU8mOr1tqS/49+twknIdNB8CARt/morlYWWhOXjHww/iDS+1D/Kzf3h/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/34ABPl4nVOj07eqVyw+EzX+v8FoksOvUnDuKq9uPqtS6UYXY
	k+wkz2yoosfGxQ0Ad7bzn7B3gB9y7YEmOf8k6Q+ieqIUbF8N338vP5iB4t1R7A==
X-Gm-Gg: AZFdTZd8sjDQizn2HtAkyQK+XZ+nyeUWvRIauucFmkQNsE2xWucfXon+qr2esIellna
	gCZxOy9SKLEXzilbjL4MP195aGqeZXGaftdFe2KT4Zo4iWMluUwWxIsihE3JIr1np/81WvJyyBH
	ApI8vSSm+v5SwkKKh1w8Pn1OTgqYR8rNGzh1v0t+A5zdSf+NUro0T8hZr7078S7yy9xBObF/6V5
	h+elU0ypN0mW3qPCOngnWXCbLD1se5r6Ch5m5OYlvjtmbZGgyD+MSgBUdmNocXOvbQN6q3LbKlQ
	KEUI6EMkqUg//JPL6Y6CoEi2Zpd9Pn9HXESjlMpiPY44VOk78HwVIrAYuyI6KtGeXuGY3XjbGor
	axuo89w7q39aLepFH+Cv9pNeZyWz3YZ1ubTzcPpJ/BmL4OMo5+BkBCOHmY6rkhlKnrR8Nhwdu64
	eUL3BHAwIr7lJKprglcvgELflylosmj42Cj05ma+7/2syir0Ab7+DjtpDqZCLA1XeLwV/LwXXUG
	563IfBbpy1nvS1uxBRfzA/LeFuSiDYv+FuPKLFZbxD8nWdHPz0GTseqq+niwozeg3jZXkuwX7oy
	yEo7vTHARnK5A3djsT19WCSE1X4K6AGwUw==
X-Received: by 2002:a05:7301:1403:b0:385:5297:573 with SMTP id 5a478bee46e88-3856f25fae8mr1480843eec.4.1795147471843;
        Thu, 19 Nov 2026 20:04:31 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:04:31 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 15/19] powerpc/pseries: Annotate the DTL debugfs read lock context
Date: Fri, 20 Nov 2026 09:33:14 +0530
Message-Id: <b4efabdcaf62c35b3fa0ffbd93aadef11e43479b.1795147055.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795147055.git.ritesh.list@gmail.com>
References: <cover.1795147055.git.ritesh.list@gmail.com>
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

Clang's context analysis reports:
  dtl.c: error: rw_semaphore 'dtl_access_lock' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  dtl.c: error: releasing rw_semaphore 'dtl_access_lock' that was not held [-Werror,-Wthread-safety-analysis]

Add the necessary annotations to
	dtl_{enable|disable}(), dtl_file{open|release}(),
to fix these errors for enabling Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/dtl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index f293588b8c7b..18c597210103 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -177,7 +177,12 @@ static u64 dtl_current_index(struct dtl *dtl)
 }
 #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 
+/*
+ * On success the read lock stays held until dtl_disable(). That covers
+ * the whole time the debugfs file is open.
+ */
 static int dtl_enable(struct dtl *dtl)
+		__cond_acquires_shared(0, &dtl_access_lock)
 {
 	long int n_entries;
 	long int rc;
@@ -225,6 +230,7 @@ static int dtl_enable(struct dtl *dtl)
 }
 
 static void dtl_disable(struct dtl *dtl)
+		__releases_shared(&dtl_access_lock)
 {
 	spin_lock(&dtl->lock);
 	dtl_stop(dtl);
@@ -238,6 +244,7 @@ static void dtl_disable(struct dtl *dtl)
 /* file interface */
 
 static int dtl_file_open(struct inode *inode, struct file *filp)
+		__cond_acquires_shared(0, &dtl_access_lock)
 {
 	struct dtl *dtl = inode->i_private;
 	int rc;
@@ -251,6 +258,7 @@ static int dtl_file_open(struct inode *inode, struct file *filp)
 }
 
 static int dtl_file_release(struct inode *inode, struct file *filp)
+		__releases_shared(&dtl_access_lock)
 {
 	struct dtl *dtl = inode->i_private;
 	dtl_disable(dtl);
-- 
2.39.5

