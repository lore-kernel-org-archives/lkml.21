Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590366;
	b=dntVA0SDftYk3NrJM2FnMz59W973cBg3X2hZJVAKJ8vPxSzh5BkfgXM36RI1HOb2ehPx
	 I7ZOhqbPuQ8yY8vFoKJ7+3y16XMT7olzkSaOj/BWL/IxS8/eKhXBBUDjn2aBycEYet1YW
	 qx16qJItWL8VVQUotWKgL3VAtBoWOynvUfO07W8pi3AJzIGZXRlM+8uJ+7/CELZletxNh
	 CYAQitH/z/79QolF5fTfwnQddbZft33nAZf47aSMTXlya/qvNsC9ytHNUk4x2eacucjfD
	 OvStNb3jYtkfongw2eB3s7XRV/nV3FYJyx0fRe2Sc4rXeUN5ZFeXVsZDPrRub0+O5yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A6UmGJ21affGPFr7f9oqagJMj/3pD+7PVBT7Ip9WBo8=;
	b=mFJmtrX0UBY8QMEJUdR6DXabMd2YGsgIo5dpg+l+6eCnF46+Xuk6Bi5s5W/PL18zG+9q
	 ikKhVsfSlgVp+O/R8qc8ivbR9bEeEuOWI6zv91n9IzGsmOPydBCyuy0Kx69uALfY6slr3
	 CDNSnYi5cFwcQNzU00z8zntCDwn+tugBEmsYbTM7VIUO2WkKQznwmadsPekhY44mgfT7i
	 GKWurA1DQvYW1eL4oYSZinRBUYMxCtmkAjF7TM7PtrQIgi421u2Qtwqkw5+4AajowuJD0
	 bw7ihBKR4JjuSAK8t/Sn2U2q3zdveiqTCoFYHnOaYlO+XHTPXY/5IYk3/ecOuE85FWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jn6QGWhf;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF98606A68D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF98606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jn6QGWhf
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso2093877a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590364; x=1796195164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6UmGJ21affGPFr7f9oqagJMj/3pD+7PVBT7Ip9WBo8=;
        b=Jn6QGWhfzKXXEZXbyEgKV/jSiwvHvSRHHKtNZ1I3MNQsGTK/DR9/C2GEZzS8KwLyXm
         esb1B7mNPSXNchYB0aO7OTV1XV8kuaVLHLLutXrRlyFozAwTfpQyOUeO+zoXlnBD1HSi
         GFvGyUwLP/hhFYevjOmRojk4X7Q7I7KrPf2DCgRG5BNGSRbjF2gAnrcfyEuUzJJWoklq
         +Lzj5orOI3vIX/m0L5R8fqERWb4KxiMATz+unXOo6W3mJrhQNYIbvYRUKnCOAoZCsyau
         oqjwzL+rSbENVKiYxIYfS73elznhvyyb/pd0uSfErSwjt83fjOOSPW3j5GFV8Hwvm/KR
         QsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590364; x=1796195164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A6UmGJ21affGPFr7f9oqagJMj/3pD+7PVBT7Ip9WBo8=;
        b=rU4sAGrbrZBc/d9+6swDKF1+SUbX6x5uG2KYMYCICXKBYA94dxvvgZrnUxPuQTUJ9a
         u8IKR3vWbMVECSAx3vuCfIyNqAVY/VXlxn9ZVGzBuYJpOsxNt92F/px5P5zGWYjDf0yd
         Q1xrEQ3YTy/249od6ftH0BccrD1T/a88nMzOSUJ68TGYh5v0j9o4Foe5vPRETIfsq13b
         sdFRNaszJ2qn/yqpX6yWodylxCaKP5ZOjGIMxRaK87icGRkfQUnisacbcHHuHifujQt3
         nXp/lCEMJpFyVFXJQ3fIQgmSGblsuxd2ud+G+UcsolEui1X5BrByIv2+X/bZ0gFR9cTC
         6tLw==
