Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645381;
	b=3kXL5ebsMB+cQlOtOhaoyKTKtkV29zRJv5qB69ntwMEEJyyGuinbGVn91iYqehEatPXZ
	 pORuKpeuGZFGm+Ax3A2eDOJbevKzQPV8IX1MO4UWagyo2Bea8jUNObBEtKt2DcswIH/Wl
	 t/kCyageILKT0fSXQ7AvbBHPf0258Gw1CiNU7/1raKNZyCAAcsB0wK7NV/yb0RtdP7SPq
	 Nm64oxK7QdOGhK+bfceqRz+KPt9u/Q1kb3/Du8LAELPhlhjYcMEYH//jwnsqDu2r2qq0h
	 9R6QDfgdyTkTusH/q3TGHy8wb0dy6blwHFVOsz4UFyjTNT+Pp9L+VHva9aelfxYv6AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=saxPFKG+rhZTmLkXlKqgvY2cUG00OsPZ3b/bnhubjfM=;
	b=E8+whrPvW0Z+oPJepHaInYl1WiJAWOHFZssgwM82w976SZ4ylQwwgXL/8o5Mwu7ahGtv
	 Df9ePCZ/G1XgIcZlewS7E3sS8wmyAfZqCLKy4uRbs/b/S3Ip3RHhBjP2ixJ2yBw+glPxz
	 gMw70KL2Edm4l/pxe7LPR8w1mKymRcroAWzuvmXBh6J9BdAJ1Vl+9ZfzJ9p5IeSjt+sN6
	 dIlzZPZzrVXR6rWFDGcJXkxobmckL4+sDY5bk85Mc4PZZGqlZ7aB9o8rkkZdCn28IsXK6
	 bBYHsstHDKUnda9IeOyxU15Klr6JHRitEYOtEhhiK9ehAPzOgefCyS8MibX44hLbhUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CL6KyJDJ;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86105606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86105606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CL6KyJDJ
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so3608855c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645380; x=1796250180; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=saxPFKG+rhZTmLkXlKqgvY2cUG00OsPZ3b/bnhubjfM=;
        b=CL6KyJDJvrxgWGfXy5oUei2+yEspwD2M+cVwOJtfh6sS0+4NU3cs8mcjUgi6UtpLH9
         0oaj7LsK08s7gNoJrvM7d5NkgPbrjDMwre7h2Cl+dkvGNUPH2Hl4PN9IAS2tLQgpniat
         qy07Qbw+zGZHvQD1xfC3WSAQDq10KyM/3hE+vCDobQpYxvoFrhKT4E4rWjTmJjHS+1d5
         FLlLAnTIGwTCyOftz3qonltx1CZoZAaKWcPMBcwsmHPlGgy3k06CKMjBGKtvh6paZ2Ki
         doxZ5umHhx/ZUDPPSjlw2jqIMdJGb/ufsLv3B4oisuoV3n6Af7CSlunSATGTNqCsPCi6
         thzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645380; x=1796250180;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saxPFKG+rhZTmLkXlKqgvY2cUG00OsPZ3b/bnhubjfM=;
        b=EQgRiaceaEYLZ++eZpYWbUJoHEA8tyvPJSTdHJyprnU+JkY/YLGVGwbdflNVfgHQKV
         MZCtmFauWKStpOP1zsbormS0DGqNyzza3EvFRkAA921X3RZsxtdefLq+uSpiOFEP+CI3
         KEJ4ugu+/AWObxeHo/fOMbO750FmDSPOw2jAzdHw10F4f62gnXf+sUyrpZQ4k03kn5f1
         vtDD/Fhme+EuN91BsoEQFyW9/Sg3zYa2/RZJU86fuAtPV6XffoBhMfQ3C4dvW1IFVOlx
         UCZnwMCMmD53gO26d+gbv55JQCELx2Qg8VWDaOHzSU/1vl5IZSje3QlBpgCxp83g0aFL
         rX3g==
X-Forwarded-Encrypted: i=1; AL+hErGnlnmn0idJGo+Md3ZkluiE98eCkVEKUiTp5Z04sMLG0lZQGTE/bGfYryHRwy0xMeptpUPSLL+Xw/WKZZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DeLprnqrvinvklvKjX4s9NgPaIAns7c+jrCOgPS8953nCT/KP
	5IaJVsWX+XjzaFOTslx5uxS5bK8rKgBRfiVIj3Ya/jTjPIncf9KysM1hhI+ICZZ96EXgbcXhDog
	qbg==
