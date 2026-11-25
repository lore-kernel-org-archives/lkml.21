Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625740;
	b=NBJ8dmCNpPJBf45xZ36L3Zuyp5SG0a89glyqvWQjEWEHrLSdcjQl78ZxaEhIp0pgJl54
	 sFnbz5AwsCZ9pfVgUsdbX+YJafft5jMM5vsJUigXz7M47N2vlE0NqWO2E7TIEuSnOfEz5
	 TjkKQ0+5v3W5UtiQl1eSHDETk1kMxs/HPIgilRjza4GUgMsjNCOHFvcesivMNGunJrtw9
	 +k4FmkjIEfmqauwULVBYw6Jqj6rRUUgVQJ9eitae+zuYe9ukTC6s270Ju1CQy+EaQ6R60
	 8VFxUsZDGUSj5z7FwFqySA1c+KtARuhPJG4QGaiWetnSWNJSuduB3Swh7cybbDHKnYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I3kEScZlbWzPvkgiaiooTo7NOcDoto+woqiEWD3fTdM=;
	b=DGxTKY/7JWCSANxUi7CoAtsbfD/yuIRyAmoK4sleJwU6hGE0hTOv0ZY3NTaU++qimvtZ
	 fS4/IDnuy3miDejCaKwaqjpK+eLnEh1JdWiC0cOPUaAIEPeK20V62vDqVJVBZMJSK9nt3
	 11hu+Z7TxjI8ODG+WxjO/1pILcuNXymgSO7KIMcQKUzNLy/2fit6ir2fU7n2jZJgHumGR
	 bIXENrkRD/LBrFfxG5Z3AuqEAQW1laLSjIs8VJ1mHpF7z1D+fBLVB5i/5D2Hjejj5v93T
	 AUwnfrGJp/u0gCyXqMVwYPCDbS7akZS31L6IdHdo2NPZ2p/Kr11ft4/vIBD2+xXapGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZGu0yE18;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32258606A680
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32258606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZGu0yE18
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4c685c751so53284607b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625739; x=1796230539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3kEScZlbWzPvkgiaiooTo7NOcDoto+woqiEWD3fTdM=;
        b=ZGu0yE18lxEgWYZSBytK0zX4atfX4vij8voUKfwNDWozPWZvo7VlhVSW0ggEMsx9Sk
         UtM/mo5koCQio8etsBiNpKrJ29nj+HKjFlQOLQ2WDyT2YdFRRatJCIT5qJ4w8WonvX7V
         MezRTremT5lawePUaTAZKzmP21rrv1hBVXPn/Fp/g5wkRmCIJ9C3FagcYFJt6wEjTOSu
         7zsgsq/XDeALmklwWFhUuH1dK1+OuH9x2PVJ2hCNI6Zu7jUUPzbezmayAgv1SO5xbY0Q
         yZS3bi5C5tpn71qCgHQifxk7Jyimcb1Mf4xUn+2U2HY6UeXyTjFix+bfRTfj3zgs+2C1
         2Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625739; x=1796230539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I3kEScZlbWzPvkgiaiooTo7NOcDoto+woqiEWD3fTdM=;
        b=jQ8PiUGi6MJzMyYVI1cb+WOn8ekmN9gjXAd+UoC+QeLHjD57M7uAHE8D+9P9RoFNCR
         JJKw3wnR18ZLliJLOOVSXG0gAIbj9SGFf48sOitcJ0vQCpDcxEDgsY3AHl6QW98qKoF8
         N90voohVkj2gounTJ7LXTDMs0K4VmgU17ebQ+PEiI87CKgINsy4XLn9Wpl5YTXup16OQ
         LJjNjFJOfHCYbyoqJx11svvixXHDih8qE1dcLw3Okh4xHdh5k0eHyTC5zweU7ZgnAY3G
         Xm9NMN3HLiK1SJGhm4e4IJ03iE/Gr3EZ2v8wGI6/tSzBKrvm3V7QCVitbS+lUtsZOSHS
         Vnnw==
