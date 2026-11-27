Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766648;
	b=HxabG0sasFQHYDo2M4mSks076tl3QXBKvJbDa+LSwOHqLFGjkZNdkfElGC+5jyMu76JZ
	 jR5AgOtzXFhWKY7hkfWAzGPj15ja8FWmwZrJTB0iG+HXqbw81Y8pfcsAMPG7FS3r0bYW7
	 ZjQ1cp8vx0jY4CTysuZSwUzYSZ6/yvFZaqvNnpSrjMCuv36dX/5j0TJoCkImbXWNwb8Ng
	 m5iQ/FQSima9TFXmXF6MXk23Lt5EVCeXcQeli8PrnisO53N6TPA94tfQbnJpZlnnum2y2
	 Lt3WTc+2efcL8nkOgxb+wibLvLEzx7IEsRtWQJr72OobXhiZ0scqKDJ3iTpMiYyLKxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z9aPSWNuVkjxdyQpwpLgQbf2amCCZj6fJ5ndu/9NBHY=;
	b=gpqcGy7EANDobNqTbhk9V8AU5vqDp5lHIu33RMEA6DzDLGEXjqn9YUkY9GuPynmUravH
	 /YZaK+JdiJRI0u90ym5c2ys8A/K/CYInrcl7iaMKr5/H5ELR/uHwwq5GSzNyj8l4lhoL6
	 2XFrbuGo8p1LbxcN+EzB4X6liV68L4+jCI61JGFAQgzXEnBgqooCAzcHDiuptjLbpffzN
	 LqKTCa4IIcXfs+z1kP5iIkXuLOWo8XMSeIbuNTS9IgjQx1eEPSf7wOjnEvoacfwGlz+YU
	 3Vq+bopHYuiFSgblkT11X3i8bbC5ww2TdoW/vxT4gNddMeofqiqxBvbYItwgvbpAjBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyXWUyo5;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AC7606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57AC7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyXWUyo5
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so4669646b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795766648; x=1796371448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9aPSWNuVkjxdyQpwpLgQbf2amCCZj6fJ5ndu/9NBHY=;
        b=oyXWUyo5LfOXPrX/MQ3o6HKh31ehKDoY3MEsTGpLFwfzkhBIS2pJ+fR5ceoG0Qx2li
         Sf3pNqNfOATHnFU2AmHvbLl6eSdsA/qLNC5q7GIkInCmo1NHb9Oe/FJjxq8RME3raakW
         UbtYHosCHS6UbmLpw69UssW4xd9MbDMbGgvQhqQeUeTQA+Ryt9C/1d9ueeg777VUb7IF
         ZZmTUPoZ+zGdCY37p6ojfdl7HRFRSFe9Mjxaqvejl+UwbphSf0/4M39INc2MdxW2yki3
         EQpznr/Jrnv5C6dBON8c2Vla4uqZ5CyKTk9xYjmH/OTHLTObLxa57DIPADr7HDUZq7UQ
         EBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795766648; x=1796371448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9aPSWNuVkjxdyQpwpLgQbf2amCCZj6fJ5ndu/9NBHY=;
        b=Nfn8luf30gmNrKaukpO88BHpr2alMqDJlcFWWcFPbIM4GiNoKbpLwED4XAlExPkIRa
         ytcwCggRIQY4J2j7BHPSDpfAUtlsaHv2QQSZJn/sL0GWj0JsQcU+TA9qTziPPEcuKo8P
         qtg+5C0KR28Fo3vdTMex6E8zLz/o9pr7daZR8iRdR8lUZ65D66EipgcZpEdKRvLy+Mre
         f1jGnFK+50uhNZcmGu7/Co6BnJBIv7HmxK/cF+0DfY3YU6thcpEcrIZXE5T6Ez/3fQvU
         EfPbndOPnfmfcKeQ5wtK2p7t7xPwCvRQ1xzYhvphDwjV8PFuPiu4HH+CNgpWaWNac7+L
         zG2w==
