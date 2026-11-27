Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772102;
	b=ES7cWzdG3mbrnAQFER40G/1YGHa+hYcvOGiGqZ+HVe5thP6vAdKZnFFwuNQHnamHSEj6
	 5gozAnK/6f0lH1m1LEyI32cWAnw6f+3j+kmH5ohr6QLM5kHtwwHcjYxngcv6MLjIKEhqy
	 UqSR+qm21E5TGUCLSkJ66+yVGqgSna13kzeQQkRTfOCBFP0cqIDq/t8BYwAGy8TyMe2D/
	 eUBbWaTyNfd4ycvxQ3qHA06id9VymCrLjtCvXwJ76fARDmxVoPylShzYgIJz+Z7gbhdpn
	 5O9dgtV6Zzb3cnJSlS5ULI04KIKaQ+RtJAzgkrWjxJ6xmxTFiUg+N3hgnJ4kJOHcH7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=xWsRCnyfIIh6p0qTAnuMX+kvCKkdDMmnnoWpEqJrMZw=;
	b=L+GVKIZUWG+hCNGPFMFMC9iDwBYKfmqxYEarzLOpqJffGMWvAKswBZDgmrc5rEEbr7dc
	 Bb+FqAdhL1c4ZESPcdK5S69Z0xTUGmPjEBqC+eeAxSzRbUov7K5+bSISneCHQyXX8rIak
	 Q0nmESdCwZf+FDZYJu8gl4ApZKE/9nod0UYPXcgnsVleDuObYLyJ6vQK24t4J20yZDxrS
	 RLpSd/5sW3XLmwfNg1Scjw9FabraiIHOrymSpzaBg27JN5kIPqxjElQeQLsdtBx10ZJ41
	 CrYbQnRXrMsja+VDp1+EGMjhYmHvgolCP5qzntkONEYxZHq0993p+v9jzqycBJCRDXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fK1lch4e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97AC606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A97AC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fK1lch4e
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1afdf5196so3023265eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:35:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772101; cv=none;
        d=google.com; s=arc-20260327;
        b=d2D2kwz0bmTLgXmlvDy6xZ7yqkcNwTgu1ufRUezMHZFxHLe988OILNVUsSbJAyNORm
         8r6efyxavSWySsyklILbr4VdTUqBZVlL0WIyN7BGJUAGTIqdZEV5JOL5yQaKg6XCozfb
         t5z7wFfbSWjDNHgPmNYHHyqlt1B98Jtm8qbnoPqSgHWDA/fN/c12Zth2Gp4jvoTZHJVL
         sgwebamO+8Su3zCYTIHaiv3nXNC5YFfT03HegzjtqJSfaSbgmKG0ZGQP73DRAGqvOJ/Z
         8VzLfcMi5GLlW/EmIqtlYSh/nabqFWmu3RuEzqu4HqNjI9suek84YotZjRRvTyxX+DDS
         FdZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xWsRCnyfIIh6p0qTAnuMX+kvCKkdDMmnnoWpEqJrMZw=;
        fh=3M9mBvDn3pfiLxHphDxd17WvVogK7lJGJUI2bP7bjuE=;
        b=mmq8e9/P9bS6qD1yuZGwAI6vcbV53rTrKgr5DJy6IM1lPoBUHWgOxqQziYkuVOYVBb
         sYTzURdJSVveY9s0BPfuPei/51UVGvvGLdEfgToTgF1xk+yebhdJDWSU70p1e3YgCpMr
         O3LDNOtXyMmLshHzSnQMYiD9coXin2beqmL32gAnIbE1JQwmBZ0vsvdkcRhjxDVX7VL7
         WbFajXLJf/iCTYMUnnDS3P6vsymzrmvxr+5Q0Y2a34aBGvsE3nh35shnbIlfW1Wu6u0C
         d0AYhxkFOAoWtz/9gteYuV7ghp25Rjt2aejRs2s4tLWssbKPq0sWT9IRBX5nG5vhZDbp
         0RQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795772100; x=1796376900; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWsRCnyfIIh6p0qTAnuMX+kvCKkdDMmnnoWpEqJrMZw=;
        b=fK1lch4evMT7fYBb0a0Xv/I9W06+pl+girdVpojSEAhq9HO8hYFAzqtCD43rewsdlN
         ZBtdN+jgSoJEDpmQmV5HG9YS5jeIzq9fiuf9dIm7mLLqiegZvdiRnme7+7Wk5GdGJIUG
         rKwpKyR9NYCQVDpHGu/2ZmrhEzqpUmQjXWQugNy8cMgkQobsuRM2KXc9fNO3tg4AdbP9
         Kz2p8+mvLKy3EChZl4/Q86dTSmlZ1RV67qk4X3RnjXstNA7E2l3by+4oia0z7FjqK0s0
         gWJmDW3d40ET3iYFwHmQ2HPulcLd7oWZKgyxhj1WIUp6fKM2niZvxFnE1CeBi3TOOh52
         xHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772101; x=1796376901;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xWsRCnyfIIh6p0qTAnuMX+kvCKkdDMmnnoWpEqJrMZw=;
        b=2xdDWlTAovzW1nkGwGvQKKe0NlQUEK7UN48DHsD26B62A29dCUFDUwU38+hDVkWjUM
         9MsiU6C/Ux1eonDrrpZH2/BIcPbpaJ6QZALdMqixMR9NnxwsOzPG9KcoYzaZg/BJ2nVB
         tVPzJbQROYVEygsJrvADv5WJsJDoT6FotgTZfLJNFSPVwYIRQUN4l/1VZcs6Argo+DSe
         TL+izktD18j15EoH3tRJayqql1HPouNLcMuBSmO8MxnzF9IgJ9HhRHhqfOLjrESVaoOM
         9SIe87oZa+P4WYn5nGXZGmfuAlMSecflbRe7F+LqfnUgBI9BFp2FPWHVwhF+IDZHIvU7
         Z2XQ==