X-Forwarded-Encrypted: i=1; AL+hErFH9xgnED8CPO/eW9+Bf+YmeILf99JKVL0ZmClAy0hOAyAlsQ5HiGkFverRAdwPnkR3HjosWJtxV8Ln6vs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mzt+yyVUu6iAivQca4Q2iN8Bk2Nhoa4n7or7P7wD+7DeAYXWi
	NqKgGC2jrSK3bpR6Mc4K3BlMmWYc80BCMvYyP2+C4oNBvTYoEIKN/TLYtM8DFWyR
X-Gm-Gg: AZFdTZc2bf2l8AFsttb1mWDITfaym9c5bm4kmRDuzBYzg9MUVd7qqp/4W6ItbL1XWBZ
	sTikVxFmf2bmJBh+qIoMJCJo0g94eTquvqs0zRGhD+j/AKTbDOW5a5Q26hxltD2Q0dlicyJcik2
	hzs166bmLIMydgg5osfahKqF50yO9EU+UsgbiH1eTyZDj5iDZu6aC63koRuKYwt94cbDSSaHbnX
	erCa63Z/1inWGj0yuGsm2v6E+iBLhjDn1oEva8eFyziagI04x2jRpNxe3DPCfw27Xtt2NncaFyg
	zdSoWhQAq546+gAOB1FRvcSRbx2PflcamH/Oj6Ml+o2aNJ8+HV5Awk8U9hY2soNny4OcVTF5wig
	Vmqbj/39cnKH2PzI4cEjlwRJ5MJeJx//LKkVKhFcM2V/ajzkrwXgG4jYLvuqTnKQriVKfMMXxCv
	gS1j38vi03nW7lSwS9FwSQSYmpRTsyoLxrrYVaAssMbE9BdMAeDiPts2fQSHaizJXurwMWwPTN4
	Yi0JlmI7oowPVAYLo2YJ1wGzCpjguSxta8R+kAnbbk8neKEE0K73GkYXXrrJs6/ok0GCrZKKsWL
	5hrbooVIIEej+NMwm7A5GSSesx0UosyNaqMGRSyorhAgdLH6ju8ItVvgRJom/BM=
X-Received: by 2002:a17:90b:3e48:b0:3ac:a521:95e with SMTP id 98e67ed59e1d1-3b41c94ce48mr16257933a91.47.1795590364121;
        Tue, 24 Nov 2026 23:06:04 -0800 (PST)
Received: from a-VirtualBox ([168.188.125.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm25898247a91.3.2026.11.24.23.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:06:03 -0800 (PST)
From: Minseo Park <hiyoukou@gmail.com>
To: clabbe@baylibre.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org
Cc: mjpeg-users@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Minseo Park <hiyoukou@gmail.com>
Subject: [PATCH 1/4] media: zoran: remove always-false buffer size check
Date: Wed, 25 Nov 2026 16:05:45 +0900
Message-ID: <20261125070548.28989-2-hiyoukou@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125070548.28989-1-hiyoukou@gmail.com>
References: <20261125070548.28989-1-hiyoukou@gmail.com>
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

zoran_v4l_set_format() assigns zr->buffer_size and then immediately
compares the very same expression against it:

	zr->buffer_size = height * width * bpp;

	/* Check against available buffer size */
	if (height * width * bpp > zr->buffer_size) {

The condition can never be true, so the check and its error path are
dead code.

The comparison used to be made against fh->buffers.buffer_size, the size
of the buffers that had already been allocated for the file handle,
which made it a real bounds check.  The assignment on the line above
turned the right hand side into the value that had just been computed,
so nothing is verified any more.

Remove the dead check.  No functional change.

Signed-off-by: Minseo Park <hiyoukou@gmail.com>
---
 drivers/media/pci/zoran/zoran_driver.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index 5b4d5dd06edb..a053365922c4 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -179,13 +179,6 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 
 	zr->buffer_size = height * width * bpp;
 
-	/* Check against available buffer size */
-	if (height * width * bpp > zr->buffer_size) {
-		pci_dbg(zr->pci_dev, "%s - video buffer size (%d kB) is too small\n",
-			__func__, zr->buffer_size >> 10);
-		return -EINVAL;
-	}
-
 	/* The video front end needs 4-byte alinged line sizes */
 
 	if ((bpp == 2 && (width & 1)) || (bpp == 3 && (width & 3))) {
-- 
2.43.0

