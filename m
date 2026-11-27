Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765414;
	b=H3dVFDVnDFUsUI8lakg719gN1DXOoRip1BxxqJMy21fsYrz7+jXM7JLMe8s9eQCio7yi
	 UspJuYE/YGmSUoeKYA5NMeL8wQHHoiYp+846+uXKgpUt/EZt958LqbdnlyEMV/ZyMvBZX
	 vZwDGo8l8iG8eHL8Oh+uX4jtDnjIJrCNofQ//Cd5nXt68o+iciJxSj1X6XtFPEHatA2T6
	 xdp0hltV92ZxJTB/YAJ5wtca1i4nb+SxikJC9JuVdsVa2YXudCEbydudDy5rOhQF4HrpG
	 1N/Lg8d5hBNWdWzzn2NGvT6wOfxk3hom0H/kbKXfRAzZiREadGFnAHst4bBvousfyPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765414;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RHakvzA5UHgBbeo16Q4RvA0oGIc2QB9xMfeDpAuCuHc=;
	b=hXp8W97kXKDrKBzk/1uXjEJkI6qyp2s1x3aPnRX1F9GapIAqI9XKTcEo07Lo7oYqn3sn
	 EMIUno8oJ/RbbC6nZ7nnHJUd5BShntKIpFsS6916YFSiuZmnfgMMp6+jtCAQGxKJTLu1F
	 oWiO1ckcTD6j5N9XAxNMlVkQ19HR/GxFL+hfuB0NRpedVWG4tXvW8Tt/4o/eCpXjSfdM8
	 T6kjgxmpTEJeLfXRadj81qcKAKfItMTAnGOGwXo5EBfuE0LNJuhbMaySxKVZkRXI38eOC
	 +ew4HZ2oPIqfF4ZujCE0rdchMA89VJ1yoBngXkMTbC/+GE4rOuibgNsMhaPf78hm5cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HBpuCL1Y;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55782606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55782606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HBpuCL1Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=HBpuCL1Y8/ZjEZRjxXSdCIhh7ERqdjYQqU8FBCHoAmOMZN4cPBzeWHdDgiX2z+aHjA4zm0kTIODXJ
	 3t3Qj6hfm29Cubiqk+wD296rsX7kiegEPbSDdsOMFPlRYMbux8nY1Kynj3akwVYDpjAbOqotKeamQU
	 qqzofTJ9v7kLI4bg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16b09345fe3e-3fd20;
	Fri, 27 Nov 2026 15:42:24 +0800 (CST)
X-RM-TRANSID:2ee16b09345fe3e-3fd20
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96b09345e154-8bd75;
	Fri, 27 Nov 2026 15:42:24 +0800 (CST)
X-RM-TRANSID:2ee96b09345e154-8bd75
From: zhaofeng2@cmss.chinamobile.com
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: arm-cci: fix OF node leak in __cci_ace_get_port()
Date: Fri, 27 Nov 2026 15:42:22 +0800
Message-ID: <20261127074222.466-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

__cci_ace_get_port() calls of_parse_phandle() to resolve the
"cci-control-port" phandle, but the returned device node
reference is never released on either the success or the
failure path.

Drop the reference with of_node_put() once the node is no
longer needed.

Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
Verified against current tree. Leak found by code inspection
(OF reference-counting audit of __cci_ace_get_port()).

 bus/arm-cci.c | 7 +-----++--
 1 file changed, 5 insertions(+), 2 deletions(-)

--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -167,9 +167,12 @@
 	cci_portn = of_parse_phandle(dn, "cci-control-port", 0);
 	for (i = 0; i < nb_cci_ports; i++) {
 		ace_match = ports[i].type == type;
-		if (ace_match && cci_portn == ports[i].dn)
+		if (ace_match && cci_portn == ports[i].dn) {
+			of_node_put(cci_portn);
 			return i;
-	}
+		}
+	}
+	of_node_put(cci_portn);
 	return -ENODEV;
 }
 


