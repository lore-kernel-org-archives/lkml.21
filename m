Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099567;
	b=uRhm6pbvfz3qfq+ercWFCz5r7L/YClbUOdduIeuGVM8GQkPaG4uXU9ZSBjgn1wouSs8Y
	 kCDezzyikDdA/bodxxJpqeHPNSr0irOeYsEXV+ZuKfdFoSOqwv3kxQcEEojLqddBM/d3e
	 dHhgS+5N4uN+vw/4Ztz9zTqprlOVLejMVkc/bQ+MblAwBX1oNrFL210sTF+2mFSQLrIWD
	 3Jd6+QLxSSptF/3tqq4rWulYkEbVS0aukMFEhLNlqinXoyQLaGRQuxzmJNEtzBKVPMeae
	 G7MbRr7eH9S1i/AgvCkdMgEMXbCQn5zq7oYP7BBkPZmDM+E/tkzSVAO0OAu+TfL7GDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FJa+BAJ5ls8qNQp19xprXvh/jhBS4rsJ+TLQrB6w3yI=;
	b=IjrRDWZh84rnVS+oXbyDA+38CKyMrpPDMAPwKL8LDNO1cnmTNcBA+sZTPcpqP2uJOrmS
	 uVxttA4Z0/eW0YGZgIMIgSsoUOjnHC2sCdiAIIYHbhsmkTCMT+SSwvUGY55fH/wExPw8Y
	 H492MgqVgCWp+eOlwFqWkALDePS9ZGDDL8csKcv7GK8ojwI2iFZIfn7NlNLdU6Si8HnXM
	 LH3XCo24NFrK67FvkAeEt7tOiZlb+nriuVpxIajSYwpuD67cLW25SyDBJQBQ21WvMqL/B
	 ZT+Jihiy9YVQ5+qTUFAeGcDPh6gUHX67yBDB0vyvY9XYhN+L9vpYLwckk7gJI4r6y2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yle2h7Dm;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937A6606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 937A6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yle2h7Dm
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b3af93b85cso1321925a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099567; x=1795704367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJa+BAJ5ls8qNQp19xprXvh/jhBS4rsJ+TLQrB6w3yI=;
        b=yle2h7DmKHSURwluxZyGpRDTP2SARDUKcw2L8XSCXEwiHo5e2yQsrojLEGRN9U5TKH
         MOsdiL/6k/MPZ+ANt89864EjULdhYQgs26QG3DBIoRORPatWgchIcydz2CMKCjP3rDj0
         Q1mLQDpV4raBzEok73E5H9eAMKcJ4J6FqbxX8/xM1JgpA7w/+hMyiOthjEzqtwVowP04
         xdIaQV8BvTjB+pW8hfz1K1XGiydG9BAGwxA5F3Z7bPkdbC5KL8qW+NZHtn00HlFQxK2S
         r9V7c741FmEKrIKzhAMapFit8cHtd6UaioNPyWx/FmJh8MHb4UGOPjo5RHZhoHwXJorM
         F8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099567; x=1795704367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJa+BAJ5ls8qNQp19xprXvh/jhBS4rsJ+TLQrB6w3yI=;
        b=ngymI9uFoq6npApxBP2auBsRs4P9rEu/g7bpaCl7oFv9MuA1e+BBP43vml37HwA4Uj
         HdfKwT1z192WbVOKofp3iaMRWqnd3GfPx/XK8/5IkaEaFbFEFrDzrzW1o+jbvVTaa2eD
         7z/EfjWXdn+7IaCyuJ90rRaEo/UvfBGYNUNBOOVgphW/oWAIpAqdkPinmsfFS4iimFVN
         /qD0ti3l9Y6kXMioUr9h2H14hOJSNUfv0wm7bFguX1xoowpc1Znysr2tYG3MK8m7l3If
         ZlvlgslnBqexXppyZbryBBePfZr7Ii3Yua+Zuqcc/gyljnjpfklWt4KR6S1oNV1Mwyg+
         AyMw==
X-Forwarded-Encrypted: i=1; AL+hErH+KMuWY4pTTZe+mTqkJe3IpzQM8M4f58lZ+fGUkVXmLtD814Udg3Uq2RIZ/cITRdLi+LAMGCXp2E+MSDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gUo3d4eE9oebZPqlgWalb8RceO7O3fw5VuzIsiMbTzXWFYaUr
	W6tYbVrMZu26CA7EFFgnrSIfnDG9mHf30VCd8+2Ed7OqZGaa+fz7Kx1w