X-Forwarded-Encrypted: i=1; AL+hErGGteGZKXRXNM3RIbddFgvFH5pYaMk6GA6stEsqHy5xKiKRKBqeaIeG1a5aqLHhjH/KfwPaHcuDbqRk67E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FSq9iOpPP1GTPnKxCv3UIgAxoupIMYylUKNyNJWCiW47OZnYO
	pq2KSpwiBzVhC8eddwqVeMX2r3lpSh1rn296oG6zoB8kNexKE1kdskN9
X-Gm-Gg: AZFdTZc2yX9ck3t573ql8/Xk4fiuBmNtbXjR2KqOWJBDAVTpcx7qZQjBrA8fvXdSySG
	dXJ870kebJv86h/fIcM/zbFfYXx6eSuUvhc3DX2QmjuWth6svT9FAGWqAy8t+U8C5WnTlEwi11y
	LtQmhTErFG6sWxme/fpk8JYwI3JI4u5BgyfK2hVPahduR3WtikbptYoVmh6c6OZdtrCAyvJhe3H
	qKmJ7oxvX9Q/qkHZPZDfskKzM/KAvHR5hX7G+mYx3K26ZSP66myXyWxnaZbb9enNpnZhGYbwoQW
	GN+ihY2kHTxyQEFfOC/ZZNgtXHQ5j8+vv9MuqvD1oPSi2xJZAGB0/BNnVxeTLTE//GxwLJ1DJw/
	Kz1OjsnXrzrMYncXbrqtGsc+ihtoRqg95uRZ4H1i/N7NIuKe9QquCrKHdTZZuOQB4vb4+RCBCve
	lt3+eHGm4OdqTP14A4uF47aO4OMpd/5atC6TIKpRFlaNO/+6LMaTOdL4/zDhhiqOAYI7cv8UvMO
	npTunCa5DX8LDC3Yzo75s/chxi0a1tyVFJHoWSnXD+5oNl2MvmdtZx8QrQ/SK5Sx8kb52AdnORQ
	Hs2n4ngVdqNeaeqmZvUGRVYTeYAgQ8J1EhOLVuh5B91JIEIeftaYGcJf6jNqA0NASrGA
X-Received: by 2002:a05:6a00:188c:b0:89e:9d69:c0bc with SMTP id d2e1a72fcca58-8c87d51d396mr16809308b3a.27.1795766647440;
        Fri, 27 Nov 2026 00:04:07 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e485f5sm12242899b3a.22.2026.11.27.00.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:04:07 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
	Georgia Garcia <georgia.garcia@canonical.com>
Cc: apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] apparmor: set xattr_count only after the xattrs array is allocated
Date: Fri, 27 Nov 2026 15:04:00 +0700
Message-Id: <20261127080400.275982-1-congnt264@gmail.com>
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

unpack_xattrs() sets profile->attach.xattr_count before it allocates
profile->attach.xattrs with kcalloc(). If the allocation fails, the load
fails and free_attachment() runs on the profile. It loops over
xattr_count entries and reads attach->xattrs[i], which is NULL, so it
dereferences a NULL pointer.

Set xattr_count after the allocation has succeeded.

Fixes: 8e51f9087f40 ("apparmor: Add support for attaching profiles via xattr, presence and value")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 security/apparmor/policy_unpack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 24fbce2e4322..83cfa981f7bd 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -598,10 +598,10 @@ static bool unpack_xattrs(struct aa_ext *e, struct aa_profile *profile)
 
 		if (!aa_unpack_array(e, NULL, &size))
 			goto fail;
-		profile->attach.xattr_count = size;
 		profile->attach.xattrs = kcalloc(size, sizeof(char *), GFP_KERNEL);
 		if (!profile->attach.xattrs)
 			goto fail;
+		profile->attach.xattr_count = size;
 		for (i = 0; i < size; i++) {
 			if (!aa_unpack_strdup(e, &profile->attach.xattrs[i], NULL))
 				goto fail;
-- 
2.25.1

