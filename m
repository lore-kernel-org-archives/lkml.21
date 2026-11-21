Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261049;
	b=3zv1Pn4eHf2stMrj7YLjJi1Vj+9bJsYB/GDHLUL1eLZEq8uPH+vR+KrtJC61xcjbnF2+
	 CsrrGACGzMUyhxwtSa63HVwM3yAGB1bd/rV6wF3crR3/juTi6AGfQybonZVEg9zwxJcfq
	 I9jYBXE4Gb1YVhpdNIPF6rWw+rA1tC8OimBJ+IONyh/6B9MKicHPK8lduT4kzQ42b4LzH
	 T0IMdxfgRe+rXR8+yayZnr//GOjuFXCRsHuBkxxQwR5GDpoowksCB0Q7DQYki3J7ED7N4
	 LLXoB2WfeB5ZgW1CsHg3W28mQPf3y1BFh16DqGtHdz0YFwgSfFalSs26tPIxx0owPQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:User-Agent;
	bh=Z6Fq2OUnRPwkDMt3uy74FQqaHnnZFERerJEl0pXhFq4=;
	b=qgGH5ClIArs/ChN3yODuwnzq25QpbmKh1znXRWBqu+eMsf0YSZmnGr35xwPViMwDrhbe
	 8iSe7zlarb62JcHnb+95XolvOa/CBpmNrnIZqavddsvxCRegDP61Gb5N5hKe6GFC2alv3
	 ey+QOxlfQNanc/2C6leemNJ8TWbIi316OKAWTE3oa3apPMl/C8H6Ksu/SojJWDhKlwWH3
	 KsUXnHAT8cv9rmtW0EWedxk9UOXeKBQgo40pfhOws7einB4y7l6w+eGCfDe/vFrwFQfyt
	 fMuRt/qpr5Yq4u0Kt0CJwkRL+ftX0vIZjEC8wxPupiORYPxCEsEPBQQCT4FY1nNjTKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOFfY2C0;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAA8606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFAA8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOFfY2C0
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so2889907c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795261048; x=1795865848; darn=vger.kernel.org;
        h=user-agent:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6Fq2OUnRPwkDMt3uy74FQqaHnnZFERerJEl0pXhFq4=;
        b=iOFfY2C0LlUvyKFJTvFPJcN4Xr9YeXIbalzQaPzIkZr72m+pI2qhhzoCdSvkI9Vk5N
         MrfXgnYBgdaM5hgm2WpobxmQXFxsK4eeEhM6WPlFxjSl3FT9bqNkd8tWAUmPV2HTf13t
         fdp3HGnjyL80p3TxPLCUooXon5JGMd3b5G58uoniv6Ux54AlcvhCmNX9iBjXPj1RJI3f
         ueq9LTqFbRPZbyMo4vl9/KuHRGK/Z7EvfG0+eUPpc5EI3rgIUohgClWWkTb/jk56aeuh
         /rUlnnsyyJ18RZOtySzvTAkOqYQc3zDZFW3igjvfG8VxE6tErT1oymKvJEWKXkwNneRc
         dKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261048; x=1795865848;
        h=user-agent:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6Fq2OUnRPwkDMt3uy74FQqaHnnZFERerJEl0pXhFq4=;
        b=Nq0AUFvoGJJxjwrdfzmodlte8CN4d8+oXwGR6vluWRYnRwFcUWEgwQ1jRXLzyprFzM
         mAn2nnMFX4Zib3hqvKBEOfZao6Jlb6LcDRiv3dTq4whs1tTcdUarNs+L6g7MSZRQjGIJ
         gEhNll8FvSlXBfsUV3MCD+gEf1wK7CovWyKXORhIFBpa3l/3NLKZUuj7XvUHv868cnz/
         1Qmiq8jllbn9bQ22mtXwMspD8KFNMnWCGYhlyoWYDPBa5Kcm3PG9pu15aVeFLKr1vfJm
         LaJSafFntY8QwaXr8q7riPJcplQ3RyJMLCuTUAtlrTx1GIHJoj5XaTYiB/+dQ3GrForF
         o2JQ==
X-Forwarded-Encrypted: i=1; AL+hErFy19NF5cQ23u5TMS0S6qeF32ZxxBgXlUj2j7MJXNVwTWE/RY1Kd0r8mSkLrP+tj59B3ivHlf/21trmfEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8t4hQmfMDeYJXsArm/RT+BkT0T9LYFwuw+6hR5mtFbB297rabt
	Xg2feAkfp6WKLosXkuTQ0pQCyvu+9+rhAtuJC+j/VEg/AZZrbOtZP5FK
X-Gm-Gg: AZFdTZdZTmf69Z0lR8yoBC6KOhQDxcce4f7YBtDjikh2bZk5CBn8fIJztRdaP6WNpCU
	xQcLRAW77pTF4d8/l1AhO4ACcEbEotaMp5J4MxdfmEpyd/KdKAJB3BuUsH0rUabsMMnle0nJX7a
	f3bs8FrDfwUU14HWyn93hMav8LSt51/0K7TJStLcHs6ZXm1ITuwxVpNZg1Q5k1+rPp13HGnipLR
	J/gZEE+bibLmhVVCdZYMBRz8UBHb+1o5UdhNbST1sif9/oR5KPWobj3oDCo2tqO9iC/gAXwfr01
	w12MsmU51TyAVLCW7vIWDGQ32KfbhG2qNDjkK4tdcxjLS4T+St88vxizIkOxaF4bmsvs8hWyXWv
	Ksp32cQITvvCmNMiYrUJHYNCGNi2+XS7IMWdFDO2ibSwI7/SV+XdkFtlsX09yilSDWHSFQx16iJ
	ksHHura1yJMqr/DeVLkhO3xwBHcG3JXv317iBJ65uMZu5/3E7shzqeOWPuwlhAjO518LfT7a6LR
	rRvmNT/a3gnDQhz4FyUNKiyBcLW3Qw0Nm4/uxXTGkMR11f1dVDpCzC7Oc6258PQbuxcN6xp3IDv
	tIBJwWpdO1OqDOYVdqbK9rPABRC/3Wj37LpRcJrGzst1FMCSyYTD6QxhoBPr9BsVUHplzqlOJ3t
	p7uDiXEADZ2LUnzY=
