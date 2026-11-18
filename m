Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969318;
	b=CnXwb5ygtzsyRU4TuVHFDtO769ahqesU2twf4B1b6Y6RuLE66pSSkpSnx9Fgi8PILJMT
	 f94ZklOw00C+vbcydgk1UQlUzD04J5TNuRjzTuyXzbzpK5i09oLAricRiKuhdO/XvEez8
	 icNfR6CziEBeQyo5xSFOgOrvwQkP4kCmMXPgu+bV2OfyyeWmSK5tSArQAGFNOh99UQu+I
	 hJfa4K1RaLiu95LQ16vAUtCFxSKLSPacf3r7Ra3TDbb/sX/5PrC3Ud3NDWgz+F5JbstHS
	 Z1XwvdgoYpd+7cWm82po8g+esUzAJh+QMBOQQr6KCSaRG1cw6JmV7FIRYOEs1XUVvwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AW6pi0Cj9ME2bkQXK4xo+E+sfPR5KEsKdLAIxsgAUfs=;
	b=P+lSFUDx63o0Q008zynCXIJN+RkQqJGzRYPjN5h96vq+n8eLbmlPJACM2DHDpYlaPxqY
	 MhHwripqkP2QKJymDLDetJAcB45zWiyPfrhvHfH7gVWKhl88uAM6+tZdT9np59GAn4439
	 7tuB6KyIGyfDgGIyVCmfGLNXzTy6bmWCElJLTdzSZAYxZVIjM681Zo5yIyL+g3iVkPwMc
	 8LHp48M4NWHgTlPcnbcu+ggOH7SnCNqr43DbIjNjib/ChMKbtwCEGx7T65gjpXBE7aqRc
	 zGZEdIftFJWrP6/bSRaac0q15q5pbKxLcCsaeiCXvZ3dkGl5CPP4jdfsA1BVWgyivmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkJq7lQn;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 911B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkJq7lQn
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so1228545eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794969318; x=1795574118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AW6pi0Cj9ME2bkQXK4xo+E+sfPR5KEsKdLAIxsgAUfs=;
        b=wkJq7lQn7jQbkhb7zUt0fj8NVtNITkZPbZUlllr6I1BSMNVSomoPkPHuULigCx6/H+
         6wCbCjAImlBRRmDlIx075Jf1YRIrwKqHGdUwUvp3IrJOcuYGIghy0wS5tykRJ6L2mRiI
         ooHfah1NRrv3sfiWb7wa6djmy3H3REuy56MrF4Ip+ic2VJuD7Nh5AezM/6YAnryz68zE
         wBBbBLoQ20Wi8wGz2XNJR1kg24vMRIqyp5Uaqw/20vA4sDPcN9R2xoGi6jgoPXrksu/u
         ZI/B7ypPmiyvm2h5qf7iTfj0mjNzM15rVcend8xmG3Rrx3Q9atB9SCDQXfBjF7fSWwLA
         KzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794969318; x=1795574118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AW6pi0Cj9ME2bkQXK4xo+E+sfPR5KEsKdLAIxsgAUfs=;
        b=o14NSDRoSMTCfLn6BZEKBQdJMmOnpqgeSBWzpVN3OwMeUBiqF7UHp919YCRRwY36Fl
         C2luAw4ZEV+BXPPQTN8R0Ll5JNx7qYBKq6roE14gmRZRQL2QWwvrAWDbuMVWSGIrQJaB
         SPFkVrsC4TOqazehsFnwQ+Hv8LStDGjzDXgTx11iVSPTY/q21ZUvq6/iIvXK38tfJenx
         iRkUOI8t95GvDRo55lsrXBP76h93+Rprja7n4nS4erHMWUhOvjcfwBifPMsfb8zrX7kB
         6hquRz/1xqVFAdM2omjAL8uSl3JTLw4kBMIS4/SX6CI1uxm3zrr5wYgcLvURZk57FgG8
         dCQg==
X-Forwarded-Encrypted: i=1; AL+hErHmAubYg/TTO0xFt/+alLLBWQLi/pQd42OaIHBCx1QNVEhpUmqoDeeQXjFugxEvDTYyGndwLzTBZc1kklk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SAkxGAW10SLg42o1bujs2gdjxy06gJVNELl3JbK0Yhw1dr630
	VjTeAEAq+xLBybi7ebBIc3vM/JIUc6qlzOxFq2cJf85y15AHpzsHmdep
X-Gm-Gg: AZFdTZemlsHbQVPJj5Leb2Xs5P0MqSnhQ0iotk6335lwxi3bn+gRzyoHMoYDT2/Kp2j
	HugpJc5gEBRKViH4uAtwk5jf4G5qMDLMC8Llek0TVdq+/CXmzuP+DLjJ/uIoM00AEFmrwhzfAX5
	u4dKbSoayuDrLCSd4A6huoA1hUEYsoIgC1xK9s7ATsOqyibjKGj0Xcb0o6B8rogVGejpdmHhX9z
	94SSnbrLv8q5OBCDb3SQrYjCLu36h3RQLtioZu/4mK7vZP6jGKMpML7a0zFuZHWe/m9+HpRqugj
	7pFyIfu7vmcUMN3DI75sD3gw1NxK+Uxcmi9/+NMEHV529jB/JCNN5zSaaNyFwHAx/+8dDOeW4uj
	QkyTnF9jlF5IJjJB+YWzooNCErQ1DwixxD1upMOPTRNYvnB1T4Y/eBWVIYzH5YaAk++aXTN8ckd
	LyE4kpqYTv/C85Y4Yfk9NgnqMMfsIf/m2IdMPCcVaDA+qpE0PUWxn3xwdnoOWhyVd4HeX1vs/gd
	f05FBuRtPnbMOm993B2CnyLARlveQn5bCFSWOUc3esg15S7pwHmzxv2zh5cHsq5uE+wdf5OvoJ+
	4PggsfociEpw6VvNMv+Wt1NtZza7
X-Received: by 2002:a05:7300:fe09:b0:382:4c1e:1c1a with SMTP id 5a478bee46e88-3828151fe38mr1178823eec.40.1794969317550;
        Tue, 17 Nov 2026 18:35:17 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:efcf:4622:136c:bde5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm2240332eec.6.2026.11.17.18.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:35:17 -0800 (PST)
From: mdshahid03@gmail.com
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] fs: sync: fix overflow check in sync_file_range()
Date: Wed, 18 Nov 2026 08:04:52 +0530
Message-ID: <20261118023452.48090-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

The addition of offset and nbytes can overflow before the result
is checked.

Use check_add_overflow() to detect the overflow safely during
addition.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 fs/sync.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/sync.c b/fs/sync.c
index 4a84dd837b86..9497604d7b17 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <linux/namei.h>
+#include <linux/overflow.h>
 #include <linux/sched.h>
 #include <linux/writeback.h>
 #include <linux/syscalls.h>
@@ -233,11 +234,13 @@ int sync_file_range(struct file *file, loff_t offset, loff_t nbytes,
 	if (flags & ~VALID_FLAGS)
 		goto out;
 
-	endbyte = offset + nbytes;
+	if (offset < 0)
+		goto out;
 
-	if ((s64)offset < 0)
+	if (check_add_overflow(offset, nbytes, &endbyte))
 		goto out;
-	if ((s64)endbyte < 0)
+
+	if (endbyte < 0)
 		goto out;
 	if (endbyte < offset)
 		goto out;
-- 
2.43.0

