Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020193;
	b=jJOShvM3yPH/v/sJPUzlfRg5wfdK2BxDgYE8Ox4TXv1EZ4rL4S63qbTyjsAyuYFIX1m+
	 IZo29eh2oO9BlfqOqB5sNngdCE9YDtwK0bzCTpZ8lyBwrep3Z2UkgWIjhliqlQv4cAzf3
	 qC5DDRWXoene7fn9cl0FSCzFmSz2PfJnyei9E2s7empwJB02gVAbNj3sEBsURQjHBRRQC
	 9M7ypK3jzPpCYAbu6WGJeYW7BYdc7F7/qA1ymdtaLnx8VaEfhqQuOAseaqzsLavps0v3g
	 T52HJEag0KP/jWa3+5LbO2WVwpigfmMyCXsq3vcvmRXOJlHBdGAHzM+Iny4SYgJVIsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yJQ0KfYMhcKQGrBdjXf1T7evC1XgvNcmVbjN4cFKjbI=;
	b=Vz45c4gQQhV4Oy3zbjmferFU1B4XV8AIlR9QRaKmej2AWEAZM1kavqpVFau1SzbFYdXV
	 zR9Jh9m7ARzVa68JKp6Y86N01W6w8QVUKqYNP/M+jx/ZozpTg6O9MYmbZcX/WJtWEypjB
	 9NaVl6ju15Az8wRV41vqK/xJe0vvv/0MLfcA54VSw/7wx3mGy2E5RPtky7FUMv42TEPUG
	 Iegay96tApJuQyETJ3p9UFDuGRrdSoUfQU0gx7z4F+yKFPpSdxyGQRCe6dNSFm64VzHD0
	 zI6BVh0d/oomzQ6s0oUE2MGofHwQ1JEWcx9j/zI/6UDAissv9oktNVIBN9fX+5dvxAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWVecMAV;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E8F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E8F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWVecMAV
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380b40319bdso1887555eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795020192; x=1795624992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJQ0KfYMhcKQGrBdjXf1T7evC1XgvNcmVbjN4cFKjbI=;
        b=hWVecMAVU9m4K4C/GKeWFiqk286vs2oScQyVrN9ursmAcYqpScxRXSeIt11MulFJU2
         9mu8Qaj14rRLqaJUDWLUUYuvPb+auOXr6RdhKaN3gS/+f1PKt7FDMZezNQh64jzIVEYB
         wAYSTL/ATPMuKOK0ek7lUy0FRGccqQCNgTGCYxqwRMEEdm34Jbvztj3dwOForZR7yvHe
         fSE13SfuEtVMsCEz3EdvrOHOmGe3a31ZtYuwyb8QLYZjmaclEQUt8pF7mVGRsoQqGFJ5
         SQOpzGGa0C1ORQmTHYWKbaoFKXYyNVDFYLKWSJUY10NVzsa9CVGqLO6hO44nDZyKICdL
         5auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020192; x=1795624992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJQ0KfYMhcKQGrBdjXf1T7evC1XgvNcmVbjN4cFKjbI=;
        b=OczY9KCV+HWxPNzZgMtSoNUxw2xxZKOoOG3VuEuGSnQVzjyfyZ6NPeGvE4JhAvMi/x
         F21ni9b/JdX0v9Aba8nHoWbdUx1CkP267uNdu4Cp4a4Fc5b8X47FGc5SxmDQz1jKsApY
         LqwsVDGz+iyurcCqmuQZJIl4y1bXcsIdk0UdtCJhQjCHMqiBE9OlFU/MEyOIttZ0g1CA
         tyiRoTLSXRetDg/okbD2xhXo4p1PiLw5Y3x7JCnMa7usChSUtCRNOEZfv4pTKu1F5z7y
         2Akm3AyGgtUtpD5cov3AWN7pm9jqMJsVKZzEJDsdOAh1QCJWvurZG1z77Ao/dhBqjQQx
         u/Zg==
X-Forwarded-Encrypted: i=1; AL+hErG3JJibsq3knbZFuQoYKR4PUmrSvWWtH4Yo44z42lQzkOwDLvka0C2fgwWd+Nx3sVIaeQlbL1Fog/A1gOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/afazbFtN1Lbj6HccVic793hbuEhs4e1YBLH7t9Infa6CdGAB+
	3ICq99o3C7RMA8HDXM8WjTtMVa7tKukw5BXO8KsOXHg7m6aLMb9+zyIy
X-Gm-Gg: AZFdTZfwMD/n8/81m1N8iFBSdtEY4eI82VL9wIF53ZGK0wC1KXdbmfMhD1Imk1Mi9R7
	QUYF7o0EJrp+k/SOVFo/DFSTyZe968esOtdkrF4Azk4+fSoPuwAcxBW+QwVmxhPCoigzusDEmSW
	4y+vEb72QgF1d71dKCFhNc7Gco4MD39QJhuqVawgZxgng5ZGj7+IxNM0B4eUhXBdomvVaeDLyBN
	XsSl153uzeaKw7uqwiJc/EBcUycdRIcy87yBB5jM/HO36jq4NAs0B/ZcWQX48h+WIwRfK25/Zxz
	6LF+te1kbH9QJsL9nQallamAbA5X2lZAkPCjTbA1Fd9HEyO8G0oig2XK9SHJPQOA+9pnQrmj4Ms
	Sufc/7vzcP+0/gJ+K4wb/YVkv74kStb3mz4QjEbks/K0JycG7vXb9jo766x6XJUL0ass5zKin0s
	gGWmxN3CUPgQl6aAjKuh7RP4LIy7Jw9r6G4aGRJeQ+jQyjOPegNetjiNkQu1oi599REjX7m1nkM
	/Nv1Mfw2Wj49OEDTNphptj4VI0M7VmtfaGDHsHaHsBYWCFxM4YilBQnFNYSHof6rohoOJdF4/o8
	qppQPGWdig++QbgOWTs94xq9AOc9GUlVJb6XNR03rO3NLHEHIsH7
X-Received: by 2002:a05:693c:8812:20b0:36a:31b2:8643 with SMTP id 5a478bee46e88-3828162490emr2848395eec.38.1795020192176;
        Wed, 18 Nov 2026 08:43:12 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm9911247eec.2.2026.11.18.08.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:43:11 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fault-injection: fix typo in failcmd.sh
Date: Thu, 19 Nov 2026 01:43:02 +0900
Message-ID: <20261118164303.97840-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The failslab debugfs file is cache-filter, not cache_filter.

Fixes: c24aa64d169b ("fault-injection: add tool to run command with failslab or fail_page_alloc")
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 tools/testing/fault-injection/failcmd.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/fault-injection/failcmd.sh b/tools/testing/fault-injection/failcmd.sh
index c4f2432750f4..4b42808a065f 100755
--- a/tools/testing/fault-injection/failcmd.sh
+++ b/tools/testing/fault-injection/failcmd.sh
@@ -196,7 +196,7 @@ while true; do
 		shift 2
 		;;
 	--cache-filter)
-		echo $2 > $FAULTATTR/cache_filter
+		echo $2 > $FAULTATTR/cache-filter
 		shift 2
 		;;
 	--ignore-gfp-highmem)

base-commit: dae384286c2852ba130604ccbd1bf5d9f732bd78
-- 
2.53.0

