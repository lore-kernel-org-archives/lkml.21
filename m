Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147485;
	b=zeETT5ulmZ28xROZnvWic7uY1wKhp8LEmx/hvSfXLe+N7E3Wy82R+8OJi1BXegSBA81f
	 Suz11rGD7YXruUHmP+gkoNLDuKltXJkcFB9P76MjG8DfDka3EibBotL93IHaY4jl4v3CW
	 cKw34YbsNleH904FTpGXheQjdXks+rTZSpl0VFWfWWdBFD4KjJixiytUoC5Iys/L3aUUT
	 GZ4AcMfRj4y02WCRoOphtAE/sMSbQRtX+pnF5QW5Yio+lYSYPCPKFW+LdonejwRxw65LE
	 Vkic2QlTQDwpZbprWAFxHH1HyU+I0vFb2Kwq7DsiWQh6tT9ns3/BL6UsnsHNkmr4usg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A0MBPJOKvnLE5rP9NIQzyUeRKGazCi9hDA+IfnK6LUo=;
	b=qGL4Qji7ihLxv1qupPc+Jcx0ak1fgnlmWkoDrqx+/PfqKjFil77hyArnZu/9ABn+FrRB
	 3FdQa4vAM9AfinpoOfW4XqwI/XkmXFE7GINPA60KDbjyMtYCj8P+1xtcE0bHzNSE61fYP
	 TPrISa2VjYaiVEVJ5Vt12sYMzCfuUchMrEoXvxoi8t8pzf903PF26oqNmbPhJj/O2spOl
	 iq+FY7X2S4mWOQK9cLDDsRhpgdvlMG3f/F4s+2YYLXC72+65w16E5XHS7MCZM07rIFppT
	 bOcxN2ASuPE9qBszsPNLR4W9hGxosGkTvduE9SAyczeQiJnBJtU057BDtd4p/GK+dGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jhbZT64i;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F079606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F079606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jhbZT64i
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3b4944abeso428747c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147484; x=1795752284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0MBPJOKvnLE5rP9NIQzyUeRKGazCi9hDA+IfnK6LUo=;
        b=jhbZT64iVoeVdQg8TchoerlntHS1udZnNbDG+Ov0wynleMU/V3beiw4CtcHrCZv/QM
         FstXM2/dMMpZ0Efz8uYTZisZtysrOM4u9Oszs47t3BgRkXbXQ+sgwU7+QsAFSpfGfa7w
         eQKmzjF4KD0CHsovp992+kJZ/PJZ0jRhmzUt0RF5d6f2EPURY1GkfO0drs+GiyW4CGfR
         JUPEU+VLDKFHwhqE6RyxFeJs0qXeiftEZCSwwMCKWfKO5Fzlg4N2BOyLVIkMy1+MlGtC
         gPFs/6ZlidVEsIB+TqQaoQDQAoTHlqEhudcWdkaRgoUdPq6H9iRLbRPEeBfQRAMGMowW
         Y7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147484; x=1795752284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0MBPJOKvnLE5rP9NIQzyUeRKGazCi9hDA+IfnK6LUo=;
        b=rjTK+J5WdEN+j4rKKEraTIearRtRwiXRYdTGn3Go9KdVk6yvuwTuwORg7Uj7DqNPJK
         b+HN0OH2b+e7/YOGjHP01byU875IkrIB5+5vY7jGiYlp6YO3uFb3UdD8PqZNMWQURwiH
         gwic1ecZGKAX4Cbs9oa+iei0u1h+mONLnjY9SwrfdccD4EHEQGEAjMIg7N+YfUoQ/VM2
         0/DKtmyzM57OXaccSc7SM+3w5I2CNXYIGq8YBRvsouF9E7WASB2w1/O9iSLoGnemc6L6
         xpDspf4bGfNeY9A2kpZqZwXXikRNX78dcDbKgxVIXwOOrvlalcDexYY2md8NtDLTdAPl
         mqMw==
X-Forwarded-Encrypted: i=1; AL+hErGCmcgJnKFtZblWp0xMfOdzZ4n/cH0uXn5rAvk7aZwfPBi0nT7tx7bMP/Y4PPk8Asj1Xd/q9zO4OaGPklY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sph6UwMXKP9q5LEi3OCDL0m6BH7UdFfoKuHtBVTNvuibgBm9C
	p8c/6zmCB0gWghlwWhlugxp4VT85CWIrmQttnRrUeCVcoYBr8sQneuoV
