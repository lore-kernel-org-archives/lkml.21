Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374689;
	b=iyqLib/vocUi226iEI1H1APojA3v1Y5cF0QcjArWrrfhHMgEyoORC5jFJX5fFsErilZV
	 r9F2xV9beLFabnyTvu5FxAT1LntF7dxp03cgEOldxywz8FJUlbkRmSyn5QBTB/e1vntPo
	 k+io1x38kvqz0U5UiG941//77tq+UhlvX62S8ZBQDlcBXadQRqwAh4O8vnSr4HXbdjZAf
	 jmMesSEqqbqu0VBUCERxwui32fjsHo4KzpS1jpvwszJi8Xwff56g2JvSV//PQg+/RRHAW
	 fDobkH8JN7lGxGcueSk1VVamDgIqQpd5TlgiwHYePo7t+pFJCccW8YkljvUjTb2tSFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2GpSzR4G5U9X0KrEU6CxhUyVa6azEyHRM8XovyPKyw4=;
	b=DvrDGkyG0ydFNeMcxGXwrjMftuFtyLqR/0xqQzkPOnQ3UdOhY3Dkx7INA211GuchxOma
	 gSTxKDh4ojAOlQWNpObPJmxvw4V+s2T/CWdYnFzPkkPeXdiZHd0N+dk5YU6+JdEbwWho5
	 GUq5Cz5mGiQVxa12rY7d/wjlWtA+/PVZ0pgX3zOBu8BfK7VPGtdjq7B3bzu4MdYWPC0RV
	 KxI84idvwMYX/kJPo1SfUTHX5lHWtaikkmJfWirN1/km4BVAi7nTBEpZLy8ybogPVKE1X
	 kB9oolpsW5v+cKwlZKM8EC2+IlJxnbqImGEYtw9kU3fgk0RM9UHWhazaVdVems4ZFgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VM1PBTOV;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01564606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01564606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VM1PBTOV
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9496577d4c4so321142585a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795374688; x=1795979488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GpSzR4G5U9X0KrEU6CxhUyVa6azEyHRM8XovyPKyw4=;
        b=VM1PBTOVgp50bkFiS9MNgPv9jpbAUqgl2cSKf5aBhvUNm6Ls0zgqO9i/+ycC0ocbBY
         yeWkT9hyjyaomJ9DWbxopzlsgUIy41tpjLcShe/qIvJrx/30dm4m4IWCdXiW024SbqQs
         6qq5bO9dGdZ0oSpTZ/Epa9U5U8hw/Q5t19nBYvV7d9QF/mr7dMEd4YQ5D1alUlIh/b3K
         OfnrX/rhGPW+mglrCujyb3rEEkvthPhVxoWqu58EMIHyhsLFMP8F3+dRL2xqyIs+zwQw
         zFwWP43UxDFffv+zipFfSdS/3jek8mGgwDSyBmbSOTtxrxradXfAtQu4YSNjCDa+Czoo
         qmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374688; x=1795979488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GpSzR4G5U9X0KrEU6CxhUyVa6azEyHRM8XovyPKyw4=;
        b=YcWZ0aO1TuBiNzCKmnh8MZv+0cgwR+tRRawJ0KWQ3OWibeWQnrRTPh4j5kaM0pw5Rj
         0Qo/eBSxpFVXQJiLBlv59jSCiga7lD9XN2Vy5Pbq7BCQBtUdkU5hFBSvD5xkYpCgxPwi
         YJSgX/7fyc41FvQPEvKrVM1idgeSUKq+OHqKLJTn+DHhe0q1q8CONchsSK4IvRljyC9T
         EspNpAWHFjpaqnVMnGvAKEC+1zGIufTtviydWyeXSc3YGlWHgxgARZihmg0lpHt15vNf
         XexNFlg4vL4lGsqvB531QTkz+OoK5+4vWh/iMMp22sgcTiucj6IayUUuUmkG9UREwaSC
         c9DA==
X-Forwarded-Encrypted: i=1; AL+hErHAa+gCTzG+PjaHj5hw7WaZzOzNJD3YNbIP3s3g61/qV+pnx14yDKLN/KVJRmihRDQy8Ds8At0ULk5CVHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UYLwTUn07wmvBsR8+H53nI6Eqgc0DXa5T232ZHFPzBVCelGUx
	eh2RSIqePdc07buLtqa5627JkO+47qjmSKIKQ4ytgrakV0SVR+JEkC15
