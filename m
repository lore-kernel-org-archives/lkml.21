Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059626;
	b=IUVemjm58C5/k7OW1wPD+biLqcNUkPC3PA5P/hdYuYnMOulayNlh2dqs0Aa5fInA15M4
	 Bm2KHhU8F1ZgQg1DM7MAnL9Cw48UvKMcc5vqQ2zplX3TUKP7Di7OzR3yHqCMIuon2UAr1
	 qZgeml3oSOVGjkQUT4xokhPA2UkNQsX/FtGkY5uCn2PRXwuBPLTj1pme8iHf5ucKQ+vNj
	 l1XcetVgMfUT7nt6MXbThGnc7S1Fp2EtTRGRJhJ9cyf+ZHL7zhy9vA14fm4JAlZsJdzte
	 wwBtaFMMOgX8pC5bPjXyxUxBNCoBcJlXwRUKBMIBhU3cwIlA6BHZDNlrO5tJC+X7B9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Yek7TewnI2aK5YoR43fTNF1BZ5xqsmq3IxR2HR2rn7Y=;
	b=o++Ttpc6/lkjve/DmBH0whpoFohfWDQ9IdhwIZqjZ/zkNj7dCZJSe1pyY8y5v/WKUJQi
	 +ryvuh85siXkx2hq5FAoDKWDu7FlT12xaJeJlWRUF6PUGeIts5ZpuUQfaTAz49auZCZF/
	 NIoaOhmH9iUsNS20cJ6GtEPCmdAIX8DyhIJ1ViQDZvWrQFuMIGKL4XxpeCyy48hEf7rDp
	 AeVf34DaMGWVkitHzb8GZjq+qBTUAg3thBCsPtKtyJ3VGBCVnMOsCtMPi02BPPBuUY5VB
	 i6Z377ynWKDIJ3wSrhfdJ/JEiOuzyYCaM+CyjgpE1Apr7ItdoyA4Flgd6SoprzNF5TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0s3eB1r3;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDF460A2609
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEDF460A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0s3eB1r3
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so4086353eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059625; x=1795664425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yek7TewnI2aK5YoR43fTNF1BZ5xqsmq3IxR2HR2rn7Y=;
        b=0s3eB1r3ycEvX9g8DGPpB1KJWDF6dVfHqq6SCdaoSqRvOZCmil5aijEwxt+xlC/p2w
         lsUkGYj5G+XyPXsFwdiX48cK+mmYaNzQ8AVYMuWmVjzJu1auP3hhvzTjDQexJ+nRWsMw
         QvaVzwQN42RBjKnwxFG/bO+ZuCRlACDj6fC+fIG/PeZ9ulhEJIj3TvvdxdFUnkllofJY
         xBP9nTaEmudtacad+JdODYKdlKEFpD4/dSrFS7D8Z5JPk3k79Xw517att6x48hUlYnBZ
         cjzTkhNdOZgQ5Dd5ndEnU9uu0P84wr5HONyGMM+DmPPs/8vkIMosFBn7ypjJR5muGaVM
         p8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059625; x=1795664425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yek7TewnI2aK5YoR43fTNF1BZ5xqsmq3IxR2HR2rn7Y=;
        b=1KuKsjO48EE9eFnwNxdJ//f06nSCthppGKP6+gJFlmbdQ5XmxO0Kp3LkRCI2vNa/KJ
         fBdqZ8DAHJ4esyEXgg4tMsvQBWkwfZIUQPdB+dlKIq0bl8uUvpN3ahGTUsPJWSpoggBG
         VXFDHXr6HIxEePE/jiX08c2IIdqyGRIGHHVzfMHwLYiKToB6nv+I8Qs4/gppkUuMC+r6
         FGUMzGMZEk/JXr46F7efJzqMiBQoxuN5tit6MVBPzZnN63/sRj6juqWgT0PMw0fkwFZ6
         iutVEGaCIKVdLcw9FDJICOhiUV1tqvmjuUgfSAmf2oMlgTZK2aFfT9quFD8SWIQH+3Ao
         f4Og==
X-Forwarded-Encrypted: i=1; AL+hErHXwLX2F0MmcrfCnfil6YZB8jlKlrLiBQePTINJuEdmNYBwWEPEX0sDPWqkcKgNcdbx/ure/o3kT6L+OH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UIdoMjv88IspiWTwLtq9TvexmgsR+iLHoaxYb75F19YXY/ASQ
	ARB6OpcxioRGcu2CzgKUqibaNQNRNPMViKg/fkT2mho37PvGYP2wt2dN
X-Gm-Gg: AZFdTZf0f8jP+fjVG4GWwwYR8dXci78YwiOMbE/Y+V3afl6MSZZcY0DR5lMvMVnVzrh
	a6/Kx8qyd9YpP0N99gwlzx9j9APJLmlItu1WePUdfj6xHrhI7Y6nJ1OOFp9F58JWuAK3E6Mw+MX
	EhbgYUFuepaBy5hz2vmrokeVrk0XQgiZditkA9hEG53GFWYvvv978ghl9FBIpjmW+QiA2wJw1Tx
	alE3AvX1EpVOFi/NNG9edtYzM8ykpUsF1wwHTz379++l+jdWxii/aqZ4ZIlg37FhL3Jdmupe5AY
	XZjSpPTSozMF+dLNwtVqKb0WUHfv8+HKKjfS7Fl/fvzxTqkVEyBApNIf/30ywXBnOy36qiI11V4
	R3H+ZOslmrYGvvgOsj871fcRb6u7R5HSuoMXHX76RZlbf8dtzDGvdyw/Qk8CaLnODK6zbqxLCxp
	TDbNAB4oSy49exGNXgky0hXGNcP9gNqUg0FEcv3PV63w8LnmTzKptWBMqntxhXeWwvrmf/n1HSd
	81W/AcXTMPSYOEU9VQlFhRis5mXCLyVTnENX8Cjy8f6Deivqr5vVGfENgQxP+vC/sVOIkv2NZM9
	K0vuife/tOzx6CTlKgo7Lk215LHyZTU4Gos=
X-Received: by 2002:a05:7300:fe09:b0:382:4c1e:1c1a with SMTP id 5a478bee46e88-3828151fe38mr4027686eec.40.1795059624746;
        Wed, 18 Nov 2026 19:40:24 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:40:24 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 14/18] powerpc/pseries: Annotate the DTL debugfs read lock context
Date: Thu, 19 Nov 2026 09:09:09 +0530
Message-Id: <6d09c4ca6a515ca5daab5e45695e63de0040ceee.1795058683.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795058683.git.ritesh.list@gmail.com>
References: <cover.1795058683.git.ritesh.list@gmail.com>
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

