Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111222;
	b=xu8QhLZborGW+b100rk0dwYUysJ51/ipUCFS+mB/ZZW2WHA7XbUYsmnVIbZnRcTr6MpD
	 hOTtKPsWS0AtTpahUCiapByw18ybyPbz+N7upey538TUwGlFgSzTMTQ+jvWcDVWrCiYeE
	 hU3xX6yl9Lj6+8dScEV+/GpEERAcVeRNbzWBZPi3cljAa/bsZ9e8CJtI2IX8vTn2fr5pe
	 t9K64p+kJEzsJHrI1z2Fq/v2CVyKxmGf0hSPhxlyxiep/KO1my1wu5UQxWJt3cxoM3n5f
	 idHoU1ut+8aq6gU1gS5ELopkK9fyJXkC6u3Q0dQv3tZ3Zny26gv9wYEPvbnqHDmVtCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zRbJF3eDTIyI8Y0KUyM7gJOV7t0l7GOD9RUKADgxt4c=;
	b=PowN5Sd1yVRvl+62BUlX8R8th0YdrTxGQ1O0496kmoDleFi55qieZF8V2A6F1MpYx+1D
	 TNJntkVO/H/AkGhHLzfQkT4pRPkFO0lniJYdRQCzHPy+JYeXn0y5927NTVW4jyPr1EBwM
	 Cs8qjl984ZnkkEzyyBYNEFKLnS6zdofP44ueHfw7jXIfkWnh9DEr8XTf8jdoSREkoF1v7
	 eKTXfaRp/HU/oHbGcrMWHokqUJCPDzXYTXItkcp2C+jybyZ0oiNEZqMl6F8G1EuxsqeAY
	 F53bINiiwQdrdJSfSq2hgqK/q2KvaGaRt2R5mQtvp7Qs74geCRd3vgchH+htGcPDcZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZvTMx8jz;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6F6606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6F6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZvTMx8jz
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-497614c95f0so1710954f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111220; x=1795716020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRbJF3eDTIyI8Y0KUyM7gJOV7t0l7GOD9RUKADgxt4c=;
        b=ZvTMx8jz9RqPe35EHxckpIspMEfBW8Syv/OV16Uuj5Y5hBlMAJ4WGOWG/B4qBwevnd
         Y4+63CpPqH2d45jB0boF2tXeiUrZPnnjV52Csk6GFX2E5W/I+CBTxX+fY5nILKYbL6EW
         NXYRo7xBgLlc73kcIPOkxE7f32WLv4v2sBJ2niomTwV7Jm05moExupQ63yyOxnsOt8ww
         eArZYRujftKPu7Z3lEHnrgV//utD2IuQvHyp2bZRkRGKfIsu7/zpLPH00yCyjyPWy8oz
         KEUtw2L+Pe29HdW7znU1PwwWjuHTm/mYJPIi3ntkq0XkKUO1IZkR2yZbQbCAxwQ0uN3q
         Ae6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111220; x=1795716020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRbJF3eDTIyI8Y0KUyM7gJOV7t0l7GOD9RUKADgxt4c=;
        b=ZT9tBXnYDe5GwthaKx0dGwxNRtcxwa8I/dzatVNFBYoFs7RaQRTFjZUS5xhBy0x/s5
         ejdfwVywnqCTx4vZeE15bqK2F3tmIEhHlNdvr9/JzUN34x1oLUtuM8sCss3B6g7yws9z
         yrj2BNqK62keH/KHXaDlKIOT4T0ErYPU+/JrG9jCbNzi015jh1TpUd57D3sEjt6T7yBb
         qH0PGzCAQc2QLgnwy0AqMIqbr8GuEp2ke5fv7KQXT8jbQHWtGlKoHwhz8bWH1dgd5uMq
         k4+CmMb98kHp91/OipwisMcIJFB49jZcurn8rIi5eVS5mYp3J88bLEYOKkBaba2yFbYk
         Qy0Q==
X-Forwarded-Encrypted: i=1; AL+hErHFYWg3dtl6dZixADkVvMHFJ6cGkliQ0kntWZX9h0B46y9/o29AaE2ypQfF/FSrcb3TON0IiMyqmDfdCls=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PseAz21wHHVp7wXeAyMfskKsU6btGM6xG6pgOuGDTBN1GnXrM
	3MxBLaPCykqIpdjvDBtN8gss4e4IlJCsiLWYSdXHKvzBRv24V4dGpATv
