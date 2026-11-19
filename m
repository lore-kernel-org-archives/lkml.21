Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064688;
	b=BAEnvsdPyRVAELCNy1+mfviHi+GPEnSwO6xZ6Xcrx5AYl41+jPq8CASZSfpCV1Xvy87+
	 ZM5SKodfQISa0mwVCCjDOOMPni8/lrTnTqSGaQqLpqjtvekSFQtTJ1fwCtj//hhpepxFq
	 +wzgMQm8FrKAc3Ti/lQykoCLd5kTcVrIwoceNSRm5qWnX6algv84Xh9Y3aW24N1AY2O55
	 EUWU3NTxCeJcILiZzP+TADByzrhYhrjZKCYqP4USQS9FmiW4KDyTwrzHO197omIJ4zXnX
	 PFoz8GT66bc63z1yVTHSESQ30O66TLjXAb+/1dPIc9FVdhlA+ceQU3vYFeeHWV9MCfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064688;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iUfRRM/uSWL5Pu2WYkuG9ZMjaMjQfW5Ts9TmnI1Vtsg=;
	b=38a588Y0lRimIGO+TE5JHaC8PXXVakxaGMGScKiaeW0wDUPebKDgtjQOJInoULY7Bez0
	 MdbfU1k97hd21Y7DAzmFisZjUv3Hbo7eWIuAvTPRyMVWPsll88PqbcyKHddRLsj8f2X61
	 68gvo22NOkuBFNPvd8GYpgsh4ipjgspVHjdz2GhkAQs8kycoDb2pzpA4sbInRIveCSu1x
	 cVXCeuUU/8mHGaWVnkx+tW5X/8+jHm0nncKXdn03daErt1MK9FNuKI2mcqJtyurYjX0AR
	 Ei+J37dKmA9DLA8I9NHQQmIQlWHjZ2KqPQSqLSzw3kUdLR40PoBuAns9SKAX711sd/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=clLbTW6A;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8F560A2618
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC8F560A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=clLbTW6A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=iUfRRM/uSWL5Pu2WYkuG9ZMjaMjQfW5Ts9TmnI1Vtsg=; b=clLbTW6AD/GF9LT6oxIkcBAiWi
	tQ4Av8HsgBkdFx+K1A2AZLmCOLlZo99ciEGZkAEnWc/oCnumDSj4gIs5L51aihlxXicG9excyoff4
	tZ2Jb/AKU5xerV0Pfti5m72LxeRMqWr7lTu0fi1y02glYdIuvJYdz7IuEXywtO2WfETSR3dW+KeHQ
	tNM0i+2vaQQ+FkEWBQTUQrx5Xdvz4YBj7az39ZdAtk4+x2S85adOe8A9edHtf2bDGB5mf+fZFt+rY
	54yF1uHy1PYntSPhowtDtkmFG4tMUqMwvdxeunfMxWgQ6Ca4SDaGXPtZDA9oHOCBc0kJeGA+gg4Q5
	ceXqBjjg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuKF-0000000ArIo-2RdC;
	Thu, 19 Nov 2026 05:04:47 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 11/12] docs: ioctl-number: update platform entries
Date: Wed, 18 Nov 2026 21:04:36 -0800
Message-ID: <20261119050444.249752-12-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119050444.249752-1-rdunlap@infradead.org>
References: <20261119050444.249752-1-rdunlap@infradead.org>
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

Update the list of platform/ files where ioctls are defined and update
the ranges of function numbers that are used.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

[Since having multiple maintainers trying to merge these would
cause some conflicts, it would be more manageable for Jon to
take all of these through the docs-next tree.]

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>

 Documentation/userspace-api/ioctl/ioctl-number.rst |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20261116.orig/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ linux-next-20261116/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -434,6 +434,7 @@ Code  Seq#    Include File
 0xBA  00-0F  uapi/linux/liveupdate.h                                   Pasha Tatashin
                                                                        <mailto:pasha.tatashin@soleen.com>
 0xC0  00-0F  linux/usb/iowarrior.h
+0xC4  00-1F  platform/raspberrypi/vchiq-interface/vchiq_ioctl.h
 0xCA  00-0F  uapi/misc/cxl.h                                           Dead since 6.15
 0xCA  10-2F  uapi/misc/ocxl.h
 0xCA  80-BF  uapi/scsi/cxlflash_ioctl.h                                Dead since 6.15
@@ -446,7 +447,7 @@ Code  Seq#    Include File
 0xDD  00-3F                                                            ZFCP device driver see drivers/s390/scsi/
                                                                        <mailto:aherrman@de.ibm.com>
 0xE5  00-3F  linux/fuse.h
-0xEC  00-01  linux/platform_data/cros_ec_chardev.h                     ChromeOS EC driver
+0xEC  00-02  linux/platform_data/cros_ec_chardev.h                     ChromeOS EC driver
 0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry
 0xEF  00-0F  uapi/linux/ntfs.h                                         NTFS
 0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb
