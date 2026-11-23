Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409062;
	b=GzzgoQXC4FdSyI33nDWn8SSxEF/44jpdiihnoTXkYoNHl5DXPCZdJIQqgVO0l/eBV1JA
	 hC1Ttn5+fV0ulyR3kbj7ZuK4DaFjVOuhYN6GgRt30w1z2ogq+ssQVR4amorpAhtsELAFp
	 NMHFeQ+qruwhtduQZldt/DqlSAsgx5SmDux3Msrk+P2jrJg/1oUmS9+k4uhSPDPVp3nKm
	 koVGU/c1U6vwb1XUh2gM637Dm3+JiKtm34ARFpzmcQzkp9aZm6MQ+BFI6bEuwL2VnaXym
	 d3Oz2x6cCtrpwQqeOosU2Mu+TfxTh2Msdj9lNKB/4x/bI+KIt5ZIep4xX+Al55cHpcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BdTqrxCjGzvBio68N6oddwP08xR12JMZ0ERx58k85rY=;
	b=QfYXR/Gj/uaq3f9LByWXtomrYRrcrSbZiRU9ShasJwDLl/gUzt7SfkPLGzntlsQCHMWf
	 t/m+KEwWx36luA4P0FKh6A3VQUHAZew5kdYq5kjD7rrIX6a1KTGQT0nPeY0O8M3SMEqhN
	 I7+eUy79Ix1UwPAcCGC0f4tMBhkdHCUPHxNkR3t596Go6rOS/I6pqsCscKwISPUljJn2N
	 nLxEJpfT1ImagM1AXSUYnfMGk7RbTCjrvhD+XmKvffH5qGFgMzrSEXqYG1R5WKy0X/Ebm
	 on1EP6nsM4CWC7OTX14H89uycHYu/9P2+V2MgferYcb+asG3dPNduPh68YVSUg6izfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ie1cTnKp;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027E7606A335
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 027E7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ie1cTnKp
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382f4710a17so4935523eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795409061; x=1796013861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BdTqrxCjGzvBio68N6oddwP08xR12JMZ0ERx58k85rY=;
        b=ie1cTnKp4MfSfSiEz5OiGwUZxrqFS6GKSJUJ/+96XcM3BSMwu76i0YBbVgn0WR0etQ
         CA/OWd3qbH5T23Z1cTJ59bGwzzjD6qzFhorJbnaj/FD5eIPiVgiMFzi/+kANFS93iNng
         AFZ2F7M/2fEBWyB468wgkpCDzSBaxnkqaTjdjTleHMqpdIp31d9v7eFWA1+7Bj//BmYg
         0qdbhEfDSzD+dM4AD3qyNLTkzGa/+tBYXH9wnAjIPiBR7+dN1qSwZCU3KudcGG0bij6I
         c+grS98KAOQphg5blyzLGMhPhMe+EhOQ1at+fpR6Bu5fnxX2qBl9zXDPKECcsktprkZU
         Kcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409061; x=1796013861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdTqrxCjGzvBio68N6oddwP08xR12JMZ0ERx58k85rY=;
        b=ofoVjcXEkElNVaLKBSjiVOHRKyPp5WfSsSMV+2nerZnjNSkV3rq4cmrDReKVTRMLr0
         UmCi5fJDTaFP1N9mCRBcCwyJhbP3Fzpo0eB5lMzhbv75QUGStqHnJthE5dsN4AI0ek/n
         SWUGaQeIW0ceHAZo1QDRj4Ox5TPyhhBnzVpZSrL1FFZe9jK+gc533Z4vS96eGyG8BGr6
         DqSzaPx8wCyHLGTP19wj7h98WQvBQbZAhIHLPhEz6DmFHwJZg7p4tJcLlXnl09A38ZH2
         B3Qc3Gei0gmCoRjf5a/QEJbzOCqFhVygh7oyOVgRoYxU6Nepx/h1PuMcFkI5ILeqaXbD
         FZFQ==
X-Forwarded-Encrypted: i=1; AL+hErHFRrl/pxHmRWOOA21NoKnWmb/qRHXbW5/2UpvlIk6vkFEMrF0fFTN1VtvN+jxBm0Xigm3W6G8wHc1kamk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e5kO1ZyiaQZRcURF107ZnH2LP5WrCHzs5A9C49gba1+MXmd7e
	4kPxmSOQ/FdiIGgd1pfEZForx7ofsXbUQsQqr5sBPsrYPiYL/NnhqlDI
