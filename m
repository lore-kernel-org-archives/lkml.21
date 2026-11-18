Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986592;
	b=T4mSsORuatt8jQk0OQcmgW/67HugpralCqaHjfvVyEkObI5VeEqf/5r0QHRwCvWzD/4v
	 4C0Em2Dm3d3nUqVnPl1+kpRVugVvztMZbnfiqTv5x3crbEyLfVhxBjqrHfJ+EPGa3VdVm
	 heXkQFhcsat4y7JlXacmUSPAVhBPrJIypFjHX56Svlyd0GFEDc5Xpy7Ids5DPwJXjO2fi
	 1JR9lDKhqrqCNQJ4EtVWwtqMrLQRBaxnGor8WwqVfi7K/5n+Blgbppl2W7xW21rWmgAG6
	 LsJi3KXfYk+LPV/cqy72S9XLh6f8jVXqhh6NqFdHjPspxaUetj7BOaqqaLtJ4CoHRtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b8jhD9NyOgBY8U4+x22CAnEoBAUGT7c8YHeC5TZXIJI=;
	b=RpboJzZoyRTSAv7Cr9z4n11rBBctFNjkk7dSIxsunRbeqIeVB5NA1Bd0Z4njJId5ATQ7
	 TAshoyPsnovArxa0fvaFTKr4vwDMInqs7B9HpBmj7lXHv1ZsRzWa6GI9cFtAKWw3mjt6G
	 A+ov0NaeGYSSggjTG/qCDxe3/cp09h9Wrn2dxsxuuPhvO6VWAiACUfQ5woyPPQ8C6suEj
	 +MV1WJyu+ZbBPy+ecpnXjABTY1RnjcRKhsGP1uzsoVQ6snRVieCSOQmkiUg6RJsRKvEQm
	 eDpKLmac1Ru2TK/TqCW7ybNmQ/7IlgKlOwO+Ulq4x6bmRTgtW5VpQbSnjj29IHvQG7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1frDFoe;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0747B606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0747B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1frDFoe
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso327882a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986590; x=1795591390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b8jhD9NyOgBY8U4+x22CAnEoBAUGT7c8YHeC5TZXIJI=;
        b=Z1frDFoem+7o/vGx2nbbSolor5KaZatEeUez6FRBzfmKkNIGkihGO9242gyljdFDrw
         P67bp1EjuAjEpwpwMw7T9kvfvVNpt7vjBOgI3BPtTAIR0Y8e8LFuUjX/COS7qFddQs/C
         vK5twTT7XHWS/D93Fvp9IF7aK8f4Ct3iV26cEJzS/V2VSERAZrxC61e4yDZiZKC3/dMn
         9iklpy1phor7eFJOg9GogU9VlxAVTnVRqA/SARD5y1Ok0c/MKmumhOkcsi8tFv44uEYw
         cm6cdKCA3F0BlaAhc66siWJbWTOOueL+xRIz4YMwbOgvvyeHJiNn0ib1MTjMgprZIeYb
         TyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986590; x=1795591390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8jhD9NyOgBY8U4+x22CAnEoBAUGT7c8YHeC5TZXIJI=;
        b=e1qI4ZBFs2eKI/UrAMksPTcZUAlrGu/IxUOorpFu9gMUSn8w+vEuk5Wpcy7H+PNKP/
         AoBMKzvX4JskeG6Pzs+wQhDQP+VVxuGkMoaOYcXbwrg0j2MpWjED+OOCSonZbfV00GF6
         g4JqT6A3DVb2TYQs4mGrtS9/5zp2xu9XwLjISLt0YxROR3AVSvTcHXPVT1th/rpdIpS/
         s1++sBTJve+J+hczr/3H5m+BVkksz84HmSC2SvmVCrbWadZ09tqDUMtmfduwcFIjmPfA
         1iGLvZ776c/2tkMkIyJZwscZXe3gqDweLIAM4paPAJbSvSXW8qusWbEqH8dfPfW+QUnP
         eD4Q==
