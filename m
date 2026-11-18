Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041471;
	b=BJYyzSdeXSuQnq2U5A3qPn/pkahT61Gr9okM4tUdYl99GCZUtkN/YLv+qXYl3JFDRSqV
	 +R/Y3xQrPImWNBQExd1qoe/veoVZg5qVU+/QTZ9clk1JKk3gpg+sdYTMD6l7lQRCAfUKX
	 PB2N3KWmg/FHGzGc+8hID3IpNXqCjqLzTLHRjdsIbSmoDLHmKWHkjjjnqqfUZU0nNdILs
	 gY7YzQEjpvX/h4fYvQx/FHdPadDi8fu77pNP5nZxEC8AY63svPy4kg8jbOw2Y1gBv6+kD
	 PlkDw52opZl1B5sPppnhBz3RfjjV8YZDlftH/w0ZBW63S4UbjsiUBj9hKs+v1L5Q/WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6TgutIL7BgsbRU4qg8O8DnW8JEzmtPqzVnoavDOV/cs=;
	b=yyctS3VbwU8Rkpb9EWcKvq7rs9RcpcNB7mPliI1UbabraE/oJMKtDkjbIoU3kc1IwGM7
	 3aGIxRdsrzY+Adt5L7lfzFgVviQkXh5NB4mD9iTdsqx9hnaF3gE4ew8beYR7jm5R+ZC0P
	 URZJPQPYLsZbdlvn7P73YtZkVSDf7FWrBSiX60GU/kbbaSWJdEOsmeA+amSDeHsBDXu1t
	 jjNmzAly0bTrO4mJhfOjWqpL3EJ9XdvwzIcY0IEpL53jp3aXtK7tfCkP2hyw815sRC1hm
	 WaU/P0vq0LlrZWnKBcl0AW7mUou8EYFkX0KCV02HJkbHxaXhxlPWvIoYP4Qrd3hXaoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z7a4V9y3;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A15760A5BD7
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A15760A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z7a4V9y3
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-843cf077f10so2017078a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795041470; x=1795646270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TgutIL7BgsbRU4qg8O8DnW8JEzmtPqzVnoavDOV/cs=;
        b=Z7a4V9y3XHhykqUAn50uEjLkC/2YbFaqfY/M5tN4H31Rq6vGiPbwiu3OjxoIihxHnl
         c9/fzNtq2f7AVtyUyn8IM59XeW84PMK1/yxbC+RD5fqwc3Z0xJrxyi5w0+8bvmG3CqwL
         FWmX62GPWMsLmU0HGPfuQW8pZve8zM5rPV9xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041470; x=1795646270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TgutIL7BgsbRU4qg8O8DnW8JEzmtPqzVnoavDOV/cs=;
        b=CHqaoULnRkaQ0w0lpJgHX+7GsYl3wAgNUyLivHTwpzhJ37gkgEjuzIjdgF6e3DrkQf
         8f23pFQCxgGJRhHXhwgk1u8X/EAz74Eumi8M4p9TpNrGkT4Nm1izzWc2TmgF4XPYjqei
         6UxG1BI7nkcHhc7Ey6HtiqpWJCikYE2wvuGz+y6D00C6h/dRUPUIRvwYltM56ZrovyL2
         3iCZSnciYCg4jBFmdmi0ynCQw4yaI2Igiyr4GAUPDtn6fl8yPUUJWGGEtPJ9BkYZUBDO
         5D65J/xKDLL4CQq5J3WHX/CLNc7LS0kz79lKDIPAmTKA97BAwi306izXGcOP9sGTasWJ
         4hvw==
X-Gm-Message-State: APuU4Z/fg+tbWe7mpFm1oOnzcLxoSBd9G55lOWuHW3PFjVjnM6nsc8Fv
	ZCRSvFAqrqomycWGz4K7jcE2VszAoqVtfQADNkDlNMlz9fq5PwS05PU83e3m2HMTsQ==
