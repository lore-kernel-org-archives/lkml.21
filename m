Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102326;
	b=LosOMKCXGmnmsf4+cJ59KDzq/uALx1Ad857fwvzNCmFR4du6i7w7Yt8FG/gt1vVXW/KK
	 2Yc3npriMXNeOM6PgKotynDK7Fn0p5rc5IRu9RgShoYXtYMj1kP74usNyLZZrSbZAHmGW
	 EnnhQ3ZBpZvdYDqwdYfZW4v2d2K8GWS2YfpgLfgdAIve9S22Cya6H/vVcM/1eZx7zsYCk
	 e/AktS7iCXkq1IBm/ELPy7bI0vGh2Yc4LNgRnGA0zwuek/J3D92+TwsPi0oRTxh/jaMO1
	 elM+o+LCFSrQJao8ZkXPIqe1uv7yBkOc1xeIeOW5Vg52JCyexJqvU8T+QIMCW9s7tPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h8lSiLXtXZ1pZqJZBadUPNSQr+zfDoCDjw/Y8Qu2swI=;
	b=v6379UUHhAmL2htxfFbtWtzujjrzSGnRroRcVjWDPBMNyW1Bentt3KAmHUxd5aGtVz9r
	 pU3BlmSddoMluDPZoL6Mib6+6kDSGb7/pplIS3Tywlnbj6d968zIWau6GV9iOvQvl1+Rs
	 x5VDDwAyV5Sa6q9m0nC9yMD5r8sZS527aJ+VUMRB0CjPPeglerFPOOg27IxcHF8QEle7G
	 RL5LvpHSEWqzuSquIEMeUZcOoavXFKbpe5HFhwvlzqD9M/uOJAnFKM74z9VfRZdQTM/GP
	 NLp57Syx33fHcfVXTHc0aofG4DTkvFremmBUUCbAnWtFCyG418G71qhhtK9BtqunZRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rGlEZAYR;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA51C60A260E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA51C60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rGlEZAYR
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so1714485f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1795102324; x=1795707124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8lSiLXtXZ1pZqJZBadUPNSQr+zfDoCDjw/Y8Qu2swI=;
        b=rGlEZAYRlFHMIzVDj4PSY5njeo+pW1iirzFOXiNmruqq3HJFFdVgx6GuoPmtDcN2/G
         4viHSbnnRMVdKLXHgzvk30Mp1W30DSh9jQdrkimb63ej3/PZGEULQifcButBU3y4NDuO
         A/+Kik3f3+P+rSPyzUiH4P2F7QfIKL4nlsiYJI0pj/t86ZQJZjZkiCBKoMCLT1Ltmazk
         T0o0EqEM596MZSYX0KSvO1fMceVNU5CzpaPYVcKm/PGA1Sy6eQm9BBCEsSXTEQv8Yocx
         Ex8bYPufgS3AsLc7Ad2Ts2KhwRUgkRRSAnvsrEg9t1/PaMPB8w/0bTMIzehku2sMooxt
         s5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102324; x=1795707124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8lSiLXtXZ1pZqJZBadUPNSQr+zfDoCDjw/Y8Qu2swI=;
        b=wQn98YRwDwp/AMhAL1fOUL2Cd68qsFkgweY7TSMGy9ySexvX/HRuRihdthwDdfAtQi
         jnFJHtOXLVAZ+HiuoVOdUDyxgI1nPAKFSAhOpPguXzLtgaB0SFudqj784ez7U9w7MSam
         hxoPbHmP44LbvdAFyRNFmSxViVL41RGgISPBjbU69CLmKbkTZRkM/X2CVr4wzduzkCXE
         6pKq0DjwuPnyPl1UjaBKhHpiG7FaXDNCApYzVYg7XA/Q8OTgDYMvKP3K7mQ9ofk3SWOL
         0A8afRuidJmuJzYmACNM8RV9EjDjnXb2PepTJSVGEMgMSvenDEtgdSCSuvlONLVmgt6w
         I51A==
