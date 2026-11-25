Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571326;
	b=1u8bSRy5lHoOxps/Qa3tOKgxUhTETj4RMRQa5HsXffMmpHcAnEbCT7c0GlnJu9fB1Z2z
	 v39eTGRQsEVT1wgK3Z+ejN6hfduMrpXmymr6be3UKh7w3svq1hk9S/V9QUYCrrjfSemZK
	 5ZExgnW4blmyek1fOz1UiXZwhNuMBd7IYn6BZfSDUOeEx67gAGYIMfXY07xKlUcoI/leH
	 fXdVclWbHCMsGS60+9a8TZ3/Tn0j2kt6YHfz5lSnLWtgP93Nk5Y99QML9MdamJffSinD5
	 ueL09uZZilkD5EASD5eCQqxt4/V8Cg3K74mFd8SEGkiFiDJIgYRIPkUJtouUdU9EU8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571326;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=G9GwjP1n+5aW/+jCvP1h7w7bFauWyEWxkPada416+40=;
	b=QF6KqZMh15ju+ILFwZIz8ZKmgvINrkOLP96naVvuTqDKngf+aQkvhUrQIHkEBSJ4tATJ
	 BqleGQ03cgFVrNtOqEro6SCgDAw4+tdZhkFEvDvhHJQ2LhygGO1QsrD/2tL99d+11dB67
	 ClGRuXGTBykrb9sy8WEJ84YByWO6s/RtIZ7+sbyBuRRWRrZkj6FlfEnaYPtdVgBotCJpD
	 3V2PB8dVgB4Ab9mNB/DvYTrTRCtI3af45z8mjEb/4YAPqL9plWbvjaDblH95Kmh0BSTNN
	 INO3EiBrnqWHjyg0Pyf87Ll4vLbmFtSIOPD6Dyp5rd6UwJaI83Owc9VaZBawdTjIJlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=ctvnf78O;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=iXJb11os;
	arc=none smtp.remote-ip=188.121.53.13
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454CF606A690
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 454CF606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=ctvnf78O;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=iXJb11os
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27ixX8PM; Wed, 25 Nov 2026 01:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571319;
	bh=G9GwjP1n+5aW/+jCvP1h7w7bFauWyEWxkPada416+40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ctvnf78OuyZLtrA6TGzNeKCF/UIoH4emMzMwRVosN49ROvPDQybNHuYro0zD+dN/g
	 iN6P7Bj6gGMSNXdWP5XM/kxv0o5PLrlr74N85aot6YZCCxPdo2LdLWLOdFJS9dlKWq
	 3/fNePPdH4MD/wMTCcOxc3dWPBDnFbq7PjiZibF02mlNYQG1Dz0hpixe2AU3ZWRSLa
	 lxSxoy+7rihUwWwjXf7LVYAdonDqHfME+gKvi/Q3l4kvKyOoa6zefEfYYaOR3KCD/x
	 mXTtaCmEUS05T6HzS/ktv9dZtVzRrET2fGw50OeyxFiTFIMRNys8RI6Z+s59MozzrH
	 xXHlYxODIrFoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571319;
	bh=G9GwjP1n+5aW/+jCvP1h7w7bFauWyEWxkPada416+40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iXJb11osQjg0RH3a11v3qv6wluvohzgyjbTLGL6C181iBs/Oabl30KydHSaboXM43
	 puODaGg3RdDQqqMa/zpDAF+nbSvzKfmE6gjbLRG9rWFILSNLP9puhMC3jTgvtUr8ob
	 ZWiiiKjpQkcqxdHVZy6I2MRsOx97Cr1FIcZNIgCnHQIndVM09lkc2BNAWJtfeB+stR
	 8Ox7qr5Zspo+Jwb6nFN4poVSTvMi0Mo9S4OK82rpDUrPK+EksUuYDbnCMtmi/Wt3Xc
	 NoMXpmkFF/vYtQqvoB0eTFfQXx986s9X+4DcKSfvnXX52NzYD+iLwwTmBJonmqcJ3e
	 M+s8BEyGTTkzw==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e77
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=novXQP1oP690d8Wgf2EA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: a9c0df4a2bc7683ba152ee516f3d14f2:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 23/23] Squashfs: check index isn't greater than S64_MAX in squashfs_read_data()
Date: Wed, 25 Nov 2026 01:47:37 +0000
Message-ID: <20261125014737.347231-24-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125014737.347231-1-phillip@squashfs.org.uk>
References: <20261125014737.347231-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfBWhYi1Td8JVsctQgYg4Opq7sJhQ2vWEQEGtxs2vBoedL+PjmwrgGjFc/qa3pd94KSeIVwpBuyl2rcM+LpPPWVJOSFk2ACpTEFGLsq3b1vMuvln2D/8h
 AAQZ+X8JMxQc9rpcbwjE0k6GBC5ZX7/0r0yFzwBQCARvB2pj81IRWhtw5NE7G0tPLQiCBkFU8Jw5z3QLcjEYYByvZCyC5Sk56i1x8L0P/HDopML58LFsUcbv
 ed7nCHO6VWWXbulaJBNrBuzbKhsFK0Up5jmaQYr2MVayxoJI1xN5WBktRXtXsx9k

The previous commits in this patch-set now sanity check index before
squashfs_read_data() is called.  However, it is always wise to take
a belts and braces approach and sanity check at the lowest level to
trap any values that could slip through.

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/block.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index 20c3030b4f96..f2f03d815167 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -297,6 +297,15 @@ int squashfs_read_data(struct super_block *sb, u64 index, int length,
 	int res;
 	int offset;
 
+	/*
+	 * Reject index values greater than possible filesystem size (S64_MAX).
+	 * This also ensures the index variable doesn't overflow in the function.
+	 */
+	if (index > S64_MAX) {
+		res = -EIO;
+		goto out;
+	}
+
 	if (length) {
 		/*
 		 * Datablock.
-- 
2.47.3

