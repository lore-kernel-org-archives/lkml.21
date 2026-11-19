Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059571;
	b=v4pTSAE0+1HA2MdZBevDjvliZFx6NtvRRGhw/Vm5un3k1NOc/5QUSbqJ40V8es858p7N
	 XLzrKdiEWG+vdh4noiFFD88gnyPX83tIv+nwGFMURfP/bFwf+E9DS+b4/VhrAxge3FVNt
	 8ZiI9R7+Xr98bNcrTgdMloVV7N1pol0BVOTQvwzqhGjmaOj16cNPcUcngvrExzqsKY+71
	 T73tUsETEosNbVZRMaMfYBhoU8cADywxcx8+t4KFti5mPTu0ekRoYiqF65hpL87MAMnyp
	 HAKRX5ikNwJHMsIcWhR9T/P+Czvtx+pu9HxD5/ecKdR2VMIJbiNxO93ludZM9y/vsvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yXYdj9nyuM4v8jiGLwhF31o5qWrZcD3zaXor3EN0gEE=;
	b=lbn8JNHfOgWvpDZY5aeo6rA3SYktobF/waDqvVWKtOK/OifQ6YpdpMaTjUcmk7QAXo4a
	 9ZLE9rJXQ16Nb38rK9Ok2eq+Xr10onJQm4FxJiYc46gnyZRrGi+gq2ciuVMK9w9T3iaeS
	 q7p+Q00P4e+qI9uF90cP3cCdq5eARPXI2TlO56q/ydAU3jIplIDjKd2Hly4/vsk/2LDcr
	 GDRqteqOjGLRk5vjK1ufvltk0Q/wpXGAGGOsavnXoWqhmq3dgsnWAWxZ3Fb96Q3lvz4ai
	 lsbEEE/JOZYK3l7WhTVm4Bp/5DR73Ry1O5VBC+r6wXqOkqvJ60x+y0Zh6OSUiy7O42A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cg4k+wH;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9101760A2603
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9101760A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cg4k+wH
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38431138772so483447eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059571; x=1795664371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXYdj9nyuM4v8jiGLwhF31o5qWrZcD3zaXor3EN0gEE=;
        b=0cg4k+wHnhNI3DTougAkFQgC3l2AHI8lRB0sPyv/gIjDnLnsorxKxP6Fvudat3iu/B
         gG3qKrXOCJWhv0AADhTB0Cld/9nvaXrphUKD4XqFU6P7dtDJnRd/d8E7wnun7Dg9Dx1V
         i5ZmgWCLef0d59vj/H02k4TCtMAUuwmja7i3UbKgQFetEDExGvKuTLFktZYBOnem04O2
         B0BDbZcbR58APvNQs7+m/delZuXjmqcU7ftNFLX4h/XRePo/9ho59uOEd2KKuwCyqU5E
         t90325AMVhhnmP53X61sfd6/RaRdvfuqObyKZG2ghX67nA7JJMyije38xrtpXohim7ut
         fZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059571; x=1795664371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yXYdj9nyuM4v8jiGLwhF31o5qWrZcD3zaXor3EN0gEE=;
        b=COHvlivQlFQByTG/IGQvgMQzEiN2aV87QtghpSxicgwlGOnWBoR/kTEQwzyNCQwF9o
         u0pUYB1KwXKHuIMmlYD8R1Rf4edJBu/QjfC3vHkOPXoT7S0FWoYgMVVukOaONhpEffHk
         KLexdj1A6FDWhd67rx/AsuU6AF54ui1+ZLEOEnoi1JOHcgpxLGRM93nP8rUPx+ZaWe4z
         BnNgGHuiFsWTpORIe7oSCdh3175oVkqhz04HNrEDf47+La9L4iIyHN7anwF/0+D9jwr0
         VI73f+sk37gBOs3S+vpt21kCOVAlYliDkfE90+0XEOpWd8qIVwXsSJxX9gfdRT4X1KCY
         8KSg==