X-Gm-Gg: AZFdTZe9sk/sPwLqrbVWjjN0WaU9XKpqNCARZqS5WPpprix3oujC5LAR7ixY4MCgf3u
	qNYDBD+egWtU7upKCMvyMk1zQJ9mXapwbItNUkFU9QQpUSsTX6I6PAIe3wcyDZ3/vdxkP8+8wAF
	ydNCMh+ef9Nbp2JWoi7KPscvgTXq2PkVebXLHtKsRZhVs6CUrgEO6wkgxIuN4T8E69/R+zzvZMo
	tI5m3df2ZRHd8yd+P7hj451KVUmMQulk3D6ssjmP877rhOJta0eP9DFh860USxrc0KNHmdCOa0p
	BJHH8Dcq1OKRZgjWwy0J7+L5yamKn1OkLIqS+i+eRwpPKWvzIEXhQj0J2E2UNyCa1ScmGSmvp0k
	Fx1yaSkvYb1LASS5inKLaOez8XYxucL7dfflYvi/602PmG/Hc91C4FK900hOeg8KGymgr6pUtuf
	jPYZO4CEzOoJG3YVFVA+AHo1HiGwwSthcVFbevh+pPjFNwpbzbR+LtsngqWVAY3aidTA5RVVWfJ
	N4jU13Ip3Bn5S4X5pAEVsV6Mw2j1oTuZo0LPbyAEXqqAKOMi/vbNEUvkgZs1D8YzHEk01puBuso
	QFjtZJAHpLm/yzVevwA7Eq+5L84LCzZzbDk=
X-Received: by 2002:a05:7301:a0d:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-38570847a85mr1610871eec.33.1795147484154;
        Thu, 19 Nov 2026 20:04:44 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:04:43 -0800 (PST)
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
Subject: [PATCHv3 18/19] powerpc/powernv: Rework OPAL console write to remove conditional locking
Date: Fri, 20 Nov 2026 09:33:17 +0530
Message-Id: <2dc60ffe2b5c0d7e6dba3216b4c040ec9788e6c2.1795147055.git.ritesh.list@gmail.com>
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
  opal.c:454:7: error: spinlock 'opal_write_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
  opal.c:493:3: error: releasing spinlock 'opal_write_lock' that was not held [-Werror,-Wthread-safety-analysis]

This patch rework the OPAL console write function to remove this
conditional locking to fix the reported build errors while enabling
Clang context analysis. We could have marked __context_unsafe(),
but this anyways simplifies the locking a bit.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/powernv/opal.c | 30 ++++++++++++++++++---------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 1946dbdc9fa1..aea83c4be76d 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -438,19 +438,13 @@ ssize_t opal_get_chars(uint32_t vtermno, u8 *buf, size_t count)
 	return 0;
 }
 
-static ssize_t __opal_put_chars(uint32_t vtermno, const u8 *data,
-				size_t total_len, bool atomic)
+static ssize_t __opal_put_chars_unlocked(uint32_t vtermno, const u8 *data,
+					 size_t total_len, bool atomic)
 {
-	unsigned long flags = 0 /* shut up gcc */;
 	ssize_t written;
 	__be64 olen;
 	s64 rc;
 
-	if (!opal.entry)
-		return -ENODEV;
-
-	if (atomic)
-		spin_lock_irqsave(&opal_write_lock, flags);
 	rc = opal_console_write_buffer_space(vtermno, &olen);
 	if (rc || be64_to_cpu(olen) < total_len) {
 		/* Closed -> drop characters */
@@ -489,10 +483,26 @@ static ssize_t __opal_put_chars(uint32_t vtermno, const u8 *data,
 	}
 
 out:
-	if (atomic)
+	return written;
+}
+
+static ssize_t __opal_put_chars(uint32_t vtermno, const u8 *data,
+				size_t total_len, bool atomic)
+{
+	unsigned long flags = 0;
+	ssize_t written;
+
+	if (!opal.entry)
+		return -ENODEV;
+
+	if (atomic) {
+		spin_lock_irqsave(&opal_write_lock, flags);
+		written = __opal_put_chars_unlocked(vtermno, data, total_len, true);
 		spin_unlock_irqrestore(&opal_write_lock, flags);
+		return written;
+	}
 
-	return written;
+	return __opal_put_chars_unlocked(vtermno, data, total_len, false);
 }
 
 ssize_t opal_put_chars(uint32_t vtermno, const u8 *data, size_t total_len)
-- 
2.39.5