X-Received: from dlgx13-n2.prod.google.com ([2002:a05:701a:cccd:20b0:1b5:26be:e863])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f01:b0:1b2:490b:6fdd
 with SMTP id a92af1059eb24-1b5568aeb2bmr16509476c88.24.1795645379375; Wed, 25
 Nov 2026 14:22:59 -0800 (PST)
Date: Wed, 25 Nov 2026 22:22:12 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222212.1434148-1-elkin@google.com>
Subject: [PATCH] usb: chipidea: udc: clean up bounce buffer and DMA mapping on
 enqueue error
From: Elkin Cruz <elkin@google.com>
To: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In _hardware_enqueue(), sglist_do_bounce() allocates a bounce buffer and
scatterlist table in hwreq->sgt and swaps hwreq->req.sg and
hwreq->req.num_sgs to point at the bounce table. If
usb_gadget_map_request_by_dev(), prepare_td_for_sg() /
prepare_td_for_non_sg(), or hw_ep_prime() subsequently fails,
_hardware_enqueue() returned without unwinding the bounce table, DMA
mapping, or allocated TD nodes. Because failed requests are never added
to hwep->qh.queue, _hardware_dequeue() and _ep_nuke() never clean them
up, leaking the bounce buffer and leaving hwreq->req.sg corrupted.

When hw_ep_prime() fails, flush the endpoint and restore TD_TERMINATE in
the queue head and any linked predecessor TD before freeing allocated TD
nodes, unmapping the request, and calling sglist_do_debounce(hwreq,
false).

Fixes: edfcc455c85c ("usb: chipidea: udc: create bounce buffer for problem sglist entries if possible")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/usb/chipidea/udc.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 98658b65b936..dad7087fc0cf 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -681,6 +681,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	struct ci_hdrc *ci = hwep->ci;
 	int ret = 0;
 	struct td_node *firstnode, *lastnode;
+	struct td_node *prevlastnode = NULL;
 	unsigned int bounced_size;
 	struct scatterlist *sg;
 
@@ -705,7 +706,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	ret = usb_gadget_map_request_by_dev(ci->dev->parent,
 					    &hwreq->req, hwep->dir);
 	if (ret)
-		return ret;
+		goto err_debounce;
 
 	if (hwreq->sgt.sgl) {
 		/* We've mapped a bigger buffer, now recover the actual size */
@@ -719,7 +720,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 		ret = prepare_td_for_non_sg(hwep, hwreq);
 
 	if (ret)
-		return ret;
+		goto err_unmap;
 
 	lastnode = list_entry(hwreq->tds.prev,
 		struct td_node, td);
@@ -740,7 +741,6 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 		struct ci_hw_req *hwreqprev;
 		int n = hw_ep_bit(hwep->num, hwep->dir);
 		int tmp_stat;
-		struct td_node *prevlastnode;
 		u32 next = firstnode->dma & TD_ADDR_MASK;
 
 		hwreqprev = list_entry(hwep->qh.queue.prev,
@@ -790,8 +790,31 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 
 	ret = hw_ep_prime(ci, hwep->num, hwep->dir,
 			   hwep->type == USB_ENDPOINT_XFER_CONTROL);
+	if (ret) {
+		hw_ep_flush(ci, hwep->num, hwep->dir);
+		hwep->qh.ptr->td.next = cpu_to_le32(TD_TERMINATE);
+		if (prevlastnode)
+			prevlastnode->ptr->next = cpu_to_le32(TD_TERMINATE);
+		/* Ensure dQH/dTD link termination is visible before freeing TDs */
+		wmb();
+		goto err_unmap;
+	}
 done:
 	return ret;
+
+err_unmap:
+	list_for_each_entry_safe(firstnode, lastnode, &hwreq->tds, td) {
+		dma_pool_free(hwep->td_pool, firstnode->ptr, firstnode->dma);
+		list_del_init(&firstnode->td);
+		firstnode->ptr = NULL;
+		kfree(firstnode);
+	}
+	usb_gadget_unmap_request_by_dev(ci->dev->parent,
+					&hwreq->req, hwep->dir);
+err_debounce:
+	if (hwreq->sgt.sgl)
+		sglist_do_debounce(hwreq, false);
+	return ret;
 }
 
 /**
-- 
2.56.1.839.g22a8290db9-goog