X-Gm-Gg: AYBFou1DmFste0tJBKtMKgB6jRpijPK7x94fo0PwoOLpsydFmiMN1OkdlPADbsm93GF
	sEIvKOMsOvfzGhf+RIthxyOj7/zcYqWX16OJ5DiEta2biWl7/yVX6HLtbizfA+aH5qPApb0+1Un
	CbYoBkLM+6YjB8g7FEdrRcfjczb3YWK7TMVrn1z0JcZmL8LbrKcMNlUWSEml5WabqkrDNOhgKMU
	g4eqSh1/zH0+kj+ZCSOqgQf2DoRYIzezGwK096d1s63wYbWy3rf5p2XfzVX2U12D0AS/1PIK2Iq
	wcpf+35A/fZmSjy2tqJEozqU2wccKWbX8G6ZDv6As3K1vow6o9TrFWI71BrYdkQgIJx8UW7ECf9
	MlJS3vAtFstqFJcntwp7TWUr2dvoOG+dgnW5BJf3YevXb6HbHYi1hAtETO6dKc+hJFe2meBKoV+
	Urw8jMiM9/h7Nxpda83E6TruDjL761gQIYFpKuZ2Gxf3eAGrvF0Iv9AqYobeiBfKYqb47pixVEo
	YeC1TsoQf0ZI2lWMucEDhEGQxd35o0zPGxZpY8VSOFyBtZyaPOpHk1V2BlEF3fFWhGZ2LjI8M2/
	o3dB3WGqgusLPugHnVn/9dW+Y9Chi+qEHMhe/7UFycZ1fjr05hhAL+LGYiQTzun/Omw1jwpjDlB
	TS0/7FBx3U8ZW7ck=
X-Received: by 2002:a05:6830:92a:b0:862:3cf:519e with SMTP id 46e09a7af769-862f09488damr5836907a34.12.1795041470598;
        Wed, 18 Nov 2026 14:37:50 -0800 (PST)
Received: from rrangel.c.googlers.com.com (212.56.236.23.bc.googleusercontent.com. [23.236.56.212])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01d4737sm2948762a34.7.2026.11.18.14.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:37:50 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: linux-kernel@vger.kernel.org,
	Raul E Rangel <rrangel@chromium.org>
Subject: [PATCH 2/2] pstore/ram: Fix region bounds check wrap
Date: Wed, 18 Nov 2026 15:37:46 -0700
Message-ID: <20261118223746.2251358-3-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261118223746.2251358-1-rrangel@chromium.org>
References: <20261118223746.2251358-1-rrangel@chromium.org>
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

ramoops_init_przs() checks whether a region fits only after dividing by
record_size, so an oversized region can fail with a misleading record
count error instead of reporting that there is no room. Both
ramoops_init_przs() and ramoops_init_prz() also add the region size to
the current address when checking bounds, which can wrap and accept an
out-of-bounds region.

Check the remaining space before dividing by record_size, and subtract
from the total size instead of adding to the address so the bounds
check cannot wrap.

Fixes: c628937803c6 ("pstore/ram: Fix bounds checks for mem_size, record_size, console_size and ftrace_size")
Fixes: de83209249d6 ("pstore: Make ramoops_init_przs generic for other prz arrays")
Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 fs/pstore/ram.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index aa056d0395a4..651f79f3187a 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -500,6 +500,14 @@ static int ramoops_init_przs(const char *name,
 		return 0;
 	}
 
+	if (mem_sz > cxt->size - (*paddr - cxt->phys_addr)) {
+		dev_err(dev, "no room for %s mem region (0x%zx@0x%llx) in (0x%lx@0x%llx)\n",
+			name,
+			mem_sz, (unsigned long long)*paddr,
+			cxt->size, (unsigned long long)cxt->phys_addr);
+		goto fail;
+	}
+
 	/*
 	 * If we have a negative record size, calculate it based on
 	 * mem_sz / *cnt. If we have a positive record size, calculate
@@ -523,14 +531,6 @@ static int ramoops_init_przs(const char *name,
 		}
 	}
 
-	if (*paddr + mem_sz - cxt->phys_addr > cxt->size) {
-		dev_err(dev, "no room for %s mem region (0x%zx@0x%llx) in (0x%lx@0x%llx)\n",
-			name,
-			mem_sz, (unsigned long long)*paddr,
-			cxt->size, (unsigned long long)cxt->phys_addr);
-		goto fail;
-	}
-
 	zone_sz = mem_sz / *cnt;
 	zone_sz = ALIGN_DOWN(zone_sz, 2);
 	if (!zone_sz) {
@@ -590,7 +590,7 @@ static int ramoops_init_prz(const char *name,
 	if (!sz)
 		return 0;
 
-	if (*paddr + sz - cxt->phys_addr > cxt->size) {
+	if (sz > cxt->size - (*paddr - cxt->phys_addr)) {
 		dev_err(dev, "no room for %s mem region (0x%zx@0x%llx) in (0x%lx@0x%llx)\n",
 			name, sz, (unsigned long long)*paddr,
 			cxt->size, (unsigned long long)cxt->phys_addr);
-- 
2.56.1.708.g77570a6a1d-goog

