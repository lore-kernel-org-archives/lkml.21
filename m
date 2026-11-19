Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102330;
	b=eSRp0JMg9GRtgbq93Wn3g/GjHbpMShXwgzTeN0pjM4oeXIkagyNrkwRqwypnis7tAfl0
	 GvesljydaiSEngMynVwsJ0L3eS2aLPgOLL3Fl4z+eNhj4vsl5ljRLSTFXyg6jxUzN/3oH
	 KhyeW2LXAZ49A59tFQN5X/1ImkokjQ9gGmhnWzjl35EEpzOq3XIoPnk2+KUA8yVueeZLB
	 eaJiNuyvOF4bCgFQWShg0lEAWuIaYXWKhGUt9c0ujl2BWWVqOxHxF0X2qhofPe0h4+93/
	 ztT5LfNCNXTrattPtekP6+KQrvfs5q36KxK2Le83PbgyMCQUV1xGa6OdwjG9h8n57OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ONhjpTFPtQ0dZVvMCyXrWyUMz7z7tu2awXqAUU0j9nA=;
	b=HxJejvX81wS1f0w7ZNOhSETog+Za7Qa8UbXFmqp6DO2uWyOF/PF2Apti0l8TfGGxGqJI
	 +m4sLuPsVYScUinzCDbzgzD9e5V311YB0Ea0zoj4Nq8RnyS5Db7niE5vMlolMSGIxYr8K
	 yaIZ3v/XfC2BTr/coHciSYCEAvU1N8wv8tzg45s9F5DarTbRM6J8C8rZogU7VZ8PJVh5E
	 G5NGGgcOsEXI4PDmbvjTO4db6iD8GmTHxZcCQp6WzJIf6nSm4ky5NMZyLiNHqd28Hnmk5
	 LTPRUZusmNJ0GVbPBXx4TKoHhPDUsawsQr8WWIdUDBtDIh2Sv7M4fPQ7UZojK5PaWIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AYvHArKH;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E4860A380D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E4860A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AYvHArKH
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so747381f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1795102328; x=1795707128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONhjpTFPtQ0dZVvMCyXrWyUMz7z7tu2awXqAUU0j9nA=;
        b=AYvHArKHN4oqDLKEjsMh2pysqJNa9z/dift5VKXpW+OolB6Zb7RTVhrbUASFVq2mEy
         jWL9/giMSuSVjFc9OUfc9EiDWF1aCj5pL+V+cePVDHAkfjDtmf7gt+b43/Q8JzYlhF/5
         RIM8CX3q5Ye2RQP9ULJBXieIzynsx9x+d3xDuZvfwsmJ6qVbtd+VQYCgV/ypFsTIcOBw
         ol59VAVAQxvBACEjfdrOSmtduD5MXNHfrW23JF349bW1bLP2EduygGjFltX72vXETwEo
         vWqLbFGN44zYqC6wgtMTvxAtK59pEwLznU7DyV9rdWPJx4gXOq/kfWgZytJ7bA31UimF
         nrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102328; x=1795707128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ONhjpTFPtQ0dZVvMCyXrWyUMz7z7tu2awXqAUU0j9nA=;
        b=g61jKdcmIZqciwBir/Z/+MhtWeCxY1YZYX1Laa1kefDW/7G8ip/9OagAPhtUSnA/Te
         wgXmBVuJh/m+b91c7t0X/KSE/bdhUgtku/TXN6OmI4QQlerpVs6UxOioZi/aMWUPpEey
         g+xmZsJPZXSxZEQYpJxcqDI8mq9G033MA/ify25EdsH17QyKyChOrUcPWonnv7hUWYvr
         ZcFbZXGUJZQjT3Lzw9+nrPopQ1TlA4esU+heGHAOX7umfvbO0iU+4gpfMb9AThDxE7xA
         iDx6/+t6xVVIdGB9AtLwwcLRTbq+ldDNZMrG2iL90eeezzRz8VU+MM/S5dKX4nLkzixO
         jOeQ==
