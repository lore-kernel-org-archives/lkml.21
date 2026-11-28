Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874792;
	b=rGiDvxFIfcx9FCVtlb4icUwIj/IzUJGy3ENdH1fjxuIZuh5NcPpv4onCp4BdH799Rk0d
	 6IOxO6xg1GfJTuyS7WwoRF30lx7l0SfL1KfTE/gKvGPi9JBuhCzoiRfHk3PCcLvJPcMSA
	 GUwhlpxXmIK8KhMNXs9fEW/aIVTB0s72gv2jHUoCbniilcjJUSaeBxIqGsLM4iiOBOpmF
	 pK/SGTTXE5uLsTybFAsDWj5urcEcrCMHxgIzZ4kngzZv6MxRo8b0AhGajUX6Kp6J7fW/N
	 Z1vo0/XtHLjONZh/xicw+1zZ0hsrlbIpYKeXyL9jy5hHwyyzCZVkoF6Z4fXytS0y70Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OW9iVuHkIi0uGMCb5+4kVxSMn6nqDiy+SCxTvwwwbsk=;
	b=aJVsKC1rc8nL0KMk8VMqnlX5ANijAuyrNPzgXjfo3AS/y+vXAznvLjt8v49yMiUcDtPX
	 4ogBVEP8jV8SwmXg0yO3QaByQM5mcybJRZP/posQVhWB3/E+a2gW/KsbXAaagXKmA1YGD
	 OsCx/mH8cnqArhzeeRjM3y4Hh9OgVT1dIp2kxCfA5N6fj+xgsy+Ocv9CNpkQwYXNGDetm
	 nZH3356bdh9kTe+/axRZ0VNvwPmZ6hKCciYW2JAKen2PPDIvWxSekIgVJYpcJwKIAim71
	 hYnFdSmzePneMPJRB+1L9eMEdlZhjXDWyp87EEPJSal9OvbarI9Cy+RBHnwUjviGKWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0+D1Mcn;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA58606A331
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA58606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0+D1Mcn
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-920fed989b2so84078776d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795874791; x=1796479591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OW9iVuHkIi0uGMCb5+4kVxSMn6nqDiy+SCxTvwwwbsk=;
        b=M0+D1McnIblrhRrp2kLKdAcCGAQTJxZp2eJaA/DYlU1hVHRoDK2kVBt9aCjHVWNz+m
         Cb6UgiOXaYF1KlhoUnP4qR9SUCTvpLBNuQnkDpzl9FchbLlpZwNkOC+AD5hETG3TvKf7
         /kDrzMpMwA0v/LFFO1fkyqRL4e+Ypsr4dYYbBcd8+zl7kZP8T2cOwK0Z9ogilwxVgmgA
         Fyv1rFxxE0VQjkWhw1FM0FNUwvDe3kQcpxiirk81ivqTrMSqIAqQ8/uvWzlaK4dUObIG
         VIcwJz7JkWLJjvvV2SlvtKDuXtCxOnLYC7TM897ADTP2kWmV+JK3GWiENaJUKpbPx8jN
         uUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795874791; x=1796479591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OW9iVuHkIi0uGMCb5+4kVxSMn6nqDiy+SCxTvwwwbsk=;
        b=dMVK/H9zbg+Br7QA3r69nnRwaCdFEecoFkMgJ5a4eAOxXaeoK/LCPa3c/U6v0e02mG
         45UNQT37lQ7ULizPE/SLsnwi3zAefoBEs4GBAM92OrPHWCfRXh7jS8OZNJPZI2xSf1DK
         9m5/Dugp5ds+ewAiv5eSlU36F5VG4iMwQxlDNjeNBrz08mEqAJDyh1NSq6ZJ1igvLHXw
         HHjB+n1+EksM7hHdT5CrcZtRzmbxAj8FX3ycsbbtBqR31HR44k3Mp6SzBWopOImwN/LR
         m2ODKKeakEq/2UxoNWz2t9cHcyapKPqMJarilXrR7aURsWbIarq7QhIiJmP5OEa4Z6SR
         frAw==
