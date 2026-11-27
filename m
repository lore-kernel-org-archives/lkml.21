Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764761;
	b=v9pnzqk1Er7RlKpfQUH4Zoy1nHw4S5Lslx8jZYaCkdFZd9otpkumNtRezh0rAwzwgzPW
	 2SmRqd1A/MhZ0JKKfr8KLKVXwFeG8WvUIWjnD5HI7FUCYkz+sPNtev/CzWag/unNSDpJ+
	 BbAnQbQX3YzYFsRuktLcUR2bVpzZFzFJW/wNCgheAYN5n+8q+FR6B01TVddVUc7/kuNxR
	 DGz0oKbGDCfv/nHYEwT+ODS+vXe+FJS7AeQLDAcd7XZl4NUAiUGPq4/7RREGH/F/ThhPp
	 rqV0cly+T7H5NduWq6rdn7B8WM/A9U2BKqJnIcdgWVcldhA5JWvlV3piuMnFSEhoZRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5CHKL/ZtHCrib3BVjwLtVv0WqKmxeKuSdrXUeRFBD58=;
	b=05RMwj/2UgrZO+1OFNzRlEnkRlgbRgE1VwhjVZQBKHD1ThMSc0vbAfbxkYQVWspIxzUh
	 55aCbfYJcT3ayf0xVxM5cAMRS/QnYSfHC8Bq3lGKGH1nAd45um+4SBHXREP3S2iXUGupE
	 VB83j3PlqZ2RNCvSFWkqZjg5WRGggyIE0E+OKon4ZW93JYozzXMGZen/TwsM7YZ3ddKyA
	 VcAk8NHaMtLu+WjV9KDwtypfxJ1iesZhp/qLL8Df4pOhtDKwJNmtZnCi4UeWhgr7XSah+
	 KFivEfmk1oTPdl5Hg3IAFo+4aZ/VYWfuHX4Ewhu7JTW8mZ4Z1lvlSxvgyF1chKTlE7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kzx9ZZrL;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95BA606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D95BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kzx9ZZrL
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38190551625so14945077eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795764760; x=1796369560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CHKL/ZtHCrib3BVjwLtVv0WqKmxeKuSdrXUeRFBD58=;
        b=Kzx9ZZrL/EDdPoNVDguy4uUQHvfrLbRe+5pu5vvCwHwBOKDtOYvENQXazWF9Q4QG9S
         RErEtlF1I8fl2bbP5a8rpgtSfrjD1QE3vdZHreBqkNFQYUqwQiN4PMOnyNYzctbcCAWX
         4+houz0x1MJ4+72svaeoYgBJLkQiZheUdD+2cHAY8jZb3xzDBcoc0Xm5MB1yiiH5/qoU
         PekSK3e7BHqIOObn2z/hfEQWeLVAYugix34HFADqzQoQRH/3t7TRgYZqPrFrFyH9ots6
         IEbgRQVnEzOTy5i56LoA0JcCJEwJbYRspYwvYu/qWQ0W2XD24HFFZo9K6lJadYizwakz
         os5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795764760; x=1796369560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CHKL/ZtHCrib3BVjwLtVv0WqKmxeKuSdrXUeRFBD58=;
        b=XITIHvKTXXiQndTYXxsr47sAjdZ6MpACQN+EYUQ3FqB4jwUi/RSnk0Kpp22IOF/+7u
         zEQkOZ1UL6nk/XYk1rANWOd2amd/EtY88tYmUPYURS/MANnZxaqOTo6LdLmRo3KrqFr/
         HouuIFoXBPAVtYK65izXBeJd+JTbXlF1nU9NaObOgIPUiip8eabpcmysoPP9hll+E3+G
         A6CjazYR0XhgBwYYAxfp7BrvnOWw1CsKB7UmAxeX76YKabIGaAFR3sdClTGTKYN0JuLW
         mjf72LuDy+qtVbh+l6QLX71ijggwxexMBerpAGm3N3yPms8T6qsMe1vIgZZDmOEID6UY
         15AQ==