X-Forwarded-Encrypted: i=1; AL+hErHUXnIenaRUQB3kRkjgU8obAOxq/NrnSFgRJbRwZqtd05utxdgCqq3ojNxUqaN1jGyJWB0JePZWLxcSbUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CNo1uTyMJoKvzZ38moBUohLE1tN6pC0zP191Mftedaw3S5H1q
	saGnOylXvxaTr/qBpbQqORVE1OvvJ60KC9Yoky5t/SDs0Z9u0aEMOKMa0IV5ruvzr2KzRMvbkE8
	qTy4jjpa7glMlomga9O8jMJPHKnQLKpo=
X-Gm-Gg: AZFdTZd1zp0sh5bqVrBUz3C9sC3VtRFF2MVhuEyHEMx3ToUbIKzMvclxd7bRFjmV3jx
	aSU4X63PcticwRE4Fy5a5Fe+bdMz/XGiaJfLjXmrqaMggYF2U6pFcHWMttssLGmweHAjOAuQlmT
	LQr7NmY7O+YEik1wqOV2/kcPkLU2bT3hS5lf49Djb6cgWfjlgRuhob9ap88PPe1glNGs7lH8zRH
	TCgpWJUKws76vmbamJhUnJaw+aLSaIdQzY9XwykknVq5F+dDYFG9IqAiyMzxPXKxhMpa0uXl3bZ
	//OOA8iYF4Se8Lc3NZjPwu7zjV7EILMp/h7FOJ3mZNttV32wq5trJfmlA3w4LE1ayh3hmeBkjqi
	M3gAY8ApkdvNBqvIbUxlzAu8TFyji4lg9UCRg8yAPtRkJskPimNjJaeC44KFD3UtV2Q==
X-Received: by 2002:a05:6820:1502:b0:71b:85a5:c1cf with SMTP id
 006d021491bc7-71b85a5cc2fmr4351963eaf.26.1795772100658; Fri, 27 Nov 2026
 01:35:00 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 04:34:59 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: getfeus@gmail.com
Date: Fri, 27 Nov 2026 04:34:59 -0500
X-Gm-Features: Aa3M54pOAqrag9P8DyluBCoyp9_znpRQFot40rVo9WjESeWPqoyH3kr_Zbfl6Ks
Message-ID: <CA+m4KrCGfS46jvTdXiYorW=rFg4wOKJ=UHKDXq1a4qfN0r5x_g@mail.gmail.com>
Subject: [PATCH] interconnect: qcom: Propagate BCM vote commit errors
To: Georgi Djakov <djakov@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

qcom_icc_set() discards the return value from
qcom_icc_bcm_voter_commit(). If the commit fails, icc_set_bw() sees
success and skips its rollback of the previous bandwidth request.

Return the commit result so the interconnect core can restore the
previous request, attempt to reapply it and report the original error.

Verified with a mocked commit failure through icc_set_bw() and on a
Huawei MateBook E Go using a one-shot -ENOMEM injection in the BCM
voter. The caller received -ENOMEM, and the previous bandwidth request
was reapplied successfully. The ARM64 kernel and modules also build
successfully.

Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -130,9 +130,7 @@

 	qp = to_qcom_provider(node->provider);

-	qcom_icc_bcm_voter_commit(qp->voter);
-
-	return 0;
+	return qcom_icc_bcm_voter_commit(qp->voter);
 }
 EXPORT_SYMBOL_GPL(qcom_icc_set);
