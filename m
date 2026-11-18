Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978441;
	b=22k83/S//4SoJvUL7J5S9Mv4Q584/+uG4LihIuwI86hfIZhNKxub6r7BaTbFmWamj8yF
	 xO0HbDepqWBfACm078+15pGhAfeVsmhPaSeV9tBZkBJ4uKvrlKvobfczuHRgLh3fquiRL
	 6Yf8+1MI9rKgvMmETCBXGjqQ3koiWQU+TY2sw+cz2L704A3YmdzOU9qFJ+XpInCBTy6IY
	 fXGS5vnCWgE2Vpi5iUYkIBf9L8pvpSSTfrKQJwX2XpQfCETZpc9eOTYcgalYeu6WdDq6r
	 ItL/wQJG3jgr9nKOnfq7W8PeijYi/wgre2lpFH17lElQ6MtcR5zSx5ye9nn15MIeqKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=biPK0aG9WHznxprJzM2qILlC7uo+QNVnfuQhkyMYT8A=;
	b=OSd59ilKP+vl+tgupGeRZj7r3yPO3wDoT3IjQPjzaDaRslZF8nPjEJxKr8GJ1W1txaQk
	 LFP3X2HW+1w7/1iaIocIbR6Eo6Quo/pEzfAP0HbW62iQ29Na+EGzqJn2FeTOdSbvuM6MC
	 +u00rgCtPxOIZTmtA8v47TT6G8ihWCGFE+XhHTaAqbU0TmdrfRD2ou6NyH29373je+TNd
	 gxs1toAAlAzSOnk1vNVJ2zNJ6YDjgQXBBoKoRKICnIToRxZR3MHbn1IEDrErwx3KFJo31
	 dPwFWypXlB5QkI2U9eUSHF67kWsKAEpY0CYt/w9XD1dlTjRvfDyMDzgHVpNkl7vG1VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NOPPV7x/";
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F08606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F08606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NOPPV7x/
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-930c0f9c1b1so67400985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794978439; x=1795583239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=biPK0aG9WHznxprJzM2qILlC7uo+QNVnfuQhkyMYT8A=;
        b=NOPPV7x/KygcBDhKQjG0je/rXa+iGCWIVdSTAMePQPwenrtjUmL0SBgIW+LoMuRulv
         tWgc7E25vQ0ijamr7AmKdxFEQ8CuIX3hIQGPg7sdJ/OgBIUku2pAWrL9Ewb5NeRJEV8f
         XNtXwpUOPXEvforek3MmifR1zSl26xNZH1JQbYBiOow739hhAvQpfQn0CQg/AGReeday
         7RvxE8tvJoiVKyiNeGLI+AYjHkha9B9f9xzqfgNODQtoWzm2J6tRVUxEzigzxJf+TFEy
         IqcYH0h3rEdYV8/TbWwoi+Q7BJNLVJFiWC2OyF9jjImWhNVkhAoNMdOTO9ReyA1aQgxB
         DVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794978439; x=1795583239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biPK0aG9WHznxprJzM2qILlC7uo+QNVnfuQhkyMYT8A=;
        b=moeIkpgZACgaEqrUccC5pi0t4efBbpBciZ0NzT7/c6sK9gIS/FSgQh1Yl/kVerREUW
         5tTUtyr6bZ6Qa1aHNKOH923B57iE7dnsdY5mak5Y4oxcQMUSsKyihFuuypqjUVAVl7cy
         TgR75gwRbGySFNgvaU604M7bnaAenbcyb0tz2iBO/vTTDHR13q/GxX/i2dL6+6f3r9Jj
         5oYx+m04xL19LWOk5CDU1QAiRsORkfhUKqOps2fSElJUvUvCNMolhEdPqdsL87nhGHQD
         fApTV5vKWGf3NxkQcFru25TYNpmyhifINxef6X14lp94hDNC79wC48sSG5K9KpL6zesD
         LZ8g==
X-Forwarded-Encrypted: i=1; AL+hErGpQKQuPVsNY/mVYntbyE1Fuo+usukbgWg3c1OAaw/bkKtP0b+ug3J/vqo3Za7krLRrQZWITPJijmMZYlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5vVkOKTCCvBHOvBEqIr0ZdPyMYbVUsRf8Ru3xWhkwH8606AMu
	6+R5yBjgpl4ogo2piHOl67sSiOrd8TMRvn0ZRFfNsRcdRaA1PRX1eAiU