X-Forwarded-Encrypted: i=1; AL+hErGK/3jgRPwEQB3bL8VH2bwimBdkXIZaNf7YOzDl9mmxGJgEPwVt3PmPZw4I6drjpdDgWELTZWCzLWsdcaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z853pz5QSNa28Sap7GSnFmddp/G93lLuiEJaGSkvmlLCnRMU5Wq
	OWeb7UUP/tjAX4S7Dyenx0/HIPXo2izdYRE0KuoIKQhx6ASdr6hTI8NP
X-Gm-Gg: AZFdTZfoJLZzLhPEgSwWq0b7zDJ62Hn4XvL+WuzPWvSS1Ihu2gZeAPdW8nUxpZ3grgq
	f1eBj7c9ZOJXdh9XMGjr+T5biwp795nePgQqTPS+yIDMf4wogwdeOcg3JMWOSqBvNOd9d5g+U1K
	OUWk6YsnfSY5W2whEAMEdIcDckCwfcPBPVH609W8/17BjZnoT+6jzRmnztuuJY8kHAnRjIgUCGe
	7laClQzz/OIgcu2Q2d6uiFdpVtJiEbDJzMHY+qBT68oDOwE4KE7pREOKTh2hmNv1jlXFywmy9zm
	nXLF7+w8qwVMCTStTfgiM820ddNgkaXeaA7EefWa2YIqjJH+dvqZuwU6TEvCWIVApFE72eZf+tL
	2OWWNpy7mmY84VIcaU6+ksuMtLtXPpDkrEpAu8N3bN4VvBLJ24R4qPOeLYIi1gC8ad3GmaiWKGM
	3ulsjvdVUqHySW5eqRsjSOyPpTzMIM6Pfw7pFX2V4U53elFCmAQP0YSxJyQosTd8F3Sqs0o/DLP
	AJKLIne3a9OztB+/BSgmy7Zb18A53WDu29aGRIIn0q9uI2LO3CaBLMKrB4KLe3/J+EkNr82kQ9E
	oP35uYYGP1tiWBPqcfvJLiRvVNIN21VTh5RSaLOseEK5BLGU349kidwwy0z0LuiBtjl8og==
X-Received: by 2002:a17:90b:3147:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3b3d07bef84mr1108974a91.15.1794986588823;
        Tue, 17 Nov 2026 23:23:08 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56c9c2csm1031783a91.3.2026.11.17.23.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:23:08 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] platform/x86: dell-wmi-sysman: fix heap OOB when scanning for a newline
Date: Wed, 18 Nov 2026 16:22:53 +0900
Message-ID: <20261118072253.896390-1-hj351016@gmail.com>
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

The current_value and new_password store handlers copy the input with
kstrdup(), which stops at the first NUL, and then search the copy for a
newline with memchr() over the full write size. If the written data
contains an embedded NUL, memchr() reads past the end of the copy, and
a newline found there is overwritten with a NUL byte.

The copy is NUL-terminated, so use strchr() instead.

This is the same issue that was fixed in hp-bioscfg by commit
ea146aaac690 ("platform/x86: hp-bioscfg: fix heap OOB in
hp_enforce_single_line_input()").

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h    | 2 +-
 drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
index eb48ced55823..808ff9e70add 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
@@ -144,7 +144,7 @@ static ssize_t curr_val##_store(struct kobject *kobj,				\
 	buf_cp = kstrdup(buf, GFP_KERNEL);					\
 	if (!buf_cp)								\
 		return -ENOMEM;							\
-	p = memchr(buf_cp, '\n', count);					\
+	p = strchr(buf_cp, '\n');						\
 										\
 	if (p != NULL)								\
 		*p = '\0';							\
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
index be939b731063..9677811436bc 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
@@ -79,7 +79,7 @@ static ssize_t new_password_store(struct kobject *kobj,
 	buf_cp = kstrdup(buf, GFP_KERNEL);
 	if (!buf_cp)
 		return -ENOMEM;
-	p = memchr(buf_cp, '\n', count);
+	p = strchr(buf_cp, '\n');
 
 	if (p != NULL)
 		*p = '\0';
-- 
2.43.0