X-Gm-Gg: AZFdTZcD2ec5SUQ7X/83mOJBG0mzQhs2rM1hND627ChWvM2KoGGtXaxSQQkQklzv2Pt
	zh2KAGNhMMwv5j6a7DYuoLOcGaiwOUHK/YZob8sXyla/9GtBgF4xArxDqKcUzOZkgslAtzwYFmS
	ontk7iJRPwhCpnXv5vEQxI8gRt3nXLpWWmykaQXwfuVnupNQTwIQdopYIT497VuaT8tSuBSnsw+
	/Wrr1B8i6eBngJr0R91XMx5yDy/H60+BAasXQJTGdDYXg6ywRuLS97yBD2QlGegoLt2gdEu07/a
	7Xq/el95H3DTShTfX96SerqOBYzeKLJeZpmPqkJN5xAltQQGIiHZcFnfFbhi1y3i8wL6JzE2Xd8
	Yvr6X6G4A6mZGigv3gwcjeZ4AZiEteDvAEsdFKMfjTuow06qhEuTtuegse9eCx4XrBDaFXvqm+l
	/8hNtGF/Pd5Stt5xAsJpeezOhtNTdstHIaVcwRFzSRohU3SE7FXNLYkRo6FFCD9dgL543yNxpK7
	DDtceWCxxKm8G4Npkk9WkcaxcES94WmxkOrRbpkSKC/SJwqX+upl5bgVf+XwojMqqNp0yD0El7f
	J+tO+4XxpQlyP4t10s4PXQscWMlCTABCJjFDTRCfEolvrMc3RjXYU/y9NQyOtnB7ti9sqyqaBhh
	JPphFVBkzj+4Hu3ZlBKweA+mi76cipUVInTdx0NPCCQLv
X-Received: by 2002:a17:90b:2fc5:b0:3b4:52b:4dd with SMTP id 98e67ed59e1d1-3b4052b0c72mr1925315a91.65.1795099566707;
        Thu, 19 Nov 2026 06:46:06 -0800 (PST)
Received: from visionx ([202.51.89.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm3283266a91.8.2026.11.19.06.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:46:06 -0800 (PST)
From: Vision KC <vision.kc791@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: linux-ntfs3@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vision KC <vision.kc791@gmail.com>
Subject: [PATCH] fs/ntfs3: fix check_log_rec() redo/undo region bounds
Date: Thu, 19 Nov 2026 20:30:21 +0545
Message-ID: <20261119144521.86377-1-vision.kc791@gmail.com>
X-Mailer: git-send-email 2.56.0
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

check_log_rec() validates that redo_off and undo_off are 8-byte
aligned and that bytes >= lrh_length(lr), but lrh_length() only
covers the LOG_REC_HDR header plus the embedded page_lcns array.
It does not check that redo_off + redo_len or undo_off + undo_len
fall within the bounds of the log record buffer.

A crafted $LogFile can set client_data_len to a small value (e.g.
40), redo_off to that same value, and redo_len to 0xFFF0. The
kernel allocates a 40-byte buffer via kmalloc() in find_log_rec(),
computes a pointer one byte past the end of that buffer, and
iterates 4,095 times reading 16 bytes of adjacent kernel heap per
iteration (65,520 bytes of OOB reads total) in the
DeleteDirtyClusters handler of log_replay().

KASAN report:
  BUG: KASAN: slab-out-of-bounds in log_replay+0xb0b3/0xe8c0
  Read of size 8 at addr ffff888009117228 by task mount/85
  The buggy address is located 0 bytes to the right of
  allocated 40-byte region [ffff888009117200, ffff888009117228)

Fix by adding bounds checks for the redo and undo data regions in
check_log_rec(): verify that redo_off + redo_len and undo_off +
undo_len each fit within the log record buffer.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Signed-off-by: Vision KC <vision.kc791@gmail.com>
---
 fs/ntfs3/fslog.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index bb8d40bb5..cd251ee9b 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -733,6 +733,20 @@ static bool check_log_rec(const struct LOG_REC_HDR *lr, u32 bytes, u32 tr,
 	if (bytes < lrh_length(lr))
 		return false;
 
+	if (lr->redo_len) {
+		u32 rend = le16_to_cpu(lr->redo_off) +
+			   le16_to_cpu(lr->redo_len);
+		if (rend > bytes)
+			return false;
+	}
+
+	if (lr->undo_len) {
+		u32 uend = le16_to_cpu(lr->undo_off) +
+			   le16_to_cpu(lr->undo_len);
+		if (uend > bytes)
+			return false;
+	}
+
 	return true;
 }
 
-- 
2.56.0