X-Gm-Gg: AYBFou1qnfsFQpdcpWzxS9M+7rMIKevgXleSbBUgg0b/IVcpHffw0zGdFeERJqu+GdV
	/54mwgeUwBzQgt7f2Pw8XZJ5i9t2FoWduwLtrB3SyOpi2nJ/kgh3nOMoKufTO0HJAQzL2mqz72D
	KCck5EuziK69r9AMwUvUewooR2rqwre8omtpA2//IHhEWwH318se90BNn075GpGGsaYpGJRaacu
	eKl6JdJ2KmOoiMRfR3w9v7pnidYncg4MFZScJ5NFXOW+EwOU8N3sCvGTK9yuUoYNG2f8YbWjA+/
	5TfgBICZMbwsGXpMxE/XEW6iJx28FW/jlg1nu5Mazycl3Ab9FANI2Uv6Gv2q5ptFyezikr19q8Y
	qRzxlADV47Q4EqcjimZgEOVpeNDaNqbWg8sW6RwXBp87iE8cTWTFaPkAzazprWYVOm9Jf06rpas
	thR1ejaScgsrswY+xok9xVdwEEdp5sOF7TPJokGLukz5LOpuAQFsBtCs+xE6IXZF4Zj4iUAjn16
	dOaHAz/1Wu+QTsH4YPNoiJwdiyQGiQOz3wGOVjFkehtl7/NS8BzAJ8NQXSbHoP/ss9F09BuPM3M
	UVvRa2XG24yS3pfLmUDJPj3TRI4rbdbR0xo5G00SBwgsYpbG3DHvt5dtMqp7rhTivkFfe+hvF3v
	7
X-Received: by 2002:a05:620a:4488:b0:949:6193:acc5 with SMTP id af79cd13be357-949996088f0mr308639385a.74.1794978439454;
        Tue, 17 Nov 2026 21:07:19 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b454fa1sm97897485a.3.2026.11.17.21.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:07:19 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vikas Gupta <vikas.gupta@broadcom.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net] bnxt_en: Fix auxiliary device leak on early probe failures
Date: Wed, 18 Nov 2026 00:07:16 -0500
Message-ID: <20261118050716.3873167-1-lcy8047@gmail.com>
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

bnxt_init_one() allocates the auxiliary device ID and initializes the
auxiliary devices before bnxt_set_dflt_rings(). If that call,
bnxt_init_int_mode() or the bnxt_pf_wq allocation fails, probe jumps to
init_err_pci_clean, which does not uninitialize the devices or free the
ID. Only init_err_cleanup does. The devices are never released, so their
aux_priv, edev and ulp_tbl allocations and the ID in bnxt_aux_dev_ids are
leaked once free_netdev() frees bp. A VF probed while the PF is down
fails this way each time.

Add an init_err_auxdev label for this cleanup and use it for every
failure after the devices are initialized. On the register_netdev()
failure path the cleanup now runs after bnxt_clear_int_mode(), in the
reverse order of setup.

Fixes: 2e4592dc9bee ("bnxt_en: Change MSIX/NQs allocation policy")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus BNXT and W=1.

 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index e78cf7ad3cbc..ba0e458a467f 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -17423,7 +17423,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 			netdev_err(bp->dev, "Not enough rings available.\n");
 			rc = -ENOMEM;
 		}
-		goto init_err_pci_clean;
+		goto init_err_auxdev;
 	}
 
 	bnxt_fw_init_one_p3(bp);
@@ -17435,7 +17435,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	rc = bnxt_init_int_mode(bp);
 	if (rc)
-		goto init_err_pci_clean;
+		goto init_err_auxdev;
 
 	/* No TC has been set yet and rings may have been trimmed due to
 	 * limited MSIX, so we re-initialize the TX rings per TC.
@@ -17449,7 +17449,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 			if (!bnxt_pf_wq) {
 				dev_err(&pdev->dev, "Unable to create workqueue.\n");
 				rc = -ENOMEM;
-				goto init_err_pci_clean;
+				goto init_err_auxdev;
 			}
 		}
 		rc = bnxt_init_tc(bp);
@@ -17487,12 +17487,13 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	return 0;
 init_err_cleanup:
-	bnxt_aux_devices_uninit(bp);
-	bnxt_auxdev_id_free(bp, bp->auxdev_id);
 	bnxt_dl_unregister(bp);
 init_err_dl:
 	bnxt_shutdown_tc(bp);
 	bnxt_clear_int_mode(bp);
+init_err_auxdev:
+	bnxt_aux_devices_uninit(bp);
+	bnxt_auxdev_id_free(bp, bp->auxdev_id);
 
 init_err_pci_clean:
 	bnxt_hwrm_func_drv_unrgtr(bp);

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.43.0