X-Forwarded-Encrypted: i=1; AL+hErEIEqm6WqiwzE8G6OOSujZI/fAgm/8Q+P9E6F/6jtnUGUohdRZNDsTPsANnUGkseGrxeaQATD1i81yQ1UM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TjKsYv7wzSwKSQPp/QmsaJcBaZ+nRcnm+afmUAAV9ehodFRQX
	ET52oB/rhUWfMcurfHJMwgBT6wYEGxUHvx0R73ccrSn2GgEKzcRJIwLQJKGpuVYt1z0=
X-Gm-Gg: AZFdTZeFFfidU7FwNbee0tRkSE8QduZQFss5g0L5l8bikBhLoycDBlV/LonirYIYUpr
	Cd+gHh9uha0TKw8ymNzkpcTlEX0ufiRuAMavmT4iti9f8IYRU8u7Zw12Mof0S4aFx+cikvvoxSM
	8o8kWsXWhDJTZ5p8oJKw9mJ6P3utqCia/KYziI+hkjzJJUme6OGF+HNASNsC1U7IK6F2Mot3OJv
	0KMtuqAFl3SR3N39+N7CY0SLAkdmmwL/eGqbdJl3vvHVYKdci7M6ZZK1Qdn6w/DutWcuXZDOmb0
	EiHD/9GYHOcv78MHa4g1UktpPg27lpwyXZ6oPfj4sSQyWJTDyPk7GIZvzpBn1kXRSgreXVGfxYV
	IQYN08MVn8c1ui7OlP+o7qayUl8ZP8VeGK5iy9pFCFWT3sLvXPa+8YG27btMMZNlzNslDnPcP+T
	QusdGqMUWiIdeEaO3aKyg4skvAhX0nZpebTI/NWKr1DMQjaZ9Q2VZ1aoUZTeqkHug8Km9TG9Btu
	uqdcYDsBVcY0nsJQ14T1VfGCZT7Icv96vGGZJM74pGdHMbum211grWc5fB/WFPETupNJr8T5sSY
	ZLiDuAXII5mkrPNY9+LQStjZLCGhqj7/
X-Received: by 2002:a5d:5f44:0:b0:48f:bf71:2ad9 with SMTP id ffacd0b85a97d-4a63e9d06e2mr13962297f8f.41.1795102324246;
        Thu, 19 Nov 2026 07:32:04 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:294b::41d:4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm237463f8f.7.2026.11.19.07.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:32:03 -0800 (PST)
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
Subject: [PATCH v4 02/10] mm/kmemleak: use stack_depot_fetch_into() for leak reports
Date: Thu, 19 Nov 2026 15:31:35 +0000
Message-ID: <20261119153143.4099483-3-matt@readmodwrite.com>
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

kmemleak stores allocation backtraces as persistent stack depot handles.
With compressed frames, stack_depot_fetch() cannot return a pointer
to unsigned long stack-record entries, so leak reports would omit the
saved backtrace.

Use stack_depot_fetch_into() with a MAX_TRACE-sized local array before
formatting the report. MAX_TRACE matches the save-side limit, so every
valid kmemleak trace fits without truncation. Preserve frame order and the
existing report format.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
[mfleming: reworded for compressed frames]
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 mm/kmemleak.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 20c0eb41c873..61ff4a10ce11 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -378,10 +378,10 @@ static void __print_unreferenced(struct seq_file *seq,
 				 bool hex_dump)
 {
 	int i;
-	unsigned long *entries;
+	unsigned long entries[MAX_TRACE];
 	unsigned int nr_entries;
 
-	nr_entries = stack_depot_fetch(object->trace_handle, &entries);
+	nr_entries = stack_depot_fetch_into(object->trace_handle, entries, ARRAY_SIZE(entries));
 	warn_or_seq_printf(seq, "unreferenced object%s 0x%08lx (size %zu):\n",
 			   __object_type_str(object),
 			   object->pointer, object->size);
-- 
2.43.0