X-Forwarded-Encrypted: i=1; AL+hErH/t5HxZP7wgF93XzkAgbqb8eE6pbpUxa24ua5aK4BPjj5nar/Z/w/L/25iYREQWpihcCXrq7mu7nJ5pI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t12whZ2M8GYbExwF1Z1b/+BeQzMV36wY80budLdtnAalH59yN
	ECVaASrZ6U2wbb6zRkDIsixUWImPQMEqv0Mu85oHK8QjDSDel0B0SxQVcLh5Jw==
X-Gm-Gg: AYBFou1wzTRVvi4Kq2KMZwtxaPyHRDQC7OCDn54V+qFpXSK89Cs8LroJ+Ne50CDLXh+
	jwP13PusDZN0Ie1p4PevamEf0CB1nUz28aEgKqvH4ZmxwcFKrlJynhKOAuZgq6MWTF0S6K9wFD/
	Fe//sAESBFsWHbDoP857DRX5c854c7BGlObc9v0/17WMhLsh4AcX4dGXeBW/TCpTRoisrScHbmb
	/PbgqP/W34x7y0HsGPBiEkknLde8/zzIcEaGqDsSSvY/nvCl6e5eV5L/MOsuoJw/hjxU5T4j+Cg
	VwVjD4kmy8KI036NbIZt4tQ+aDdWJP683Dh1Bg55g66D51J5jLrjosmj62CF0T0x7EzpijPjgzd
	GQ7CsUTosT2742ZI4Fg4ADJxbMV/3/49i5MZALkwgpr3pTHDTohh6TnVd9NqB+8JzaLtstzherv
	7v3w8TOlMvGGBGoX2Y5BZ6CZrqo9SZcOl1yE60Y9hxafWoribKPeLEmhVAWpffDpGj2ab2ofiz9
	l8HAEAehu0+jMiIbSD4UmL6779HkGW6rWY01JRNcbZjT5yH6EUOtx5Yi3ZHjER1koAlXFYdGGvd
	uWfJLrq5jmx0KlG5GDTH9DDUXzi/krUu7ULpvsHuS/2HA1a8WKpX+b0=
X-Received: by 2002:a05:7300:f408:b0:369:f035:661 with SMTP id 5a478bee46e88-38280a3c1f8mr4556846eec.15.1795059570467;
        Wed, 18 Nov 2026 19:39:30 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:39:29 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCHv2 01/18] powerpc/mm/book3s64: unlock RCU before returning from mm_iommu_is_devmem()
Date: Thu, 19 Nov 2026 09:08:56 +0530
Message-Id: <c6cce4c4ad2b177cacfb7bfbb7bfd4a26fcd4612.1795058683.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795058683.git.ritesh.list@gmail.com>
References: <cover.1795058683.git.ritesh.list@gmail.com>
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

Clang's context analysis reports:
  iommu_api.c:380:1: error: __ctx_lock_RCU 'RCU' is not held on every path through here [-Werror,-Wthread-safety-analysis]

mm_iommu_is_devmem() takes the RCU read lock to walk the preregistered
device-memory list. On a match it returned true from inside the loop and
skipped rcu_read_unlock(). Hence fix it.

Fixes: b5952f8125ae ("powerpc/mm/book3s64/iommu: fix some RCU-list locks")
Cc: stable@vger.kernel.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/iommu_api.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index 60d00c9e7f19..56d9aa6cc8e2 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -356,6 +356,7 @@ bool mm_iommu_is_devmem(struct mm_struct *mm, unsigned long hpa,
 {
 	struct mm_iommu_table_group_mem_t *mem;
 	unsigned long end;
+	bool ret = false;
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(mem, &mm->context.iommu_group_mem_list, next) {
@@ -371,12 +372,13 @@ bool mm_iommu_is_devmem(struct mm_struct *mm, unsigned long hpa,
 			 * and the caller needs to distinguish this situation.
 			 */
 			*size = min(1UL << pageshift, end - hpa);
-			return true;
+			ret = true;
+			break;
 		}
 	}
 	rcu_read_unlock();
 
-	return false;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mm_iommu_is_devmem);
 
-- 
2.39.5