X-Forwarded-Encrypted: i=1; AL+hErF0aJGT7XwICN+ctCon/uL1/Xi/ZP6ceD63lhwGzvfZccoRMmpkF9F4tCZmAL2oNGSeilhWQrzYCAU+9Ow=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tqzOthm20vmzec9p4it0gKseMk9kIGE0v6974ZN6EccYF3RsP
	N258Br7/3Giea2aNSx2Jv9hjIXUIQ64e9fNvrhfNNi4pEcmkvJHQRuuQCXH1HNlp0sE=
X-Gm-Gg: AZFdTZdDkyywisckiS5dBguyHj26YEiJshXGN5Y+S+IaBy+ONPMIjvkTLztSXAzzFRE
	wGR6Ez3H6uMCaflxVtp5bN/lAcrjV3eVdCNbE68idpBV167x07dvJMjkis5lQU1jDL74SxbPASz
	lf5gzClPEs3TUNdw4tonUecXIFsbz9VCQW7+zxa4l4A1TSxLyj9LU74pvbZTR8RRLy1zFMarCtX
	h8xncO0OamOkWsTaHxmDxVFdFUgHh5HXfouJ9Jpb/uIqZJ46otJ8pTR/69czNpKOyvFVGViZVRv
	4ortV0zMT62WHuzfYrgGJA3ENGIDQK2MD2WaO6vX7qeQWMLefDMbKF2Gi2sXF7QrO38F7laUs7D
	lt6BYHAYs3j1ME8DDG9vPNoK1VV9D2VGUHyfA1WXD5UVSRO2Det4Viz4ZbpqOXUeiNB2ql5s/pG
	o0ys6TtBQ37OuFxdJ4ETlxkW4cHJRKFSA026iVPQh0aF9st0L7uoXIMdPpCOTIwR6LDytH0hyjs
	7zwfWR4HOp9CLwV/wJgfyPQ5aXpQwse4qtkaDefM/GbwgfLsVcEtFvNocUGI/BvRNrKn3LPN3vq
	ic0IAebwAxTFzxJlHFfjrT9VjD4jcb0=
X-Received: by 2002:a05:6000:1841:b0:48e:60a7:e0bd with SMTP id ffacd0b85a97d-4aa54114f41mr3885700f8f.17.1795102328375;
        Thu, 19 Nov 2026 07:32:08 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:294b::41d:4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm237463f8f.7.2026.11.19.07.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:32:07 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Caleb Kan <ckan@cloudflare.com>,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v4 05/10] drm/locking: print deadlock backtraces with stack_depot_snprint()
Date: Thu, 19 Nov 2026 15:31:38 +0000
Message-ID: <20261119153143.4099483-6-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153143.4099483-1-matt@readmodwrite.com>
References: <20261119153143.4099483-1-matt@readmodwrite.com>
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

From: Caleb Kan <ckan@cloudflare.com>

When a modeset lock acquisition returns -EDEADLK, DRM saves the call chain
and prints it if the caller later attempts another lock or drops its locks
without first calling drm_modeset_backoff(). This diagnostic currently
fetches the saved stack through stack_depot_fetch().

Later patches compress the frames of persistent stack depot records and
remove stack_depot_fetch(), which cannot return a pointer to them.
Use stack_depot_snprint() to format the stack. Keep the PAGE_SIZE
buffer and leave the warning text, existing indentation, and backtrace
unchanged.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
[mfleming: reworded for compressed frames]
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 drivers/gpu/drm/drm_modeset_lock.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index e14814c30d8c..f48b02379b71 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -94,16 +94,13 @@ static noinline depot_stack_handle_t __drm_stack_depot_save(void)
 static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
 {
 	struct drm_printer p = drm_dbg_printer(NULL, DRM_UT_KMS, "drm_modeset_lock");
-	unsigned long *entries;
-	unsigned int nr_entries;
 	char *buf;
 
 	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
 	if (!buf)
 		return;
 
-	nr_entries = stack_depot_fetch(stack_depot, &entries);
-	stack_trace_snprint(buf, PAGE_SIZE, entries, nr_entries, 2);
+	stack_depot_snprint(stack_depot, buf, PAGE_SIZE, 2);
 
 	drm_printf(&p, "attempting to lock a contended lock without backoff:\n%s", buf);
 
-- 
2.43.0

