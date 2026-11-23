Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420312;
	b=Y7IlH+aPkDdVwRjKWtnvRVkXdf65psjwXyAOLv1Qm0hOigH65QXVeuO4kyrlDh4dCMAf
	 3230I6KEi/MYvrJlnMQIAiDO54eVU++z59YPXkEcdEGqVSlPBOqivea9JeWPQNS5A+i74
	 sFTLO+NoBxD0UXFyz3s/Zm5w9diNQIDmYd+zSgX6SSP8j1KjFo7FXaijeFoh4ToTsGCnT
	 vKTLTvKMfpu4dclqxX4shoxjqpB//nmT0UNQIoM2nf9YtrGA/R+nKaJDQ+ZVLFNeRDucw
	 zzDtYqNq9z0hiQ3KwzQRmZu3bEj0H/zU0XeugAeOSif3WXk6dcjpTgIup4tlQz5FRVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BINbLWyN7d7fWRHArd9V3tMNJuWsrP/CJ/4DZkBrtXk=;
	b=5kPx0tvJPrpQkGbMRkHjaERresdM4AjLzFNMxhSsIhtGMQM8oTzgqFMSKzhbaqxZ9pNO
	 uRUyPG0STOkBVNTAJDpBLE3/mM6KpobQV/YBca8sZovmco218gDxexEOGekZE6ByMUx8p
	 O4NJVyuDbBlXmckJnSBqsG7m0i5ptGH0ddnt3cnBqXlC5E2sqpvwBDPuJnFwff0r0GJ4i
	 JAkD/7FBTxhcfwdmnAoa69GtiLrh7RboH+KOorup7fr9cWy6+3BXXkctfq/fkFfmBbAnH
	 2SRTXCJBYLGHNnq78jgPrF6Fum7GJRuYkhlALIqv40MNsEcMypRB1qHLsF86ntQhm0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WfuTfgXr;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A9A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A9A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WfuTfgXr
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386ab9ab619so1663233eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795420311; x=1796025111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BINbLWyN7d7fWRHArd9V3tMNJuWsrP/CJ/4DZkBrtXk=;
        b=WfuTfgXrnhpX4eJtG7OqGQvHtqwtnJEDDuw+u5l15bl+IOK27QJsjk1toqCdzdfOwp
         WnrdiuD1WaenZsUn5m3F/Qf7H8zx5Fo6lXcbKzwLPZCoEHPbwAuyFEf2bR32mS1dm4j6
         REA1OX+wvLtHNUNfkEJRQr8Kwwk4i9JUsGSvB7kyFney4zvf5yT/rkZsGDhxXS0+Obk7
         4nQmdr48WXpnnN5eHbL9MgfkDEanJfl5JosUWLzfgl1VzkhqTBBhi2ZohBvKM1w5FpFy
         QFlOkmB975D7I7kBj8Eta1gctqKsYSPGvzHhPuh3BXGxzG5K6dkEhYBJ/PXv4ynhroqN
         T9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795420311; x=1796025111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BINbLWyN7d7fWRHArd9V3tMNJuWsrP/CJ/4DZkBrtXk=;
        b=eommsE6ld/7j4S4Q493yF8rUie/ddP3BZIr8iTiIbIxAQik3iSTLI7Bav40BCkHv3+
         0v53PjppdHfjax7QmiyrzlmfU1ogGYBKjgpKIYf8T9/ZhKN6SAYdjcOSi4ewyL/95nl0
         hvSpuZTVe+HptsBHOnp5Co3ERRcezyH2CpRaUOXioJW8LrMnaiXvV2DXZmnaqlAiRP4L
         OYYTaq95dBiidxDRYmMqvC5i7xqNroRJmFs+ORt/BW4vI8Eb1HQr1pmgnNvaJRfIBwdD
         JmL9n5vzCIM5z/B5V6y1LczvTu4FuiGAEh6SC3562Pba2JJVOd8kLV5plJnR4IjPhhXG
         XP8w==
X-Forwarded-Encrypted: i=1; AL+hErGaBOPsdSAUYX4u/BMU6BkZqrhPv3x1AwU+L1Dnz2K7l0g+f19IibPgVVOS4pr6McFOkbKECRi/edYgLhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UWxhtCEVPpFW4Jvyhg+TpAyHUICmrQpt857eORHPnDZ0cc78X
	6kzbYmR1oYu8NMAB5lEJhD0cEr/z7dcjfFmUDte2sGODE93hAY5P1/Ee
X-Gm-Gg: AZFdTZdXmjDsvQFcaV8Bnr1kGFPdpT/+2OBBPbeyybroa3IJmMiGeCuAkHWmGo/5KY/
	OnKRLmpom3+VJX8TGGt4QPfXTDkO/IVVNf+sw8dHgS+sCqPI448RwDOu/RzK51oOoHqcAN5/3g9
	XbzBYyY/36IoEf848dT6lypP6e2CnvrboB8tDFA0guZHwEGT5XQ1Tl5HYaleIX/9GUMOIjwP0Ev
	IRhYEG/aDob1Tp9o5XFai5/RYH7W9CYjoiWslCflyDDrW/6Zm7orNLBssQHtFJ04RbJjik06sRS
	/ZPC6R/vCPmL+xVdfqXyyY3WCxQvTKEPA/qRPYXaUW/keqAwLc7RV5LZV3pO01ko+llCVnLm2KF
	TIshr83g4ICtpv3MmccOqlvcli2JEFDxRIS1mDMKdjveeXBPHn5AltAo1BbiaGZfWu8Opv5J9pB
	Ulmf4cbZ636NM8fNBcU6dnWRUa8l1VJ1qMzjbp+Uyo3HqwS1x++qztSeE8Ipg7tcO760+B4o3Le
	4bCpWG083XQA4KvEgd0ZP+vfktQnVYN7GK8wio0Noj7Ry69zz/6okscFxqq/USQngGW9B+5riSl
	st3H15zBDSSz2kvjmnl7dpKHAD03m/3ccx09xmLJpSPC1JerWvA=