X-Gm-Message-State: APuU4Z9IREK+6Dm+tA+wOFrW+oIwwf7qcMrLI6YzkzMQSSlEKsvop/Xo
	AOrfrZje/yFwceIyw+7u7DFdeLCEzuTV8TO5nWWMBI3pZeaQhh4kc0ISswG/H6w=
X-Gm-Gg: AZFdTZfEunCIkgVDtk3AHugIauJpAkehvXXshl5U0T3CU5scxK52qpzQ+de6o/g3a1Q
	U8t/VNU4AUfiZ1FpUx6mJ+3HxHrXEA1LDEAPTOoUBYpVJ9tnzAVEGxhi7QilUtaOcM7YOfIzKLz
	aXCJnyqAo1bpMNTRNmoGyp8lGMzBjEr9UAyfgVfunfC1fCwwRPL14AcW5ekk1cYszVEVzw1RW9F
	KdB5OxO/M4aCDY9qlWFM0cE7oTzsST3GTZHX/zCt9bUwLmx1PJv3yjRhdWfhzD7x8OmNLYG5oq7
	eUb+pEUkwd/rMXOjgiKyfyoYPPOjC+V0d26B9psMVnTaH4zaQ73Q1oy8JsiuPU4Lu6LoURWQf2e
	1XbzLtc6ldYgUcjvP3xArZWtbr2HN1jyKzmFWeNHxiesFbZ6eLZAOQySKRnjOjlBZnc1BwQPGb+
	cVbd2Zhdx0O41pPZY0XRzrFUAYNqF3VTfF8/Xg/7udu1Ohb4bA5Bbjp3NquSq8fXZyEN1MG0H+/
	8Fo0LU2hXNyop8DxNAwsUje6FIJBZyIrkdRfGjSm+I4/jKVVFW9d39hCELgL+ay3Gso3o6S52F7
	V2PqodUgzCXcJ6Op4dneNgKgxmmjPdC8xs0=
X-Received: by 2002:a05:690c:48c3:b0:8b3:615b:71d5 with SMTP id 00721157ae682-8b52051d1d0mr60411817b3.107.1795625739063;
        Wed, 25 Nov 2026 08:55:39 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bf474sm74766167b3.21.2026.11.25.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:55:38 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] MAINTAINERS: Move INTEL CRPS COMMON REDUNDANT PSU DRIVER entry to sorted position
Date: Wed, 25 Nov 2026 10:55:31 -0600
Message-ID: <20261125165536.792563-5-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125165536.792563-1-svav2021@gmail.com>
References: <20261125165536.792563-1-svav2021@gmail.com>
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

The INTEL CRPS COMMON REDUNDANT PSU DRIVER entry is out of alphabetical
order. Move it between INTEL CPU family model numbers and INTEL DISCRETE
GRAPHICS NVM MTD DRIVER.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8576ec2cdcf1..37087eb6e40a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7124,13 +7124,6 @@ F:	kernel/cred.c
 F:	rust/kernel/cred.rs
 F:	Documentation/security/credentials.rst
 
-INTEL CRPS COMMON REDUNDANT PSU DRIVER
-M:	Ninad Palsule <ninad@linux.ibm.com>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/hwmon/crps.rst
-F:	drivers/hwmon/pmbus/crps.c
-
 CRYPTO API
 M:	Herbert Xu <herbert@gondor.apana.org.au>
 M:	"David S. Miller" <davem@davemloft.net>
@@ -13310,6 +13303,13 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	arch/x86/include/asm/intel-family.h
 
+INTEL CRPS COMMON REDUNDANT PSU DRIVER
+M:	Ninad Palsule <ninad@linux.ibm.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/crps.rst
+F:	drivers/hwmon/pmbus/crps.c
+
 INTEL DISCRETE GRAPHICS NVM MTD DRIVER
 M:	Alexander Usyskin <alexander.usyskin@intel.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.47.3

