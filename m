Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190533;
	b=DdfcyYywQHvhmaVOnNC4+POpTzzwsXkX3TsfI/XbpUMpoSiVBnWDq2fxH2lqF0B99lOg
	 FrF+IUrDQprzQYaeiBRCyRhR9fG6gKqpbSfiVcoeN9YTG4MWWWznDCf75j+rru5xt7XDT
	 EH9o28YBbjT62c6+JduR8y+nshNwE573/ef//K9QWaLpDdy3bNPIdRN+mfMvQYYfd/uTv
	 ckmqlfiwHeyVeqVWkR7Bqk1EpJ6P7AO3vR0bxxRgx+4G1H0HFjo63PvX4NwfQJr/aE9vo
	 Xvvl/RbzyXfoOjoSNYv6pG3sRjrFaKLC70tpeqWSay12P9O/Ui4Z6Aa7iTjb8Ntj7bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=dApsL/dlRKoFxvBs2GETZ/NYEsxe4Hnp92CF1CLUeuU=;
	b=ZcLJXmDDqD0z+N77+iXhPGTgtsLx5J/ndp06JuIFWwsGwpgGp4XR7csONkFlVANP+c+c
	 g2ZwNhLYLUlrn13Mez7vh2M4V4gQtJ8oIU23e6XRc7+SdYtmEx+H9oi3PK7j8Sqj3uBq+
	 t80+F5NccpXlgMeK6C7k6+NyF2p1qKqku2YKwg2TDvI6Qhs0TaHXI00PUTJP3SP4YBlDC
	 AXsqXMNdqtH5TiduDzq9jbPsM5nV/MA23F9e5FftTBRkgo9lvQFE5fn7FjAs+9kgz/vaz
	 eh+p/Rw/GpYmgFP1LJGRxPvYCBP4/U1b16GbyL7+epJoZGWXJ/GFpPP65a1S8a3LtmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t4CUSqYw;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA30606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA30606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t4CUSqYw
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-844a8bf7e25so618947a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190532; x=1795795332; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dApsL/dlRKoFxvBs2GETZ/NYEsxe4Hnp92CF1CLUeuU=;
        b=t4CUSqYweHqu+sOy/9IwfBzvby1J11Ei2Ie24G7H2zDvWMmrK63gqIm8/gLFLOPLyV
         qfNvbQ9EAC2eOil3qpni+5DwkJNLy+g/L84suyXe9npP0i4usrFeEoTHKxRac+fQmwSb
         olAiVKf+86TJ8+yEVOlGsna9223O05zipiRvC/OprljMxZzWDSvPr4GxKy+ivvg9J5iJ
         f5gChIHMy7uaNlp8YBtL7h4eRpLq8pDCI1R0avg9BverGCOGFCjzGuaentMV+nodsALU
         SMEX/Y7vSlRnLdyscV+g9tgqscJtkBOQ+AMYJ64+Gp5syMLaYLEoJ4N09a6jPJgiTVhO
         6AuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190532; x=1795795332;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dApsL/dlRKoFxvBs2GETZ/NYEsxe4Hnp92CF1CLUeuU=;
        b=lodSIlaZ1fPiO5zvUSbfk3WSdkrRji2M0yxICj89oxYkSOJj4NU4MfJcqZLzX/cIvT
         MizKQ24EfDrc6mKZaL7/KcntFB7naOC1wPdm7bxYsQyMd2SZri6ihxi8N15O+mF0DTez
         8M2ouqQdS2Hl98+0gCcnUzQL5PJti83PR75EJxq5OuppUYYJR2vWDBjBBHAfvyG3ng98
         A8H9cEV36p8nwl9ZktPw+cKMB84WgEYre2laNGW10C/o95kFip3dgzn5YKifcONLMo9C
         kR6/QM1C+fcKz9R9JWPUk4P+eyoCXM+VDXcCXbzGnFKPMD4kyEyGGor26TokDV18ct+H
         5WDA==
X-Forwarded-Encrypted: i=1; AL+hErHKs0erTRQ1QcAUTVPoFTpR56EMQtLcXwva5sasmy9WwAhsU2K7q06tBW1ELrWtwg9tf3ZQMrcTv9PWw7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/68rwoq5rvSZwFXYnBxSnVkvXrTcz+xGqdAYIIOobaCkbtvqaf
	EnhoNkL8Ue/pLnBC4bf8BJahWbuMYYaa0OcKj9/qAcCd8eK9ZaIEuF0k
X-Gm-Gg: AZFdTZeCNhF1hFTluwLVRkbuNOEEp8gvdbMElYg2A2sh/+Icn/pWN+VZSPXfMCWIAhP
	+Wo8OOl52ZfFNchmhUvPr2IThg68Zazb3zWzi+jwKMgG27iU03If6s+fsoYlS/FY+vB05t3Aeo+
	q8IFO1d043fuTon6wiczH/+4OuWQPUK2o5u5XdYYF9Gx0bOxDpqw4fM3noT3oHylhzicpeQ6Du0
	d44zeXo92rWTNueZc0x/icdhfhP3BrHNfXfqqCJ+MDBmCwSd141VNwNyniuW54KuZrpbAVWNLSE
	Lxi91p15ob1V93vCKGjYKJ2CfSSbTroBfhtVGT9cg/sDSqsmKkTEEgDufKPvin8FJsxihPm1D4F
	5zkGoNfoYI5A13rU/x00XX+cVCErI63Q9EOIN1Kapbe1FsfSIYjO97N3Fk6NgLxJH8qwi0xKKEX
	v8G7cC6bRvj5+kvBXjlamV4bONTVZSQjEz4JNGor9J0riFA7OUQWtBoLXzcxLME2re7CiEPXqtP
	rNPwoV4UuSCJZsQVBZYtjMDIqh/mIU8WC84we6AEvk2X/8n2ea9B7MyvbeCDWg78aCy+ASYI8Nb
	Mnpf569mdIIytTKHOeHyiSP1G3O3qsinyCn+02MNRT0mCI2EN8l9WHUZkW8o2syYz6xFpSFvf+Y
	TGLv5HTi+LtQwyHUOZfO71dOmc06cnxG7c5zWwrvIJcgAypYbJYwfTTOkG1TdD+Ryc9DkTOt2i1
	tiEtihYXD0+orHW94jRBc3hatXYtVBfWe3iW44kEDIwxE5tM8V8T3tu2Ma/ThD4IxtDU6S0nBS