X-Forwarded-Encrypted: i=1; AL+hErEMrsqdzPbX5JfyGA1tllIMrD81B9tCSRlnuovrwxIydmmEmLIUIVvW88JXl2u2OPP8OUdMUg0EZYZpCIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ekh8S/jT9wMq3H/tI3USqTPXFCt8WmQlUIS40OSMDVMLAD2p2
	hVwXZgORtY0qGW1QSmdw4RhDILZL0K4oQmDQEEXJsbyySnH32HtTBWZh
X-Gm-Gg: AZFdTZc0X6HoN+Tb5f7NvQnCXQ1rm7kl/xFUeK+4mG+hNJ4+e8qhVdb6kd7PvVpzTnA
	6SObhF3KMOcuIHojD4ji8VGPCTmrZiepg05YNTlePuEmRA+zTCFKwXWJN2rc9ORe38gyBlvYBJO
	erOAWAznotWcbM9DeMUW4K+sArm58sxfC+WoQIZ0UUlAEKm7oW1BZJQBahVY5PG8PWz072AlWKM
	8Gkes1FUTWzDWPCIeyCnW8Wxvy3FmaHW+4BoUtIcUXiIOO+2kea+F7Xe+OpSs1PIwnPC87lGRM6
	lru7/bECbUsO9Sxfbmbpfxc52D29wVQ+QHlW3AcIDTtneZCU7c5HYLJRm22aTuQiwnUO8oTcVRN
	RLQwZxqUbZZEoNKeoqKlHsY5RQTt5u2lJ8BN9iC0lk3nchlmvv101AxWYGX2sXE7Y3FtRnMbHeF
	RoICmyHVbj9uIZN4h980lkkYKbYtO4JQMTN7v4qHkwp/VVUN0HQ/5dJQrsQ8UbqfwUVUysl2ccG
	RizFu5muGPzlSuPTUWrMUwbImXlNxoeiKbVTtzI5NXK+9hqJrFiojeiN8toYJOb0plUfLnDL7ff
	nhSroJ0TTntnb08l1/KaR2B4QrIHh6aAv+QCKu1IEgpNIMU=
X-Received: by 2002:a05:7300:2301:b0:385:4c54:3c8c with SMTP id 5a478bee46e88-3856c0c9403mr33946786eec.1.1795764759968;
        Thu, 26 Nov 2026 23:32:39 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm62804163eec.20.2026.11.26.23.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:32:39 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ima: free the restored template entry on error in ima_restore_measurement_list()
Date: Fri, 27 Nov 2026 14:32:33 +0700
Message-Id: <20261127073233.181925-1-congnt264@gmail.com>
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

ima_restore_template_data() allocates a template entry that the caller
owns once it returns success. ima_restore_measurement_list() breaks out
of its loop without freeing it when ima_calc_field_array_hash() fails
or when ima_restore_measurement_entry() fails, so the entry, its digests
and its field data are leaked.

Free the entry with ima_free_template_entry() on both paths.

Fixes: 1ea973df6e21 ("ima: Calculate and extend PCR with digests in ima_template_entry")
Fixes: 94c3aac567a9 ("ima: on soft reboot, restore the measurement list")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 security/integrity/ima/ima_template.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/security/integrity/ima/ima_template.c b/security/integrity/ima/ima_template.c
index 16154078fd70..d5256da8f76e 100644
--- a/security/integrity/ima/ima_template.c
+++ b/security/integrity/ima/ima_template.c
@@ -526,6 +526,7 @@ int ima_restore_measurement_list(loff_t size, void *buf)
 						entry);
 			if (ret < 0) {
 				pr_err("cannot calculate template digest\n");
+				ima_free_template_entry(entry);
 				ret = -EINVAL;
 				break;
 			}
@@ -541,8 +542,10 @@ int ima_restore_measurement_list(loff_t size, void *buf)
 		entry->pcr = !ima_canonical_fmt ? *(u32 *)(hdr[HDR_PCR].data) :
 			     le32_to_cpu(*(__le32 *)(hdr[HDR_PCR].data));
 		ret = ima_restore_measurement_entry(entry);
-		if (ret < 0)
+		if (ret < 0) {
+			ima_free_template_entry(entry);
 			break;
+		}
 
 	}
 	return ret;
-- 
2.25.1

