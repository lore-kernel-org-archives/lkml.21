Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766500;
	b=lz688JLMz7MgKOx4sS6WQgPS+KVMq0rjx20EGV8A4roWGdkpmF1H/A3Vi8AdXjc+Bpu1
	 Y4MYnxOrJJNlDp9Ux23q2lN9oXS9JyMqOZOi2vdh4qReu2OYSfL8UCpS8YuNZfaSmpr8t
	 Ayj+AeSwBhL6403kEHMMvp6AUKfhTtrxKD9IqdabyfCr8JEwIzwf4rZyuTFT7DADrwFZ5
	 NA9wOF0H8X8xm3ueSq2uqrx3qKJLXrblsDqCA/6Jp/pI07QPxHxTicG5adXfTVimGcU0j
	 PEWGhLVzhnhaUvev7NEvWbBWzFnZkfM6HV592NjZHx7oe4lxgYU99tf+xKb+9lJi+xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G5cm++BKjFrmGv1W0VY1iGSaZZ+nQ2gJAfMXfykemMY=;
	b=wsqEFs6ZJH+IN2MN/2Za9b9lxjfymTxDybMUFQbRbMIA/WdOSVq1f+35PGOXe3HDi3EC
	 SPcCBiLsRP2E94yW8zvnEFF8EDrFbEYk8uPCHfEY6eIoBI6IH4WwKMRPbBy9zGY8XP1ix
	 pRh//zMJ71FCLWV8nX0MQT2gDfsC4MQ2Z1EZeY8NEYul5JST8zWB3pUDS4CKCVz/jcX7m
	 7P4Nk/2UBXN4WkJRAAEaHQN5VClypC1UF7tiklBrbNafT1dDBw7/E6SW5s9fPmH3rZJew
	 7OAM9UfLSlIIDvzEp+nRpcfQk/l037xCLm2Q6NExu6PlUR6koxvxeUVz1MxskW0bX3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aoE2KlTZ;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FBD606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1FBD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aoE2KlTZ
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2af4c8d00so8262139c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795766499; x=1796371299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5cm++BKjFrmGv1W0VY1iGSaZZ+nQ2gJAfMXfykemMY=;
        b=aoE2KlTZsOaqN/EKDD8LhhRvMHJHUrDgyfVz5jrv5SYa9u0HsYZuylI7Vl7jQQEYMZ
         tdW/I2/u+IuPcCNiN16K9wECxM5kKqya2nq0x2eKTNCov4Jz+VB6PSMo2yKm5pl0Kv7i
         cqQb+wn7UdSCvttjJLCudtu7dQgt9uEJFSHwxNdt70K1UVxK/dJa1vhhiBFXazv6vWM8
         Xp447FkML8miI0jA4DPkuBgGqLuwOIQM2vOBgLyZkLLlG4IL/l0UNNksKzmV5EwOfnlK
         7734bocIlbh92laV8ISUKLnlfl1cR9UY7kaoEQHy6NtLqK0JdN1u1if7cqiREir5/k+G
         HVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795766499; x=1796371299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5cm++BKjFrmGv1W0VY1iGSaZZ+nQ2gJAfMXfykemMY=;
        b=mCoiSV2NWzaww4V0JEPVHgkhghMZpwVK1zaZ7QxXV9LVQuFHp1jIA8GVNTJ/QotJk9
         025z6HjA+QjFhFAAhWe1bfex73aZn/ngZf7BnrRXWBsBef0BguvzRK2mRCd2PFuPdky7
         6H7k+da8Qrvg/j/Ag3s2GMEaemHF1FhIvtfRGPlM/QhVqCgj/f3d7tcYs7rlsvw8Hsjn
         lzhfBKY3P3FINjtGwBfuyo2pajtIKLz+llfxqdaB3TbP+4WSA+nU7of/lPzdv+kXRxuT
         PHt4w35oLDUhGsPf3XXGpAI30ldOPHX66hoqkt3YQryFDxxT4x6AZayOrd7FzNHe5BLU
         wKJA==