X-Received: by 2002:a05:7301:7e07:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-38570e23830mr10807680eec.30.1795420310553;
        Sun, 22 Nov 2026 23:51:50 -0800 (PST)
Received: from localhost.localdomain ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm5771757eec.27.2026.11.22.23.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:51:50 -0800 (PST)
From: Guomin chen <chenguoming88s@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roger Quadros <rogerq@kernel.org>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Guoming Chen <chenguoming88s@gmail.com>
Subject: [PATCH v4] usb: cdns3: fix NULL dereference in cdns_host_resume()
Date: Mon, 23 Nov 2026 15:51:15 +0800
Message-ID: <20261123075116.3868-1-chenguoming88s@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123044347.3273-1-chenguoming88s@gmail.com>
References: <20261123044347.3273-1-chenguoming88s@gmail.com>
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

From: Guoming Chen <chenguoming88s@gmail.com>

cdns_host_resume() assumes that the xhci-hcd child is bound and passes
platform_get_drvdata() to hcd_to_xhci_priv() unchecked.  The child is
created by __cdns_host_init(), but xhci-plat probes it only when it
registers; cdns3/ precedes host/ in drivers/usb/Makefile, so with both
built in the child is registered before xhci-plat's initcall runs, and
with xhci-plat as a module it stays unbound until the module loads.
Platforms that allow runtime PM (cdns3-imx is the only in-tree user)
autosuspend the controller after 20 ms, so the parent may already be
suspended when the child is probed.

Resuming the parent, either for the child's probe
(__driver_probe_device() calls pm_runtime_get_sync(dev->parent)) or on
a system-wide resume, runs cdns_host_resume() while the drvdata is
still NULL; xhci_plat_probe() sets it later via __usb_create_hcd().
hcd_to_xhci_priv(NULL) then dereferences NULL + offsetof(struct
usb_hcd, primary_hcd):

  pc : usb_hcd_is_primary_hcd+0x0/0x1c
  lr : cdns_host_resume+0x24/0x44

Commit 87e4b043b98a ("usb: cdns3: fix role switching during resume")
only skips the callback when the role changes during resume, which is
not the case here.

Return early when there is no hcd to notify: the host role can fail to
start after cdns_role_start() set cdns->role, or the child may not be
probed yet.  An unbound child has no state to restore, power_lost is
only consumed by an initialized host, and cdns_wakeup_irq() already
checks cdns->host_dev the same way.  Also publish cdns->host_dev only
after platform_device_add() succeeds: the error paths free the child
with platform_device_put() while the pointer stays set, and the next
resume would dereference freed memory instead of bailing out.

Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to xhci")
Cc: stable@vger.kernel.org
Signed-off-by: Guoming Chen <chenguoming88s@gmail.com>
---
Changes in v4:
 - Assign cdns->host_dev only after platform_device_add() succeeds, as
   reported by Sashiko; otherwise the error paths leave a dangling
   pointer.
 - Cc stable@vger.kernel.org, mention the system-wide resume path, and
   shorten the commit message.
Changes in v3:
 - Add the changelog below the tear line.
 - Clarify that 87e4b043b98a covers only the role-switch variant, and
   correct the description of when cdns->host_dev can be NULL.  No
   functional changes.
Changes in v2:
 - Resend with the correct sender address; the patch is unchanged from
   v1.
---
 drivers/usb/cdns3/host.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index e01264dc625d..b0269c21e339 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -81,7 +81,6 @@ static int __cdns_host_init(struct cdns *cdns)
 	}
 
 	xhci->dev.parent = cdns->dev;
-	cdns->host_dev = xhci;
 
 	ret = platform_device_add_resources(xhci, cdns->xhci_res,
 					    CDNS_XHCI_RESOURCES_NUM);
@@ -116,6 +115,13 @@ static int __cdns_host_init(struct cdns *cdns)
 		goto free_memory;
 	}
 
+	/*
+	 * Publish the child only once it has been added: the error paths
+	 * above free it, and a stale cdns->host_dev would be dereferenced
+	 * by the next resume.
+	 */
+	cdns->host_dev = xhci;
+
 	/* Glue needs to access xHCI region register for Power management */
 	hcd = platform_get_drvdata(xhci);
 	if (hcd)
@@ -140,9 +146,23 @@ static void cdns_host_exit(struct cdns *cdns)
 
 static int cdns_host_resume(struct cdns *cdns, bool power_lost)
 {
-	struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
-	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
-
+	struct usb_hcd *hcd;
+	struct xhci_plat_priv *priv;
+
+	/*
+	 * The xhci-hcd child may not be bound yet: cdns3 creates it, but
+	 * xhci-plat probes it only later, and the drvdata is set in that
+	 * probe.  cdns->host_dev itself can be NULL, e.g. when the host
+	 * role failed to start.
+	 */
+	if (!cdns->host_dev)
+		return 0;
+
+	hcd = platform_get_drvdata(cdns->host_dev);
+	if (!hcd)
+		return 0;
+
+	priv = hcd_to_xhci_priv(hcd);
 	priv->power_lost = power_lost;
 
 	return 0;
-- 
2.34.1

