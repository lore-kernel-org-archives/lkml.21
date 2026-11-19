Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046519;
	b=3KR4hyavsCseihZJAMqQuIn6EeaR9Bxyq8QihTgou+rqv6aS58enkRmwlN2/y7LC8MNw
	 VJCA+cuPaJVtKeovBq/8lmv0iKYJ7tyG0eOvq9GHryog1s4AonJsFqnwjDialjgW/3W4C
	 fB4Gc68C2TBSzVp2w75+IEY78MxxtmX8rUCWeL33Z54JuuXifVd5VHY+2hwBxeic6fKGu
	 IVvc5BbnizasOOixstNcVN9M/gQaBZaM61BW5e02MnPSqxBjPnw6euQGrR/hReQDpCSoV
	 WtTDDh/go6feltFar4vzKKL3r0460mHVUw4nlFHUTDzvMKQUf1uCDVxeKcSETIg1LAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=w7Woz9FOzyEI61pXAlfURrfx9J9JG5qwKCh+RDSinsc=;
	b=FGhkGzv6W9Rxbg5EWzARs7LgLtER92YPPAkrjBx/CZS1oAWmI+KthVhMFvs3TPzZ1DS2
	 gQPWBsbfBBPDiq7gOpFmkG6fXT8ClRmqTLHQkedaGLW6KAf+zfLd7jt7IMoaPGdXfIduc
	 JkJNwsxkI69wDU4ClRz9nNtSO2tqAxpoAFAez1Fy2wls306epWvA+DOEtnCGrycRjk1ta
	 miy7EWFvoHuTc/O0AOF1+7kOrkTb8eAeJrUCLmntSfY09DKv/al6xJq0n3+LDYoKr41x2
	 WoPiO9zmwZNpzcKq6fX5TAakjgJ+DJbt6ifjvntsL7E4TVnWYFqPplalx28i2CRqQUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nsRGs9Ga;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5918060A2618
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5918060A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nsRGs9Ga
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-860e65f42a5so1729976a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795046518; x=1795651318; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7Woz9FOzyEI61pXAlfURrfx9J9JG5qwKCh+RDSinsc=;
        b=nsRGs9GaEnVL8fDz7RDR30xI5x0zjXluUYy96pdI+goVmdQ/rT3JwxAmAhoLV7IDji
         FS84Q+VArgYKbMS6JeL5lnSR17EEK/kS8NluDXXIf5fdaK0K5/O4hA4LhOdIVwsQHusy
         tNa0z0tp7R9qIDPlxXbE45AY95n18rw2FY54ZBHmWxHVQHEbSMqXosjNYqECUWKhjng1
         Kb1rirxYgDO2Sg1zDFL9Ma0uNUMmPJH1ugn6x0cPwmpaRO8Db8iomGD0Tv/c0yl7CPah
         rIaMJ6cz4p4Hm9pWzg/iaGIZtw3bj5dZUCnbxRPsamBCwXb0jav8YU19AMB2vkXnm1rD
         hQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046518; x=1795651318;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w7Woz9FOzyEI61pXAlfURrfx9J9JG5qwKCh+RDSinsc=;
        b=ljs1u+hoRr4nzWGMXd0S1irBJ32zcTtyuzN2kU8zPzswZZLVZPsaueM9JH+F48VDdM
         J4BY15G4X2+nTeaBrRpQS1RR0X1GwdZJQaISlKvaWatZwJBrrMe49qUcIahiwifbtXas
         8OXL41GXuOUzehT+plCm+yekPmNBWkZDbyC+vP8et2g1THfJoGA92KZfGYUgM/EZtcQ3
         nN60qqrl9E0x/Rkryy/y0ijK9Ds8btvh+vzlZbtdHwmsS4iaUYCPtHFzrjYi8FjispYl
         jAJ1juMqOnz5oQIxa6pPQo9keFnhsa0mu1rEB2vgbHrIJLYeXnB8Z/Fk5ACMXXg31kCd
         o8hA==
X-Forwarded-Encrypted: i=1; AL+hErHyNdB/rorDFOzsX5c+A+uk4boePTrsNBqE3FNztchxfBe9srMOTRetDBf8rYf3zvj763yiDUGnZqpmZyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X8MHJy3nY8jxOBVEQCpWmS77U+99tZSN7dIbRXUk4KGZSj1zT
	Y/2dYxHg9SWKkvEgrzTgls/kONQmzUvFS9Mncx6YTwnmF6vELECoP3yzLH1aY8iMC0xJ4hFwjNr
	EUVZTNd+/kJPz1g==
X-Received: from ioi14-n1.prod.google.com ([2002:a05:6602:c64e:10b0:9ca:d7a7:e72f])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:518b:b0:4f5:d3bf:edf3 with SMTP id 5614622812f47-57742b303c1mr4468950b6e.59.1795046518039;
 Wed, 18 Nov 2026 16:01:58 -0800 (PST)
Date: Thu, 19 Nov 2026 00:01:44 +0000
In-Reply-To: <20261119000151.442543-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119000151.442543-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119000151.442543-3-dmatlack@google.com>
Subject: [PATCH v2 2/8] vfio/pci: Annotate lockless accesses to vdev->sriov_active
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Cc: Abhishek Sahu <abhsahu@nvidia.com>, Alex Williamson <alex@shazbot.org>, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>, Shuah Khan <shuah@kernel.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Use READ_ONCE() and WRITE_ONCE() to annotate the read of
vdev->sriov_active in vfio_pci_set_power_state() and the lockless write
that clears it in vfio_pci_core_sriov_configure().

vfio_pci_core_sriov_configure() intentionally clears sriov_active
without holding memory_lock, so the write can race with the read in
vfio_pci_set_power_state() (which runs under memory_lock). The race is
benign: at worst it causes a spurious -EBUSY while the device stays in
D0. Mark the accesses anyway to document the intentional data race and
avoid KCSAN reports.

The write that sets sriov_active is done under memory_lock and is
serialized against the lockless write by device_lock, so it does not
need to be annotated.

Fixes: 40ef3edf151e ("vfio/pci: Use a private flag to prevent power state change with VFs")
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 4289ec9bc32f..511dcb49d2f6 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -329,7 +329,7 @@ int vfio_pci_set_power_state(struct vfio_pci_core_device *vdev, pci_power_t stat
 	lockdep_assert_held_write(&vdev->memory_lock);
 
 	/* Prevent changing power state for PFs with VFs enabled */
-	if (state > PCI_D0 && vdev->sriov_active)
+	if (state > PCI_D0 && READ_ONCE(vdev->sriov_active))
 		return -EBUSY;
 
 	if (vdev->needs_pm_restore) {
@@ -2393,7 +2393,7 @@ int vfio_pci_core_sriov_configure(struct vfio_pci_core_device *vdev,
 	 * state transition would at most result in an -EBUSY, leaving the
 	 * device in PCI_D0.
 	 */
-	vdev->sriov_active = false;
+	WRITE_ONCE(vdev->sriov_active, false);
 
 	mutex_lock(&vfio_pci_sriov_pfs_mutex);
 	list_del_init(&vdev->sriov_pfs_item);
-- 
2.56.1.708.g77570a6a1d-goog

