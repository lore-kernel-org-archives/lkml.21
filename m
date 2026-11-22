Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795336739;
	b=g/EiiFFeg+da9GfW0UIajSSFi3wQUyxRLV5UYJ0Sq+zLXZTyVrOOXVh00e1MMDVe/F0q
	 xcHtI4bBzZD2b4vcZimrEkeKcVSRPFaf2atur+VjrmwCFR1HwDJVU665bGQPMdPkyhPBn
	 IKgjxhYdOnhSppwi4qbsRN60yYb5rmopabYjq29Kh+WFNx93Lmzr3kiAcF9XCukt40iXi
	 DteJ/IKP/e9MkYFsoS8QfY7G46yo2z+70cBqQRmGCpFJdPvDqtZjh+y785YW78pjcaCxK
	 wuXRswzDEcje/A8kcklJhw7+XTQ0vIC5WcSdiz6UPatHzqTGD25T3RuGGWjh8wclMVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795336739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TzTZoWcHEL/gSOs3Vo0+LX5MsR82QU/4aKtI268Jly4=;
	b=JmQO33eb+weM0gc0CAmz0vH+zqg7cTYSjEBKzDaZOuhOKpRAibxV0h7jRXN4LHVbHYoq
	 HIZNyRBUZ5p+yGuB3E5ifHFilH2ymvee/oLDrJzDY6SzCvbc6WIYEhJoDX0R1VolDM60S
	 5mPzFMCOGIL24Cz5fOI3KDkdmW2qjzLC14qU+hX6fdcSvnQEliA3Cykzb/ZS3Kyh4e5Oo
	 u61HfCD8CsFTR3pyePgukCYzwUWMfub2BRdqLOMDAmonODF5bXdqxditgfHAkiFJtcsoP
	 cY2Uv0pz/rwY5eG5Bdh7QKJzb2CWmumUHpg611NM/gUus2R8p3SEBe6FW5vKpC1Nb6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cBwbAbA;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B442606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B442606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cBwbAbA
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso1888668b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795336738; x=1795941538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzTZoWcHEL/gSOs3Vo0+LX5MsR82QU/4aKtI268Jly4=;
        b=0cBwbAbACG4TaTpObFAJfRzdQLnqJbq16vyRIaBLBhizyCpWuu+9Ir2r/Q4o2qnYnT
         G1MzJr72+e+pxqV3MvGcdLJJrK0dQ/+JefOjeF4fiUDPoYEsC81YlQRjbbfHUjke2+SR
         nFPv2+lWDROsM4kSfefi9RILbXnTXE3H9JgwOMubxinNZ0qL1EK9a9LixCdC1SH7m4m1
         heflcz2Y+FT/P+YQpnEyHPmTmZj0MzYtdXa87ALkBcWGvX+iQ0E5cxLplwFhrFbEjl47
         2qBHzq/d8534CisBFWRXeDIMN34qHVmd6NMpp1k+HbonQ5gaiABfi4tznxFauq1eH52D
         KtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795336738; x=1795941538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzTZoWcHEL/gSOs3Vo0+LX5MsR82QU/4aKtI268Jly4=;
        b=L4FBuV6vLL+D4D27qWd/SDmP7JDu0qY3i4KScW4NYubgVuPVwiMjdMDKLzL9W1zudx
         WmKiytgSxwY9/OpRCCtPaiHfXdeQUUaSuZsOZ0XgZzDwNy50eQsfPlu9uJicYCgtRuA4
         zBR6wl7qsi12dK3UM1AW7ysnhes/Wi1u1R5FdxJIr3TWkJwzAV3kZYS7bOnZ4W6JkYfw
         Ab1xWYdnmBk6OnP8xEbNeI5nZjpK6OyiQYkifHDR9neFf4FrkrCo4opzoo2Iq2U34YNz
         0RwkHm8lmKti6d5znNTYeu4kwecDUjLUDq3NHHjy+NveqmZZcbjTHsJhjOVq1GPdcpgo
         EDQg==
X-Forwarded-Encrypted: i=1; AL+hErE/kJ2Ff2QGEG/ol0BR9mHd/+IkU6DUVpYF72ix9Al+qBQSXWK12tenRSbSHZOxuA7P9Zk3Z+uGKMHqOxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uSdzW61KEi/KUimCq8PsxVyMRCzp+SiPwGLqNZesVrS293sNt
	j8qvIdbi5LZDRfbDvzTpbN8yRoPrLA7n7InlJb3CKhsxAEf79iMjFoH+
X-Gm-Gg: AZFdTZdhddoaovc0cj1wS7ixllJDJdPtXUbu03KUkf0jvztfdXeqBuk0xAcoeCPSsn5
	q8KBaX443HXmBWTuv+33ul3qWi8CLqYGgd4sCndTHPkSe8hxSW4qQFOhOQx7T2ypSlEXvU+/Umu
	rr6MfNo+xcr9pa43p2U5bpFb6GLXZMXJmfenMzWQDMMLga0bdkaDK2WuUldioSDwbMPstTyVjhC
	BXqcbx8NNRGZVdMGQRDK+UW13kF0dyMLWEAxtwuWXU+1zbThmvXlqKYK7a6cHMWgTh1fXtlka6j
	epB9GZftznzyQ4G8cRP8KN5Muf1bAACQKRIQslF1+4+Odc+XCSzVDolYIinjQSf/a/KyYyx7R5r
	KBlgYez/4JkvColulug9LPDbSOstYYEoCN6NlXOmvDpqcL++a84+w7CuKqoDvN2DsC1iIuUF15/
	AqIvJv6mu+lKeUWhAUDeBGeZd+Wf4X7ZJO/5UzRLFSZ/mY5/uJaNX/xlx06AGo9xUujLt0zcHqG
	DNYZhydpf8OCX0LYLIn2mOdwAMYg9Y0ezLv7byqCw7XgpB96N4dtSZGtol1NEE6/rzPXM4KAHCI
	sym570Mtn3wNxYx4K0Fo0L/ZbTW/hFPAcRZhxRq1Za38o61BSLI=
X-Received: by 2002:a05:6a21:6f89:b0:3f1:fdd4:5742 with SMTP id adf61e73a8af0-4014ca44afbmr5515841637.9.1795336738339;
        Sun, 22 Nov 2026 00:38:58 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f11da2sm3549381b3a.55.2026.11.22.00.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:38:57 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] ARM: clarify StrongARM TLB invalidation limitation
Date: Sun, 22 Nov 2026 02:38:54 -0600
Message-ID: <20261122083854.176071-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The existing comment says "w/o I TLB entry", which can be
misread as saying that these processors lack an instruction
TLB.

The implementation invalidates the entire I-TLB while
invalidating individual D-TLB entries. Clarify that the
limitation concerns single-entry I-TLB invalidation.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/mm/tlb-v4wb.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/tlb-v4wb.S b/arch/arm/mm/tlb-v4wb.S
index 04e46c359e75..f72961267b08 100644
--- a/arch/arm/mm/tlb-v4wb.S
+++ b/arch/arm/mm/tlb-v4wb.S
@@ -5,7 +5,8 @@
  *  Copyright (C) 1997-2002 Russell King
  *
  *  ARM architecture version 4 TLB handling functions.
- *  These assume a split I/D TLBs w/o I TLB entry, with a write buffer.
+ *  These assume split I/D TLBs without single-entry I-TLB
+ *  invalidation, with a write buffer.
  *
  *  Processors: SA110 SA1100 SA1110
  */
-- 
2.56.1

