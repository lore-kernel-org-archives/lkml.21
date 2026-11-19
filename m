Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107921;
	b=o0AGn7DFLtdAlH2+WW8qGe1uO02HlbFRpI6H1Abtrun9xKKb7FsiA8K0gh4+9Es3rPiR
	 QhlXThAx1cF4zMDyD/QASh63WRc79SiTYYCaiz/9QoFANLTKit4+IlL8ddTpdopxRfINT
	 6erocoUMtcZOys1D9n1aaTdXLCIw57fBmVrzfqswnmjMfsaQTYmxEVEvGqJb3DjdoJLlM
	 vGmjJ0dJgPfqH8uaRJR8cBrt97N/dzcs+0y9aekEjFyJ74/xcA0nO8b4xTAUAL8H6Z3J6
	 gsiXgyR5aNG00PMVBYyxiej6S2LO6TtmmXumWMXRqtuFZGVo+JuHNlrnv9rOtzQmeWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=lxyKrcrROgSrDO2SJS728Cqlccn0RMILLNUr3hcKYMg=;
	b=mPGiM2xS0TFOFqwnasegWEmV4yNQPqCA0Uv0X9YZYsyCjavDC2/s88SyjNABtgToD2Pu
	 6E2bRNdND/akFOTtOSYs2XQ1I9FWYysMiGWMUDv3LvMb7oZC1uUdU8kHjWam1zXLvRnvF
	 zSkPZacrJ57h2xPBVtaKy41GS4UCb8KoLX+UXud2j4eFSIHaLMhIimycmy51zqRNoe3x8
	 OaL7sSHGlFe2ThANBK1DPBhiym13pGJPrTSa+ykJyuDbK5u3NsAToh3qFJE2Zc1nmgfNq
	 JxPYPHCjUDx/ueo8KleTC3XCiHo9gyWVQXkBdn635/wXxJXoB7fNwuRcTBSkRKg3q5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e1KnvIao;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451DA606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451DA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e1KnvIao
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3837afac185so4822114eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107920; x=1795712720; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lxyKrcrROgSrDO2SJS728Cqlccn0RMILLNUr3hcKYMg=;
        b=e1KnvIao0takC4YGkR4kiNO+LXjXSdl4WiB6fpN5o/UtGiDfAHapsp61CIjZ+h1VZv
         bUW0q+n3d/EEjtqSiGQc6jc2f47cuGJwL5KjwhPfp32XCcjPOk86EFuR5o+PxX+wGg2z
         15PP/D9qtSFwiGIqmSpPuBqzEqejE5/fTPkGZ4kWwncBdv2hfVL91qlciPBZvg6k9ISz
         vMI6ySx5uOmcWq4DzTytjvJm94PQR5T5gEHHhGdFa4brgJ7U7Vq96hfg4iJYmD4ielho
         BRVkdqEpnibLKzxZ1Xws6oyZ4yPhqKBH5Mv1Ini387QtGeQashmB9zpjLcduTjfoDMNc
         vAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107920; x=1795712720;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxyKrcrROgSrDO2SJS728Cqlccn0RMILLNUr3hcKYMg=;
        b=zqzwiZsmyg91/83YRtMJZK7SuTrnyU78Ud1CCmXH2o/xp747anWvQLhowKPeA/TOwu
         yCxvFP25YRc2lZJReZZlSMYqdfD/H4O7T9MOJXByDtb4eCiR8/CGz3HDBStfoIOcGQA1
         rIeGlcIrCgTKopl+5FgXq7Xh6ojP4Bx4P1gStAB6dAO1N4/OPYs8XfFAu/Wn1myODf7t
         bobTYKNSWtQM2VUkkeKrYAGJSDKNjLu3zOSlZM+6xsaTi2/PBNDrGqWjv2thr3fNJDWi
         IfK6Kj+8YLAokpboWg7fC/tfeiopyluy1Wza6p/P9OtTD4/5F4nxvk0kV1K95iGz29k4
         CMJQ==
X-Forwarded-Encrypted: i=1; AL+hErFs4WuN0KpS72Sa0tOY4buKNa3I/pmoY5JccDiUe1eyK+3TTSnKyY0+cX+HFhvwrmArV2NuW51h8RjIasg=@vger.kernel.org
X-Gm-Message-State: APuU4Z96FYA4wuK6UWenhK2BNLM+klJ7LDaHCaQ5rYpJ5/LVg7GR2jjA
	jku/Vi/fTCweconWLoST6TReF9pwFAuv1psZStOox5Phk//NBYVogIwwJEliOZmUzboj3x5CPvt
	iAWUjb11sNg==
X-Received: from dybgp2.prod.google.com ([2002:a05:7301:2102:b0:384:7a9f:7f2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d211:b0:384:6a72:4e91
 with SMTP id 5a478bee46e88-3846a724fddmr2026727eec.31.1795107919998; Thu, 19
 Nov 2026 09:05:19 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:17 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170517.1515872-1-irogers@google.com>
Subject: [PATCH] mm/backing-dev: pass "%s" format string to device_create() in bdi_register_va()
From: Ian Rogers <irogers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

bdi_register_va() formats (fmt, args) into bdi->dev_name via vsnprintf()
and then passes bdi->dev_name directly as the format string argument to
device_create(), causing vsnprintf() to run a second time on the already
formatted device name with no variadic arguments. If a caller formats an
identifier containing '%', device_create() interprets it as format
specifiers and reads arbitrary stack slots.

Pass "%s", bdi->dev_name to device_create().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wformat-security enabled; fix and changelog drafted with an AI coding
assistant. Build-tested under LLVM=1 W=1 and -Wformat-security; not
runtime-tested with '%' in backing-device names.

Fixes: 6bd87eec23cb ("bdi: add a ->dev_name field to struct backing_dev_info")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 mm/backing-dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index fad1495d3b20..58373d494d92 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -1097,7 +1097,8 @@ int bdi_register_va(struct backing_dev_info *bdi, const char *fmt, va_list args)
 		return 0;
 
 	vsnprintf(bdi->dev_name, sizeof(bdi->dev_name), fmt, args);
-	dev = device_create(&bdi_class, NULL, MKDEV(0, 0), bdi, bdi->dev_name);
+	dev = device_create(&bdi_class, NULL, MKDEV(0, 0), bdi, "%s",
+			    bdi->dev_name);
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 
-- 
2.56.1.708.g77570a6a1d-goog