X-Gm-Gg: AZFdTZeivrSS+fo5R9lcHI4PftJHSAC1RZ1AcD8yxOWIo3hiGS1KETvVq+ry736KNBP
	kAK/be8pysi851WNaEs7P8cIVSLlexilgWFB83Rc/De34Cuy+TvKzZbpFxtvxkgp5EWzsyDkHVJ
	fKPU7YkHtFLzslc3btX1U6h0TxYXb47+VeHPXati+e9+c2zAL/L83J8InSXKzx11bgfN8B3IE4b
	fNXh15Mj4R5pfzy9MZyDCU3ME/QIsPhIpFadzcFZRMHj5+Zm5XXMPayBdHVPNPVGh4UzgtsKZ5i
	SoOZoyEVxFyrW2KatPJqlCc3DqYPmt4pvUoO5U5kLWO7RXoOrKwYnCBZ/KRONzJobMX5Uj9261S
	v9NbRlh8K64fDT98APw0TDCecJTC96TqgoWPmMxzN9Ch+9JcPGHK/b1C+2lqA6yfpX5fAWtiijf
	7WWzPs8pcDSF6fzX33rgGklqodktVKANk6+kULuEBqCjcljfbE0vMjbexwTc32lWZhmAF396INw
	wh74w6zucmCQsWJRGEc8BzV190x9teESp5lG97IHqszXzkwzMToX+aFzJh2AKLnHZ/tHyLt5mZE
	xH5VE2E/uvj584ZRGv8hNXA/y4og6cq5509eD09V3GbOaQ==
X-Received: by 2002:a5d:64c9:0:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-4abb0f3c071mr274803f8f.14.1795111220019;
        Thu, 19 Nov 2026 10:00:20 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:477f:ff00:daf2:6bb3:8bd9:8ae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm900334f8f.11.2026.11.19.10.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:00:19 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	ljs@kernel.org,
	rppt@kernel.org,
	peterx@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] mm: skip temporary folio allocation for anonymous UFFD missing faults
Date: Thu, 19 Nov 2026 20:00:15 +0200
Message-ID: <20261119180015.933433-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

An anonymous write fault on a VMA registered for missing userfaultfd
faults currently allocates, zeroes and memcg-charges a folio before
checking the PTE and handing the fault to userspace. The folio is then
immediately discarded without ever being mapped.

Check the PTE and address-space stability under the PTE lock before
allocating a folio when missing faults are registered. Deliver the fault
to userfaultfd without allocating and discarding a temporary folio.

In a four-boot native B/P/B/P comparison, the mean UFFD fault median
fell from 13,997.75 ns to 13,093.55 ns (-904.2 ns, -6.46%). A guest
allocation trace saw 256 fewer allocations in the faulting task for
256 registered missing faults.

Note: this changes OOM ordering. In a fixed 18 MiB memcg test, the
baseline OOM-killed only the faulting client before delivering a UFFD
event. With this change, the event reached an unprotected shared handler,
and its UFFDIO_COPY allocation could trigger an additional OOM kill of the
handler. A separate surviving client consequently lost its handler and
failed a page-content check after the UFFD registration was released.
The same handler-death mechanism was reproducible on the unmodified
(mainline) kernel when memory pressure was imposed after event delivery
but before UFFDIO_COPY, although the fixed-limit outcomes differed.

Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 mm/memory.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 0fb676d..63b39fa 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5547,6 +5547,22 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	ret = vmf_anon_prepare(vmf);
 	if (ret)
 		return ret;
+
+	if (unlikely(userfaultfd_missing(vma))) {
+		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
+				vmf->address, &vmf->ptl);
+		if (!vmf->pte)
+			goto unlock;
+		if (vmf_pte_changed(vmf)) {
+			update_mmu_tlb(vma, vmf->address, vmf->pte);
+			goto unlock;
+		}
+		ret = check_stable_address_space(vma->vm_mm);
+		if (ret)
+			goto unlock;
+		pte_unmap_unlock(vmf->pte, vmf->ptl);
+		return handle_userfault(vmf, VM_UFFD_MISSING);
+	}
 	/* Returns NULL on OOM or ERR_PTR(-EAGAIN) if we must retry the fault */
 	folio = alloc_anon_folio(vmf);
 	if (IS_ERR(folio))
@@ -5579,12 +5595,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	if (ret)
 		goto release;
 
-	/* Deliver the page fault to userland, check inside PT lock */
-	if (userfaultfd_missing(vma)) {
-		pte_unmap_unlock(vmf->pte, vmf->ptl);
-		folio_put(folio);
-		return handle_userfault(vmf, VM_UFFD_MISSING);
-	}
 	map_anon_folio_pte_pf(folio, vmf->pte, vma, addr,
 			      vmf_orig_pte_uffd_wp(vmf));
 unlock:
-- 
2.43.0