X-Received: by 2002:a05:6808:3193:b0:4cb:f21c:a794 with SMTP id 5614622812f47-57a0ac257d3mr3853052b6e.28.1795190531576;
        Fri, 20 Nov 2026 08:02:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252251sm2522283b6e.6.2026.11.20.08.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:02:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 09:02:06 -0700
Subject: [PATCH v2] mtd: serialize dynamic partition registration with
 removal
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-mtd-partition-publication-v1-v2-1-8098cde01961@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WO3Q6CMAyFX8Xs2iqbiOKV72G42EaBGv6yDaIhv
 LsdPIFJm/S0PV+7CI+O0IvHYREOZ/I09CzU8SBso/sagUrWQiUqkzK5g59MRwG6UMKoXaDABhg
 n05LVWz1LSDOVG8zT8oaZYNLosKLPduVV7Joxb7QhouOG0R7BON3bJraYfo65u3jekA+D+25vz
 jJy/vuIQ4I1VaUSIy9Xic+609Se7NCJYl3XH5KuSIgIAQAA
X-Change-ID: 20261108-submit-mtd-partition-publication-v1-4629be94d7e6
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

If a flash driver is unbound while userspace adds a partition, removal
can find the new partition before it is registered or release it before
its sysfs attributes are added. If removal finishes first, the ioctl can
even register a new partition on a master that has been unregistered.

Hold partitions_lock from the start of partition allocation until the
device and its attributes are registered. Mark the master as being
unregistered under the same lock so a later ioctl fails before allocation
can read bad-block markers. Clear the flag when registering the master.

Fixes: 5daa7b21496a ("mtd: prepare partition add and del functions for ioctl requests")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Use mutex guards to keep publication and teardown lock scopes explicit.
- Link to v1: https://patch.msgid.link/20261108-submit-mtd-partition-publication-v1-v1-1-cbff20b1351e@gmail.com
---
 drivers/mtd/mtdcore.c   | 4 ++++
 drivers/mtd/mtdpart.c   | 9 ++++-----
 include/linux/mtd/mtd.h | 2 ++
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b170c3144ca8..5ee1eb29fc1a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -918,6 +918,7 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 	INIT_LIST_HEAD(&mtd->partitions);
 	mutex_init(&mtd->master.partitions_lock);
 	mutex_init(&mtd->master.chrdev_lock);
+	mtd->master.unregistering = false;
 }
 
 static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
@@ -1206,6 +1207,9 @@ int mtd_device_unregister(struct mtd_info *master)
 {
 	int err;
 
+	scoped_guard(mutex, &master->master.partitions_lock)
+		master->master.unregistering = true;
+
 	if (master->_reboot) {
 		unregister_reboot_notifier(&master->reboot_notifier);
 		memset(&master->reboot_notifier, 0, sizeof(master->reboot_notifier));
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ddded0dbe77e..b20fa4309084 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -278,13 +278,15 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	part.size = length;
 	part.offset = offset;
 
+	guard(mutex)(&master->master.partitions_lock);
+	if (master->master.unregistering)
+		return -ENODEV;
+
 	child = allocate_partition(parent, &part, -1, offset);
 	if (IS_ERR(child))
 		return PTR_ERR(child);
 
-	mutex_lock(&master->master.partitions_lock);
 	list_add_tail(&child->part.node, &parent->partitions);
-	mutex_unlock(&master->master.partitions_lock);
 
 	ret = add_mtd_device(child);
 	if (ret)
@@ -295,10 +297,7 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	return 0;
 
 err_remove_part:
-	mutex_lock(&master->master.partitions_lock);
 	list_del(&child->part.node);
-	mutex_unlock(&master->master.partitions_lock);
-
 	free_partition(child);
 
 	return ret;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e830..cd7b4671c456 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -224,6 +224,7 @@ struct mtd_part {
  *		     not only the master partition list, but also all
  *		     sub-partitions.
  * @suspended: set to 1 when the device is suspended, 0 otherwise
+ * @unregistering: removal has started; protected by partitions_lock
  *
  * This struct is embedded in mtd_info and contains master-specific
  * properties/fields. The master is the root MTD device from the MTD partition
@@ -233,6 +234,7 @@ struct mtd_master {
 	struct mutex partitions_lock;
 	struct mutex chrdev_lock;
 	unsigned int suspended : 1;
+	bool unregistering;
 };
 
 struct mtd_info {

---
base-commit: 14b6830335eb6d70dec7a235094d66c22d38eb07
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
change-id: 20261108-submit-mtd-partition-publication-v1-4629be94d7e6

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

