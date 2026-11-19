Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064687;
	b=KNrBK9y8MfLU8barIViVh3N+9XdY5VSo8gGEwYfrQmuONu6cOM/76InMBeB455Nwomwh
	 N5B5AqTVuLl/mWoR2t8GjJKBTY19U1V2tOvFPVEL8oYuym3NUyN1ZGn3yysZTzwQ+vy9T
	 bLRzGZe09up0FroJb7zXInhkk0hCvl5K74/F/E7aAQop1N3wAzi3u2PdW00XZA1OFWC6m
	 2QUTMV1npQc/AabHn+/EIpku3d5+XB8mPJXMO8ERHT/mvzldis+wldHjB+6gD6D8fYoAN
	 /zkCy+b6TjqjBr/q+BKWyhxPJug+M6+4bruD5tVAbE2i0NrCkL0TUIlPPH2nod4UAvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064687;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4HnqDLCNCiAOQ9sq1Q6ULWGj/wzn4gKYXx5Raw5Q7fU=;
	b=osGuh5Z3uld6jM6vjVLV5BfzTocwo8x/j4Y00dfBEWj0ILd82aFz+mUs6nUZPGRjAIC8
	 tPXavq0UXCyuCdN6f0xa1tmHOITluboUCbECiG2PSJe9nn2Ar/wJ6T7jlVPTKGC3PN9lO
	 rIRWj2Eb5gZZuqZNjyc9D5X2PxAmjr7gOkTOFIokaayJVHZfAAt/TdAzKzGAQdvvyCudX
	 1gsXSL3DV4PVzZLigfnw7duoAIfpN9PlLy92Ahk8eSXjQ911z95/9DGN3F7j3E5sH09zg
	 hcUKJtbUIlT1T2VD/nHeD4KB1i/L62SonbXOQeZtqelI7JxFVjR04x/mhAHAMne/T/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b="Isg7ds/P";
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6335460A2604
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6335460A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Isg7ds/P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=4HnqDLCNCiAOQ9sq1Q6ULWGj/wzn4gKYXx5Raw5Q7fU=; b=Isg7ds/P0r9icYEi8CbP+bCb5w
	ksr7b51yXr3J4JLeURkkChnCajh/arVOXUZoeHSdtU83Fq0i6P36ckTrp7yHNxoY2HmD4pcSLt+B4
	SN3rc1GN4oAAe8AtRimQgfhyKsgW6QTkaeUvM58AlFckNEtZPaGxZ4Na+2pb1IgecW6OgXKLdxFy/
	F/rzPBZ75gMHin8ssWVkn7lZU7d/04BLq1aYUWBQyKlR7b0vOGcWAuttoCKoOhur9U5HQ8SzbinpX
	WueUE4XRDTUlL7KHG5+qtliEordomPBiqYQ3zGfIViy6PiLgLHKFtA9doBS+siWX6qrZutJW7UJ8/
	py8vVM2w==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuKF-0000000ArIo-0KOZ;
	Thu, 19 Nov 2026 05:04:47 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 08/12] docs: ioctl-number: update USB entries
Date: Wed, 18 Nov 2026 21:04:33 -0800
Message-ID: <20261119050444.249752-9-rdunlap@infradead.org>
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

Update the list of files where USB ioctls are defined.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

[Since having multiple maintainers trying to merge these would
cause some conflicts, it would be more manageable for Jon to
take all of these through the docs-next tree.]

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Neill Kapron <nkapron@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org

 Documentation/userspace-api/ioctl/ioctl-number.rst |    6 ++++++
 1 file changed, 6 insertions(+)

--- linux-next-20261116.orig/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ linux-next-20261116/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -233,6 +233,9 @@ Code  Seq#    Include File
 'U'   00-EF  linux/usbdevice_fs.h
 'U'   C0-CF  drivers/bluetooth/hci_uart.h
 'U'   00     net/nfc/nci_core.h                                        conflict!
+'U'   00-0F  linux/usb/raw_gadget.h                                    conflict!
+'U'   01     linux/usb/g_uvc.h                                         conflict!
+'U'   64     drivers/usb/misc/usbtest.c                                conflict!
 'V'   all    linux/vt.h                                                conflict!
 'V'   all    linux/videodev2.h                                         conflict!
 'V'   C0     linux/ivtvfb.h                                            conflict!
@@ -279,6 +282,9 @@ Code  Seq#    Include File
 'g'   20-2F  linux/usb/g_printer.h
 'g'   01-0F  mm/gup_test.h                                             conflict!
                                                                        <mailto:linux-mm@kvack.org>
+'g'   01-03  linux/usb/functionfs.h                                    conflict!
+      80-86
+'g'   41-42  linux/usb/g_hid.h
 'h'   00-7F                                                            conflict! Charon filesystem
                                                                        <mailto:zapman@interlan.net>
 'h'   00-1F  linux/hpet.h                                              conflict!