X-Received: by 2002:a05:7301:1501:b0:385:1e1c:9ab5 with SMTP id 5a478bee46e88-385701527f3mr5469764eec.20.1795261047398;
        Sat, 21 Nov 2026 03:37:27 -0800 (PST)
Received: from asus-ux3405ca ([140.213.140.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm17980517eec.6.2026.11.21.03.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:37:27 -0800 (PST)
Date: Sat, 21 Nov 2026 18:37:21 +0700
From: Muhammad Huda Nugroho <mhudan21@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: qcom: Do not power off a PHY whose power-on
 failed
Message-ID: <20261121113721.7OL6u%mhudan21@gmail.com>
User-Agent: mail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

qcom_pcie_phy_power_on() unwinds a failed phy_power_on() by calling
qcom_pcie_phy_power_off(), which walks the whole port list - including
the port that just failed, and every port the loop has not reached yet.
The phy_set_mode_ext() failure path returns without unwinding at all,
leaking the ports already powered on.

The first of those is not a leak but a refcount underflow.
phy_power_off() decrements phy->power_count unconditionally and invokes
the provider's ->power_off only at a count of 1, while phy_power_on()
invokes ->power_on only at a count of 0. Releasing a reference that was
never acquired therefore drives the count to -1, and the next
phy_power_on() returns success having silently skipped powering the PHY
up: no error, no message, just a PHY that is never initialised again.

The damage outlives the failed attempt, which is what makes it worth
fixing. On a single-port controller the very first failure is enough to
reach -1. It is normally invisible because a failed host init at probe
time is fatal anyway, but it becomes reachable as soon as anything
retries host init at runtime, as system resume does - at which point the
controller comes back with a PHY the core believes is already on.

Unwind with list_for_each_entry_continue_reverse() so that only the
ports successfully powered on are powered off, and route the
phy_set_mode_ext() failure through the same unwind. The PHY core already
releases the failed acquisition itself, so the failing port must not be
released here.

Signed-off-by: Muhammad Huda Nugroho <mhudan21@gmail.com>
---
Notes for reviewers, not for the commit message:

A structurally similar unwind fix for the tegra host bridge was declined in
August 2026 ("PCI: tegra: Unwind partial PHY ...", Pengpeng Hou) on the
grounds that a phy_power_on() failure means a broken system that an unwind
will not save. That reasoning answers a leak argument, and it is fair
against one - a PHY left powered after a fatal probe failure changes
nothing. It is not the argument here. The problem in this driver is the
opposite direction: a reference released that was never taken, leaving
power_count below zero, so the next phy_power_on() succeeds without
powering the PHY. That survives the failed attempt and breaks the next
legitimate one.

The same underflow was described by Vladimir Oltean in March 2026 while
reviewing "scsi: ufs: qcom: Drop the PHY power_count check" - "If 0, the
power_count would become negative after phy_power_off(), and a subsequent
phy_power_on() would merely bump it back to 0" - and the ufs patch was
withdrawn in favour of per-driver state tracking. This patch takes the
other available route for a consumer that must not inspect power_count:
only release what it acquired.

Against mainline master as of 2026-11-21.

Found by reading the error path, not by observing it fire. The underflow
mechanism is from the PHY core's own accounting in phy_power_on() and
phy_power_off(); no hardware reproduction of the resume case is claimed.
I would rather say so than imply a bug report I do not have.

 drivers/pci/controller/dwc/pcie-qcom.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1445,16 +1445,29 @@
 	list_for_each_entry(port, &pcie->ports, list) {
 		ret = phy_set_mode_ext(port->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
 		if (ret)
-			return ret;
+			goto err_power_off;
 
 		ret = phy_power_on(port->phy);
-		if (ret) {
-			qcom_pcie_phy_power_off(pcie);
-			return ret;
-		}
+		if (ret)
+			goto err_power_off;
 	}
 
 	return 0;
+
+err_power_off:
+	/*
+	 * Only release what was actually acquired. phy_power_off() decrements
+	 * phy->power_count unconditionally and invokes the provider's callback
+	 * only at 1, while phy_power_on() invokes it only at 0, so releasing a
+	 * port whose phy_power_on() failed (or was never reached) drives the
+	 * count negative - after which the next phy_power_on() silently skips
+	 * powering the PHY up at all. The PHY core already unwinds the failed
+	 * acquisition itself.
+	 */
+	list_for_each_entry_continue_reverse(port, &pcie->ports, list)
+		phy_power_off(port->phy);
+
+	return ret;
 }
 
 static void qcom_pcie_configure_ports(struct qcom_pcie *pcie)
-- 
2.51.0