X-Forwarded-Encrypted: i=1; AL+hErGu3UGM+xKOYn6BDf2XFd0Iryx+PTdiBKLD5whVnPO3TTgA3hGiir14Vle1XsG6EHHFNhFLXHqDd5glGrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hTi02nCO4bM+lNQktqgRrB+4Dli4goWqtQti2SvEbN0ITBPQG
	wxHCUZEP/M2pJO7XB93KG+kPj2Y9jAtTEFvEWLmfKkXOVfT3skh4Fzl9
X-Gm-Gg: AZFdTZeRaz3XH7dFKj5L0f0EyVrSMuq8ssrPfW6i3qAKp3ag0KaWQ2wfgF3zHHwoeyh
	zdgOAdhKVJ6H2+cpwr69QPLpMXA69/ham1TDcWeqL1l+Zs/0EM/Uy5ATHYdsUu1tYUQP2sBmdAN
	bLPKXHTsq0zM0VRMgGPYe/ovkDD8iS5pQJTEC9JLlDaCQH4cRNEkUxcFChsN+B3/eHvDZp8Y3YW
	8rD37BOkA8opvxY/806tIz7H6zGZ0sCyXY9WjgP3PAaVdiObleW/2/WjHG9gbwgyHsjw3aNbJ28
	rGAII2iiUM0k9EaOPFfChNdDY4j/kyPIJ63upNKoDJpD/UWKWabYmSudJLrxFs+/OErZeOQtYG6
	1TSW+qrWw2a0/gQBNpWXRbx9IUBhFx2ZGSvEtXX+JfuLv3gTVoXce2X8z9h7QOGndubYHTa2KM/
	qyjoxSxLTYtKlSYbIqT1qHAUh25frZN68ebUJIAzSy3Z9pMVNvGM4oUEo+tLB18wVlwL0/UQuMi
	f2BoI1L53dbHK/lDpWFHGf7b6KKmVWNAxW2pqKfGUIwpCa0G0iqxQoZHEWphkz6CEZqZfGlqtOj
	QQ1C5vlrn0gPDJ00BNp/uejsqNDksN25TvlLHOFKYqcU8eU=
X-Received: by 2002:a05:7022:ed02:b0:149:50cb:2175 with SMTP id a92af1059eb24-1b5568fda53mr22332116c88.33.1795766498681;
        Fri, 27 Nov 2026 00:01:38 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61827257c88.13.2026.11.27.00.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:01:38 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
	Georgia Garcia <georgia.garcia@canonical.com>
Cc: apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] apparmor: return 0 from unpack_tag_headers() on success
Date: Fri, 27 Nov 2026 15:01:32 +0700
Message-Id: <20261127080132.266236-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

unpack_tag_headers() returns int, where 0 means success and a negative
errno means failure, like unpack_strs_table() and unpack_tagsets() which
unpack_tags() calls next to it. On success it returns true, which is 1.

unpack_tags() tests the result with "if (error)", so a successfully
unpacked "hdrs" array is treated as a failure: unpack_tags() destroys the
tags, rewinds e->pos and returns 1. Its caller, unpack_pdb(), only checks
for "< 0", so it continues without the tags.

Return 0 on success.

Fixes: 3d28e2397af7 ("apparmor: add support loading per permission tagging")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 security/apparmor/policy_unpack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 24fbce2e4322..b6864757e6dd 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -841,7 +841,7 @@ static int unpack_tag_headers(struct aa_ext *e, struct aa_tags_struct *tags)
 	tags->hdrs.size = size;
 	tags->hdrs.table = hdrs;
 	AA_DEBUG(DEBUG_UNPACK, "headers %ld size %d", (long) hdrs, size);
-	return true;
+	return 0;
 
 fail:
 	kfree_sensitive(hdrs);
-- 
2.25.1

