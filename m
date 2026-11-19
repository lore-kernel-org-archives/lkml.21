Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064687;
	b=DZ+qZ7AMcWBuhtoklFaKAdgOsl4YCNVnZfZCkBcVODbqxEDci0f+bFdcn7gMu8iBDoMn
	 N+Ka2rdYqi5cJUWFJeY7IG9PDVgxxN/c/Xnjg0V4+lutfCKg4M3GRyRYYAqyYMyzk7z85
	 vujgi9K8GEQ3xJ7rxJZGsxqF7SCXQfrcYkApsLPFE6K09BCmLTMQez467a7zBRqKBB0Gd
	 Pbuk4FQTTMCyoUwSgxjKquCPFFcAMFDlsWJfY4ckZuKg72PWvZaYJ3MRzC/YqqVxGQqlb
	 cEPmhBJPtjnp57CeORI4QU9ze8UAlgPmc3SIhXd8QtQ5RGieptYDj/l5Mq6B5kE59fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064687;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ELh5lc2aPOWRUhM5D4IHCHtXzMf4oMgv7S6UUVSFuJE=;
	b=j2N1cHWLIfav4DOh/pO/yXHsB3DlSc/JjXiATZ3DW6w8MZfyiWkVJHR/yn99mtIXAckd
	 bQhB9PIYnXHpbSiHfXAK0kckybUPnVS0Q0ZiKSaEfespCyJoV8MbzihWElxePeQOlCV3T
	 WUYRus9rA1mYPW9h0IRUHA7JaKyZYFW6gozrL9QYnoH8rq7L/GAjCAoTG6EWphLxlLwJ+
	 w/y7i+9ITyS3JIIBzYv3tA5iHlvvoeUbFv3Hf4ZVEHFymlSu65467sSda8BcC2bkLbFTc
	 sd4toxaWa7uR10poRJBfJ7RdPz9D7T8FaRytzeKjAAfiIKegGcJvjAjj0AnADgloEag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nZVFW9l9;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F19560A260B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F19560A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nZVFW9l9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ELh5lc2aPOWRUhM5D4IHCHtXzMf4oMgv7S6UUVSFuJE=; b=nZVFW9l9MBJp64q8stBvK61xSf
	yzQu/r8dHBe5E7AJedwLqsaR2yDs+yZ9hgF0O5Uhr4BRS0HjgqL7gPCQWGBlCd9oxprJW6AlI1hGG
	Jv+lGP5DQchkPnzBDI68kTfdRpuiLsGmD+pGDkwosqY7IbduWqCVLhc8aifXnouWav4hgpLC8pBD7
	eDub/JfVqgxWSyDTONB+sp/MB+Y0wOELPBOJquKhoCuO8WWyiRz6fkO0soyF44nOaioVJrRFMHiMo
	2S+8MSq4WY2oxziZxq5dMMHw+VFsyjsdesb4ZsMylSiDJFgpZExhdPzpGesI/oyh1gfV7AG6syhTb
	pao1vdyA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuKF-0000000ArIo-12kP;
	Thu, 19 Nov 2026 05:04:47 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 09/12] docs: ioctl-number: update virtualization entries
Date: Wed, 18 Nov 2026 21:04:34 -0800
Message-ID: <20261119050444.249752-10-rdunlap@infradead.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the list of files where virtualization ioctls are defined.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: drop 0xAE, C6, arch/x86/kvm/x86.c (covered by line above;
    Sean Christopherson)

[Since having multiple maintainers trying to merge these would
cause some conflicts, it would be more manageable for Jon to
take all of these through the docs-next tree.]

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
Cc: Hans de Goede <hansg@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>
Cc: Eugenio Pérez <eperezma@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org
Cc: virtualization@lists.linux.dev

 Documentation/userspace-api/ioctl/ioctl-number.rst |    5 +++++
 1 file changed, 5 insertions(+)

--- linux-next-20261116.orig/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ linux-next-20261116/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -198,6 +198,7 @@ Code  Seq#    Include File
 'M'   01-03  drivers/scsi/megaraid/megaraid_sas.h
 'M'   00-03  drivers/video/fbdev/mb862xx/mb862xxfb.h
 'M'   00-0F  drivers/video/fsl-diu-fb.h                                conflict!
+'M'   01-03  xen/interface/xen-mca.h                                   conflict!
 'N'   00-1F  drivers/usb/scanner.h
 'N'   40-7F  uapi/linux/nvme_ioctl.h
 'N'   80-83  uapi/linux/ntsync.h and uapi/linux/nvme_ioctl.h           conflict!
@@ -238,6 +239,7 @@ Code  Seq#    Include File
 'U'   64     drivers/usb/misc/usbtest.c                                conflict!
 'V'   all    linux/vt.h                                                conflict!
 'V'   all    linux/videodev2.h                                         conflict!
+'V'   00-1F  linux/vboxguest.h                                         conflict!
 'V'   C0     linux/ivtvfb.h                                            conflict!
 'V'   C0     linux/ivtv.h                                              conflict!
 'V'   C0     media/si4713.h                                            conflict!
@@ -356,6 +358,7 @@ Code  Seq#    Include File
 '|'   80-9F  samples/                                                  Any sample and example drivers
 0x80  00-1F  linux/fb.h
 0x81  00-1F  linux/vduse.h
+             drivers/vdpa/vdpa_user/vduse_dev.c
 0x89  00-07  asm-generic/sockios.h
 0x89  06-07  linux/sockios.h
 0x89  0B-DF  linux/sockios.h
@@ -399,6 +402,8 @@ Code  Seq#    Include File
                                                                        <mailto:kvm@vger.kernel.org>
 0xAE  20-3F  linux/nitro_enclaves.h                                    Nitro Enclaves
 0xAF  00-1F  linux/fsl_hypervisor.h                                    Freescale hypervisor
+0xAF  00-8F  linux/vhost.h                                             conflict!
+0xAF  31-32  drivers/vhost/test.h                                      conflict!
 0xB0  all                                                              RATIO devices in development:
                                                                        <mailto:vgo@ratio.de>
 0xB1  00-1F                                                            PPPoX
