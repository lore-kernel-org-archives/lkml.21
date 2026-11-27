Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737637;
	b=0tCndZ/1R4vSGxt8tXX4l8p7c12cVu0vNGZrfiUHtsFrh/WcvGLI96/FjpWORybufoED
	 ZwPeN+10F1iAm5JQbrb1f+cvmkbprl090uxOB7QY+7CG0K/7Tmtk9qaU4DIDv4+aUN+F0
	 FpIsPq4KYz1GhC7IXRiHgbI+W0G/9QjuvMKBPhyKMRKqrpP+UktxKIGWmUKdSGodHqLAd
	 1zlIHy3HtSZQXMGx239BzZNFLtinJUotWbyivry9EYokDDiyZAXbUvLIoxFF4tJaqpiXL
	 f3KSIuzY3WSMXAcqhDVRHX88iUqpO1Oiy+9aInk71CmrGJJmbAfYc9bd0l25BzPeDeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=bI5wgKSxHmXVhcmMGt1XWUXhGqSxXd41m+lLl/fjbr4=;
	b=NGd0pC5NH8MqJ+DPXMgpUv3QvKShXcP4X+BsiVgSK0jPcwB5L3PwXw/xwX2Yfa/C8bXs
	 36F2BUKq0OWgdfz3IP34XGK+YPeVnidOwIy86kzrinHvgf0EldiBXhcEataM4ygE3tA+r
	 z1EgRS60hQhcLqZbN7BEHQsxSV2/IFsdF4Li0yeEmPUFjWD6krrQo8o6VFt6xjxHSWjoE
	 tykE6PdrXSod5nLXy5TO3ADZNcfe7Vgrfqp4e2KfbNEYgPE3jBnPeAQUvDb9KsAWHivKB
	 M2HdhNztmAXGCJNqgUIlaKOX8xMNltm/Uiazv82Eqcl/3D1BYM6TuDhlJ/4i4BP4DWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QHUw1TNk;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6321606A334
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6321606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QHUw1TNk
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so6909445f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795737635; x=1796342435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI5wgKSxHmXVhcmMGt1XWUXhGqSxXd41m+lLl/fjbr4=;
        b=QHUw1TNkXmTEOzQX8Nylpr11eeDYM5iLjNsukKHMgqk9V42oWhGyTLN+7wxZwRyM/w
         3csjlbjRDgpgcdzNVGtjc6xfg7iGxplIXyqnVoDNO9456MxYBoXS+Ek22/v6q7/8VJHA
         GzFR9sPBhg5pU+0egnAVpxipNLbXkj26Ol0V2GILslRJB+Gt3vIW4ckBRQW47yHxb1Bx
         39SWXFGql0DWFd+CppzSC7mg92CTrdd6fyQeBO8+a4A5A8pyokNg4D6Ng+JdFVzRiRbG
         BOOQl6M9H2JKfoQdZwiFMygnid5IGGZtPxuVlaeXlU5lm91lKTF88Ox3ZGXvxg1KAaLg
         Qocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795737635; x=1796342435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bI5wgKSxHmXVhcmMGt1XWUXhGqSxXd41m+lLl/fjbr4=;
        b=wtu5lFoecY2x2dbzMZoeBJB9riXjvX+c3xwht3D7Eo0eHZ39LLsn3XEioONKEP8zhC
         mBeUPAdmUEp4q8TF3TMqd/nEaVOfYrAIYsSiGzT8ZQMQoUgZnsrapTVmajjnirpqiGwB
         mQRGnRprj2Cc3eNUTNa+fjNE4zYvftQctl6NU6j79HW4pW1CIcTDCSwwmss90q/wV3Py
         6SqLJe9FagJkDx+jKqrjQ+PGQiCFkFwSXxOvJcclftDpPrUvFmpEECC73pnke+7RUryi
         1iiLFpdqTWLK7wgpFZcFAIDBCpE+paHVI6XA+Lu6S24YsuQxD32VU9f+yubI96BRrYZS
         7mEw==
X-Forwarded-Encrypted: i=1; AL+hErH6dywOzBE2TZj7L10sjbO1myNTWIq+HCgljwTxgWM6qcarE632ExrfzlfuC6Qxerb6ARLqwhjArLQl0hE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C2uWS5Ll6LP9oYSkji5spo9EwkYG6/boivMQkLjDyYeCQ5gvi
	hPFqgA8YL9xztMHJYHeOkBQn+EhAmdwlt5zcYLzdPjzQdo+dlZRKRo+E
X-Gm-Gg: AZFdTZd5o/F5fAVVxn2GP5UiKesnIqvBTSvVXo3g64/iMTbkg3w5aEQA8dCh1wHJ1+t
	BXvtHElBbuFBX5CQcd7ggF+utZB8dJGLXQ1DPZ3+rSvDudQAlqyUDk2lqbGJkVwUqICMIQM7ppd
	Z0UoI4yj1OO5Fj4Wv6iA7QavclGz/FX9UA/LwqEtSuK3qvvQijjXiUTlrXE2v/w7lwDYsvbTc4k
	vpp14k9YqmN6AZZrb8XKWmU2wpTXf6ivv3WCVYb0zH1Yk/DcfVFGumQvzEN3NcT8ggw/2l53IKA
	gK6aIr8g789EOx6l9wfKsFHqJX9T4S9364AcTWvqOKf16Je79gYpMMlXovzt3Fi95Ts5LfsKWvt
	++2gMy8O1XEWhHW3p0NXq7lVeZT1TdilnIzCL/VN7xJQjslU686bX+PJz6kHVMeKfGDkaWmk4HP
	hTKou+nnQ7Il9TuCzrCQBiEeT3YpgFeX3EvG9r0Hxm5eD8zu0tV1SmkeSoDgWI5hbnG3Oqphz6A
	6oOP1JzpfjYfQUuIb3L+Ypernidhb/zY/AfF9k5MTeh3BtS6KAwfnqQOAHOejvJFFCmawODJ0VX
	FZVt3X1tsI89PxcYKpQAQFR86JVhMR+4MR7OMsgpzjdNObFBd7u081tT4S/MYaCrmg67vRD1X8X
	xsX6oEoB2HILa5LyoDQ==
X-Received: by 2002:a05:6000:4b15:b0:48d:df08:307c with SMTP id ffacd0b85a97d-4abb8ac0d92mr39000455f8f.44.1795737635110;
        Thu, 26 Nov 2026 16:00:35 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm45536616f8f.29.2026.11.26.16.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:00:34 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: samitolvanen@google.com,
	torvalds@linux-foundation.org,
	ljs@kernel.org,
	david.laight.linux@gmail.com,
	sashal@kernel.org,
	lzsx618@gmail.com,
	zuoan.penguin@gmail.com,
	petr.pavlu@suse.com,
	jani.nikula@intel.com,
	xur@google.com,
	sidnayyar@google.com,
	robertusdchris@gmail.com,
	acourbot@nvidia.com,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH 5/5] kconfig: replace XOR with addition for expr_lookup() key generation
Date: Fri, 27 Nov 2026 00:00:15 +0000
Message-ID: <20261127000015.3662267-6-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127000015.3662267-1-julianbraha@gmail.com>
References: <20261127000015.3662267-1-julianbraha@gmail.com>
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

As Linus noted when reporting the 'make oldconfig' performance issue [1],
XOR of the hash_ptr() values will clear the shared bits, increasing hash
table collisions when l == r. In Kconfig, this happens when two sides of
an expression are equal, for example 'range 1 1' in fs/erofs/Kconfig.

Let's replace the XOR usage with addition, as Linus suggested.

Link: https://lore.kernel.org/all/CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com/ [1]
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/expr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 8dc73acb08ad..e30554807d12 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -35,7 +35,7 @@ static struct expr *expr_lookup(enum expr_type type, void *l, void *r)
 	struct expr *e;
 	int hash;
 
-	hash = hash_32((unsigned int)type ^ hash_ptr(l, 32) ^ hash_ptr(r, 32), 32);
+	hash = hash_32((unsigned int)type + hash_ptr(l, 32) + hash_ptr(r, 32), 32);
 
 	hash_for_each_possible(expr_hashtable, e, node, hash) {
 		if (e->type == type && e->left._initdata == l &&
-- 
2.56.0

