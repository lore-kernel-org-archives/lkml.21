Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.222.135.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795276435;
	b=m+F/yEHuntDQV86PHkgcVkRxFJf9FA0I1lo/HKsobydKYyVRr013YYzILi2aMJ+tb1SD
	 60RrzxLJmwCm5U6JRNNv1mhDTq+9yo0opQfhKzbdz59KRtDuF6TS2vP9lBCEVd8+oOcXJ
	 92fFJtk8mZ0PDpRs8Ef2aFTO0aM7lL3oT6H8GtR7a9wiy+wcI8tQBFFY8dnCJQ14KYuqM
	 R2sFv2PoFl7FlDP2iqmcY9TgxDlGhYOB46k/mZa+rnDUc+Yf3gAovxRlKrZjEzijCJqCh
	 9QzE/RiKZC8n7Dazd1R9h9Q2tVy9o2+RGjuMVqcYglxiLUlTSYYnAQOq8M+3DmQljCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795276435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-WP-DKIM-Status:X-WP-MailID:
	 X-WP-AV:X-WP-SPAM;
	bh=7bBGkEM1F0aiz0suHMTa/EpEpYTAohLosYW6UGvonyY=;
	b=JrMdipmUNaglszoFleb/cs/MpMfHQl725dKVscJ/6TmiEo5k7SkJSmcHPW/kkBebZnxn
	 NDorJyn9oi0i/VmkOVsi8BpZhSGWV4mAXj6JHyE/NnI/Idub5zRBVFVpxPAgN6v2Zng3A
	 mkbJwY73pYzHXH4X648ewwIoIF46g+C6qlRGjIgb8Cn/Vflf/KEVRkmjz9MxV//Ea7NLH
	 XV322LJ3mW9K4ykrU1v40u9jgaa3gH/h2L5Wxfr/6eVAAT2ODR9ln2/QycPiTcboQ/4jD
	 rf96PngiSnTgMoL9NaeRjMKsfLZg9neKLiz4KjC9mD4N4wu6KyHrixwBDrSdXwbwwkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=o2.pl;
	spf=pass smtp.mailfrom=o2.pl;
	dkim=pass header.d=o2.pl header.i=@o2.pl header.a=rsa-sha256 header.s=s20261001 header.b=bKUk6b7c;
	arc=none smtp.remote-ip=193.222.135.140
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBBC606A33F
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBBC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.a=rsa-sha256 header.s=s20261001 header.b=bKUk6b7c
Received: (wp-smtpd smtp.tlen.pl 14720 invoked from network); 21 Nov 2026 16:53:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=s20261001;
          t=1795276426; bh=7bBGkEM1F0aiz0suHMTa/EpEpYTAohLosYW6UGvonyY=;
          h=From:To:Cc:Subject;
          b=bKUk6b7c+J7q4KDaxnIavfJr3SPh3UoqWCH2ZhRElFD6vLfGGTki0o0usy/MuKr3N
           MUFtP5NjhYV1aGTKeb6P4O5WGKNF9Z7X1f15gt62UQ4CcId7cl17Moxuu7PVMkxten
           6/t1bKBp/XWo6mGeLyTwXSIlylhv7YHvMmrHDLJm77Ilv54IFQqTtUrswKpHqnsloR
           3S8x0Hq8GMichFGpXeTqcYWaHeIc+fBh7QIEhv/lTKxoz9UvDGwo4r+3AmGz2HiDlc
           DsLgfRzxpRN+QGLCsHsOL1djyuuJsoUlABEBokI1vTb4sQNee4btT3G8OwGxq7p95j
           b+qKfrkK2cLXQ==
Received: from localhost.localdomain (apn-78-30-78-152.dynamic.gprs.plus.pl [78.30.78.152])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <oneukum@suse.com>; 21 Nov 2026 16:53:45 +0100
From: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: [PATCH 2/2] usb: mass storage: expose ata_passthrough_disabled in sysfs
Date: Sat, 21 Nov 2026 16:52:53 +0100
Message-ID: <20261121155253.4980-2-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121155253.4980-1-mat.jonczyk@o2.pl>
References: <20261121155253.4980-1-mat.jonczyk@o2.pl>
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
X-WP-DKIM-Status: good (id: o2.pl)                                                      
X-WP-MailID: 4a983041922b4c62b7c16f818300dc54
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000A [gXPk]                               

The mass storage driver blocks access to ATA passthrough commands for some
devices it considers buggy. As in the case of the uas driver, indicate
this in sysfs.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>

---

v2:
- add this patch to the series
---
 drivers/usb/storage/scsiglue.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 97de28e85562..43198888449e 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -572,6 +572,18 @@ US_DO_ALL_FLAGS
  * Sysfs interface
  ***********************************************************************/
 
+/* Output routine for the sysfs ata_passthrough_disabled file */
+static ssize_t ata_passthrough_disabled_show(struct device *dev, struct device_attribute *attr,
+					     char *buf)
+{
+	struct scsi_device *sdev = to_scsi_device(dev);
+	struct us_data *us = host_to_us(sdev->host);
+
+	return sysfs_emit(buf, "%d\n", !!(us->fflags & US_FL_NO_ATA_1X));
+}
+
+static DEVICE_ATTR_RO(ata_passthrough_disabled);
+
 /* Output routine for the sysfs max_sectors file */
 static ssize_t max_sectors_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -602,6 +614,7 @@ static ssize_t max_sectors_store(struct device *dev, struct device_attribute *at
 static DEVICE_ATTR_RW(max_sectors);
 
 static struct attribute *usb_sdev_attrs[] = {
+	&dev_attr_ata_passthrough_disabled.attr,
 	&dev_attr_max_sectors.attr,
 	NULL,
 };
-- 
2.47.3