X-Forwarded-Encrypted: i=1; AL+hErGP73JDepK5azRjShNSQd6DDqwgpXKwDDuvh5ZiMrtsy/u+WerB/Nn3Gn1B82UnDDPuPd4jh2Eas8IeOXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GTj+A7mxjTbnUALKyt+2E+NJm6dsAZmMmXkP3DHqJ0lH+OR16
	IoQbGAe7TRIRxzp3yw3xWEXnZANbk0kYvUxIksptQQgU28eK2sXa159f
X-Gm-Gg: AZFdTZc8yYp5Tbbts4lpSqIjzHo8jsGj/hnFrtZb3gasl1QQU+FWpUzIt82iylNS67J
	mZFkgSWgN105uIEVKPmmqxH0smUeiYsP5o6EU7ZhVc8bVhjVFRSRclox+DzRYzD0qmWgwEoPWrl
	+oPGXIguYS/7nEhzZqO9GVvH8lsbYYzmDB6VJGnB4i2hcn4B5tMAomNqObEQ9AKq2etCyV5WqZE
	K2fZ8UYCWqInGitkLd65uclExkvBPm2oCxCnGiPzD+BIKIwYNgVh4/pZaj0HZ8M5h7oXfdjqfPd
	GahcwUqV5zoclQYhzny6cmiEXh5O0sSyheStHggm177rmLAFZCTQoudGlhOx7zYIUmCkwysaM4O
	V47VbDBBSUKtJGPkzXUkl5foLHoIeyDOyP4UFFT8M8HNPnOL9N7j60oMYTKdod542/PyPmF/XuD
	l+Ojf/uqklNMAaaHhoZ1KZBfe5HJiK4E9fKrB09uhbVTeM7q6XF1p04b5Pcd77qGe2Q5qLWQVFk
	Ks4Tt2EOKq/4/eOvsEg6crEHbBMQUGKU/XoGpbIzb+IKqwi/uSo6k2UxdSJ/JByu/WPLg7BPPkm
	QA+tPvdpfxLVrWuZcF8/HF+Z2fjG967iBML4m2k2i85wk245kFLxaVn5TKAU36Gz/Ade7pkZZ9W
	R9G9Z
X-Received: by 2002:ad4:5cc7:0:b0:921:e08:1d9d with SMTP id 6a1803df08f44-92134b93acbmr546792206d6.49.1795874791266;
        Sat, 28 Nov 2026 06:06:31 -0800 (PST)
Received: from localhost ([138.197.109.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a08552sm241627116d6.34.2026.11.28.06.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:06:30 -0800 (PST)
From: Nikolai Dokutovich <ndokutovich@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Nikolai Dokutovich <ndokutovich@gmail.com>
Subject: [PATCH 2/2] selftests/namespaces: check that listns() rejects a non-zero spare2
Date: Sat, 28 Nov 2026 17:06:23 +0300
Message-ID: <20261128140623.19-3-ndokutovich@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128140623.19-1-ndokutovich@gmail.com>
References: <20261128140623.19-1-ndokutovich@gmail.com>
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

copy_ns_id_req() rejects a non-zero reserved field.  Extend the error
case test to cover @spare2 as well as @spare.

Signed-off-by: Nikolai Dokutovich <ndokutovich@gmail.com>
---
 tools/testing/selftests/namespaces/listns_test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/namespaces/listns_test.c b/tools/testing/selftests/namespaces/listns_test.c
index 538d60f908b4..c52b02bd416a 100644
--- a/tools/testing/selftests/namespaces/listns_test.c
+++ b/tools/testing/selftests/namespaces/listns_test.c
@@ -667,6 +667,17 @@ TEST(listns_error_cases)
 	}
 	req.spare = 0;
 
+	/* Test with invalid spare2 field */
+	req.spare2 = 1;
+	ret = sys_listns(&req, ns_ids, ARRAY_SIZE(ns_ids), 0);
+	if (errno == ENOSYS) {
+		/* listns() not supported, skip this check */
+	} else {
+		ASSERT_LT(ret, 0);
+		ASSERT_EQ(errno, EINVAL);
+	}
+	req.spare2 = 0;
+
 	/* Test with huge nr_ns_ids */
 	ret = sys_listns(&req, ns_ids, 2000000, 0);
 	if (errno == ENOSYS) {
-- 
2.43.0