X-Gm-Gg: AZFdTZc31j8/8cOQk/mcytLvsQL1OUaZ9AyzW+TJCYB3z0O0MP2QXisiVzKZ9LILkFy
	CkPWblKddNh6uYa+e6idBMc9c4gNQRq7piFDatKHsUmHSvpvqQMNNjBYrx3KoUq+fGN56hOi45j
	7u/kYodc2QeO+uttExQKNGuS3WESBz9Pv3s7aq5LGoEuPaiYqzQcNRQHTNBjvHWLER+KowWhAWQ
	M4A4scVdrwLvc9039t9LpizM1AS3T2SxYFQNwpK+f2sFt4/ozVJoV5NMDCfkTmZBbFjh6wst2iu
	TaUojhxroVHsbYQ7/FXazUzhMUA0SFrfbcPNaA9W3ZjPH3UWhwWPNSb0EPCpzrm8gsOymeFeExS
	hSGF6ynA9pQMNZPsDxYJZ7fpBnXCF9TSEOb0YLNxA18Qp3Vkf+dNfHKgXNLg7DKjzixyMGNTYF5
	9d6lRrJYsrfshmhhNeH8f/UHpTC1KrKeMpDGrbaWu38mDN3LPzl6bvuD4rJ5+8ffCM0bO1mkn7a
	epk+8A1Sl9NgTfCS0SC1IOgKeROoZticoRFlIybZVxORKTBvxwxlDdSdZBG86TjznPHoOOS4vNK
	i9ut2GEnK4nz7WiW9/3CMLlW08fLdBngEeTEoZOaei9IZLXcgwY=
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr12269206eec.22.1795409061005;
        Sun, 22 Nov 2026 20:44:21 -0800 (PST)
Received: from localhost.localdomain ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm24322434eec.19.2026.11.22.20.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:44:20 -0800 (PST)
From: Guomin chen <chenguoming88s@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roger Quadros <rogerq@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guoming Chen <chenguoming88s@gmail.com>
Subject: [PATCH v3] usb: cdns3: fix NULL dereference in cdns_host_resume()
Date: Mon, 23 Nov 2026 12:43:47 +0800
Message-ID: <20261123044347.3273-1-chenguoming88s@gmail.com>
X-Mailer: git-send-email 2.47.3
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

cdns_host_resume() assumes that the xhci-hcd child device is bound and
passes platform_get_drvdata() straight to hcd_to_xhci_priv().  That is
not guaranteed: __cdns_host_init() creates the child with
platform_device_add(), but the child is only probed once the xhci-plat
driver is registered.  cdns3/ is linked before host/ in
drivers/usb/Makefile and both drivers are device_initcall(), so on the
built-in path the child is registered before xhci-plat's initcall runs;
when xhci-plat is a module, the child stays unbound until that module is
loaded.  Platforms that set CDNS3_DEFAULT_PM_RUNTIME_ALLOW (cdns3-imx
is the only in-tree user) let the controller autosuspend (20 ms), so
the parent may already be runtime-suspended by the time the child's
probe actually runs.

When the child is finally probed, the driver core resumes its parent
before calling really_probe(): __driver_probe_device() does
pm_runtime_get_sync(dev->parent).  That runs cdns_resume() ->
cdns_host_resume() while platform_get_drvdata() still returns NULL,
because the drvdata is only set later, by dev_set_drvdata() in
__usb_create_hcd() called from xhci_plat_probe().  hcd_to_xhci_priv(NULL)
then evaluates usb_hcd_is_primary_hcd(NULL), which dereferences
NULL + offsetof(struct usb_hcd, primary_hcd) (the offset depends on the
configuration).  The oops faults in the first instruction of that
helper:

  pc : usb_hcd_is_primary_hcd+0x0/0x1c
  lr : cdns_host_resume+0x24/0x44

Commit 87e4b043b98a ("usb: cdns3: fix role switching during resume")
only skips the resume callback when the role changes during resume.  The
role does not change here: the parent is resumed by the driver core
while the child is being probed, so that fix does not apply.

Return early when the host child is not available: it has either not
been probed yet, or cdns->host_dev is NULL because starting the host
role failed after cdns_role_start() had already set cdns->role.  Nothing
is lost in either case: a child that is not bound yet has no state to
restore, and xhci_plat_priv.power_lost is only consumed when an already
initialized host resumes.  cdns_wakeup_irq() already checks
cdns->host_dev the same way.

Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to xhci")
Signed-off-by: Guoming Chen <chenguoming88s@gmail.com>
---
Changes in v3:
 - Add the changelog below the tear line, as requested after v2.
 - Note that commit 87e4b043b98a covers only the role-switch variant,
   and correct the description of when cdns->host_dev can be NULL in
   both the commit message and the code comment.  Clarify a few other
   statements in the commit message.  No functional changes.
Changes in v2:
 - Resend with the correct sender address; the patch is unchanged from
   v1.
---
 drivers/usb/cdns3/host.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index e01264dc625d..2f430e1e0089 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -140,9 +140,23 @@ static void cdns_host_exit(struct cdns *cdns)
 
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

