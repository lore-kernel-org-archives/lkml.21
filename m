Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064686;
	b=T8zKCvxu52fP8mYGg3JZG5fM9OJ8kHRhXnRgLbF/AD1iBuuQ7tH3rVO5La4v5eIqCnU/
	 HEdeZhDfM99Pt9nAHnUU5nQGTXX16beQ9jfgbegbcv7HN4LuhbIrT+TjHjv6Vn5IzEjE7
	 vONm5+TjrzuukmKCvqTrtrYPxyuLXh1IwPOnjdDbmVHbhJOKeXjewKhiiuSA+HsNZEMa4
	 7sHeojZTZRxVrQlQO1j83N/sevMXPlBZR4VzZpgDgJ5tnXMHPRb759QrrMmIVwj49A6mk
	 sO58L8oHRxHpf07gLikjtnJBVFJfxIuFTpUt+tW70dTaWt7uZhQWk1xb/+qeI8ZzRiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064686;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HdjBVi+t78AKEXqFGcFEr3Jdy2Bsa5tMpWA/POOsSkU=;
	b=kW259qyTvw+hMKfm/IfiE6O3xBz0wf7eaQG3Nfb8xcQJs45xdVyeLYW9XRSEtqJW6TXb
	 JLt1noO4Mlet0hpABlB1wEmPOuPe1C0EIlFqchPZX4lwKtu/7mgPTWpQmMtGFgV3MELdo
	 X8hOZopJB7Zri9ruVOChu/LxSq2RVFTWl1cPXDahvfEXKv46O4/KZ03/UgVcwBuZXvHQK
	 G8UexJ84o+UTOJDTJUNQTGPmXG0t0VetKbI4rYpu4oYG02xGbN7vv0ukzmnRO59nzI9o/
	 qT56dj3gTHU5E4lGxVcQ4TXXxwWycVA1MSTXhM5TumwYnDviVAwrkhc4lCSibgmmjWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b="ChAAtRN/";
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388A3606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 388A3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ChAAtRN/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=HdjBVi+t78AKEXqFGcFEr3Jdy2Bsa5tMpWA/POOsSkU=; b=ChAAtRN/xnQPWj2FLPM+mdY8M1
	p+QNPXBJk8BKOOgM1+NAghkjyTVnOfARVrsXDQVu1clYfc5JK4/BGNb8bt3V39PtbG6d2C7PAMANc
	iNwDtAG6Eyb/pHQHpIx3BnpVA1kbBR3s1KZYAad9s4LKGJbYmpowukfO2ly8rIsGICaHjXEwVmZfL
	nqBEmVzRm8eAJlutLdeM4ix5sJFlgIEfNhZ8GdoGKl9YmYwB0GSNJRenBktTzQCTjEMf4UXCH6nA2
	eeF2wNXvqjt1Hh7lFIq96c31Dd6Pzvbt94UO8Y2qI2OV6ur2bXoSAlMEt5EEfa9VhM4BXggvGOwPm
	QTg8FLrg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuKD-0000000ArIo-308A
	for linux-kernel@vger.kernel.org;
	Thu, 19 Nov 2026 05:04:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/12] docs: ioctl-number: update entries
Date: Wed, 18 Nov 2026 21:04:25 -0800
Message-ID: <20261119050444.249752-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
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

Update file names that define ioctls and update the range of
ioctl function numbers that are used where they have changed.

[Since having multiple maintainers trying to merge these would
cause some conflicts, it would be more manageable for Jon to
take all of these through the docs-next tree.]

 [PATCH 01/12 v2] docs: ioctl-number: update MM entries
 [PATCH 02/12 v2] docs: ioctl-number: update sound entries
 [PATCH 03/12 v2] docs: ioctl-number: update block entries
 [PATCH 04/12 v2] docs: ioctl-number: update networking entries
 [PATCH 05/12 v2] docs: ioctl-number: update video/fbdev entries
 [PATCH 06/12 v2] docs: ioctl-number: update SCSI entries
 [PATCH 07/12 v2] docs: ioctl-number: update MTD entries
 [PATCH 08/12 v2] docs: ioctl-number: update USB entries
 [PATCH 09/12 v2] docs: ioctl-number: update virtualization entries
 [PATCH 10/12 v2] docs: ioctl-number: update FS entries
 [PATCH 11/12 v2] docs: ioctl-number: update platform entries
 [PATCH 12/12 v2] docs: ioctl-number: update DRM entries

 Documentation/userspace-api/ioctl/ioctl-number.rst |   91 ++++++++---
 1 file changed, 72 insertions(+), 19 deletions(-)

v2 changes:
- address sashiko review comments
- drop addition of arch/x86/kvm/x86.c (Sean Christopherson)
- drop moderated mailing lists

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: linux-mm@kvack.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>
Cc: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev
Cc: Chas Williams <3chas3@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: MPT-FusionLinux.pdl@broadcom.com
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org
Cc: Neill Kapron <nkapron@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
Cc: Hans de Goede <hansg@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Pérez <eperezma@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org
Cc: virtualization@lists.linux.dev
Cc: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: linux-ext4@vger.kernel.org
Cc: Mike Marshall <hubcap@omnibond.com>
Cc: devel@lists.orangefs.org
Cc: Paulo Alcantara <pc@manguebit.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gfx@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
