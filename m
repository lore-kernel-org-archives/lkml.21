Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709198;
	b=dqTG1Myc9tFgVpKqfTe+ZRqTC8fLhU2FbsU7ir8Sik53poRYqTcA6RZJtBJL3Q4EeAQA
	 L3OfcK/Z9BWR0P13lAWrz0jhIVBhD6FkuP+j88rX58jvNxkIn3+QqQhfB0T1Zmh9pAVlm
	 8AWgNV00OsPsZXNiFqtAS4mgmwQK85Q4Nda5NVz2+k+jUQ0pw47V9smhqoyu+Adr+TFSn
	 0KMUHNXAe3GJxPuzf77ZxQbI+EKxjVaVHgh5eJ+2uFND3PB8mYN5UVdUF5tFnSx+j1Xhz
	 NBVX145Pe9WCCgvrGo5zqYuJ7gF8MlKHrYOVes2lTAl54H9y9C1tx80w0NlN9i1mPqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OsYj4h7lFyAAQ586ViqJKEuuJnHGha6jecM+gKVz3t4=;
	b=4UGgROIyEKCBKk42dYy4bU2bh0H60EyOwxTocQZmh6u1b9u4kWlh9a0vNHvnvdGfG+2r
	 HYiFW8EYoOVeii82YEUMhzEBWwUgVHFYb89d71Fqjr0GN/JKoDgdBLFgXGIsA4gu/KfJK
	 MbMl9KpjtLkfh2OOmfQ6/g+xNkZAw1gMGiCgKCm7CBLyWjlEjXfIdgutt4rMpcvsPP4fE
	 Q3/HGflUV/4eENrJb+klPtWqVFGuEMWuRp59y6rn9XFm+PRnIuPXbD18+otb696zJ+s94
	 OZ/APMEky37EuuA64APFknWoPCZwSQ56/wKwFHPCIO6Vw6rWDO5HAa8z5L5nL0JrfbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvh0mr3r;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFECB606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFECB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvh0mr3r
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38692f62b22so9192885eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795709197; x=1796313997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OsYj4h7lFyAAQ586ViqJKEuuJnHGha6jecM+gKVz3t4=;
        b=qvh0mr3rDqqpVnveocsKUzUNI6NI5TxhPFvsGkKIcmh18I6LftHdeDNtLUtzdxKG7y
         AEH9uo+jHCsDZlrqB8fui/gCIJtnleS1hvgm8t7iQ09l7lSR/Q6orx54eB9tZk7MOyXm
         yxvXc24KTE/IbseWBrNHHC9QVAxCM+9yroQINIJk939J0PAAvMdtrUSLmN3bk6suGMwT
         uFjCcDc5Tyx91ETQpk0ZJS79V3bVyadWEzelyBLbG3/wMz910Hm2QVlyhXzOndWfyEBF
         xrwuFZq+QI3IbhgsNr29XzF5ctO2CETkziu0rgcYiPnQ8sZkK908goG65he6IjF/fVdH
         FBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709197; x=1796313997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OsYj4h7lFyAAQ586ViqJKEuuJnHGha6jecM+gKVz3t4=;
        b=Y2Ws/QoLDTpnBhv6mfJcHe+8G9gpEuRqlFSr97jsn3E/7aLH0upyfu6v2OvCQ/Bptv
         VSi2luJiHqAbe2pmLthebfXfwNHec7ZzgkI684Ke+70Z9OJeYVV/YVwdSGlVw+KMYukp
         S76mxQXl+o3JxrkhshpdjMPOd3NZgwqV6jqQ98hswo6TdKypD+c7lSi1EbRA2xxjPwCX
         ERcipnh696bxLJ7aSmEyFQZrJsXTI2ffhUkytnldiCAPcJb0yhQqufxuCF+32hb9vXme
         y784QYRoAeUN1zHF0IKLHbEG5p0jCHfSELY+vs9xeFRPAkF7/97HjPoBaTopK4fYz6d+
         lJPA==
X-Forwarded-Encrypted: i=1; AL+hErF7c2GyR/luGh9eZAd4iRMIW212SUvQ/9uDsBXhPy1AbPfJy7owEV/C87SlNkZQIX5x0B93ujvN8rCNrNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N3Aj9gZum2oJV960Smr8zgz4d5Jatss5y1g/udgdPi0TSSRy7
	Gqe8C9caRWeqHnL1Nu0al0Bf2c6fRxs6uSW5pCVct3RoYoxJ79CJvmGN
X-Gm-Gg: AZFdTZeGmS+64qrlZLl8l/ApWr9JhAPgJNQ0vxcJxlWd8W1fb8BfVoOBPE96KyPi1jM
	eDgsBfUXAUzK+cQbB9Jg1PVWksk3xEgprFWExSSkOd0TflFlRJK4RceIFBCoWaVcouXIN+5F/iy
	25niwKnNoQJ0GR18J+9nLOl2fGS85Zusj6/hYRLJRode+p9rqVEpMvSYVCbMgOB3hEr9Z+vuZ6Z
	fg//V7zYhAVWpUC6JSv+/kMk6r3rJmD4SxZ/nZdC9TUC6CerWTJEI8hedpuFxAVwJzz8LgHqr9+
	CTBQ1ifmYH7jmPIajutUQHaX1h1c8fln7SDrxbNXqjQ2IwuV/sal7R+7h9d1fg74T3RRSLRoqNf
	cQtTI0vW9jl3X63EBgKSDHT5wcAfQOZT2BU18YmorA2vBUtLic4BG7g/nzx0xQiTWSITQXFh9m+
	s66UhtccIlgrE4L3RZsLENQ9PGS4MJtNsBSoX5JmWnaz5CmjKOyMgsvc4SO2c2XCB1rOnqLjPCK
	mL619jRbDweSNQhPEJrPZygP4wkhu6xVHTDk3VSo8f7KlSBgFOXmyZ0BDFUOKSxouKhfWPh7y25
	E5Wmfki4hoLKcqoSue+4uH8AUEUrAZbS386fdu6gfjWqV9NFiZZ+vSp0XWj4hCnmL/RprEj+h1I
	0JxW4xEydgHPoQfC9kw==
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr12735002eec.40.1795709196765;
        Thu, 26 Nov 2026 08:06:36 -0800 (PST)
Received: from arch.srmap.univ ([103.217.237.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm62904914eec.15.2026.11.26.08.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:06:36 -0800 (PST)
From: Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>
To: brendan.higgins@linux.dev,
	david@davidgow.net,
	raemoar63@gmail.com
Cc: Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kunit: tool: remove unused JUnit imports
Date: Thu, 26 Nov 2026 21:28:56 +0530
Message-ID: <20261126160122.35088-1-jahanzaibashraf1318@gmail.com>
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

The JUnit output implementation uses ElementTree directly, so the
xml.sax.saxutils imports are unused. Remove them.

Signed-off-by: Jahan Zaib Ashraf Mir <jahanzaibashraf1318@gmail.com>
Reviewed-by: David Gow <david@davidgow.net>
---
 tools/testing/kunit/kunit_junit.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/kunit/kunit_junit.py b/tools/testing/kunit/kunit_junit.py
index 3622070358e7..b76748947d65 100644
--- a/tools/testing/kunit/kunit_junit.py
+++ b/tools/testing/kunit/kunit_junit.py
@@ -4,7 +4,6 @@
 #
 # Copyright (C) 2026, Google LLC and David Gow.
 
-from xml.sax.saxutils import quoteattr, XMLGenerator
 import xml.etree.ElementTree as ET
 from kunit_parser import Test, TestStatus
 from typing import Optional
-- 
2.56.1