X-Gm-Gg: AZFdTZfuO3/WZOD461T+bFadAJ+eVyIvXRPsnwAUkWAjOqq7SvxeUySQlH9vWIrzn3c
	4LYe9g2+v6xs7o36ryAWAo5OkTmbVHKR8qzmw8Ksbpqy4j6eClEcDWWzAkdL4ZfZOrMfiA42j6i
	+Eu9M1olzODyJeAbsvY6aKe9TidyhmtXiDB96qfjxiLtmsGaSz9MEZJ8Ay7nRbHKJQwqHbKPee/
	1jANiOkkyGXMpeXEydhTE5hRpk6gIscCZCeqYRyOxTw0BFFn6zX33vROoHu9pdgRBgbfYNMLYpc
	+YZLiLADRReHw8wd0PDH0sPLH3F2k+H8AKH7A6SBUmPDO3k2j4L87kOhOC/azdpsEHcnxEUAJbT
	NF0C6dWNOQc2SI8Hm5i8qFdTX3jUfWZkaF6xK2KKSe5PjUY64kbSn4Jv43PobNlwGnvv5+Y02CU
	SGXnewR/fnBzRFhLewZ/i9ZrsmSZD/MHGrDzOe/pyzV30Ujpid2eij//FLFo+TXMfLwg7CUSY70
	nVV3NqHpH3aE/tnpyAv2LF+L/1h9Rsp9BMMk6aevTh/1dTabf6/c0lKYb0t1etVxYbockC7NaqG
	oRwj9RnchC2F/WB84qy6qO2rGAxB9LI9XGqlifNHYSNdL2rdra2OeyvSmrlzBiymGAfte9Y0/AH
	jYzmizWA61BddHs5vXa3mquIh1Na0kp98BMEljTTaJW3NCyqiJBcu7fJa1TstgKUlz+tAnc/8J6
	UufyiUN05MMLpPKBU4dkBZ4tOVgQ==
X-Received: by 2002:a05:620a:2986:b0:949:aceb:b799 with SMTP id af79cd13be357-949b357272amr1785474285a.13.1795374687873;
        Sun, 22 Nov 2026 11:11:27 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c8ee:a73:9097:862f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949c555faf9sm536397585a.0.2026.11.22.11.11.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 11:11:27 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Bernard Metzler <bernard.metzler@linux.dev>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-rc] RDMA/siw: Don't send stale data for a queued zero length Read Request
Date: Sun, 22 Nov 2026 14:11:22 -0500
Message-ID: <20261122191122.65240-1-astellman@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
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

siw_init_rresp() queues an inbound RDMA Read Request in the inbound read
queue (IRQ) when the TX work request is busy. For a zero length Read
Request the IRQ entry has num_sge 0, and siw_activate_tx() then leaves
wqe->sqe.sge[0] as the previous work request left it.
siw_qp_sq_proc_tx() sets num_sge to 1 for every Read Response, so the
Read Response is built from the previous work request's sge[0]. RFC
5040, section 5.2.1, requires a zero length Read Response.

A plain TCP peer that speaks MPA rev 1 sent two Read Requests in one
write(): 64 bytes from an MR with remote read access, then a zero
length Read Request. The second Read Response carried the same 64
bytes of the MR:

  Read Response, sink STag 0x11110000: 64 bytes "SIW016-REMOTE-RD..."
  Read Response, sink STag 0x22220000: 64 bytes "SIW016-REMOTE-RD..."

When the zero length Read Request was sent 500 ms after the first one,
its Read Response had no payload.

Copy sge[0] from the IRQ entry whatever its length, as the immediate
path in siw_init_rresp() does. With this change the second Read
Response has no payload in both cases.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with Claude Opus 5.5 and
reviewed by me.

Fixes: f29dd55b0236 ("rdma/siw: queue pair methods")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
Tested in QEMU on v7.4-rc3 with KASAN, with a plain TCP peer that speaks
MPA rev 1. A reproducer is available on request.

 drivers/infiniband/sw/siw/siw_qp.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/infiniband/sw/siw/siw_qp.c b/drivers/infiniband/sw/siw/siw_qp.c
index bb780e3904a..f3eb1c85f3e 100644
--- a/drivers/infiniband/sw/siw/siw_qp.c
+++ b/drivers/infiniband/sw/siw/siw_qp.c
@@ -972,14 +972,15 @@ int siw_activate_tx(struct siw_qp *qp)
 	/* start READ RESPONSE */
 	wqe->sqe.opcode = SIW_OP_READ_RESPONSE;
 	wqe->sqe.flags = 0;
-	if (irqe->num_sge) {
-		wqe->sqe.num_sge = 1;
-		wqe->sqe.sge[0].length = irqe->sge[0].length;
-		wqe->sqe.sge[0].laddr = irqe->sge[0].laddr;
-		wqe->sqe.sge[0].lkey = irqe->sge[0].lkey;
-	} else {
-		wqe->sqe.num_sge = 0;
-	}
+	/*
+	 * Copy sge[0] also for a zero length Read Request. The TX path
+	 * sends sge[0] of every Read Response, and the previous work
+	 * request's sge[0] must not be sent in its place.
+	 */
+	wqe->sqe.num_sge = irqe->num_sge;
+	wqe->sqe.sge[0].length = irqe->sge[0].length;
+	wqe->sqe.sge[0].laddr = irqe->sge[0].laddr;
+	wqe->sqe.sge[0].lkey = irqe->sge[0].lkey;
 
 	/* Retain original RREQ's message sequence number for
 	 * potential error reporting cases.
-- 
2.43.0

